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

use TYPO3\CMS\Core\Configuration\SiteConfiguration;
use TYPO3\CMS\Core\Database\ConnectionPool;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Extensionmanager\Event\AfterExtensionSiteFilesHaveBeenImportedEvent;

/**
 * Event listener to configure the 404 error handler.
 *
 * @internal
 */
final class AfterExtensionSiteFilesHaveBeenImportedEventListener
{
    private const PAGE_404 = '404';

    private SiteConfiguration $siteConfiguration;

    public function __construct(SiteConfiguration $siteConfiguration)
    {
        $this->siteConfiguration = $siteConfiguration;
    }

    public function __invoke(AfterExtensionSiteFilesHaveBeenImportedEvent $event): void
    {
        if ($event->getPackageKey() !== 'introduction') {
            return;
        }

        foreach ($event->getSiteIdentifierList() as $siteIdentifier) {
            if ($siteIdentifier !== 'introduction') {
                continue;
            }

            $configuration = $this->siteConfiguration->load($siteIdentifier);
            $this->configureErrorHandling($configuration);
            $this->siteConfiguration->write($siteIdentifier, $configuration);
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
            fn ($errorHandler) => ($errorHandler['errorCode'] ?? null) !== 404
        );

        // Add new configuration
        $configuration['errorHandling'][] = [
            'errorCode' => 404,
            'errorHandler' => 'Page',
            'errorContentSource' => \sprintf(
                't3://page?uid=%d',
                $this->getNotFoundErrorPageUid($configuration['rootPageId'])
            )
        ];
    }

    /**
     * @return int Uid of the error page.
     * @throws \RuntimeException If the error page is not found.
     */
    private function getNotFoundErrorPageUid(int $rootPageId): int
    {
        /** @var ConnectionPool $connectionPool */
        $connectionPool = GeneralUtility::makeInstance(ConnectionPool::class);
        $queryBuilder = $connectionPool->getQueryBuilderForTable('pages');
        $queryBuilder->getRestrictions()->removeAll();

        /** @var \Doctrine\DBAL\Driver\Result $result */
        $result = $queryBuilder->select('uid')
            ->from('pages')
            ->where(
                $queryBuilder->expr()->eq(
                    'pid',
                    $queryBuilder->createNamedParameter($rootPageId, \PDO::PARAM_INT)
                ),
                $queryBuilder->expr()->eq(
                    'title',
                    $queryBuilder->createNamedParameter(self::PAGE_404)
                )
            )
            ->execute()
        ;

        if (($page = $result->fetchAssociative()) !== false) {
            return (int)$page['uid'];
        }

        throw new \RuntimeException(\sprintf(
            'The page "%s" cannot be found under the root page "%d".',
            self::PAGE_404,
            $rootPageId
        ), 1633194089);
    }
}
