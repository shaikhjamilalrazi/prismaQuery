-- CreateTable
CREATE TABLE `user` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `firstName` VARCHAR(50) NOT NULL,
    `middleName` VARCHAR(50) NOT NULL,
    `lastName` VARCHAR(50) NOT NULL,
    `mobile` VARCHAR(15) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `passwordHash` VARCHAR(32) NOT NULL,
    `registeredAt` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `lastLogin` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `intro` TEXT NULL,
    `profile` TEXT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `post` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `authorId` INTEGER UNSIGNED NOT NULL,
    `parentId` INTEGER UNSIGNED NOT NULL,
    `title` VARCHAR(75) NOT NULL,
    `metaTeitle` VARCHAR(100) NULL,
    `slug` VARCHAR(100) NULL,
    `summary` TINYTEXT NULL,
    `published` TINYTEXT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `publishedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `content` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `post_comment` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `postId` INTEGER UNSIGNED NOT NULL,
    `parentId` INTEGER UNSIGNED NOT NULL,
    `title` VARCHAR(100) NOT NULL,
    `published` TINYTEXT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `publishedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `content` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `category` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `parentId` INTEGER UNSIGNED NOT NULL,
    `title` VARCHAR(75) NOT NULL,
    `metaTitle` VARCHAR(100) NULL,
    `slug` VARCHAR(100) NULL,
    `content` TEXT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `post_category` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `postId` INTEGER UNSIGNED NOT NULL,
    `catrgoryId` INTEGER UNSIGNED NOT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tag` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(75) NOT NULL,
    `metaTitle` VARCHAR(100) NULL,
    `slug` VARCHAR(100) NULL,
    `content` TEXT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `post_tag` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `postId` INTEGER UNSIGNED NOT NULL,
    `tagId` INTEGER UNSIGNED NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `post_meta` (
    `id` INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    `postId` INTEGER UNSIGNED NOT NULL,
    `key` VARCHAR(50) NULL,
    `content` TEXT NULL,
    `createdAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
    `updatedAt` TIMESTAMP(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `post` ADD CONSTRAINT `post_authorId_fkey` FOREIGN KEY (`authorId`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_comment` ADD CONSTRAINT `post_comment_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_category` ADD CONSTRAINT `post_category_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_category` ADD CONSTRAINT `post_category_catrgoryId_fkey` FOREIGN KEY (`catrgoryId`) REFERENCES `category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_tag` ADD CONSTRAINT `post_tag_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_tag` ADD CONSTRAINT `post_tag_tagId_fkey` FOREIGN KEY (`tagId`) REFERENCES `tag`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `post_meta` ADD CONSTRAINT `post_meta_postId_fkey` FOREIGN KEY (`postId`) REFERENCES `post`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
