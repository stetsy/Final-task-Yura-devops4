FROM golang:1.16-alpine
RUN mkdir /app
ADD server.go /app
WORKDIR /app
RUN go build server.go
CMD ["/app/server"]