# Open Opus
Classical music open metadata API

It was created for the Concertmaster player (https://github.com/adrianosbr/concertmaster_player) and its Apple-flavored fork, Concertino (https://github.com/adrianosbr/concertino_player) but it can be freely used in any application.

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

4. Set the environment variables for root:

```bash
vim /etc/environment
```

```bash
export BASEHTMLDIR="/var/www/openopus_api/html"
```

5. Update crontab for root

```bash
# m     h       dom     mon     dow     command
0       *       *       *       *       /var/www/openopus_api/cln/db.sh
```

6. Give ownership of the public directory to the web server group (e.g., www-data):

```bash
chgrp www-data /var/www/openopus_api/html -R
```