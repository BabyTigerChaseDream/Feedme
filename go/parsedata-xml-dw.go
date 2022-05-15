package main

import (
    "encoding/xml"
    "fmt"
    "io/ioutil"
    "os"
)

// our struct which contains the complete
// array of all Users in the file
type Users struct {
    XMLName xml.Name `xml:"urlset"`
    Users   []Url   `xml:"url"`
}

// the user struct, this contains our
// Type attribute, our user's name and
// a social struct which will contain all
// our social links
type Url struct {
    XMLName xml.Name `xml:"loc"`
    Type    string   `xml:"loc"`
}
type Urlset struct {
	XMLName xml.Name `xml:"urlset"`
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

func main() {

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

    // we initialize our Users array
    var urlset Urlset
    // we unmarshal our byteArray which contains our
    // xmlFiles content into 'users' which we defined above
    xml.Unmarshal(byteValue, &urlset)

    // we iterate through every user within our users array and
    // print out the user Type, their name, and their facebook url
    // as just an example
	fmt.Println("Length of URLS :",len(urlset.URL))
    for i := 0; i < len(urlset.URL); i++ {
        fmt.Println("News Loc: " + urlset.URL[i].Loc)
        fmt.Println("News Title: " + urlset.URL[i].News.Title)
        fmt.Println(" ********************* ")
    }

}