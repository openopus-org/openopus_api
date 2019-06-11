# Open Opus
Free and open API for classical music metadata

It was created for the Concertmaster player (https://github.com/adrianosbr/concertmaster_player) and its Apple-flavored fork, Concertino (https://github.com/adrianosbr/concertino_player) but it can be freely used in any application.

# Dependencies

This API relies on an utilities library (https://github.com/adrianosbr/openopus_utils). Clone it beforehand.

# Steps to install

1. Clone the git repository (for example, in the /var/www/ folder)
2. Install the data (create a database first, for example, openopus)

```bash
mysql -u USER -p openopus < /var/www/openopus_api/db.sql
```

3. Install the Composer vendor packages:

```bash
cd /var/www/openopus_api/
composer install
```

4. Create an inc.php file from the example:

```bash
cd /var/www/openopus_api/lib/
cp inc-example.php inc.php
vim inc.php
```

5. This API uses Google Cloud to store image files. Create a 'keys' directory in /var/www/openopus_api/ and put your Google Cloud key.json in it
6. Set the environment variables for root:

```bash
vim /etc/environment
```

```bash
export BASEOPENOPUSDIR="/var/www/openopus_api/html"
```

7. Update crontab for root

```bash
# m     h       dom     mon     dow     command
0       0       1       *       *       /var/www/openopus_api/cln/db.sh
```

8. Give ownership of the public directory to the web server group (e.g., www-data):

```bash
chgrp www-data /var/www/openopus_api/html -R
```