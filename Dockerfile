# openshift-curl
# rhel7 repository only works when running on a subscripted host
#FROM rhel7:latest
FROM centos:latest

# TODO: Put the maintainer name in the image metadata
MAINTAINER Steve Netting <snetting@redhat.com> 

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="Curl Proxy Test" \
      io.k8s.display-name="Curl Proxy Test" \
      io.openshift.tags="builder,curl"
# io.openshift.expose-services="3128:tcp"

# TODO: Install required packages here:
RUN yum clean all && yum -y update && yum install -y curl  

LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i
COPY ./.s2i/bin /usr/libexec/s2i

# Copy entrypoint script
COPY ./entrypoint.sh /

# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
RUN chmod 755 /entrypoint.sh

# TODO: Set the default CMD for the image
ENTRYPOINT ["/entrypoint.sh"]
