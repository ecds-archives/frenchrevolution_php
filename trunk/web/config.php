<?php

/* Configuration settings for entire site */
// set level of php error reporting --  ONLY display errors
// (will hide ugly warnings if databse goes offline/is unreachable)
$in_production = "false";
if($in_production == "true") {
  error_reporting(E_ALL ^ E_NOTICE);	// for production
 } else {
  error_reporting(E_ERROR | E_PARSE);    // for development
 }



/* exist settings  */
if($in_production == "true") {
  $server = "bohr.library.emory.edu";
  $port = "7080";
 } else {
  $server = "kamina.library.emory.edu";
  $port = "8080";
 }
$db = "frenchrevolution";

$exist_args = array('host'   => $server,
	      	    'port'   => $port,
		    'db'     => $db,
		    'dbtype' => "exist");



?>
