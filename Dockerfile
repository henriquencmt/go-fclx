FROM golang:alpine3.16 as build-stage

WORKDIR /app

COPY main.go .

RUN go mod init github.com/henriquencmt/go-fclx && go build -o main .

FROM scratch

COPY --from=build-stage /app/main .

ENTRYPOINT [ "./main" ]