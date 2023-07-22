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

class FeaturesPageCest
{
    use MenuTestTrait;

    public function _before(AcceptanceTester $I)
    {
        $I->amOnPage('features');
    }

    public function url(AcceptanceTester $I)
    {
        $I->seeCurrentUrlEquals('/features');
    }

    public function title(AcceptanceTester $I)
    {
        $I->seeInTitle('Features - TYPO3 Introduction Package');
    }

    public function header(AcceptanceTester $I)
    {
        $I->seeHeader('With a rich core feature set out-of-the-box, TYPO3 is an ideal choice for building ambitious digital experiences.');
    }

    public function content(AcceptanceTester $I)
    {
        $I->see('A single TYPO3 CMS installation can easily power hundreds of websites in many dozens of languages. Need more functionality? No problem! More than 1,500 open source extensions are available via Packagist and TYPO3 Extension Repository (TER).', 'main#page-content.bp-page-content.main-section p.lead.text-center');
    }
}
