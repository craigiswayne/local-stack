<?php
if(isset($_SERVER) && !isset($_SERVER['COMPUTERNAME'])){

  // Set the computer name so that coin can determine the environment
  if($_SERVER['SERVER_NAME'] === 'local.coin.dagacube.net'){
    $_SERVER['COMPUTERNAME'] = 'st-mbook10.local';
  } else {
    $_SERVER['COMPUTERNAME'] = 'CW_NONE_SET';
  }
}
