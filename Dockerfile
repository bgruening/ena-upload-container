
# Example Galaxy container
#
# to build the docker image, go to root of training repo and
#    docker build -t containername -f Dockerfile .
#
# to run image:
#    docker run -p "8080:80" -t  containername 

FROM quay.io/bgruening/galaxy:20.05
MAINTAINER ELIXIR Belgium

ENV GALAXY_CONFIG_BRAND "ENA-upload"
ENV ENABLE_TTS_INSTALL=True

ADD bin/docker-install-tutorials.sh /setup-workflow.sh
ADD /tools.yaml /tools.yaml 
ADD /workflow /workflowDir
ADD /bin/tool_conf.xml /galaxy-central/config/tool_conf.xml

RUN chmod 755 /setup-workflow.sh && \
/setup-workflow.sh
