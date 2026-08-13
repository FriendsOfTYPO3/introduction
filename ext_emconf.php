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
    'description' => 'This is the Official TYPO3 Introduction Package, a carefully crafted TYPO3 distribution giving you a small insight in the powerful toolbox of the TYPO3 CMS framework. It comes with a full-fledged website based on Benjamin Kott\'s Bootstrap Package and Twitter Bootstrap, with simple options to customize the base theme.',
    'category' => 'distribution',
    'version' => '4.7.0',
    'state' => 'stable',
    'clearcacheonload' => 1,
    'author' => 'Introduction Package Team',
    'author_email' => '',
    'constraints' => [
        'depends' => [
            'typo3' => '13.4.0-14.99.99',
            'beuser' => '13.4.0-14.99.99',
            'bootstrap_package' => '16.0.0-16.99.99',
            'extensionmanager' => '13.4.0-14.99.99',
            'felogin' => '13.4.0-14.99.99',
            'filemetadata' => '13.4.0-14.99.99',
            'form' => '13.4.0-14.99.99',
            'impexp' => '13.4.0-14.99.99',
            'indexed_search' => '13.4.0-14.99.99',
            'tstemplate' => '13.4.0-14.99.99',
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
