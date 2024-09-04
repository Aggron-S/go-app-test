package routes

import (
    "github.com/gorilla/mux" // Importing a router library
    "myapp/handlers"
)

// NewRouter creates and returns a new router with defined routes
func NewRouter() *mux.Router {
    router := mux.NewRouter()
    router.HandleFunc("/hello", handlers.HelloHandler).Methods("GET")
    router.HandleFunc("/json", handlers.JSONHandler).Methods("GET")
    return router
}
