FROM --platform=${BUILDPLATFORM:-linux/amd64} golang:1.23 AS builder

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG TARGETOS
ARG TARGETARCH

WORKDIR /app/
ADD . .
RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -ldflags="-w -s" -o golang-multi-arch main.go

FROM scratch
WORKDIR /app/
COPY --from=builder /app/golang-multi-arch /app/golang-multi-arch
ENTRYPOINT ["/app/golang-multi-arch"]
