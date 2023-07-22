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

class PagesPageCest
{
    use MenuTestTrait;

    public function _before(AcceptanceTester $I)
    {
        $I->amOnPage('pages');
    }

    public function url(AcceptanceTester $I)
    {
        $I->seeCurrentUrlEquals('/pages');
    }

    public function title(AcceptanceTester $I)
    {
        $I->seeInTitle('Pages - TYPO3 Introduction Package');
    }

    public function header(AcceptanceTester $I)
    {
        $I->seeHeader('Page Layouts');
        $I->seeSubHeader('Your content, always presented in the right light.');
    }

    public function content(AcceptanceTester $I)
    {
        $I->see('TYPO3 offers the flexibility to use ready-made page layouts to have full control over the output of your content and to enable consistency. Templates are reusable and can be inherited to subpages if desired. Every website has different requirements, TYPO3 makes it possible to provide your own layouts and combine them with new designs.', 'main#page-content.bp-page-content.main-section p');
    }
}
