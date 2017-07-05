FROM anapsix/alpine-java:8_jdk

WORKDIR /root

COPY install_gradle.sh .
ENV GRADLE_USER_HOME /gradle
ENV GRADLE_OPTS -Dorg.gradle.daemon=true

RUN apk update && \
  apk add libstdc++ && \
  apk add bash && \
  mkdir bin && \
  /bin/sh install_gradle.sh

VOLUME ["/app", "/gradle"]

EXPOSE 8080
CMD ["bash"]
