<?php
defined('TYPO3_MODE') or die('Access denied.');

\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addTypoScriptSetup('
  module.tx_form.settings.yamlConfigurations.100 = EXT:introduction/Configuration/Form/CustomFormSetup.yaml
  plugin.tx_form.settings.yamlConfigurations.100 = EXT:introduction/Configuration/Form/CustomFormSetup.yaml
');
