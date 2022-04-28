#/bin/sh
# deleted cookie, check tmr if we can still get latest data

##########################################
#           jq command encap  
##########################################
##'check if a key exists'
#jq_searchkey() {
#}
#
#jq_path_endwith_key() {
#}
#
#jq_print_keyvalue() {
#}
##########################################
#             nytimes 
##########################################
url='https://samizdat-graphql.nytimes.com/graphql/v2'
website='https://www.nytimes.com'

# both work for below parameters
#num=5
num='5'

# both work: single quote or not quote
section='/section/world/europe'
#section=/section/world/europe
send_request() {
  curl_output=$(curl $url \
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
    --data-raw '{"operationName":"CollectionsQuery","variables":{"id":"'$section'","first":'$num',"streamQuery":{"sort":"newest","text":""},"exclusionMode":"NONE","isHighEnd":false,"highlightsListUri":"nyt://per/personalized-list/__null__","highlightsListFirst":0,"hasHighlightsList":false,"collectionQuery":{"sort":"newest","text":""}},"extensions":{"persistedQuery":{"version":1,"sha256Hash":"fce66de80aa68e479cd61c96b1d70509eadd7d2478eacb76e0494e25a33cb324"}}}' \
    --compressed | jq '.data.legacyCollection.collectionsPage.stream.edges[].node|.url,.headline.default,.firstPublished')
    # "id":"/section/world/europe change to different nytimes session , can scrape different section
    #echo $curl_output

    # double quotes is a must
    #return "'$curl_output'"
    return "$curl_output"
}
#send_request
echo "$(send_request)"
#result=$(send_request)
#echo "$result"
