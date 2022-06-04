#/bin/bash
if [[ $(jq -c 'paths | index("nothinghaha")//empty' nytimeseuro.json) ]]; then
    echo "there are files"
else
    echo "no files found"
fi
