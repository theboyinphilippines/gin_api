# 第一阶段：构建阶段
FROM golang:1.22-alpine AS builder
ENV CGO_ENABLED 0
ENV GOOS linux
ENV GOPROXY https://goproxy.cn,direct
WORKDIR /build
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -ldflags="-s -w" -o gin_api main.go

# 第二阶段：运行阶段
FROM alpine
WORKDIR /build
ENV TZ Asia/Shanghai
# 从构建阶段复制构建好的二进制文件
COPY --from=builder /build/gin_api .
# EXPOSE 8080
ENTRYPOINT ["./gin_api"]
