/**
 * Created by martin on 30/07/2019
 */

package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"time"
)

// 成为有状态的服务
func main(){
	http.HandleFunc("/add",Add)
	http.HandleFunc("/get",Get)
	http.HandleFunc("/panic",Panic)
	_ = http.ListenAndServe(":31344", nil)
}

func Add(w http.ResponseWriter, r *http.Request) {
	f, err := os.Open("/opt/database/data.kv")
	if err != nil{
		log.Panic("add()# open file panic")
	}

	defer  f.Close()
	value := fmt.Sprintf("value:%s\n", time.Now().String())
	_, _ = f.Write([]byte(value))
	_, _ = w.Write([]byte("add ok!"))
}

func Get (w http.ResponseWriter, r *http.Request) {
	f, err := os.Open("/opt/database/data.kv")
	if err != nil{
		log.Panic("get()# open file panic")
	}

	defer  f.Close()
	result := make([]byte, 1024)
	_, _ = f.Read(result)
	_, _ = w.Write(result)
}

func Panic(w http.ResponseWriter, r *http.Request){
	log.Panic("gg")
}

