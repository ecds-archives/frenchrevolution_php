<?php

// param arg is optional - defaults to null
function transform ($xml_file, $xsl_file, $xsl_params = NULL) {
	$xsl = new DomDocument();
	$xsl->load($xsl_file);
	
	$xml = new DOMDocument();
	$xml->load($xml_file);
	
	/* create processor & import stylesheet */
	$proc = new XsltProcessor();
	$proc->importStylesheet($xsl);
	if ($xsl_params) {
		foreach ($xsl_params as $name => $val) {
			$proc->setParameter(null, $name, $val);
		}
	}
	/* transform the xml document and store the result */
	$xsl_result = $proc->transformToDoc($xml);
	
	return $xsl_result;
}



?>
