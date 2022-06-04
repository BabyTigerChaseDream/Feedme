package main

import (
	"encoding/xml"
	"fmt"
	"io/ioutil"
	"net/http"
	"reflect"
	// "github.com/antchfx/xmlquery"
)

type Rss struct {
	// XMLName xml.Name `xml:"urlset"`
	// rssfeed string
	XMLName xml.Name `xml:any`
	Channel
}

type Channel struct {
	URL []News `xml:"url"`
}

type News struct {
	Loc         string `xml:"loc"`
	Publishdate string `xml:"news>publication_date"`
	Title       string `xml:"news>title"`
	Summary     string `xml:"news>keywords"`
}

// tweaked from: https://stackoverflow.com/a/42718113/1170664
// quote from : https://gist.github.com/james2doyle/e2f05b5756e4ee46848a8d987405f152
func getXML(url string) ([]byte, error) {
	resp, err := http.Get(url)
	if err != nil {
		return []byte{}, fmt.Errorf("GET error: %v", err)
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return []byte{}, fmt.Errorf("Status error: %v", resp.StatusCode)
	}

	data, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return []byte{}, fmt.Errorf("Read body: %v", err)
	}
	fmt.Println(reflect.TypeOf(resp))
	fmt.Println(reflect.TypeOf(resp.Body))
	fmt.Println(reflect.TypeOf(data))
	return data, nil
}

func main() {
	// [decode from response.Body]
	url := "https://www.dw.com/en/news-sitemap.xml"

	var URLset Rss
	if xmlBytes, err := getXML(url); err != nil {
		fmt.Printf("Failed to get XML: %v", err)
	} else {
		xml.Unmarshal(xmlBytes, &URLset)
	}
	/************************** XML parser *************************/
	for _, URLElement := range URLset.URL {
		fmt.Println(
			"[Element]:",
			"\nTitle #", URLElement.Title,
			"\nPublicationDate #", URLElement.Publishdate,
			"\nSummary#", URLElement.Summary,
			"\nLoc #", URLElement.Loc, "\n")
	}
}
