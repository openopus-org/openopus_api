<?
    // web server 

    define ("INFRADIR", "/var/www"); // base OS directory 
    define ("UTILIB", INFRADIR. "/openopus_utils"); // directory for the utilities library
    define ("BASEDIR", INFRADIR. "/opubase_api"); // directory for all project, including public and non-public files
    define ("WEBDIR", BASEDIR. "/html"); // directory for publicly accessible files
    define ("LIB", BASEDIR. "/lib"); // directory for non-publicly accessible files, like libraries
    define ("LOG", BASEDIR. "/log"); // log dir
    define ("DEBUG", LOG. '/debug.txt'); // log file for some CURL operations detailed debug
    define ("TMP_DIR", "/tmp"); // OS temp directory

    // mysql 

    define ("DBDB", "openopus"); // mysql database basename
    define ("DBHOST", "localhost"); // mysql host address
    define ("DBUSER", "username"); // mysql username
    define ("DBPASS", "password"); // mysql password

    // cloud storage

    define ("GOOGLE_BUCKET", "assets.openopus.org"); // name of the storage bucket
    define ("GOOGLE_STORAGE", "https://". GOOGLE_BUCKET); // resulting url of the storage bucket
    define ("GOOGLE_KEYFILE", BASEDIR. "/keys/keyfile.json"); // google cloud key file

    // admin

    define ("SOFTWAREMAIL", "adminmail@gmail.com"); // server admin email address
    
    // debug

    define ("NOCACHE", false); // true will stop caching api results - useful for debugging

    // library initialization

    include_once (LIB. "/ini.php");