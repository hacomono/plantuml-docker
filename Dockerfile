FROM openjdk:11.0.11-jre

ENV LANGUAGE=en_US
ENV LANG=C.UTF-8

WORKDIR /home

RUN apt-get update \
  && apt-get install -y --no-install-recommends graphviz=2.40.1-6+deb10u1 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ADD https://moji.or.jp/wp-content/ipafont/IPAexfont/ipaexg00301.zip ./ipaexg00301.zip
RUN unzip ipaexg00301.zip \
  && mv ipaexg00301/ipaexg.ttf /usr/share/fonts/ \
  && rm ipaexg00301.zip \
  && rm -rf ipaexg00301

WORKDIR /app
ARG PLANTUML_VERSION=1.2021.7
ADD https://repo1.maven.org/maven2/net/sourceforge/plantuml/plantuml/${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar /app/plantuml.jar
COPY entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh

WORKDIR /home
ENV PLANTUML_LIMIT_SIZE=4096
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["-h"]
