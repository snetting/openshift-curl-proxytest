
**Proxy Test Script**

Set vars in entrypoint.sh

[root@lapper openshift-curl]# docker run -d snetting/curl
<container_ID>
[root@lapper openshift-curl]# docker logs <container_ID> 
------------------------------------------------
Proxy Test Script - Fri Jul  7 15:20:38 UTC 2017
------------------------------------------------
Connecting to http://www.google.com via http://username:proxypass@proxypod.openshift.dev:8080...
- Proxy connect failed
Sleeping 20 seconds...

