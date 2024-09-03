# Use a Go base image
FROM golang:1.23 AS builder

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files
COPY go.mod go.sum ./

# Download Go module dependencies
RUN go mod download

# Copy the rest of the application code
COPY . .

# Build the Go application
RUN go build -o hello_world ./cmd/main.go

# Use a minimal base image for the final stage
FROM scratch

# Copy the built binary from the builder stage
COPY --from=builder /app/hello_world /app/hello_world

# Command to run the executable
CMD ["/app/hello_world"]
