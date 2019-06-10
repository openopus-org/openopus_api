<?
  // guess the role of a performer using a given reference db
  
  function guessrole ($name, $rldb)
  {
    $name = preg_replace ('/^((sir|lord|dame) )/i', '', $name);

    global $orchestra_kw, $ensemble_kw, $choir_kw;

    foreach ($choir_kw as $kw)
    {
      if (stripos ($name, $kw) !== false)
      {
        return "Choir";
      }
    }
    
    foreach ($ensemble_kw as $kw)
    {
      if (stripos ($name, $kw) !== false)
      {
        return "Ensemble";
      }
    }

    foreach ($orchestra_kw as $kw)
    {
      if (stripos ($name, $kw) !== false)
      {
        return "Orchestra";
      }
    }

    if ($rldb[slug ($name)])
    {
      return $rldb[slug ($name)];
    }

    return "";
  }

