#nytimes.json was from : 
#curl 'https://samizdat-graphql.nytimes.com/graphql/v2' 

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