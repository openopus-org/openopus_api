# openopus_api
[Open Opus](https://openopus.org) is a free and open source API to classical music metadata.

It provides composers, works and performers information to classical music apps such as [Concertmaster](https://getconcertmaster.com) and [Concertino](https://getconcertino.com). It's written in PHP and relies on a MySQL database. It's free and everybody can use it directly. Additionally, all Open Opus data is in the [public domain](https://creativecommons.org/publicdomain/zero/1.0/) and can be freely used.

## Usage

It's a public RESTful API which returns data in JSON format. There is a [wiki](https://openopus.org/docs) explaining all endpoints and data structures. No registration needed.

## How to build

1. Fork and clone this git repository to your webserver (for example, in the `/var/www/` folder)
2. The Open Opus API uses a shared [Open Opus utilities library](https://github.com/openopus-org/openopus_utils). Clone it in the same directory
3. Create a MySQL database (for example, `openopus`) and load its strucuture

```bash
mysql -u USER -p openopus < /var/www/openopus_api/sql/openopus.sql
```

4. Install the Composer vendor packages:

```bash
cd /var/www/openopus_api/
composer install
```

5. Create an `inc.php` file from the example:

```bash
cd /var/www/openopus_api/lib/
cp inc-example.php inc.php
vim inc.php
```
6. Change variable values in the `lib/inc.php` accordingly to your webserver

### MySQL settings

Open Opus search functionality needs special configurations on your MySQL database. Update your server's `my.cnf` file (paths may vary on different operating systems) to include two extra directives:

```
innodb_ft_min_token_size = 1
innodb_ft_enable_stopword = 0
```

### Data import

To import the full Open Opus dataset to your fork, simply:

1. Remove the 2nd line from the `html/dyn/composer/importdump/index.phtml` file
2. Open the following URL in your web browser:

```
https://youropenopusfork.com/dyn/composer/importdump/
```

Replace the domain above with the one your app will use.

Additionally, you can download the data directly through the API:

```
https://api.openopus.org/work/dump.json
```

#### Search data

The search database will be renewed automatically every night (see "cache cleaning routines", below). To make the first import, simply run on command line:

```bash
php /var/www/openopus_api/cln/omnisearch.php
```

### Google Cloud Storage

The Open Opus API uses [Google Cloud](https://cloud.google.com/) to store image files. In order to use it, you must:

1. Create a `keys` directory in `/var/www/openopus_api/` and put your Google Cloud `keyfile.json` in it
2. Change the Google Cloud variables in the `lib/inc.php` accordingly to your Google account

### Composer portraits

There are 220 composer portraits in the `portraits` directory. If you want to upload them to your cloud:

1. Remove the 2nd line from the `html/dyn/composer/portraitupload/index.phtml` file
2. Open the following URL in your web browser:

```
https://youropenopusfork.com/dyn/composer/portraitupload/
```

Replace the domain above with the one your app will use.

### Cache and cache cleaning routines

The Open Opus API can cache its results, saving server resources. In order to activate this feature you must:

1. Give ownership of the public directory to the web server group (e.g., `www-data`):

```bash
chgrp www-data /var/www/openopus_api/html -R
```
2. Set the environment variables for root:

```bash
vim /etc/environment
```

```bash
export BASEOPENOPUSDIR="/var/www/openopus_api/html"
```

3. Update crontab for root (this will set the cache cleaning routines)

```bash
# m     h       dom     mon     dow     command
0       2       1       *       *       /var/www/openopus_api/cln/db.sh
0       1       *       *       *       php /var/www/openopus_api/cln/omnisearch.php
```

## Domains

There is a single public directory in the project (*/html*) and it must have its own virtual host on your webserver. (For example, we host it at [api.openopus.org](https://api.openopus.org).)

The API *must* be served with HTTPS. You can use a free [Let's Encrypt](https://letsencrypt.org/)-provided certificate, it's perfectly fine.

### CORS Settings

Open Opus is a publicly available API, so its [CORS](https://medium.com/@baphemot/understanding-cors-18ad6b478e2b) settings are fully permissive (`Access-Control-Allow-Origin: *`).

If you plan your fork to be more restrictive, you can make it accept requests only from trusted domains. Just remove the first line of the `html/.htaccess` file and implement the following configuration in your webserver (it must be placed inside the `<virtualhost>` directive):

```
SetEnvIf Origin ^(https?://(?:.+\.)?(example\.com|expl\.me)(?::\d{1,5})?)$   CORS_ALLOW_ORIGIN=$1
Header append Access-Control-Allow-Origin  %{CORS_ALLOW_ORIGIN}e   env=CORS_ALLOW_ORIGIN
Header merge  Vary "Origin"
```

Change the domains above to the ones your app will use.

## Contributing with code
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Contributing with data
Open Opus is a free, wiki-style, open source database. You can review existing info or add new entries to the database - any help will be appreciated!

## Contributing with money
Open Opus is free to use but it runs on web servers that cost us money. You can help us by supporting us on [Patreon](https://www.patreon.com/openopus) - any amount is more than welcome!

## License
API: [GPL v3.0](https://choosealicense.com/licenses/gpl-3.0/)
Data: [Public Domain](https://creativecommons.org/publicdomain/zero/1.0/)