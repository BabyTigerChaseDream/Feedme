#!/bin/sh

##########################################
#             nytimes 
##########################################
url='https://samizdat-graphql.nytimes.com/graphql/v2'
website='https://www.nytimes.com'

# both work for below parameters
num=5

# both work: single quote or not quote

#section=/section/world/europe
sectionarray=(
  '/section/world/europe' 
  #'/section/technology' 
  '/section/world/asia'
  #'/section/opinion/international-world'
  '/section/opinion/business-economics'
  )
send_request() {
  #echo "first param is $1"
  # works
  #eval "$1='$(curl $url \
  # works: command not find
  #"$response='$(curl $url \
  #eval "$2='$(curl $url \
  #[X]work
  # !!!eval "$response
  eval "$2='$(curl $url \
    -H 'authority: samizdat-graphql.nytimes.com' \
    -H 'pragma: no-cache' \
    -H 'cache-control: no-cache' \
    -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="99", "Google Chrome";v="99"' \
    -H 'nyt-token: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAs+/oUCTBmD/cLdmcecrnBMHiU/pxQCn2DDyaPKUOXxi4p0uUSZQzsuq1pJ1m5z1i0YGPd1U1OeGHAChWtqoxC7bFMCXcwnE1oyui9G1uobgpm1GdhtwkR7ta7akVTcsF8zxiXx7DNXIPd2nIJFH83rmkZueKrC4JVaNzjvD+Z03piLn5bHWU6+w+rA+kyJtGgZNTXKyPh6EC6o5N+rknNMG5+CdTq35p8f99WjFawSvYgP9V64kgckbTbtdJ6YhVP58TnuYgr12urtwnIqWP9KSJ1e5vmgf3tunMqWNm6+AnsqNj8mCLdCuc5cEB74CwUeQcP2HQQmbCddBy2y0mEwIDAQAB' \
    -H 'sec-ch-ua-mobile: ?0' \
    -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36' \
    -H 'nyt-app-type: project-vi' \
    -H 'content-type: application/json' \
    -H 'accept: */*' \
    -H 'nyt-app-version: 0.0.5' \
    -H 'sec-ch-ua-platform: "Linux"' \
    -H 'origin: $website' \
    -H 'sec-fetch-site: same-site' \
    -H 'sec-fetch-mode: cors' \
    -H 'sec-fetch-dest: empty' \
    -H 'referer: $website' \
    -H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7,cy;q=0.6' \
    --data-raw '{"operationName":"CollectionsQuery","variables":{"id":"'$1'","first":'$num',"streamQuery":{"sort":"newest","text":""},"exclusionMode":"NONE","isHighEnd":false,"highlightsListUri":"nyt://per/personalized-list/__null__","highlightsListFirst":0,"hasHighlightsList":false,"collectionQuery":{"sort":"newest","text":""}},"extensions":{"persistedQuery":{"version":1,"sha256Hash":"fce66de80aa68e479cd61c96b1d70509eadd7d2478eacb76e0494e25a33cb324"}}}' \
    --compressed |jq -r '.data.legacyCollection.collectionsPage.stream.edges[].node|[.headline.default,.url,.summary,.firstPublished]')'"
    #echo $response
    echo "Good to get here" 
}
response=''
# 1) output func string 
# response is a global variable by default
for sect in ${sectionarray[@]}; do
   echo "****** Parse section :$sect"
   send_request "$sect" response
   #send_request '/section/world/asia'
   #break
   #echo "****************[response] $response *****************"
   printf "%s\n\n" "${response[@]}"
done