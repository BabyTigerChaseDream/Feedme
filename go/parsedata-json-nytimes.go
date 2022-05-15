package main

type MyJsonName struct {
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

