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

defined('TYPO3_MODE') || die();

/***************
 * Add default RTE configuration
 */
$GLOBALS['TYPO3_CONF_VARS']['RTE']['Presets']['introduction_sitepackage'] =
    'EXT:introduction_sitepackage/Configuration/RTE/Default.yaml';

/***************
 * PageTS
 */
\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addPageTSConfig(
    '<INCLUDE_TYPOSCRIPT: source="FILE:EXT:introduction_sitepackage/Configuration/TsConfig/Page/All.tsconfig">'
);

/***************
 * Add default RTE configuration
 */
$GLOBALS['TYPO3_CONF_VARS']['RTE']['Presets']['introduction_sitepackage'] =
    'EXT:introduction_sitepackage/Configuration/RTE/Default.yaml';

/***************
 * Register custom EXT:form configuration
 */
\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addTypoScriptSetup(trim('
    module.tx_form {
        settings {
            yamlConfigurations {
                100 = EXT:introduction_sitepackage/Configuration/Form/CustomFormSetup.yaml
            }
        }
    }
    plugin.tx_form {
        settings {
            yamlConfigurations {
                100 = EXT:introduction_sitepackage/Configuration/Form/CustomFormSetup.yaml
            }
        }
    }
'));
