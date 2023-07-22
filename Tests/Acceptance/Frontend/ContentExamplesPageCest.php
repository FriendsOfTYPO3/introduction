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

class ContentExamplesPageCest
{
    use MenuTestTrait;

    public function _before(AcceptanceTester $I)
    {
        $I->amOnPage('content-examples');
    }

    public function url(AcceptanceTester $I)
    {
        $I->seeCurrentUrlEquals('/content-examples');
    }

    public function title(AcceptanceTester $I)
    {
        $I->seeInTitle('Content Examples - TYPO3 Introduction Package');
    }

    public function header(AcceptanceTester $I)
    {
        $I->seeHeader('Content Management Made Easy');
        $I->seeSubHeader('To help get you started with TYPO3, we’ve included usage examples of the core content elements that have made TYPO3 so popular.');
    }

    public function content(AcceptanceTester $I)
    {
        $I->see('These examples illustrate how - straight out-of-the-box - TYPO3 delivers a vast amount of freedom to content editors. Unlike more static content management systems, TYPO3 content management is highly element-based and granular. Click on any of the links in the secondary navigation, to the right, to see examples of each core content element.', 'main#page-content.bp-page-content.main-section p');
    }
}
