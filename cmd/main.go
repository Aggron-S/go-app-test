package main

import (
    "fmt"
    "log"
    "net/http"
    "myapp/routes"
)

func main() {
    mux := routes.NewRouter()
    fmt.Println("Starting server on :8080")
    if err := http.ListenAndServe(":8080", mux); err != nil {
        log.Fatal("Error starting server:", err)
    }
}
