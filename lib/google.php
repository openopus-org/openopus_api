<?
  require (BASEDIR. "/vendor/autoload.php");
  use Google\Cloud\Storage\StorageClient;

  // cloud uploading

  function cloudupload ($file, $id, $folder, $orgfile = "")
  {
    // copying original file

    if ($orgfile)
    {
      $ext = pathinfo ($orgfile, PATHINFO_EXTENSION);
      $name = $id. "-". time (). ".jpg";
    }
    else
    {
      $ext = pathinfo ($file, PATHINFO_EXTENSION);
      $name = $id. "-". time (). ".jpg";
    }

    $newfile = TMP_DIR. "/". $name;
    copy ($file, $newfile);

    // setting dimensions

    list ($width, $height) = getimagesize ($newfile);
    
    $new_width = PORTRAIT_W;
    $new_height = $height * (PORTRAIT_W / $width);

    if ($new_height < PORTRAIT_W)
    {
      $new_height = PORTRAIT_W;
      $new_width = $width * (PORTRAIT_W / $height);
    }

    // resampling

    $image_p = imagecreatetruecolor ($new_width, $new_height);

    if ($ext == "jpg") $image = imagecreatefromjpeg ($newfile);
    elseif ($ext == "png") $image = imagecreatefrompng ($newfile);

    imagecopyresampled ($image_p, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);
    imagedestroy ($image);

    // cropping

    $im2 = imagecrop ($image_p, ['x' => 0, 'y' => 0, 'width' => PORTRAIT_W, 'height' => PORTRAIT_W]);
    if ($im2 !== FALSE) {
        imagejpeg ($im2, $newfile, 100);
        imagedestroy ($im2);
    }
    imagedestroy ($image_p);

    $name = $folder. "/". $name;

    // instantiating google storage api

    $storage = new StorageClient (
      $config = [
        "keyFilePath" => GOOGLE_KEYFILE
      ]);

    $fl = fopen ($newfile, 'r');
    $bucket = $storage->bucket (GOOGLE_BUCKET);
    $object = $bucket->upload (
      $fl, [
        'name' => $name,
        'predefinedAcl' => "publicRead"
      ]);

    // deleting tmp file and returning its path

    unlink ($newfile);
    return GOOGLE_STORAGE. "/". $name;
  }
