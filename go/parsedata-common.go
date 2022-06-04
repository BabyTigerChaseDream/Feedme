package main

import (
	"encoding/xml"
	"fmt"
	"io/ioutil"
	"net/http"
	// "github.com/antchfx/xmlquery"
)

/* interface to parse Rssfeed*/
type Rssfeed interface {
	GetXML() ([]byte, error)
	ParseXML([]byte)
}

/******** FP News struct *******/
type FPRss struct {
	FeedURL string   //`default:"https://foreignpolicy.com/feed/"`
	XMLName xml.Name `xml:any`
	FPChannel
}
type FPChannel struct {
	URL []FPNews `xml:"channel>item"`
}
type FPNews struct {
	Loc         string `xml:"link"`
	Publishdate string `xml:"pubDate"`
	Title       string `xml:"title"`
	Summary     string `xml:"description"`
}

func (r FPRss) GetXML() ([]byte, error) {
	url := r.FeedURL
	fmt.Printf("GetXML link is :", url)
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
	return data, nil
}

func (r FPRss) ParseXML(xmlBytes []byte) {
	var URLset FPRss
	xml.Unmarshal(xmlBytes, &URLset)
	for _, URLElement := range URLset.URL {
		fmt.Println(
			"[Element]:",
			"\nTitle #", URLElement.Title,
			"\nPublicationDate #", URLElement.Publishdate,
			"\nSummary#", URLElement.Summary,
			"\nLoc #", URLElement.Loc,
			"\n")
	}
}

/******** DW News struct *******/
type DWRss struct {
	FeedURL string   //`default:"https://www.dw.com/en/news-sitemap.xml"`
	XMLName xml.Name `xml:any`
	DWChannel
}
type DWChannel struct {
	URL []DWNews `xml:"url"`
}
type DWNews struct {
	Loc         string `xml:"loc"`
	Publishdate string `xml:"news>publication_date"`
	Title       string `xml:"news>title"`
	Summary     string `xml:"news>keywords"`
}

func (r DWRss) GetXML() ([]byte, error) {
	url := r.FeedURL
	fmt.Printf("GetXML link is :", url)
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
	return data, nil
}

func (r DWRss) ParseXML(xmlBytes []byte) {
	var URLset DWRss
	xml.Unmarshal(xmlBytes, &URLset)
	for _, URLElement := range URLset.URL {
		fmt.Println(
			"[Element]:",
			"\nTitle #", URLElement.Title,
			"\nPublicationDate #", URLElement.Publishdate,
			"\nSummary#", URLElement.Summary,
			"\nLoc #", URLElement.Loc,
			"\n")
	}
}
func main() {
	FeedArray := []Rssfeed{
		FPRss{FeedURL: "https://foreignpolicy.com/feed/"},
		DWRss{FeedURL: "https://www.dw.com/en/news-sitemap.xml"},
	}

	for _, R := range FeedArray {
		if xmlBytes, err := R.GetXML(); err != nil {
			fmt.Printf("Failed to get XML: %v", err)
		} else {
			R.ParseXML(xmlBytes)
		}
	}
}
