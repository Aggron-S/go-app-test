FROM golang:1.20-alpine as BUILDER
WORKDIR /src/
COPY . .
RUN go build -o out ./cmd/main.go

FROM golang:1.20-alpine
RUN go version
WORKDIR /go/src/golang-baseapp
COPY --from=BUILDER \
  /src/webserver \
  /go/src/golang-baseapp/

RUN chmod +x /go/src/golang-baseapp/webserver

EXPOSE 8080

CMD ["/go/src/golang-baseapp/webserver"]
