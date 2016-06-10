/* Add "Params" column for categories */
ALTER TABLE `#__reditem_category_fields` ADD `type_id` INT( 11 ) NOT NULL DEFAULT '0' AFTER `type`;