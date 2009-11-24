<?php

include("config.php");
include_once("lib/xmlDbConnection.class.php");

$kw = $_GET["kw"];		// any keywords to highlight

$exist_args{"debug"} = false;
$xmldb = new xmlDbConnection($exist_args);

$query = "for \$doc in /TEI.2[. &= '$kw']
let \$count := text:match-count(\$doc)
order by \$count descending
return <TEI.2>
{\$doc//titleStmt}
<docname>{substring-before(util:document-name(\$doc), '.xml')}</docname>
<hits>{\$count}</hits>
</TEI.2>";

$xsl = "xsl/search.xsl";
$xsl_params = array("keyword" => $kw);

print "<html>
        <head>
          <title>French Revolution Pamphlet Collection : Search</title>
	  <link rel=\"stylesheet\" type=\"text/css\" href=\"fr.css\">
          <meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">";

$headtitle = "Search";
include("header.php");

print "<div class='content'>
   <p>Search results for '$kw':</p>";

// run the query (start with first match, display 50 - should be more than enough to get everything)
$xmldb->xquery($query, 1, 50);
$xmldb->xslTransform($xsl, $xsl_params);
$xmldb->printResult();


print "</div>";
include("footer.xml");

?>
</body>
</html>
