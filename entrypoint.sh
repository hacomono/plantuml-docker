#! /bin/sh

exec java -DPLANTUML_LIMIT_SIZE=${PLANTUML_LIMIT_SIZE} -jar /app/plantuml.jar $1
