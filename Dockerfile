FROM golang:1.21 AS builder

WORKDIR /app

COPY ./app /app

RUN go build -o fullcycle main.go

FROM scratch

COPY --from=builder /app/fullcycle .

CMD ["/fullcycle"]