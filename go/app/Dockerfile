#FROM rhaps1071/golang-1.14-alpine-git AS build
FROM golang:1.17 AS build

WORKDIR /
COPY . .
#RUN CGO_ENABLED=0 go get -ldflags "-s -w -extldflags '-static'" github.com/go-delve/delve/cmd/dlv
RUN CGO_ENABLED=0 GOOS=linux GO111MODULE=on
RUN go install github.com/go-delve/delve/cmd/dlv@latest

#RUN CGO_ENABLED=0 go build -gcflags "all=-N -l" -o ./feedme
RUN go build -gcflags="all=-N -l" -o /feedme

#FROM scratch

EXPOSE 8000 2345 

COPY --from=build /go/bin/dlv /dlv
COPY --from=build /feedme /feedme

#ENTRYPOINT [ "/dlv" ]
CMD ["/dlv", "--listen=:2345", "--headless=true", "--api-version=2", "--accept-multiclient", "exec", "/feedme"]
