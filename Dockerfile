FROM golang:1.21 AS builder

WORKDIR /app

COPY ./app /app

RUN go build -ldflags "-s -w" -o fullcycle main.go

FROM scratch

COPY --from=builder /app/fullcycle .

CMD ["/fullcycle"]