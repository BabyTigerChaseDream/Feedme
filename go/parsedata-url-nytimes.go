package main

import (
	"encoding/json"
	"fmt"

	// "io/ioutil"
	"net/http"
	"reflect"
	"strings"
)

type NYTimesNews struct {
	Data struct {
		LegacyCollection struct {
			CollectionsPage struct {
				Stream struct {
					Edges []struct {
						Node struct {
							FirstPublished string `json:"firstPublished"`
							Headline       struct {
								Default string `json:"default"`
							} `json:"headline"`
							Summary string `json:"summary"`
							URL     string `json:"url"`
						} `json:"node"`
					} `json:"edges"`
				} `json:"stream"`
			} `json:"collectionsPage"`
		} `json:"legacyCollection"`
	} `json:"data"`
}

func main() {

	// nytimesjson:="nytimes-response.json"
	url := "https://samizdat-graphql.nytimes.com/graphql/v2"
	method := "POST"

	payload := strings.NewReader(`{"operationName":"CollectionsQuery","variables":{"id":"/section/world/europe","first":5,"streamQuery":{"sort":"newest","text":""},"exclusionMode":"NONE","isHighEnd":false,"highlightsListUri":"nyt://per/personalized-list/__null__","highlightsListFirst":0,"hasHighlightsList":false,"collectionQuery":{"sort":"newest","text":""}},"extensions":{"persistedQuery":{"version":1,"sha256Hash":"fce66de80aa68e479cd61c96b1d70509eadd7d2478eacb76e0494e25a33cb324"}}}`)

	client := &http.Client{}
	req, err := http.NewRequest(method, url, payload)

	if err != nil {
		fmt.Println(err)
		return
	}
	req.Header.Add("authority", "samizdat-graphql.nytimes.com")
	req.Header.Add("pragma", "no-cache")
	req.Header.Add("cache-control", "no-cache")
	req.Header.Add("sec-ch-ua", "\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"")
	req.Header.Add("nyt-token", "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAs+/oUCTBmD/cLdmcecrnBMHiU/pxQCn2DDyaPKUOXxi4p0uUSZQzsuq1pJ1m5z1i0YGPd1U1OeGHAChWtqoxC7bFMCXcwnE1oyui9G1uobgpm1GdhtwkR7ta7akVTcsF8zxiXx7DNXIPd2nIJFH83rmkZueKrC4JVaNzjvD+Z03piLn5bHWU6+w+rA+kyJtGgZNTXKyPh6EC6o5N+rknNMG5+CdTq35p8f99WjFawSvYgP9V64kgckbTbtdJ6YhVP58TnuYgr12urtwnIqWP9KSJ1e5vmgf3tunMqWNm6+AnsqNj8mCLdCuc5cEB74CwUeQcP2HQQmbCddBy2y0mEwIDAQAB")
	req.Header.Add("sec-ch-ua-mobile", "?0")
	req.Header.Add("user-agent", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36")
	req.Header.Add("nyt-app-type", "project-vi")
	req.Header.Add("content-type", "application/json")
	req.Header.Add("accept", "*/*")
	req.Header.Add("nyt-app-version", "0.0.5")
	req.Header.Add("sec-ch-ua-platform", "\"Linux\"")
	req.Header.Add("origin", "https://www.nytimes.com")
	req.Header.Add("sec-fetch-site", "same-site")
	req.Header.Add("sec-fetch-mode", "cors")
	req.Header.Add("sec-fetch-dest", "empty")
	req.Header.Add("referer", "https://www.nytimes.com/")
	req.Header.Add("accept-language", "zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7,cy;q=0.6")

	resp, err := client.Do(req)
	if err != nil {
		fmt.Println(err)
		return
	}
	defer resp.Body.Close()
	fmt.Println(reflect.TypeOf(resp))
	fmt.Println(reflect.TypeOf(resp.Body))

	fmt.Println("Done")

	/***************************************
	  # ----- decode with ioutil.ReadAll -----
	  **************************************
	bytedata, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Errorf("Read body: %v", err)
	}
	fmt.Println(reflect.TypeOf(resp))
	fmt.Println(reflect.TypeOf(resp.Body))
	fmt.Println(reflect.TypeOf(bytedata))
	var data NYTimesNews
	json.Unmarshal(bytedata, &data)
	*/
	/*************************************************
	  # ----- decode with json Decoder: right way  -----
	  /**************************************************/
	decoder := json.NewDecoder(resp.Body)

	var data NYTimesNews
	err = decoder.Decode(&data)
	if err != nil {
		fmt.Printf("%T\n%s\n%#v\n", err, err, err)
	}

	// for i, Node:= range data.Data.LegacyCollection.CollectionsPage.Stream.Edges{
	//     // fmt.Printf("[%d] \n %s \n", i, Node)
	//     fmt.Printf("[%d] \n %s \n %s\n", i, reflect.TypeOf(Node),Node)
	// }

	for i, Edge := range data.Data.LegacyCollection.CollectionsPage.Stream.Edges {
		fmt.Printf("[%d] \n %s \n %s -------- \n\n", i, Edge.Node.FirstPublished, Edge.Node.Headline.Default)
	}
}
