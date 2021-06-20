FROM openjdk:11.0.11-jre

ARG PLANTUML_VERSION=1.2021.7

WORKDIR /app
ADD https://repo1.maven.org/maven2/net/sourceforge/plantuml/plantuml/${PLANTUML_VERSION}/plantuml-${PLANTUML_VERSION}.jar /app/plantuml.jar

COPY entrypoint.sh /app/
RUN chmod +x /app/entrypoint.sh

ENV PLANTUML_LIMIT_SIZE=4096
ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["-h"]
