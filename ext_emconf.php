<?php

$EM_CONF[$_EXTKEY] = array(
	'title' => 'The official Introduction Package',
	'description' => 'This package delivers a new website (page tree) and shows all out-of-the-box features of TYPO3, and includes a theme based on Twitter Bootstrap 3, and a style editor to customize the design. Sample backend groups are added',
	'category' => 'distribution',
	'version' => '4.0.0',
	'state' => 'stable',
	'clearcacheonload' => 1,
	'author' => 'Introduction Package Team',
	'author_email' => '',
	'constraints' => array(
		'depends' => array(
			'typo3' => '9.5.0-9.5.99',
			'bootstrap_package' => '10.0.1-10.0.99'
		),
		'conflicts' => array(),
		'suggests' => array(),
	)
);
