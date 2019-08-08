/**
 * Created by martin on 30/07/2019
 */

package main

import (
	"net/http"
)

func main(){
	http.HandleFunc("/ping",Ping)
	http.HandleFunc("/index",Index)
	_ = http.ListenAndServe(":31344", nil)
}

func Ping(w http.ResponseWriter, r *http.Request) {
	_, _ = w.Write([]byte("ok"))
}

func Index (w http.ResponseWriter, r *http.Request) {
	_, _ = w.Write([]byte("index"))
}

