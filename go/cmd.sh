#!/bin/bash

jq '(.data.legacyCollection.collectionsPage.stream.edges|map({node:(.node|{url,firstPublished,headline:{default:.headline.default},summary})})) as $edges|{data:{legacyCollection:{collectionsPage:{stream:{$edges}}}}}' nytimes-response.json > succient-nytimes.json
