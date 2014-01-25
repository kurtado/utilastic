utilastic
=========

Useful (?) utils for elasticsearch users and admins. (I'm a software developer at Elasticsearch)

http://www.elasticsearch.org

== kickoff-queries.sh
This is a shell script which I use when kicking off support contracts with customers. It's pretty simple and silly, but allows some insight into an existing Elasticsearch cluster. It takes about 10 seconds to clone and run, but provides a lot of insightful data about the current status of an Elasticsearch cluster. 

The fielddata queries are useful when troubleshooting Out of Memory errors on a cluster. Excessive field data loaded to memory is a fairly common cause of OOM JVM exceptions.
