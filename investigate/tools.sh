#[save curl graphql request as json]
curl 'https://samizdat-graphql.nytimes.com/graphql/v2'   
-H 'authority: samizdat-graphql.nytimes.com'   
-H 'pragma: no-cache'   
-H 'cache-control: no-cache'   
-H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="99", "Google Chrome";v="99"'   
-H 'nyt-token: MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAs+/oUCTBmD/cLdmcecrnBMHiU/pxQCn2DDyaPKUOXxi4p0uUSZQzsuq1pJ1m5z1i0YGPd1U1OeGHAChWtqoxC7bFMCXcwnE1oyui9G1uobgpm1GdhtwkR7ta7akVTcsF8zxiXx7DNXIPd2nIJFH83rmkZueKrC4JVaNzjvD+Z03piLn5bHWU6+w+rA+kyJtGgZNTXKyPh6EC6o5N+rknNMG5+CdTq35p8f99WjFawSvYgP9V64kgckbTbtdJ6YhVP58TnuYgr12urtwnIqWP9KSJ1e5vmgf3tunMqWNm6+AnsqNj8mCLdCuc5cEB74CwUeQcP2HQQmbCddBy2y0mEwIDAQAB'   -H 'sec-ch-ua-mobile: ?0'   -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36'   -H 'nyt-app-type: project-vi'   -H 'content-type: application/json'   -H 'accept: */*'   -H 'nyt-app-version: 0.0.5'   -H 'sec-ch-ua-platform: "Linux"'   
-H 'origin: https://www.nytimes.com'   
-H 'sec-fetch-site: same-site'   
-H 'sec-fetch-mode: cors'   
-H 'sec-fetch-dest: empty'   
-H 'referer: https://www.nytimes.com/'   
-H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8,zh-TW;q=0.7,cy;q=0.6'   
-H 'cookie: nyt-a=RzlPho-p13M6vlZ1BJc12PuN; _ga=GA1.2.1637201770.1649556780; nyt-purr=cfhhcfhhhukf; __gads=ID=2aa8e551a41e20ed:T=1649556781:S=ALNI_MbM1Ax5Lj84VkH_VfKD7mloygIbIw; _gcl_au=1.1.1264348353.1649633804; purr-cache=<K0<r<C_<G_<S0; walley=GA1.2.1637201770.1649556780; iter_id=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhaWQiOiI2MjUzNmEyZmY3Nzk3NjAwMDEzOWRlZTciLCJjb21wYW55X2lkIjoiNWMwOThiM2QxNjU0YzEwMDAxMmM2OGY5IiwiaWF0IjoxNjQ5NjMzODM5fQ.gj4gULMHxzoy1CX50bey8Yj-Wjx_LK206-82CNnjJG0; walley_gid=GA1.2.1713333327.1649996291; nyt-gdpr=0; nyt-us=0; nyt-geo=JP; b2b_cig_opt=%7B%22isCorpUser%22%3Afalse%7D; edu_cig_opt=%7B%22isEduUser%22%3Afalse%7D; SIDNY=CA8SJQi-gOmSBhC2gemSBhoSMS3pRQrmmInPtxwL6F0I53dGIKvK7lkaQM5jOvGQmsiBcE0Q6uAFzyqGqxrZ2kPLd8O5DvLC1LGtMzpLQYbsCh6lOgSIq2n8E4avlXWtMdqeeV1Z78oUCQo=; nyt-auth-method=sso; _scid=06744d74-8650-4f12-a1f9-5f6cc9188d72; FPC=id=1ccabf8a-9941-4be2-9a37-e8386b0b04f7; WTPERSIST=regi_id=188458283; _sctr=1|1650038400000; _fbp=fb.1.1650081863909.1363780388; nyt-cmots=eyJmcmVxdWVuY3kiOnsiMjg2NTI1OTkzIjp7ImlubGluZVVuaXQiOnsiZiI6MiwicyI6MiwiZmMiOjE2NTAwODE5NDEsInNjIjoxNjUwMDgxOTQxLCJjYSI6MTY1MDA4MTk0MX19fX0=; RT="z=1&dm=nytimes.com&si=163e6b08-d14f-4f41-b124-ff34d0e3a9b0&ss=l21o8etu&sl=1&tt=7bn&bcn=%2F%2F684d0d46.akstat.io%2F&ul=7awo&hd=7ay1"; __gpi=UID=000004d9b43d93f8:T=1649996288:RT=1650104995:S=ALNI_MZ8y4BOf5Wo4dzMxJ0DKQhQPLmkUA; NYT-S=1w/FkFaXnGZWjDnJaODg.JXSxmZSbWvE0Rixx.SqzqSZSwIsIuBLEe6yQbNUg7kM59jOoea6bgYnTRJrSncMhw2S/ol53KDJVXzY9PUdAtMoR/8j7jk0Xy83xDTQO38FS1^^^^CA8SJQi-gOmSBhC2gemSBhoSMS3pRQrmmInPtxwL6F0I53dGIKvK7lkaQM5jOvGQmsiBcE0Q6uAFzyqGqxrZ2kPLd8O5DvLC1LGtMzpLQYbsCh6lOgSIq2n8E4avlXWtMdqeeV1Z78oUCQo=; nyt-b3-traceid=dfca8e3131914876a4f0176f44bd8fe6; nyt-m=DA9B927E161DF0A639F319D070FE2039&ft=i.0&imu=i.1&iir=i.0&uuid=s.bcd0fe89-74be-484f-b390-6b5af0d558f0&rc=i.0&vp=i.0&iga=i.0&ird=i.0&l=l.2.2502083088.3987422742&iue=i.0&igu=i.1&v=i.2&cav=i.0&imv=i.0&igf=i.0&s=s.core&t=i.2&prt=i.0&igd=i.0&ira=i.0&vr=l.4.0.0.0.0&ica=i.0&ier=i.0&ifv=i.0&iru=i.1&fv=i.0&g=i.0&er=i.1650105414&iub=i.0&e=i.1651392000&n=i.2&pr=l.4.0.0.0.0; nyt-jkidd=uid=188458283&lastRequest=1650105414712&activeDays=%5B0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C0%2C1%2C0%2C0%2C0%2C0%2C1%2C1%5D&adv=3&a7dv=3&a14dv=3&a21dv=3&lastKnownType=regi; datadome=hfTsJKlDwx4BH_T.CqcWEk28m_MZ2D9qF-fdMNC5viO.2Ovc7PBYalF8Ebn_LPs6Fe5S55nxzilLctU1UuQUohi4gGS~BcBMD9ifjnQF7niGiTso~Vz3TSNVu6-CD16; SIDNY="CA8SHxCnu-qSBhoSMS3pRQrmmInPtxwL6F0I53dGIKvK7lkaQNlW8ag9LOdZgD74ThoBEa0OtdU1QcU1KlbjPtHkf0aIvvccWuZjGgLUnx3j2GAiFACeLRuYu_JYcJluAQXjdwM="'   --data-raw '{"operationName":"CollectionsQuery","variables":{"id":"/section/world/europe","first":10,"streamQuery":{"sort":"newest","text":""},"exclusionMode":"NONE","isHighEnd":false,"highlightsListUri":"nyt://per/personalized-list/__null__","highlightsListFirst":0,"hasHighlightsList":false,"collectionQuery":{"sort":"newest","text":""}},"extensions":{"persistedQuery":{"version":1,"sha256Hash":"fce66de80aa68e479cd61c96b1d70509eadd7d2478eacb76e0494e25a33cb324"}}}'
| jq '.' > nytimes-graphql-search.json