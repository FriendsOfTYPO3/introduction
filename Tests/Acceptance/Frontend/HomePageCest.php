<?php

declare(strict_types=1);

namespace TYPO3\CMS\Introduction\Tests\Acceptance\Frontend;

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
use TYPO3\CMS\Introduction\Tests\Support\Helper\MenuTestTrait;

class HomePageCest
{
    use MenuTestTrait;

    public function _before(AcceptanceTester $I)
    {
        $I->amOnPage('');
    }

    public function url(AcceptanceTester $I)
    {
        $I->seeCurrentUrlEquals('/');
    }

    public function title(AcceptanceTester $I)
    {
        $I->seeInTitle('Congratulations - TYPO3 Introduction Package');
    }

    public function header(AcceptanceTester $I)
    {
        $I->seeHeader('Open source, enterprise CMS delivering  content-rich digital experiences on any channel,  any device, in any language');
    }

    public function content(AcceptanceTester $I)
    {
        $I->see('Possibilities', 'main#page-content.bp-page-content.main-section div.frame-header h2.element-header.text-center span');
        $I->see('Examples', 'main#page-content.bp-page-content.main-section div.frame-header h2.element-header.text-center span');
        $I->see('Playground', 'main#page-content.bp-page-content.main-section div.frame-header h2.element-header.text-center span');
    }
}
