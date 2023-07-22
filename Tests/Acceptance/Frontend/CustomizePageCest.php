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

class CustomizePageCest
{
    use MenuTestTrait;

    public function _before(AcceptanceTester $I)
    {
        $I->amOnPage('customize');
    }

    public function url(AcceptanceTester $I)
    {
        $I->seeCurrentUrlEquals('/customize');
    }

    public function title(AcceptanceTester $I)
    {
        $I->seeInTitle('Customize - TYPO3 Introduction Package');
    }

    public function header(AcceptanceTester $I)
    {
        $I->seeHeader('Incredible flexible');
        $I->seeSubHeader('Build any web application you can imagine.');
    }

    public function content(AcceptanceTester $I)
    {
        $I->see('Whether you need a blog, feedback forms, an online shop, integrations with external web services, calendars, and much more ... extensions give you a wide range of flexibility to go beyond core functionality, growing your site hand-in-hand as your business and site grow. They are the ideal building block for creating complex online solutions.', 'main#page-content.bp-page-content.main-section p');
    }
}
