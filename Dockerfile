FROM golang:1.15.5 as builder
RUN mkdir /app
ADD . /app/
WORKDIR /app
COPY test.go ./
RUN go build -o test .
CMD ["/app/test"]

FROM alpine:latest as test
COPY --from=builder /app/test ./
CMD ["./test"]