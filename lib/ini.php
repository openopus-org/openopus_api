<?
  // removing notices

  error_reporting (E_ALL ^ (E_WARNING | E_NOTICE));

  // header json

  if (!$nojson)
  {
    header ("Content-Type: application/json");
  }

  // global constants

  define ("SOFTWARENAME", "Open Opus");
  define ("SOFTWAREVERSION", "1.20.6");
  define ("USERAGENT", SOFTWARENAME. "/" . SOFTWAREVERSION. " ( ". SOFTWAREMAIL. " )");
  define ("API_RETURN", "json");
  define ("MIN_SIMILAR", 20);
  define ("PORTRAIT_W", 200);
  define ("CATALOGUE_REGEX", "/\,( )*(twv|bwv|wwv|hwv|op|opus|cw|g|d|k|kv|hess|woo|fs|k\.anh|wq|w|sz|kk|s|h|rv|jb ([0-9]+\:)|jw ([a-z]+\/)|(hob\.([a-z])+\:))( |\.)*((([0-9]+)([a-z])?)(\:.+)?)/i");

  // performer roles keywords

  $orchestra_kw = ['orchestra', 'symphony', 'philharmonic', 'philharmoniker', 'philharmonie', 'symphoniker', 'orchester', 'academy', 'orchestre', 'orchestra', 'orquesta', 'orquestra', 'orkester', 'orkest', 'philharmonia', 'academie', 'academia', 'accademia', 'akademie', 'society', 'societe', 'societa', 'sinfonietta', 'camerata', 'sinfonia', 'staatskapelle', 'strings', 'collegium', 'consortium'];
  $ensemble_kw = ['ensemble', 'quartet', 'quintet', 'trio', 'duo', 'players', 'solisti', 'chamber', 'octet', 'nonet', 'decet', 'oktett'];
  $choir_kw = ['choir', 'chorus', 'choral', 'cantorum', 'coro', 'singers', 'kammerchor', 'voices', 'kantorei', 'rundfunkchor', 'singakademie', 'vocale', 'knabenchor', 'singverein', 'sangerknaben', 'scholars'];
  
  // helper libraries

  include_once (UTILIB. "/lib.php");
  include_once (LIB. "/lib.php");

  // api init

  $starttime = microtime (true);
  $apireturn = Array ("status" => Array ("version" => SOFTWAREVERSION));

  // db init

  $mysql = mysqli_connect (DBHOST, DBUSER, DBPASS, DBDB);
  mysqli_set_charset ($mysql, "utf8");
