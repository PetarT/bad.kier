SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `#__reditem_categories`;
DROP TABLE IF EXISTS `#__reditem_fields`;
DROP TABLE IF EXISTS `#__reditem_items`;
DROP TABLE IF EXISTS `#__reditem_item_category_xref`;
DROP TABLE IF EXISTS `#__reditem_templates`;
DROP TABLE IF EXISTS `#__reditem_types`;
DROP TABLE IF EXISTS `#__reditem_category_related`;
DROP TABLE IF EXISTS `#__reditem_comments`;
DROP TABLE IF EXISTS `#__reditem_item_preview`;
DROP TABLE IF EXISTS `#__reditem_item_reports`;
DROP TABLE IF EXISTS `#__reditem_item_rating`;
DROP TABLE IF EXISTS `#__reditem_comment_reports`;
DROP TABLE IF EXISTS `#__reditem_reporter_point`;
DROP TABLE IF EXISTS `#__reditem_mail`;
DROP TABLE IF EXISTS `#__reditem_mail_queue`;
DROP TABLE IF EXISTS `#__reditem_mail_settings`;
DROP TABLE IF EXISTS `#__reditem_log_useractivity`;
DROP TABLE IF EXISTS `#__reditem_watch_xref`;
DROP TABLE IF EXISTS `#__reditem_search_engine`;

/* Delete version feature */
DELETE FROM `#__content_types` WHERE `type_alias` LIKE 'com_reditem.%';

SET FOREIGN_KEY_CHECKS=1;