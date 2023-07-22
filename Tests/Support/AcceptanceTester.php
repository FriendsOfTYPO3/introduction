<?php

declare(strict_types=1);

namespace TYPO3\CMS\Introduction\Tests\Support;

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

use TYPO3\CMS\Introduction\Tests\Support\_generated\AcceptanceTesterActions;

class AcceptanceTester extends \Codeception\Actor
{
    use AcceptanceTesterActions;

    public function seeHeader(string $text): void
    {
        $this->see($text, 'div.body-bg.body-bg-top div.carousel .carousel-header');
    }

    public function seeSubHeader(string $text): void
    {
        $this->see($text, 'div.body-bg.body-bg-top div.carousel .carousel-subheader');
    }
}
