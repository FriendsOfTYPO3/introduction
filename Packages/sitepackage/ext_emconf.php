<?php

/*
 * This file is part of the TYPO3 CMS project.
 *
 * It is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License, either version 2
 * of the License, or any later version.
 *
 * For the full copyright and license information, please read the
 * LICENSE.txt file that was distributed with this source code.
 *
 * The TYPO3 project - inspiring people to share!
 */

$EM_CONF[$_EXTKEY] = [
    'title' => 'The official TYPO3 Introduction Sitepackage',
    'description' => 'TYPO3 Introduction Sitepackage',
    'category' => 'templates',
    'version' => '5.0.0',
    'state' => 'stable',
    'clearCacheOnLoad' => 1,
    'author' => 'Introduction Package Team',
    'author_email' => 'typo3cms@typo3.org',
    'author_company' => 'TYPO3 Association',
    'constraints' => [
        'depends' => [
            'typo3' => '9.5.0-10.4.99',
            'bootstrap_package' => '11.0.0-11.9.99',
        ],
        'conflicts' => [],
        'suggests' => [
            'introduction' => '5.0.0-5.9.99',
        ],
    ],
];
