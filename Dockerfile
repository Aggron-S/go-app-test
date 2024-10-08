# Use a Go base image
FROM golang:1.23-alpine AS builder

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the go.mod and go.sum files
COPY go.mod ./

# Download Go module dependencies
RUN go mod download

# Copy the rest of the application code
COPY . .

# Build the Go application
RUN go build -o out ./cmd/main.go

# Use a more complete base image for the final stage
FROM golang:1.23-alpine

# Copy the built binary from the builder stage
COPY --from=builder /app/out /app/out

# Command to run the executable
CMD ["/app/out"]

