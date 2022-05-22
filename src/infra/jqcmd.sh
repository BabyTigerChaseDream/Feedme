# tools to transfer data format:
#1) json to go struct : https://json2struct.mervine.net/
#2) xml to json struct : https://www.onlinetool.io/xmltogo/

#nytimes.json was from : 
#curl 'https://samizdat-graphql.nytimes.com/graphql/v2' 

#####################################################################################################
#[!!!!! COOL]
# find all path end at certain key: all path end at 'default'
jq -c 'paths | select(.[-1] == "default")' nytimeseuro.json
["data","legacyCollection","collectionsPage","stream","edges",0,"node","headline","default"]
["data","legacyCollection","collectionsPage","stream","edges",1,"node","headline","default"]
["data","legacyCollection","collectionsPage","stream","edges",2,"node","headline","default"]
["data","legacyCollection","collectionsPage","stream","edges",3,"node","headline","default"]
["data","legacyCollection","collectionsPage","stream","edges",4,"node","headline","default"]

#[!!!!! COOL]
# find path ends with specific key and print key value
# jq -c 'paths as $p| getpath($p) as $v|select($p[-1] == "default")|[$p,$v]' nytimeseuro.json
jq -c 'paths as $p| getpath($p) as $v|select($p[-1] == "default")|[$v]' nytimeseuro.json
["The War in Ukraine Has Unleashed a New Word"]
["Russians Seize 42 Towns in Eastern Ukraine as Fighting Intensifies"]
["Dug in on the front lines, Ukrainian soldiers fight to repel the Russian onslaught."]
["Hackers Claim to Target Russian Institutions in Barrage of Cyberattacks and Leaks"]
["For France’s Muslims, a Choice Between Lesser Evils in Presidential Vote"]

jq -c 'paths as $p| getpath($p) as $v|select($p[-1] == "headline")|$v.default' nytimeseuro.json
"Fears Are Mounting That Ukraine War Will Spill Across Borders"
"I.C.C. Joins Investigation of War Crimes in Ukraine"
"Ukraine War Impact Widens: Russia Cuts Gas Flow and Vows More Reprisals"
"House Passes Bill Urging Biden to Sell Seized Russian Yachts to Aid Ukraine"
"Endgame Nears in Bidding for Chelsea F.C."
# find all 'objects' end with certain key and print 'value' of 'objects[key]''
jq -c 'paths as $p| getpath($p) as $v|select($p[-1] == "headline")|$v' nytimeseuro.json
{"default":"Fears Are Mounting That Ukraine War Will Spill Across Borders","__typename":"CreativeWorkHeadline"}
{"default":"I.C.C. Joins Investigation of War Crimes in Ukraine","__typename":"CreativeWorkHeadline"}
{"default":"Ukraine War Impact Widens: Russia Cuts Gas Flow and Vows More Reprisals","__typename":"CreativeWorkHeadline"}
{"default":"House Passes Bill Urging Biden to Sell Seized Russian Yachts to Aid Ukraine","__typename":"CreativeWorkHeadline"}
{"default":"Endgame Nears in Bidding for Chelsea F.C.","__typename":"CreativeWorkHeadline"}

#####################################################################################################
#[!!!!! COOL]
# find all paths contains certains key('headine' in my case) and print it if values are 'objects'
#1) print value if values are 'objects'
jq '.. | .headline?|objects' nytimeseuro.json
#2) print value if values are NOT empty 
jq '.. | .headline?//empty' nytimeseuro.json
#3) print multiple fields in certain objects
jq '.. | .default?//empty,.firstPublished?//empty' nytimeseuro.json
"2015-12-09T18:42:46.000Z"
"2022-04-27T23:33:14.000Z"
"Fears Are Mounting That Ukraine War Will Spill Across Borders"
"2022-04-27T23:28:33.241Z"
"I.C.C. Joins Investigation of War Crimes in Ukraine"

#[!!!!! COOL]
# search keywords in ALL paths
#[X]jq -c 'paths |select(.[-1]//empty and contains("headline"))' nytimeseuro.json
# print FULL paths ends with certain key
jq -c 'paths | select(.[-1] == "headline")' nytimeseuro.json
["data","legacyCollection","collectionsPage","stream","edges",0,"node","headline"]
["data","legacyCollection","collectionsPage","stream","edges",1,"node","headline"]
["data","legacyCollection","collectionsPage","stream","edges",2,"node","headline"]
["data","legacyCollection","collectionsPage","stream","edges",3,"node","headline"]
["data","legacyCollection","collectionsPage","stream","edges",4,"node","headline"]
["data","legacyCollection","headline"]
# check if 'key' exists in any of the 'paths' 
# (as func paths' output is array, the basic is looking for a value in an array)
jq -c 'paths | select(.[-1]) as $p| index("headline") //empty' nytimeseuro.json
jq any(paths[-1]; . == "headline") nytimeseuro.json # super succinct solution , all in one line  
jq 'any(paths; .[-1] == "headline")' nytimeseuro.json 
# -e , has shell exist code ,directly handle with shell
jq -e 'any(paths; .[-1] == "headline")' nytimeseuro.json 

# specific path : $PATH needs to be in ['key1','key2'] format
jq -c 'getpath(["data","legacyCollection","collectionsPage","stream","edges",4,"node","headline","default"])' nytimeseuro.json
# all paths in the json 
jq -c 'paths'

#/section/world/asia
jq '.data.legacyCollection.collectionsPage | keys' nytimes.json  
	[ 
	"__typename", 
	"embeddedCollections", 
	"stream" 
	] 

# news in all
jq '.data.legacyCollection.collectionsPage.stream.edges|length'
	20 
jq '.data.legacyCollection.collectionsPage.stream.edges | keys' nytimes.json
	[ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 ]

jq '.data.legacyCollection.collectionsPage.stream.edges[]' nytimes.json
	[
	"__typename",
	"node"
	]
	...
	[
	"__typename",
	"node"
	]

# get all fields I want: url/headline/firstPublic
jq '.data.legacyCollection.collectionsPage.stream.edges[].node|.url,.headline.default,.firstPublished'
	"https://www.nytimes.com/interactive/2022/04/21/world/asia/hong-kong-star-ferry.html"
	"Aboard the Star Ferry in Hong Kong"
	"2022-04-22T02:37:14.891Z"
	...
	"https://www.nytimes.com/2022/04/18/briefing/russia-offensive-china-economy.html"
	"Your Tuesday Briefing: Russia Launches Assault in Eastern Ukraine"
	"2022-04-18T21:04:25.316Z"
jq -c '.data.legacyCollection.collectionsPage.stream.edges[].node|keys' nytimeseuro.json
	["__typename","archiveProperties","bylines","firstPublished","headline","id","kicker","promotionalMedia","summary","translations","typeOfMaterials","url"]
	["__typename","bylines","embedded","firstPublished","headline","id","kicker","promotionalMedia","summary","url"]
	["__typename","archiveProperties","bylines","firstPublished","headline","id","kicker","promotionalMedia","summary","translations","typeOfMaterials","url"]

# Only keep certain keys of object subset
jq '.data.legacyCollection.collectionsPage.stream.edges[].node|with_entries(select([.key] | inside(["headline"])))' nytimeseuro.json
{
  "headline": {
    "default": "Fears Are Mounting That Ukraine War Will Spill Across Borders",
    "__typename": "CreativeWorkHeadline"
  }
}
{
  "headline": {
    "default": "I.C.C. Joins Investigation of War Crimes in Ukraine",
    "__typename": "CreativeWorkHeadline"
  }
}
{
  "headline": {
    "default": "Endgame Nears in Bidding for Chelsea F.C.",
    "__typename": "CreativeWorkHeadline"
  }
}



# print only certain fields embed in a parent key: url/headline/firstPublic and combine them in a dict

# get all nested structure of path/route of json objects keys
# https://jqplay.org/s/2MtWze95uN
jq '[path(..)]'

# get type of all elements
.data.legacyCollection.collectionsPage.stream.edges[].node|map(type)
[
  "string",
  "string",
  "string",
  "string",
  "array",
  "object",
  "object",
  "array",
  "string",
  "string",
  "object",
  "array"
]

# all keys in the json objects  
jq '[.. | objects | keys[]] | unique'

# get entry end with certain key & concat all paths 
# [Jia Q]
# https://stackoverflow.com/questions/72069045/how-to-concat-jq-paths-in-each-array
jq -c 'paths | select(.[-1] == "external_url")|.[:-1] | map(strings = ".\(.)" | numbers = "[\(.)]") | join("")' sisy.json


# get just the subset I am interset
jq '(.data.legacyCollection.collectionsPage.stream.edges|map({node:(.node|{url,firstPublished,headline:{default:.headline.default},summary})})) as $edges|{data:{legacyCollection:{collectionsPage:{stream:{$edges}}}}}' nytimes-response.json