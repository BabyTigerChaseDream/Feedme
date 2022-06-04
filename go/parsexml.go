// package parsexml
package main

import (
	"encoding/xml"
	"fmt"
	"io/ioutil"
	"net/http"
)

type Urlset struct {
	XMLName xml.Name `xml:"Urlset"`
	Text    string   `xml:",chardata"`
	Video   string   `xml:"video,attr"`
	Image   string   `xml:"image,attr"`
	Xhtml   string   `xml:"xhtml,attr"`
	Xmlns   string   `xml:"xmlns,attr"`
	News    string   `xml:"news,attr"`
	URL     []struct {
		Text string `xml:",chardata"`
		Loc  string `xml:"loc"`
		News struct {
			Text        string `xml:",chardata"`
			Publication struct {
				Text     string `xml:",chardata"`
				Name     string `xml:"name"`
				Language string `xml:"language"`
			} `xml:"publication"`
			PublicationDate string `xml:"publication_date"`
			Title           string `xml:"title"`
			Keywords        string `xml:"keywords"`
		} `xml:"news"`
		Image struct {
			Text    string `xml:",chardata"`
			Loc     string `xml:"loc"`
			Caption string `xml:"caption"`
		} `xml:"image"`
	} `xml:"url"`
}

// tweaked from: https://stackoverflow.com/a/42718113/1170664
// quote from : https://gist.github.com/james2doyle/e2f05b5756e4ee46848a8d987405f152
func GetXML(url string) ([]byte, error) {

	// url := "https://www.dw.com/de/news-sitemap.xml"
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
	// fmt.Println(reflect.TypeOf(resp))
	// fmt.Println(reflect.TypeOf(resp.Body))
	// fmt.Println(reflect.TypeOf(data))
	return data, nil
}

/*
func ParseXML(data []byte, v any) {
/**********************************************************************/
/*
	   // [decode from xml file]
	   // Open our xmlFile
	   xmlFile, err := os.Open("go2xml.xml")
	   // if we os.Open returns an error then handle it
	   if err != nil {
	       fmt.Println(err)
	   }

	   fmt.Println("Successfully Opened go2xml.xml")
	   // defer the closing of our xmlFile so that we can parse it later on
	   defer xmlFile.Close()

	   // read our opened xmlFile as a byte array.
	   byteValue, _ := ioutil.ReadAll(xmlFile)
	/**********************************************************************
	// [decode from response.Body]

	xml.Unmarshal(data, &v)
	for _, URLElement := range v.URL {
		fmt.Println(URLElement.News.Title, URLElement.News.PublicationDate, URLElement.Loc, "\n")
	}
} */

func main() {
	url := "https://www.dw.com/de/news-sitemap.xml"

	var URLset Urlset
	if xmlBytes, err := GetXML(url); err != nil {
		fmt.Printf("Failed to get XML: %v", err)
	} else {
		// ParseXML(xmlBytes, &URLset)
		xml.Unmarshal(xmlBytes, &URLset)
	}
	/************************** XML parser *************************/
	for _, URLElement := range URLset.URL {
		fmt.Println(URLElement.News.Title, URLElement.News.PublicationDate, URLElement.Loc, "\n")
	}

}
