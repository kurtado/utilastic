# utilastic

Useful (?) utilities for Elasticsearch users and administrators. For example, if you're having a problem with your cluster, running this script will create a handy-dandy tarball of troubleshooting data. Just send the tarball to your helpful-friendly Elasticsearch expert for (potential) cluster-saving stategies! More information on Elasticsearch can be found here:

http://www.elasticsearch.org

## kickoff-queries.sh
This is a shell script which I use when kicking off support contracts with customers. It's pretty simple and silly, but allows some insight into an existing Elasticsearch cluster. It takes about 60 seconds to clone and run (depending on the size and state of your cluster), but provides a lot of insightful data about the current status of an Elasticsearch cluster. 

The fielddata queries are useful when troubleshooting Out of Memory errors on a cluster. Excessive field data loaded to memory is a fairly common cause of OOM JVM exceptions.

Note that if the cluster is currently in RED status, or timing out due to other problems, the script may not successfully execute. It also may not provide exactly the information you need to solve your problem. Caveat Programmer.

