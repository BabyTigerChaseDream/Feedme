package main

import (
	"fmt"

	miniflux "miniflux.app/client"
)

func main() {
	/*
		client := miniflux.New("https://api.example.org", "admin", "secret")
		users, err := client.Users()
		if err != nil {
			fmt.Println(err)
			return
		}
		fmt.Println(users, err)
	*/
	client := miniflux.New("https://example.org/", "admin", "secret")
	subscriptions, err := client.Discover("https://example.org/")
	if err != nil {
		fmt.Println(err)
		return
	}
	fmt.Println(subscriptions)
}
