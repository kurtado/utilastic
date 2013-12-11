#!/bin/sh

DIR=es-kickoff-queries
HOST=localhost
PORT=9200
mkdir $DIR
curl -s "$HOST:$PORT/_mapping?pretty" > $DIR/mapping.pretty.json
curl -s "$HOST:$PORT/_settings?pretty" > $DIR/settings.pretty.json
curl -s "$HOST:$PORT/_cluster/settings?pretty" > $DIR/cluster.settings.pretty.json
curl -s "$HOST:$PORT/_stats?all&pretty" > $DIR/stats.all.pretty.json
curl -s "$HOST:$PORT/_nodes?all&pretty" > $DIR/nodes.all.pretty.json
curl -s "$HOST:$PORT/_nodes/stats?all&pretty" > $DIR/nodes.stats.all.pretty.json

tar cvf $DIR.tar $DIR
#gzip $DIR.tar

echo "done."


