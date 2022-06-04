# 王炸
# everything in json , the parse with jq - PERFECT
pup 'json{}'| jq '..|keys?'


cat dw.html|pup 'div[class="news"]'

# get all titles
pup 'div.teaserContentWrap.a.h2'

# get all titles with text only 
pup 'div.teaserContentWrap.a.h2 text{]'

# get one output entry 
cat dw.html|pup 'json{}'| jq -c '.[0].children[0].children[1].children[11].children[1].children[3].children[0].children[5].children[]'

