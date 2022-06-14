FROM golang
WORKDIR /go/src/github.com/kaperys/delve-into-docker-app
ENV GO111MODULE="on"
ENV GOOS="linux"
ENV CGO_ENABLED=0
RUN go mod init

EXPOSE 40000 1541

RUN go install github.com/go-delve/delve/cmd/dlv@latest
ADD main.go .

CMD [ "dlv", "debug", "github.com/kaperys/delve-into-docker-app", "--listen=:40000", "--headless=true", "--api-version=2", "--log" ]

