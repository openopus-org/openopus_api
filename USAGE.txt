The Open Opus API is a very straightforward RESTful web service which returns data in JSON format. It's completely free to use and it requires no registration at all. You can use it in any website, HTTPS or not - but we strongly suggest you to serve your web app over HTTPS. You can also use the Open Opus API in any non-web application. 

== Base URI ==

All endpoints begin with

<code>https://api.openopus.org</code>

== Endpoints ==

The Open Opus API has four main endpoint groups: composers, genres, works and performers.

=== Composers === 

==== List popular composers ====

<code>GET /composer/list/pop.json</code>

Response:

 <syntaxhighlight lang="json">
{
    "status": {
        "version": "1.19.10",
        "success": "true",
        "source": "db",
        "rows": 23,
        "processingtime": 0.0017228126525878906,
        "api": "Open Opus-dyn"
    },
    "request": {
        "type": "pop",
        "item": "1"
    },
    "composers": [
        {
            "id": "87",
            "name": "Bach",
            "complete_name": "Johann Sebastian Bach",
            "birth": "1685-01-01",
            "death": "1750-01-01",
            "epoch": "Baroque",
            "portrait": "https://assets.openopus.org/portraits/12091447-1568084857.jpg"
        },
        {
            "id": "145",
            "name": "Beethoven",
            "complete_name": "Ludwig van Beethoven",
            "birth": "1770-01-01",
            "death": "1827-01-01",
            "epoch": "Early Romantic",
            "portrait": "https://assets.openopus.org/portraits/55910756-1568084860.jpg"
        }
    ]
}</syntaxhighlight>

==== List essential composers ====

<code>GET /composer/list/rec.json</code>

Response:

 <syntaxhighlight lang="json">
{
    "status": {
        "version": "1.19.10",
        "success": "true",
        "source": "db",
        "rows": 77,
        "processingtime": 0.0025510787963867188,
        "api": "Open Opus-dyn"
    },
    "request": {
        "type": "rec",
        "item": "1"
    },
    "composers": [
        {
            "id": "149",
            "name": "Adams",
            "complete_name": "John Adams",
            "birth": "1947-01-01",
            "death": null,
            "epoch": "21st Century",
            "portrait": "https://assets.openopus.org/portraits/74462091-1568084854.jpg"
        },
        {
            "id": "87",
            "name": "Bach",
            "complete_name": "Johann Sebastian Bach",
            "birth": "1685-01-01",
            "death": "1750-01-01",
            "epoch": "Baroque",
            "portrait": "https://assets.openopus.org/portraits/12091447-1568084857.jpg"
        }
    ]
}
</syntaxhighlight>

==== List composers by first letter ====

<code>GET /composer/list/name/a.json</code>

Response:

 <syntaxhighlight lang="json">
{
    "status": {
        "version": "1.19.10",
        "success": "true",
        "source": "db",
        "rows": 6,
        "processingtime": 0.0013890266418457031,
        "api": "Open Opus-dyn"
    },
    "request": {
        "type": "name",
        "item": "a"
    },
    "composers": [
        {
            "id": "149",
            "name": "Adams",
            "complete_name": "John Adams",
            "birth": "1947-01-01",
            "death": null,
            "epoch": "21st Century",
            "portrait": "https://assets.openopus.org/portraits/74462091-1568084854.jpg"
        },
        {
            "id": "130",
            "name": "Adès",
            "complete_name": "Thomas Adès",
            "birth": "1971-01-01",
            "death": null,
            "epoch": "21st Century",
            "portrait": "https://assets.openopus.org/portraits/31194505-1568084855.jpg"
        }
    ]
}
</syntaxhighlight>

==== List composers by period ====

<code>GET /composer/list/epoch/Early Romantic.json</code>

Options are:

* Medieval
* Renaissance
* Baroque
* Classical
* Early Romantic
* Romantic
* Late Romantic
* 20th Century
* Post-War
* 21st Century

Response:

 <syntaxhighlight lang="json">
{
    "status": {
        "version": "1.19.10",
        "success": "true",
        "source": "db",
        "rows": 13,
        "processingtime": 0.0015330314636230469,
        "api": "Open Opus-dyn"
    },
    "request": {
        "type": "epoch",
        "item": "Early Romantic"
    },
    "composers": [
        {
            "id": "145",
            "name": "Beethoven",
            "complete_name": "Ludwig van Beethoven",
            "birth": "1770-01-01",
            "death": "1827-01-01",
            "epoch": "Early Romantic",
            "portrait": "https://assets.openopus.org/portraits/55910756-1568084860.jpg"
        },
        {
            "id": "51",
            "name": "Bellini",
            "complete_name": "Vincenzo Bellini",
            "birth": "1801-01-01",
            "death": "1835-01-01",
            "epoch": "Early Romantic",
            "portrait": "https://assets.openopus.org/portraits/47933748-1568084861.jpg"
        }
    ]
}
</syntaxhighlight>

==== Search composers by name ====

<code>GET /composer/list/search/bruc.json</code>

Response:

 <syntaxhighlight lang="json">
{
    "status": {
        "version": "1.19.10",
        "success": "true",
        "source": "db",
        "rows": 2,
        "processingtime": 0.002309083938598633,
        "api": "Open Opus-dyn"
    },
    "request": {
        "type": "search",
        "item": "bruc"
    },
    "composers": [
        {
            "id": "184",
            "name": "Bruch",
            "complete_name": "Max Bruch",
            "birth": "1838-01-01",
            "death": "1920-01-01",
            "epoch": "Romantic",
            "portrait": "https://assets.openopus.org/portraits/32995254-1568084867.jpg"
        },
        {
            "id": "2",
            "name": "Bruckner",
            "complete_name": "Anton Bruckner",
            "birth": "1824-01-01",
            "death": "1896-01-01",
            "epoch": "Romantic",
            "portrait": "https://assets.openopus.org/portraits/25478484-1568084868.jpg"
        }
    ]
}
</syntaxhighlight>

==== List composers by ID ====

<code>GET /composer/list/ids/186,52.json</code>

Response:

 <syntaxhighlight lang="json">
{
    "status": {
        "version": "1.19.10",
        "success": "true",
        "source": "db",
        "rows": 2,
        "processingtime": 0.0011899471282958984,
        "api": "Open Opus-dyn"
    },
    "request": {
        "type": "ids",
        "item": "186,52"
    },
    "composers": [
        {
            "id": "52",
            "name": "Nielsen",
            "complete_name": "Carl Nielsen",
            "birth": "1865-01-01",
            "death": "1931-01-01",
            "epoch": "Late Romantic",
            "portrait": "https://assets.openopus.org/portraits/94573742-1568084926.jpg"
        },
        {
            "id": "186",
            "name": "Sibelius",
            "complete_name": "Jean Sibelius",
            "birth": "1865-01-01",
            "death": "1957-01-01",
            "epoch": "Late Romantic",
            "portrait": "https://assets.openopus.org/portraits/56825570-1568084947.jpg"
        }
    ]
}
</syntaxhighlight>

=== Genres === 

==== List genres by composer ID ====

<code>GET /genre/list/composer/2.json</code>

Response:

 <syntaxhighlight lang="json">
{
    "status": {
        "success": "true",
        "source": "db",
        "rows": 6,
        "processingtime": 0.002276897430419922,
        "api": "Open Opus-dyn",
        "version": "1.19.10"
    },
    "composer": {
        "id": "2",
        "name": "Bruckner",
        "epoch": "Romantic",
        "complete_name": "Anton Bruckner",
        "birth": "1824-01-01",
        "death": "1896-01-01",
        "portrait": "https://assets.openopus.org/portraits/25478484-1568084868.jpg"
    },
    "genres": [
        "Popular",
        "Recommended",
        "Chamber",
        "Keyboard",
        "Orchestral",
        "Vocal"
    ]
}
</syntaxhighlight>

=== Works === 

==== List works by composer ID ====

<code>GET /work/list/composer/129/genre/all.json</code>

Response:

 <syntaxhighlight lang="json">
{
    "status": {
        "success": "true",
        "source": "db",
        "rows": 160,
        "processingtime": 0.004470109939575195,
        "api": "Open Opus-dyn",
        "version": "1.19.10"
    },
    "request": {
        "type": "genre",
        "item": "all"
    },
    "composer": {
        "id": "129",
        "name": "Schumann",
        "epoch": "Romantic",
        "birth": "1810-01-01",
        "death": "1856-01-01",
        "complete_name": "Robert Schumann",
        "portrait": "https://assets.openopus.org/portraits/25233320-1568084946.jpg"
    },
    "works": [
        {
            "title": "Carnaval, op. 9",
            "subtitle": "",
            "searchterms": "",
            "popular": "1",
            "recommended": "1",
            "id": "15091",
            "genre": "Keyboard"
        },
        {
            "title": "Cello Concerto in A minor, op. 129",
            "subtitle": "",
            "searchterms": "",
            "popular": "0",
            "recommended": "1",
            "id": "15105",
            "genre": "Orchestral"
        }
    ]
}
</syntaxhighlight>

==== List popular works by composer ID ====

<code>GET /work/list/composer/129/genre/Popular.json</code>

Response:

 <syntaxhighlight lang="json">
{
    "status": {
        "success": "true",
        "source": "db",
        "rows": 10,
        "processingtime": 0.0015871524810791016,
        "api": "Open Opus-dyn",
        "version": "1.19.10"
    },
    "request": {
        "type": "genre",
        "item": "Popular"
    },
    "composer": {
        "id": "129",
        "name": "Schumann",
        "epoch": "Romantic",
        "birth": "1810-01-01",
        "death": "1856-01-01",
        "complete_name": "Robert Schumann",
        "portrait": "https://assets.openopus.org/portraits/25233320-1568084946.jpg"
    },
    "works": [
        {
            "title": "Piano Quintet in E flat major, op. 44",
            "subtitle": "",
            "searchterms": "",
            "popular": "1",
            "recommended": "1",
            "id": "15111",
            "genre": "Chamber"
        },
        {
            "title": "Arabesque, op. 18",
            "subtitle": "",
            "searchterms": "",
            "popular": "1",
            "recommended": "0",
            "id": "15138",
            "genre": "Keyboard"
        }
    ]
}
</syntaxhighlight>

==== List essential works by composer ID ====

<code>GET /work/list/composer/129/genre/Recommended.json</code>

Response:

 <syntaxhighlight lang="json">
{
    "status": {
        "success": "true",
        "source": "db",
        "rows": 17,
        "processingtime": 0.002140045166015625,
        "api": "Open Opus-dyn",
        "version": "1.19.10"
    },
    "request": {
        "type": "genre",
        "item": "Recommended"
    },
    "composer": {
        "id": "129",
        "name": "Schumann",
        "epoch": "Romantic",
        "birth": "1810-01-01",
        "death": "1856-01-01",
        "complete_name": "Robert Schumann",
        "portrait": "https://assets.openopus.org/portraits/25233320-1568084946.jpg"
    },
    "works": [
        {
            "title": "Piano Quartet in E flat major, op. 47",
            "subtitle": "",
            "searchterms": "",
            "popular": "0",
            "recommended": "1",
            "id": "15062",
            "genre": "Chamber"
        },
        {
            "title": "Piano Quintet in E flat major, op. 44",
            "subtitle": "",
            "searchterms": "",
            "popular": "1",
            "recommended": "1",
            "id": "15111",
            "genre": "Chamber"
        }
    ]
}
</syntaxhighlight>

==== List works by composer ID and genre ====

<code>GET /work/list/composer/2/Orchestral.json</code>

Options are:

* Chamber
* Keyboard
* Orchestral
* Stage
* Vocal

Response:

 <syntaxhighlight lang="json">
{
    "status": {
        "success": "true",
        "source": "db",
        "rows": 13,
        "processingtime": 0.0018169879913330078,
        "api": "Open Opus-dyn",
        "version": "1.19.10"
    },
    "request": {
        "type": "genre",
        "item": "Orchestral"
    },
    "composer": {
        "id": "2",
        "name": "Bruckner",
        "epoch": "Romantic",
        "birth": "1824-01-01",
        "death": "1896-01-01",
        "complete_name": "Anton Bruckner",
        "portrait": "https://assets.openopus.org/portraits/25478484-1568084868.jpg"
    },
    "works": [
        {
            "title": "Symphony no. 4 in E flat major, WAB 104, \"Romantic\"",
            "subtitle": "",
            "searchterms": "",
            "popular": "1",
            "recommended": "1",
            "id": "27",
            "genre": "Orchestral"
        },
        {
            "title": "Symphony no. 5 in B flat major, WAB 105",
            "subtitle": "",
            "searchterms": "",
            "popular": "0",
            "recommended": "1",
            "id": "68",
            "genre": "Orchestral"
        }
    ]
}
</syntaxhighlight>

==== Search works by composer ID and title ====

<code>GET /work/list/composer/196/genre/all/search/Sonata.json</code>

Response:

 <syntaxhighlight lang="json">
{
    "status": {
        "success": "true",
        "source": "db",
        "rows": 81,
        "processingtime": 0.01688218116760254,
        "api": "Open Opus-dyn",
        "version": "1.19.10"
    },
    "request": {
        "type": "genre",
        "item": "all",
        "search": "Sonata"
    },
    "composer": {
        "id": "196",
        "name": "Mozart",
        "epoch": "Classical",
        "birth": "1756-01-01",
        "death": "1791-01-01",
        "complete_name": "Wolfgang Amadeus Mozart",
        "portrait": "https://assets.openopus.org/portraits/21459195-1568084925.jpg"
    },
    "works": [
        {
            "title": "Piano Sonata no. 11 in A major, K.331, \"Alla turca\"",
            "subtitle": "",
            "searchterms": "",
            "popular": "1",
            "recommended": "1",
            "id": "23512",
            "genre": "Keyboard"
        },
        {
            "title": "Violin Sonata no. 21 in E minor, K.304",
            "subtitle": "",
            "searchterms": "",
            "popular": "0",
            "recommended": "1",
            "id": "23563",
            "genre": "Chamber"
        }
    ]
}
</syntaxhighlight>

==== Search works by composer ID, genre and title ====

<code>GET /work/list/composer/145/genre/Chamber/search/Cello Sonata.json</code>

Response:

 <syntaxhighlight lang="json">
{
    "status": {
        "success": "true",
        "source": "db",
        "rows": 6,
        "processingtime": 0.006963014602661133,
        "api": "Open Opus-dyn",
        "version": "1.19.10"
    },
    "request": {
        "type": "genre",
        "item": "Chamber",
        "search": "Cello Sonata"
    },
    "composer": {
        "id": "145",
        "name": "Beethoven",
        "epoch": "Early Romantic",
        "birth": "1770-01-01",
        "death": "1827-01-01",
        "complete_name": "Ludwig van Beethoven",
        "portrait": "https://assets.openopus.org/portraits/55910756-1568084860.jpg"
    },
    "works": [
        {
            "title": "Cello Sonata no. 4 in C major, op. 102, no. 1",
            "subtitle": "",
            "searchterms": "",
            "popular": "0",
            "recommended": "1",
            "id": "16300",
            "genre": "Chamber"
        },
        {
            "title": "Cello Sonata in E flat major, op. 64",
            "subtitle": "Version for cello and piano of the String Trio, op. 3 (tr. unknown)",
            "searchterms": "",
            "popular": "0",
            "recommended": "0",
            "id": "16429",
            "genre": "Chamber"
        }
    ]
}
</syntaxhighlight>

==== Detail work by ID ====

<code>GET /work/detail/15076.json </code>

Response:

 <syntaxhighlight lang="json">
{
    "status": {
        "success": "true",
        "source": "db",
        "processingtime": 0.0012171268463134766,
        "api": "Open Opus-cache",
        "version": "1.19.10"
    },
    "composer": {
        "id": "129",
        "name": "Schumann",
        "complete_name": "Robert Schumann",
        "epoch": "Romantic"
    },
    "work": {
        "genre": "Keyboard",
        "title": "Fantasy in C major, op. 17",
        "subtitle": "",
        "searchterms": [
            "op 17"
        ],
        "id": "15076",
        "searchmode": "catalogue",
        "catalogue": "op",
        "catalogue_number": "17"
    }
}
</syntaxhighlight>

==== List works by ID ====

<code>GET /work/list/ids/15076,24963.json</code>

Response:

 <syntaxhighlight lang="json">
{
    "status": {
        "success": "true",
        "source": "db",
        "rows": 2,
        "processingtime": 0.0019631385803222656,
        "api": "Open Opus-dyn",
        "version": "1.19.10"
    },
    "request": {
        "type": "ids",
        "item": "15076,24963"
    },
    "works": {
        "w:15076": {
            "composer": {
                "id": "129",
                "name": "Schumann",
                "complete_name": "Robert Schumann",
                "epoch": "Romantic"
            },
            "id": "15076",
            "title": "Fantasy in C major, op. 17",
            "subtitle": "",
            "genre": "Keyboard"
        },
        "w:24963": {
            "composer": {
                "id": "202",
                "name": "Poulenc",
                "complete_name": "Francis Poulenc",
                "epoch": "20th Century"
            },
            "id": "24963",
            "title": "Concerto in G minor for Organ, Strings, and Timpani, FP93",
            "subtitle": "",
            "genre": "Orchestral"
        }
    },
    "abstract": {
        "composers": {
            "portraits": [
                "https://assets.openopus.org/portraits/25233320-1568084946.jpg",
                "https://assets.openopus.org/portraits/94859063-1568084931.jpg"
            ],
            "names": [
                "Schumann",
                "Poulenc"
            ],
            "rows": 2
        },
        "works": {
            "rows": 2
        }
    }
}
</syntaxhighlight>

==== List random works ====

<code>POST /dyn/work/random</code>

Header:

{| class="wikitable"
|popularwork
|<code>1</code>
|Return only popular compositions
|-
|recommendedwork
|<code>1</code>
|Return only essential compositions
|-
|popularcomposer
|<code>1</code>
|Return only works by famous composers
|-
|recommendedcomposer
|<code>1</code>
|Return only works by essential composers
|-
|genre
|<code>All</code>
|Return only works of a certain genre
|-
|epoch
|<code>All</code>
|Return only works from a certain period
|-
|composer
|<code>196,183</code>
|Return only works by specific composers
|-
|composer_not
|<code>165,3</code>
|Don't return works by certain composers
|-
|work
|<code>16642,16578,16595</code>
|Return only works from a list
|-
|}

Response:

<syntaxhighlight lang="json">
{
    "status": {
        "success": "true",
        "processingtime": 0.003039836883544922,
        "api": "Open Opus-dyn",
        "version": "1.19.10"
    },
    "criteria": [
        {
            "popularwork": 1
        },
        {
            "recommendedwork": 1
        },
        {
            "genre": "Orchestral"
        },
        {
            "epoch": "Romantic"
        },
        {
            "composer": "196,145,80,129,138"
        }
    ],
    "works": [
        {
            "id": "15743",
            "title": "Siegfried Idyll, WWV 103",
            "genre": "Orchestral",
            "composer": {
                "id": "138",
                "name": "Wagner",
                "complete_name": "Richard Wagner",
                "epoch": "Romantic"
            }
        },
        {
            "id": "7706",
            "title": "Symphony no. 4 in E minor, op. 98",
            "genre": "Orchestral",
            "composer": {
                "id": "80",
                "name": "Brahms",
                "complete_name": "Johannes Brahms",
                "epoch": "Romantic"
            }
        },
        {
            "id": "15144",
            "title": "Piano Concerto in A minor, op. 54",
            "genre": "Orchestral",
            "composer": {
                "id": "129",
                "name": "Schumann",
                "complete_name": "Robert Schumann",
                "epoch": "Romantic"
            }
        },
        {
            "id": "7774",
            "title": "Piano Concerto no. 2 in B flat major, op. 83",
            "genre": "Orchestral",
            "composer": {
                "id": "80",
                "name": "Brahms",
                "complete_name": "Johannes Brahms",
                "epoch": "Romantic"
            }
        },
        {
            "id": "7764",
            "title": "Violin Concerto in D major, op. 77",
            "genre": "Orchestral",
            "composer": {
                "id": "80",
                "name": "Brahms",
                "complete_name": "Johannes Brahms",
                "epoch": "Romantic"
            }
        },
        {
            "id": "7765",
            "title": "Symphony no. 3 in F major, op. 90",
            "genre": "Orchestral",
            "composer": {
                "id": "80",
                "name": "Brahms",
                "complete_name": "Johannes Brahms",
                "epoch": "Romantic"
            }
        }
    ]
}
</syntaxhighlight>

=== Omnisearch ===

==== Search works and composers by name/title ====

<code>GET /omnisearch/beeth/0.json</code>

Response:

<syntaxhighlight lang="json">
{
    "status": {
        "success": "true",
        "source": "db",
        "rows": 20,
        "processingtime": 0.006445169448852539,
        "api": "Open Opus-dyn",
        "version": "1.20"
    },
    "request": {
        "type": "omnisearch",
        "search": "beeth",
        "offset": "0"
    },
    "results": [
        {
            "composer": {
                "id": "145",
                "name": "Beethoven",
                "complete_name": "Ludwig van Beethoven",
                "epoch": "Early Romantic",
                "birth": "1770-01-01",
                "death": "1827-01-01",
                "portrait": "https://assets.openopus.org/portraits/55910756-1568084860.jpg"
            },
            "work": null
        },
        {
            "composer": {
                "id": "145",
                "name": "Beethoven",
                "complete_name": "Ludwig van Beethoven",
                "epoch": "Early Romantic",
                "birth": "1770-01-01",
                "death": "1827-01-01",
                "portrait": "https://assets.openopus.org/portraits/55910756-1568084860.jpg"
            },
            "work": {
                "id": "16218",
                "title": "Piano Concerto no. 5 in E flat major, op. 73, \"Emperor\"",
                "subtitle": "",
                "genre": "Orchestral",
                "popular": "1",
                "recommended": "1",
                "searchterms": ""
            }
        },
        {
            "composer": {
                "id": "145",
                "name": "Beethoven",
                "complete_name": "Ludwig van Beethoven",
                "epoch": "Early Romantic",
                "birth": "1770-01-01",
                "death": "1827-01-01",
                "portrait": "https://assets.openopus.org/portraits/55910756-1568084860.jpg"
            },
            "work": {
                "id": "16184",
                "title": "Piano Sonata no. 21 in C major, op. 53, \"Waldstein\"",
                "subtitle": "",
                "genre": "Keyboard",
                "popular": "1",
                "recommended": "1",
                "searchterms": ""
            }
        },
        {
            "composer": {
                "id": "145",
                "name": "Beethoven",
                "complete_name": "Ludwig van Beethoven",
                "epoch": "Early Romantic",
                "birth": "1770-01-01",
                "death": "1827-01-01",
                "portrait": "https://assets.openopus.org/portraits/55910756-1568084860.jpg"
            },
            "work": {
                "id": "16419",
                "title": "Piano Sonata no. 23 in F minor, op. 57, \"Appassionata\"",
                "subtitle": "",
                "genre": "Keyboard",
                "popular": "1",
                "recommended": "1",
                "searchterms": ""
            }
        },
        {
            "composer": {
                "id": "145",
                "name": "Beethoven",
                "complete_name": "Ludwig van Beethoven",
                "epoch": "Early Romantic",
                "birth": "1770-01-01",
                "death": "1827-01-01",
                "portrait": "https://assets.openopus.org/portraits/55910756-1568084860.jpg"
            },
            "work": {
                "id": "16222",
                "title": "Piano Sonata no. 8 in C minor, op. 13, \"Pathétique\"",
                "subtitle": "",
                "genre": "Keyboard",
                "popular": "1",
                "recommended": "1",
                "searchterms": ""
            }
        },
        {
            "composer": {
                "id": "145",
                "name": "Beethoven",
                "complete_name": "Ludwig van Beethoven",
                "epoch": "Early Romantic",
                "birth": "1770-01-01",
                "death": "1827-01-01",
                "portrait": "https://assets.openopus.org/portraits/55910756-1568084860.jpg"
            },
            "work": {
                "id": "16231",
                "title": "Piano Trio no. 7 in B flat major, op. 97, \"Archduke\"",
                "subtitle": "",
                "genre": "Chamber",
                "popular": "1",
                "recommended": "1",
                "searchterms": ""
            }
        },
        {
            "composer": {
                "id": "145",
                "name": "Beethoven",
                "complete_name": "Ludwig van Beethoven",
                "epoch": "Early Romantic",
                "birth": "1770-01-01",
                "death": "1827-01-01",
                "portrait": "https://assets.openopus.org/portraits/55910756-1568084860.jpg"
            },
            "work": {
                "id": "16259",
                "title": "String Quartet no. 14 in C sharp minor, op. 131",
                "subtitle": "",
                "genre": "Chamber",
                "popular": "1",
                "recommended": "1",
                "searchterms": ""
            }
        },
        {
            "composer": {
                "id": "145",
                "name": "Beethoven",
                "complete_name": "Ludwig van Beethoven",
                "epoch": "Early Romantic",
                "birth": "1770-01-01",
                "death": "1827-01-01",
                "portrait": "https://assets.openopus.org/portraits/55910756-1568084860.jpg"
            },
            "work": {
                "id": "16406",
                "title": "Symphony no. 5 in C minor, op. 67",
                "subtitle": "",
                "genre": "Orchestral",
                "popular": "1",
                "recommended": "1",
                "searchterms": ""
            }
        },
        {
            "composer": {
                "id": "145",
                "name": "Beethoven",
                "complete_name": "Ludwig van Beethoven",
                "epoch": "Early Romantic",
                "birth": "1770-01-01",
                "death": "1827-01-01",
                "portrait": "https://assets.openopus.org/portraits/55910756-1568084860.jpg"
            },
            "work": {
                "id": "16238",
                "title": "Symphony no. 9 in D minor, op. 125, \"Choral\"",
                "subtitle": "",
                "genre": "Orchestral",
                "popular": "1",
                "recommended": "1",
                "searchterms": ""
            }
        },
        {
            "composer": {
                "id": "145",
                "name": "Beethoven",
                "complete_name": "Ludwig van Beethoven",
                "epoch": "Early Romantic",
                "birth": "1770-01-01",
                "death": "1827-01-01",
                "portrait": "https://assets.openopus.org/portraits/55910756-1568084860.jpg"
            },
            "work": {
                "id": "16458",
                "title": "Violin Concerto in D major, op. 61",
                "subtitle": "",
                "genre": "Orchestral",
                "popular": "1",
                "recommended": "1",
                "searchterms": ""
            }
        }
    ],
    "next": 20
}
</syntaxhighlight>

=== Performers ===

==== List roles by names ====

<code>POST /dyn/performer/list</code>

Header:

{| class="wikitable"
|names
|<code>["Herbert von Karajan", "Sviatoslav Richter", "Berliner Philharmoniker"]</code>
|}

Response:

<syntaxhighlight lang="json">
{
    "status": {
        "version": "1.20",
        "success": "true",
        "source": "db",
        "rows": 3,
        "processingtime": 0.0018758773803710938,
        "api": "Open Opus-dyn"
    },
    "request": {
        "type": "names",
        "item": [
            "Herbert von Karajan",
            "Sviatoslav Richter",
            "Berliner Philharmoniker"
        ]
    },
    "performers": {
        "readable": [
            {
                "name": "Sviatoslav Richter",
                "role": "Piano"
            },
            {
                "name": "Berliner Philharmoniker",
                "role": "Orchestra"
            },
            {
                "name": "Herbert von Karajan",
                "role": "Conductor"
            }
        ],
        "digest": {
            "sviatoslav-richter": "Piano",
            "berliner-philharmoniker": "Orchestra",
            "herbert-von-karajan": "Conductor"
        }
    }
}
</syntaxhighlight>

=== Work guesser ===

==== Bulk discover composer and work IDs by title ====

<code>POST /dyn/work/guess</code>

Header:

{| class="wikitable"
|works
|<code>[{"composer":"Igor Stravinsky","title":"Le sacre du printemps"},{"composer":"Anton Bruckner","title":"Symphony no 4"},{"composer":"Ferruccio Busoni", "title":"Piano concerto, op. 39"}]</code>
|}

Response:

<syntaxhighlight lang="json">
{
    "status": {
        "version": "1.20.6",
        "success": "true",
        "source": "db",
        "rows": 4,
        "processingtime": 0.0285589694976806640625,
        "api": "Open Opus-dyn"
    },
    "request": {
        "type": "works"
    },
    "composers": [
        {
            "requested": "Igor Stravinsky",
            "guessed": {
                "id": "190",
                "name": "Stravinsky",
                "complete_name": "Igor Stravinsky",
                "epoch": "20th Century",
                "birth": "1882-01-01",
                "death": "1971-01-01",
                "portrait": "https://assets.openopus.org/portraits/43509313-1560207052.jpg"
            }
        },
        {
            "requested": "Anton Bruckner",
            "guessed": {
                "id": "2",
                "name": "Bruckner",
                "complete_name": "Anton Bruckner",
                "epoch": "Romantic",
                "birth": "1824-01-01",
                "death": "1896-01-01",
                "portrait": "https://assets.openopus.org/portraits/17156265-1560206994.jpg"
            }
        },
        {
            "requested": "Ferruccio Busoni",
            "guessed": {
                "id": "84",
                "name": "Busoni",
                "complete_name": "Ferruccio Busoni",
                "epoch": "Late Romantic",
                "birth": "1866-01-01",
                "death": "1924-01-01",
                "portrait": "https://assets.openopus.org/portraits/27241620-1560206995.jpg"
            }
        }
    ],
    "works": [
        {
            "requested": {
                "composer": "Igor Stravinsky",
                "title": "Le sacre du printemps"
            },
            "guessed": {
                "id": "22505",
                "title": "The Rite of Spring",
                "subtitle": "Ballet",
                "genre": "Stage",
                "popular": "1",
                "recommended": "1",
                "composer": {
                    "id": "190",
                    "name": "Stravinsky",
                    "complete_name": "Igor Stravinsky",
                    "epoch": "20th Century",
                    "birth": "1882-01-01",
                    "death": "1971-01-01",
                    "portrait": "https://assets.openopus.org/portraits/43509313-1560207052.jpg"
                }
            }
        },
        {
            "requested": {
                "composer": "Anton Bruckner",
                "title": "Symphony no 4"
            },
            "guessed": {
                "id": "27",
                "title": "Symphony no. 4 in E flat major, WAB 104, \"Romantic\"",
                "subtitle": "",
                "genre": "Orchestral",
                "popular": "1",
                "recommended": "1",
                "composer": {
                    "id": "2",
                    "name": "Bruckner",
                    "complete_name": "Anton Bruckner",
                    "epoch": "Romantic",
                    "birth": "1824-01-01",
                    "death": "1896-01-01",
                    "portrait": "https://assets.openopus.org/portraits/17156265-1560206994.jpg"
                }
            }
        },
        {
            "requested": {
                "composer": "Ferruccio Busoni",
                "title": "Piano concerto, op. 39"
            },
            "guessed": {
                "id": "8564",
                "title": "Piano Concerto in C major, op. 39, KiV247",
                "subtitle": "",
                "genre": "Orchestral",
                "popular": "0",
                "recommended": "0",
                "composer": {
                    "id": "84",
                    "name": "Busoni",
                    "complete_name": "Ferruccio Busoni",
                    "epoch": "Late Romantic",
                    "birth": "1866-01-01",
                    "death": "1924-01-01",
                    "portrait": "https://assets.openopus.org/portraits/27241620-1560206995.jpg"
                }
            }
        }
    ]
}
</syntaxhighlight>

== The Status object ==

The Open Opus API always returns a <code>200 OK</code> success code. Errors and stats are reported in the <code>status</code> object instead:

{| class="wikitable"
|<code>version</code>
|<code>1.20</code>
|The Open Opus version
|-
|<code>success</code>
|<code>true</code>
|"true" if there are results for the query, "false" otherwise
|-
|<code>error</code>
|<code>No works found</code>
|"No [items] found" if good query with no results or "Bad request" if bad formed query
|-
|<code>source</code>
|<code>db</code>
|"db" if no external APIs were consumed, "external" otherwise
|-
|<code>rows</code>
|<code>2</code>
|Number of results
|-
|<code>processingtime</code>
|<code>0.0018379688262939453</code>
|Response time in seconds 
|-
|<code>api</code>
|<code>Open Opus-dyn</code>
|"Open Opus-cache" if showing a cached result, "Open Opus-dyn" otherwise
|-
|}
