<?php

use TYPO3\CMS\Core\Core\Environment;

$applicationContext = Environment::getContext();

if ($applicationContext->isDevelopment()) {
    $GLOBALS['TYPO3_CONF_VARS'] = array_replace_recursive(
        $GLOBALS['TYPO3_CONF_VARS'],
        [
            'SYS' => [
                'exceptionalErrors' => getenv('TYPO3_CONFIG_SYS_EXCEPTIONALERRORS'),
                'systemLocale' => 'en_US'
            ],
        ]
    );
}
