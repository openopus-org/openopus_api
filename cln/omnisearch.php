<?
  chdir ($_SERVER["BASEOPENOPUSDIR"]);
  include_once ("../lib/inc.php");

  mysqli_query ($mysql, "truncate table omnisearch");
  mysqli_query ($mysql, "insert into omnisearch select concat(complete_name, ' ', title, ' ', COALESCE(subtitle,''), ' ', COALESCE(searchterms, '')) summary, composer_id, work.id work_id from composer, work where composer_id = composer.id");
  mysqli_query ($mysql, "insert into omnisearch select complete_name summary, id composer_id, null work_id from composer");