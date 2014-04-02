#!/bin/sh

echo "Querying Elasticsearch for cluster status and statistics..."

DIR=es-cluster-status-$(date +%Y%m%d%H%M%S)
HOST=localhost
PORT=9200

# make sure Elasticsearch is running on the specified $HOST:$PORT
echo Checking if Elasticsearch is running at $HOST:$PORT...
RUNNING=`curl -s -I "$HOST:$PORT"|grep -c '200 OK'`

if [ $RUNNING != 1 ]
then
  echo Elasticsearch not running at $HOST:$PORT
  exit;
fi

# looks good - let's run the queries
echo Found Elasticsearch running on $HOST:$PORT.
echo Running cluster health and status queries...
mkdir $DIR
curl -s "$HOST:$PORT/_cluster/health?pretty&human" > $DIR/cluster.health.pretty.json
curl -s "$HOST:$PORT/_mapping?pretty&human" > $DIR/mapping.pretty.json
curl -s "$HOST:$PORT/_settings?pretty&human" > $DIR/settings.pretty.json
curl -s "$HOST:$PORT/_cluster/settings?pretty&human" > $DIR/cluster.settings.pretty.json
curl -s "$HOST:$PORT/_stats?all&pretty&human" > $DIR/stats.all.pretty.json
curl -s "$HOST:$PORT/_nodes?all&pretty&human" > $DIR/nodes.all.pretty.json
curl -s "$HOST:$PORT/_nodes/stats?all&pretty&human" > $DIR/nodes.stats.all.pretty.json

# optional, but important for troubleshooting
curl -s "$HOST:$PORT/_stats/fielddata/*?pretty" > $DIR/stats.fielddata.pretty.json
curl -s "$HOST:$PORT/_nodes/stats/indices/fielddata/*?pretty" > $DIR/nodes.stats.indices.fielddata.pretty.json


tar cvf $DIR.tar $DIR
gzip $DIR.tar

echo "Done. Data collected in $DIR.tar.gz."
