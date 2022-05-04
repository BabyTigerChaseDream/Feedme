#/bin/sh
# deleted cookie, check tmr if we can still get latest data
##########################################
#           jq command encap  
##########################################
##'check if a key exists' and returns 'true/false' as a whole
jq_haskey() {
  echo ' jq_haskey() running'
  jq -e 'any(paths; .[-1] == "'$2'")' <<< "$response"
}

# print keywords in 'key' or 'value'
#jq_searchkey() {
#}
jq_get_endkey_value() {
   jq -c 'paths as $p| getpath($p) as $v|select($p[-1] == "'$keyword'")|$v' <<< "$response"
}
# parse subset of json objects
#jq_get_struct() {
#}

jq_printpath() {
  echo "$response" | jq '.data.legacyCollection.collectionsPage.stream.edges[].node|.url,.headline.default,.firstPublished'
}

# search key value pair
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
  eval "$1='$(curl $url \
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
    --compressed)'"
    #--compressed |jq .data.legacyCollection.collectionsPage.stream.edges[])'"
    #echo $response
}
# 1) output func string 
# response is a global variable by default
send_request response
#echo " [R1] $response"

keyword="default"
#jq_haskey "$response" "headline"
#jq_haskey "$response" "$keyword"
status=$?
# () can group a list of commands
#if (exit $status)
#then
#    echo "Key word found"
#else
#    echo "NOTHING "
#fi
#jq_get_endkey_value #"$keyword"
#jq_fullpath_endkey "$keyword"# "$fulloath_endkey"
#echo "[Out of func]  $(jq_fullpath_endkey)"
#echo "[Out of parameter]  $PATHARRAY"

# get all paths ends with certain key, the path is in format "k1.k2.k3..."
jq_fullpath_endkey() {
  # 1)works below 
  #echo "In put response : $response"
  # works 
  #PATHARRAY=$(jq -c 'paths | select(.[-1] == "'$keyword'")|map(strings |= ".\(.)" | numbers |= "[\(.)]") | join("")'<<< "$response")
  #[X]#PATHARRAY=$(jq -c 'paths | select(.[-1] == ${keyword})|map(strings |= ".\(.)" | numbers |= "[\(.)]") | join("")'<<< "$response")
  #works:file name as command parameter 
  #PATHARRAY=$(jq -c 'paths | select(.[-1] == "'$keyword'")|map(strings |= ".\(.)" | numbers |= "[\(.)]") | join("")' $1)
  #???:file name as command parameter 
  PATHARRAY=$(jq -c 'paths | select(.[-1] == "'$keyword'")|map(strings |= ".\(.)" | numbers |= "[\(.)]") | join("")' ${myfile})
  # 2)works move it inside a func
  #PATHARRAY=$(echo "$response" | jq -c 'paths | select(.[-1] == "'$keyword'")|map(strings |= ".\(.)" | numbers |= "[\(.)]") | join("")')
  #echo "jq_fullpath_endkey out put : : : $PATHARRAY"
}
#myfile=/home/jia/codespace/Feedme/src/infra/nytimeseuro.json
myfile=nytimeseuro.json
#myfile=/

jq_fullpath_endkey #${myfile}
echo "[Out of parameter]  '$PATHARRAY'"
#arr=()
#while IFS=$'\n' read -r line; do
while IFS='' read -r line; do
#[work/matters] must have 'remove "' in line
   temp="${line%\"}"
   temp="${temp#\"}"
   arr+=($temp)
   #echo "[Read line] $line"
#   # execute jq command to get value of each path
   #jqcmd="'jq -c' "$line" "${myfile}""
   # () starts a completely new shell , so need to be specific on cmd/file path
   #echo $(/usr/bin/jq -c $line ${myfile})
   #echo $(/usr/bin/jq -c .data.legacyCollection.collectionsPage.stream.edges[0].node.headline.default nytimeseuro.json)
   #echo "/usr/bin/jq -c '$temp' "$myfile""
   #----------------------------------
   #[Works]: Or try to have this cmd in a func and pass $temp as parameter
   #[X] incorrect : 
   #TITLE=$(jq -c $line $myfile)
   TITLE=$(jq -c $temp $myfile)
   echo "$TITLE" 
   #----------------------------------
#   #content=$('jq -c "'$line'"<<< "'$response'"')
#   #content='$(echo "'$response'"|jq -c "'$line'")'
   #content='$(jq -c "'$line'"<<<"'$response'")'
   #echo "'$response'" | jq -c "$line"
#   jq -c "$line" <<< "$response"
   #echo "[content] $content"
   #break
done <<<$PATHARRAY