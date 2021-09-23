<?php

$EM_CONF[$_EXTKEY] = array(
	'title' => 'The official Introduction Package',
	'description' => 'This package delivers a new website (page tree) and shows all out-of-the-box features of TYPO3, and includes a theme based on Twitter Bootstrap 3, and a style editor to customize the design. Sample backend groups are added',
	'category' => 'distribution',
	'version' => '4.2.0',
	'state' => 'stable',
	'clearcacheonload' => 1,
	'author' => 'Introduction Package Team',
	'author_email' => '',
	'constraints' => array(
		'depends' => array(
			'typo3' => '10.4.10-10.4.99',
			'bootstrap_package' => '11.0.3-11.0.99',
			'felogin' => '10.4.10-10.4.99',
			'filemetadata' => '10.4.10-10.4.99',
			'form' => '10.4.10-10.4.99',
			'impexp' => '10.4.10-10.4.99',
			'indexed_search' => '10.4.10-10.4.99',
			'tstemplate' => '10.4.10-10.4.99',
		),
		'conflicts' => array(),
		'suggests' => array(),
	)
);
