FROM golang:1.16.6-alpine
ENV GOPROXY="https://goproxy.io"
WORKDIR /apps
COPY ./ .
RUN go build -o tekton-demo main.go

FROM alpine:latest
WORKDIR /apps
COPY --from=0 /apps/tekton-demo .
CMD ./tekton-demo
