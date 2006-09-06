<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
   <title>French Revolution Pamphlet Collection List</title>
   <link rel="stylesheet" type="text/css" href="fr.css">
</head>
<body>

<?php

$sort = $_GET["sort"];
$view = $_GET["view"];

if ($sort == "") $sort = "title";	// default sort option
$headtitle = "List";
include("header.php");
include("common_functions.php");

$params = array("sort" => $sort, "view" => $view);
$list =  transform("pamphletlist.xml", "xsl/list.xsl", $params);
print $list->saveXML();



include("footer.xml");

?>

</body>
</html>
