<?php

$config = \TYPO3\CodingStandards\CsFixerConfig::create();
$config->getFinder()
    ->exclude('.build')
    ->exclude('Packages')
    ->in(__DIR__)
;

return $config;
