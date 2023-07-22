<?php

declare(strict_types=1);

namespace TYPO3\CMS\Introduction\Tests\Support\Helper;

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

use TYPO3\CMS\Introduction\Tests\Support\AcceptanceTester;

trait MenuTestTrait
{
    public function mainNavigationHome(AcceptanceTester $I)
    {
        $I->click('Home', 'nav#mainnavigation ul.navbar-nav');
        $I->seeCurrentUrlEquals('/');
    }

    public function mainNavigationFeatures(AcceptanceTester $I)
    {
        $I->click('Features', 'nav#mainnavigation ul.navbar-nav');
        $I->seeCurrentUrlEquals('/features');
    }

    public function mainNavigationCustomize(AcceptanceTester $I)
    {
        $I->click('Customize', 'nav#mainnavigation ul.navbar-nav');
        $I->seeCurrentUrlEquals('/customize');
    }

    public function mainNavigationPages(AcceptanceTester $I)
    {
        // Link is not found on pages itself, using tryTo to avoid a failure.
        $I->tryToClick('Pages', 'nav#mainnavigation ul.navbar-nav');
        $I->seeCurrentUrlEquals('/pages');
    }

    public function mainNavigationContentExamples(AcceptanceTester $I)
    {
        $I->click('Content Examples', 'nav#mainnavigation ul.navbar-nav');
        $I->seeCurrentUrlEquals('/content-examples');
    }

    public function footerLinks(AcceptanceTester $I)
    {
        $I->seeLink('TYPO3', 'http://www.typo3.org');
        $I->seeLink('Bootstrap Package', 'https://www.bootstrap-package.com');

        $I->seeLink('Facebook', 'https://www.facebook.com/typo3/');
        $I->seeLink('Twitter', 'https://twitter.com/typo3');
        $I->seeLink('GitHub', 'https://github.com/TYPO3/typo3');
        $I->seeLink('YouTube', 'https://www.youtube.com/user/typo3');
    }
}
