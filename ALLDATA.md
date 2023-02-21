You can download the full Open Opus dataset directly through the API:

`GET `[`https://api.openopus.org/work/dump.json`](https://api.openopus.org/work/dump.json)

Response:

``` json
{
    "status": {
        "success": "true",
        "source": "db",
        "rows": 26666,
        "processingtime": 1.2537741661071777,
        "api": "Open Opus-cache",
        "version": "1.19.10"
    },
    "request": {
        "type": "dump"
    },
    "composers": [
        {
            "name": "Adams",
            "complete_name": "John Adams",
            "epoch": "21st Century",
            "birth": "1947-01-01",
            "death": null,
            "popular": "0",
            "recommended": "1",
            "works": [
                {
                    "title": "Berceuse élégiaque",
                    "subtitle": "For chamber orchestra",
                    "searchterms": "",
                    "popular": "0",
                    "recommended": "0",
                    "genre": "Orchestral"
                },
                {
                    "title": "Chamber Symphony",
                    "subtitle": "",
                    "searchterms": "",
                    "popular": "0",
                    "recommended": "0",
                    "genre": "Orchestral"
                }
            ]
        },
        {
            "name": "Adès",
            "complete_name": "Thomas Adès",
            "epoch": "21st Century",
            "birth": "1971-01-01",
            "death": null,
            "popular": "0",
            "recommended": null,
            "works": [
                {
                    "title": "Catch, op. 4",
                    "subtitle": "For clarinet, piano, violin and cello",
                    "searchterms": "",
                    "popular": "0",
                    "recommended": "0",
                    "genre": "Chamber"
                }
            ]
        }
    ]
}
```
