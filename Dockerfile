FROM hseeberger:scala-sbt as builder

WORKDIR /cromwell_pipeline
ADD . /cromwell_pipeline

RUN gradle clean bootJar --no-daemon

FROM openjdk:8-jre-alpine
WORKDIR /cromwell_pipeline
COPY --from=builder /cromwell_pipeline/target/???/???.jar /cromwell_pipeline/