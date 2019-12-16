FROM hseeberger:scala-sbt as builder

WORKDIR /cromwell_pipeline
ADD . /cromwell_pipeline

RUN sbt clean assembly

FROM openjdk:8-jre-alpine
WORKDIR /cromwell_pipeline
COPY --from=builder /cromwell_pipeline/target/scala-2.12/Cromwell\ pipeline-assembly-0.1.jar /cromwell_pipeline/