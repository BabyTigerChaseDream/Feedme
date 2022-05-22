package main

import (
	"fmt"

	"github.com/mmcdole/gofeed"
)

func main() {
	fp := gofeed.NewParser()
	// fp.UserAgent = "MyCustomAgent 1.0"
	// feed, _ := fp.ParseURL("http://feeds.twit.tv/twit.xml")
	feed, _ := fp.ParseURL("https://rss.nytimes.com/services/xml/rss/nyt/HomePage.xml")

	fmt.Println(feed)
}
