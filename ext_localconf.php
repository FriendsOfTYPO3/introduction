<?php
defined('TYPO3_MODE') or die('Access denied.');

if (TYPO3_MODE === 'BE') {
    /**
     * Register custom EXT:form configuration
     */
    \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addTypoScriptSetup(
        trim('
                module.tx_form {
                    settings {
                        yamlConfigurations {
                            100 = EXT:introduction/Configuration/Form/CustomFormSetup.yaml
                        }
                    }
                }
            ')
    );
}
