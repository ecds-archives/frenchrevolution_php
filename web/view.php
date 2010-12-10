<?php

include("config.php");
//include("common_functions.php");
include_once("lib/xmlDbConnection.class.php");

$doc = $_GET["doc"];		// name of document to retrieve
$kw = isset($_GET["kw"]) ? $_GET["kw"] : "";	  // any keywords to highlight

if (!($doc)) {
  print "<p class='error'>Error: No document specified!</p>";
  exit;
}


$exist_args{"debug"} = true;
$xmldb = new xmlDbConnection($exist_args);

$filter = "";
if ($kw)
  $filter = "[. &= '$kw']";

// retrieve entire document, by docname
$query = 
'declare namespace tei="http://www.tei-c.org/ns/1.0"'; 
"document('/db/$db/$doc.xml')/tei:TEI$filter"; 
$xsl = "xsl/view.xsl";

// run the query 
$xmldb->xquery($query);
$pagetitle = $xmldb->findNode("title");

print "<html>
        <head>
          <title>French Revolution Pamphlet Collection : $pagetitle</title>
	  <link rel=\"stylesheet\" type=\"text/css\" href=\"fr.css\">
          <meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">";

$xmldb->xslBind("xsl/teiheader-dc.xsl");
$xmldb->xslBind("xsl/dc-htmldc.xsl");
$xmldb->transform();
$xmldb->printResult();

print "\n</head>";

include("header.php");

//html_head("Browse - Article");

//include("xml/head.xml");
print '<div class="content">';


// convert the terms into an array to pass to xmlDb functions
//  $myterms = array($term, $term2, $term3);
// transform xml with xslt
$xmldb->xslTransform($xsl);
// print out info about highlighted terms
//  $xmldb->highlightInfo($myterms);
// print transformed result
//  $xmldb->printResult($myterms);
$xmldb->printResult();

print "</div>";
include("footer.xml");
//include("xml/foot.xml"); 
include_once("google-trackfr.xml");
?>
</body>
</html>