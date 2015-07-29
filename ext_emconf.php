<?php

/***************************************************************
 * Extension Manager/Repository config file for ext "introduction".
 *
 * Auto generated 15-06-2015 17:57
 *
 * Manual updates:
 * Only the data in the array - everything else is removed by next
 * writing. "version" and "dependencies" must not be touched!
 ***************************************************************/

$EM_CONF[$_EXTKEY] = array (
	'title' => 'The official Introduction Package',
	'description' => 'This package delivers a new website (page tree) and shows all out-of-the-box features of TYPO3, and includes a theme based on Twitter Bootstrap 3, and a style editor to customize the design. Sample editors and backend groups are added',
	'category' => 'distribution',
	'version' => '2.2.2',
	'state' => 'stable',
	'uploadfolder' => false,
	'clearcacheonload' => true,
	'author' => 'Introduction Package Team',
	'author_email' => '',
	'author_company' => '',
	'constraints' => 
	array (
		'depends' => 
		array (
			'typo3' => '6.2.0-7.9.99',
			'bootstrap_package' => '6.2.0-7.9.99',
			'realurl' => '1.12.8-2.99.99',
		),
		'conflicts' => 
		array (
		),
		'suggests' => 
		array (
		),
	),
);

