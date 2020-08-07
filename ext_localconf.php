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

defined('TYPO3_MODE') or die();

/**
 * We must make sure that the feature toggle "felogin.extbase" is not active
 * during the initial data import. Afterwards the update wizard can be used to
 * migrate to the new Extbase implementation. Once the support for 9.5 is
 * dropped this can be changed but then also the content element needs to be
 * migrated.
 */
$registry = \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\TYPO3\CMS\Core\Registry::class);

if (
    !$registry->get('introduction', 'feature.felogin.extbase.handled', false)
    && \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\TYPO3\CMS\Core\Configuration\Features::class)
        ->isFeatureEnabled('felogin.extbase')
) {
    \TYPO3\CMS\Core\Utility\GeneralUtility::makeInstance(\TYPO3\CMS\Core\Configuration\ConfigurationManager::class)
        ->disableFeature('felogin.extbase');
    $registry->set('introduction', 'feature.felogin.extbase.handled', true);
}

unset($registry);
