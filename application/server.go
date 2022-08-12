package main

import (
	"fmt"
	"log"
	"net/http"
	"time"
)

func appHandler(w http.ResponseWriter, r *http.Request) {

	fmt.Println(time.Now(), "Hello from my new fresh server")
	w.Write([]byte("!!!Hello from my new fresh server with GO!!!"))
}

func main() {
	http.HandleFunc("/", appHandler)

	log.Println("Started, serving on port 8080")
	err := http.ListenAndServe(":8080", nil)

	if err != nil {
		log.Fatal(err.Error())
	}
}
