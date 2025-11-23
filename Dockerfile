# Multi-stage Dockerfile for gin-example

# Build stage
FROM golang:1.25-alpine AS builder

WORKDIR /app

# Install build tools (if needed) and CA certs
RUN apk add --no-cache ca-certificates

# Pre-cache modules
COPY go.mod go.sum ./
RUN go mod download

# Copy source
COPY . .

# Build the binary
RUN CGO_ENABLED=0 GOOS=linux go build -o gin-example .

# Runtime stage
FROM alpine:3.20

# Install CA certificates
RUN apk add --no-cache ca-certificates

WORKDIR /app

# Copy binary from builder
COPY --from=builder /app/gin-example ./gin-example

# Set Gin to release mode in containers
ENV GIN_MODE=release

# The app listens on 8080
EXPOSE 8080

# Run the service
CMD ["./gin-example"]
