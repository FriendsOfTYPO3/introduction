<?php

declare(strict_types=1);

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

namespace TYPO3\CMS\Introduction\EventListener;

use TYPO3\CMS\Core\Attribute\AsEventListener;
use TYPO3\CMS\Core\Configuration\SiteConfiguration;
use TYPO3\CMS\Core\Configuration\SiteWriter;
use TYPO3\CMS\Core\Database\Connection;
use TYPO3\CMS\Core\Database\ConnectionPool;
use TYPO3\CMS\Core\Package\Event\PackageInitializationEvent;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Impexp\Initialization\ImportSiteConfigurationsOnPackageInitialization;

/**
 * Event listener to configure the 404 error handler.
 *
 * @internal
 */
#[AsEventListener(after: ImportSiteConfigurationsOnPackageInitialization::class)]
final readonly class ConfigureSiteErrorHandlingListener
{
    private const PAGE_404 = '404';

    public function __construct(
        private SiteConfiguration $siteConfiguration,
        private SiteWriter $siteWriter,
    ) {}

    public function __invoke(PackageInitializationEvent $event): void
    {
        if ($event->getExtensionKey() !== 'introduction') {
            return;
        }

        if (!$event->hasStorageEntry(ImportSiteConfigurationsOnPackageInitialization::class)) {
            return;
        }

        $siteIdentifierList = $event->getStorageEntry(ImportSiteConfigurationsOnPackageInitialization::class)->getResult();

        foreach ($siteIdentifierList as $siteIdentifier) {
            if ($siteIdentifier !== 'introduction') {
                continue;
            }

            $configuration = $this->siteConfiguration->load($siteIdentifier);
            $this->configureErrorHandling($configuration);
            $this->siteWriter->write($siteIdentifier, $configuration);
        }
    }

    /**
     * @param array<string,mixed> $configuration
     */
    private function configureErrorHandling(array &$configuration): void
    {
        // Remove existing configuration
        $configuration['errorHandling'] = array_filter(
            $configuration['errorHandling'] ?? [],
            fn($errorHandler) => ($errorHandler['errorCode'] ?? null) !== 404
        );

        // Add new configuration
        $configuration['errorHandling'][] = [
            'errorCode' => 404,
            'errorHandler' => 'Page',
            'errorContentSource' => sprintf(
                't3://page?uid=%d',
                $this->getNotFoundErrorPageUid($configuration['rootPageId'])
            ),
        ];
    }

    /**
     * @return int Uid of the error page.
     * @throws \RuntimeException If the error page is not found.
     */
    private function getNotFoundErrorPageUid(int $rootPageId): int
    {
        $connectionPool = GeneralUtility::makeInstance(ConnectionPool::class);
        $queryBuilder = $connectionPool->getQueryBuilderForTable('pages');
        $queryBuilder->getRestrictions()->removeAll();

        $result = $queryBuilder->select('uid')
            ->from('pages')
            ->where(
                $queryBuilder->expr()->eq(
                    'pid',
                    $queryBuilder->createNamedParameter($rootPageId, Connection::PARAM_INT)
                ),
                $queryBuilder->expr()->eq(
                    'title',
                    $queryBuilder->createNamedParameter(self::PAGE_404)
                )
            )
            ->executeQuery()
        ;

        if (($page = $result->fetchAssociative()) !== false) {
            return (int)$page['uid'];
        }

        throw new \RuntimeException(sprintf(
            'The page "%s" cannot be found under the root page "%d".',
            self::PAGE_404,
            $rootPageId
        ), 1633194089);
    }
}
