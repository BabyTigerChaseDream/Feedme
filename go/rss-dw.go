package main

import (
  "fmt"
  "net/http"
  "io/ioutil"
)

func main() {

  url := "https://www.dw.com/de/news-sitemap.xml"
  method := "GET"

  client := &http.Client {
  }
  req, err := http.NewRequest(method, url, nil)

  if err != nil {
    fmt.Println(err)
    return
  }
  // req.Header.Add("pragma", "no-cache")
  // req.Header.Add("cache-control", "no-cache")
  // req.Header.Add("sec-ch-ua", "\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"")
  // req.Header.Add("sec-ch-ua-mobile", "?0")
  // req.Header.Add("sec-ch-ua-platform", "\"Linux\"")
  // req.Header.Add("upgrade-insecure-requests", "1")
  // req.Header.Add("user-agent", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36")
  // req.Header.Add("accept", "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9")
  // req.Header.Add("sec-fetch-site", "same-origin")
  // req.Header.Add("sec-fetch-mode", "navigate")
  // req.Header.Add("sec-fetch-user", "?1")
  // req.Header.Add("sec-fetch-dest", "document")
  // req.Header.Add("referer", "https://www.dw.com/en/top-stories/s-9097")
  // req.Header.Add("accept-encoding", "gzip, deflate, br")
  // req.Header.Add("accept-language", "zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7,cy;q=0.6")
  // handle compressed content
  // req.Header.Set("Accept-Encoding", "identity")

  res, err := client.Do(req)
  if err != nil {
    fmt.Println(err)
    return
  }
  defer res.Body.Close()

  body, err := ioutil.ReadAll(res.Body)
  if err != nil {
    fmt.Println(err)
    return
  }
  fmt.Println(string(body))
}