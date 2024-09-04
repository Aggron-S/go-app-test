package handlers

import (
    "encoding/json"
    "net/http"
)

// JSONHandler handles the /json endpoint and returns a JSON response
func JSONHandler(w http.ResponseWriter, r *http.Request) {
    response := map[string]string{"message": "Hello, JSON!"}
    w.Header().Set("Content-Type", "application/json")
    json.NewEncoder(w).Encode(response)
}
