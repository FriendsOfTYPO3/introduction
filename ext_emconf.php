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
    'title' => 'The Official TYPO3 Introduction Package',
    'description' => 'This package delivers a new website (page tree) and shows all out-of-the-box features of TYPO3, and includes a theme based on Twitter Bootstrap 3, and a style editor to customize the design. Sample backend groups are added',
    'category' => 'distribution',
    'version' => '4.6.1',
    'state' => 'stable',
    'clearcacheonload' => 1,
    'author' => 'Introduction Package Team',
    'author_email' => '',
    'constraints' => [
        'depends' => [
            'typo3' => '12.3.0-12.4.99',
            'beuser' => '12.3.0-12.4.99',
            'bootstrap_package' => '13.0.1-13.9.99',
            'extensionmanager' => '12.3.0-12.4.99',
            'felogin' => '12.3.0-12.4.99',
            'filemetadata' => '12.3.0-12.4.99',
            'form' => '12.3.0-12.4.99',
            'impexp' => '12.3.0-12.4.99',
            'indexed_search' => '12.3.0-12.4.99',
            'tstemplate' => '12.3.0-12.4.99',
        ],
        'conflicts' => [],
        'suggests' => [],
    ],
    'autoload' => [
        'psr-4' => [
           'TYPO3\\CMS\\Introduction\\' => 'Classes',
        ],
    ],
];
