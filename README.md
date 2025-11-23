# Gin Example

This is a minimal example of a web server built with the [Gin](https://github.com/gin-gonic/gin) framework in Go. It starts an HTTP server and responds with `Hello, World!` on the root path `/`.

## Prerequisites

- Go 1.20+ (or a reasonably recent Go version)
- Git

## Getting Started

Clone the repository:

```bash
git clone https://github.com/calpa/gin-example.git
cd gin-example
```

Install dependencies (Gin will be fetched automatically on first build/run if using Go modules):

```bash
go mod tidy
```

## Run the Server

Start the server with:

```bash
go run main.go
```

By default, Gin listens on `:8080`. Open your browser or use `curl`:

```bash
curl http://localhost:8080/
```

You should see:

```text
Hello, World!
```

## Project Structure

- `main.go` – entry point that sets up the Gin router and defines the `/` route.
- `.gitignore` – standard ignores for a Go project.

## Run with Docker

You can build and run this example using Docker:

```bash
docker build -t gin-example .
docker run --rm -p 8080:8080 gin-example
```

Then visit:

```bash
http://localhost:8080/
```

## Customization

- Add new routes using `r.GET`, `r.POST`, etc. in `main.go`.
- Configure middleware (logging, recovery, CORS, etc.) by adding them to `gin.Default()` or with `r.Use(...)`.
