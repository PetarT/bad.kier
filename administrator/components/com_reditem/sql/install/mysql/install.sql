SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE IF NOT EXISTS `#__reditem_categories`
(
    `id`                    int(11)                     NOT NULL AUTO_INCREMENT,
    `asset_id`              int(255)        UNSIGNED    NOT NULL DEFAULT '0',
    `parent_id`             int(10)         UNSIGNED    NOT NULL DEFAULT '0',
    `lft`                   int(11)                     NOT NULL DEFAULT '0',
    `rgt`                   int(11)                     NOT NULL DEFAULT '0',
    `level`                 int(10)         UNSIGNED    NOT NULL DEFAULT '0',
    `title`                 varchar(255)                NOT NULL,
    `alias`                 varchar(255)                NOT NULL DEFAULT '',
    `access`                tinyint(3)      UNSIGNED    NOT NULL DEFAULT '0',
    `path`                  varchar(255)                NOT NULL DEFAULT '',
    `type_id`               int(11)                     NOT NULL DEFAULT '0',
    `category_image`        varchar(255)                NOT NULL DEFAULT '',
    `introtext`             mediumtext                  NOT NULL,
    `fulltext`              text                        NOT NULL,
    `template_id`           int(11)                     NOT NULL,
    `featured`              tinyint(1)                  NOT NULL DEFAULT '0',
    `ordering`              int(11)                     NOT NULL DEFAULT '0',
    `published`             tinyint(1)                  NOT NULL,
    `publish_up`            datetime                    NOT NULL DEFAULT '0000-00-00 00:00:00',
    `publish_down`          datetime                    NOT NULL DEFAULT '0000-00-00 00:00:00',
    `checked_out`           int(10)         UNSIGNED    NOT NULL DEFAULT '0',
    `checked_out_time`      datetime                    NOT NULL DEFAULT '0000-00-00 00:00:00',
    `created_user_id`       int(10)         UNSIGNED    NOT NULL DEFAULT '0',
    `created_time`          datetime                    NOT NULL DEFAULT '0000-00-00 00:00:00',
    `modified_user_id`      int(10)         UNSIGNED    NOT NULL DEFAULT '0',
    `modified_time`         datetime                    NOT NULL DEFAULT '0000-00-00 00:00:00',
    `params`                varchar(2048)               NOT NULL DEFAULT '',
    PRIMARY KEY (`id`),
    KEY `idx_left_right` (`lft`,`rgt`),
    KEY `access` (`access`),
    KEY `type_id` (`type_id`),
    KEY `template_id` (`template_id`),
    KEY `published` (`published`),
    KEY `publish_up` (`publish_up`),
    KEY `publish_down` (`publish_down`),
    KEY `featured` (`featured`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `#__reditem_fields`
(
    `id`                        int(10)             NOT NULL AUTO_INCREMENT,
    `type_id`                   int(11)             NOT NULL DEFAULT '0',
    `type`                      varchar(255)        NOT NULL,
    `ordering`                  int(11)             NOT NULL DEFAULT '0',
    `published`                 tinyint(1)          NOT NULL,
    `name`                      varchar(255)        NOT NULL,
    `options`                   text                NOT NULL DEFAULT '',
    `fieldcode`                 varchar(255)        NOT NULL,
    `checked_out`               int(11)             NOT NULL,
    `checked_out_time`          datetime            NOT NULL,
    `searchable_in_frontend`    tinyint(1)          NOT NULL DEFAULT '0',
    `searchable_in_backend`     tinyint(1)          NOT NULL DEFAULT '0',
    `backend_filter`            tinyint(1)          NOT NULL DEFAULT '0',
    `params`                    varchar(2048)       NOT NULL DEFAULT '',
    PRIMARY KEY (`id`),
    KEY `type_id` (`type_id`),
    KEY `type` (`type`),
    KEY `published` (`published`),
    KEY `searchable_in_frontend` (`searchable_in_frontend`),
    KEY `searchable_in_backend` (`searchable_in_backend`),
    KEY `backend_filter` (`backend_filter`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `#__reditem_items`
(
    `id`                    int(11)                     NOT NULL AUTO_INCREMENT,
    `asset_id`              int(255)        UNSIGNED    NOT NULL DEFAULT '0',
    `title`                 varchar(255)                NOT NULL,
    `alias`                 varchar(255)                NOT NULL DEFAULT '',
    `ordering`              int(11)                     NOT NULL DEFAULT '0',
    `access`                tinyint(3)      UNSIGNED    NOT NULL DEFAULT '0',
    `blocked`               tinyint(1)                  NOT NULL DEFAULT '0',
    `published`             tinyint(1)                  NOT NULL,
    `publish_up`            datetime                    NOT NULL DEFAULT '0000-00-00 00:00:00',
    `publish_down`          datetime                    NOT NULL DEFAULT '0000-00-00 00:00:00',
    `featured`              tinyint(4)                  NOT NULL DEFAULT '0',
    `type_id`               int(11)                     NOT NULL,
    `template_id`           int(11)                     NOT NULL,
    `checked_out`           int(11)                     NOT NULL DEFAULT '0',
    `checked_out_time`      datetime                    NOT NULL DEFAULT '0000-00-00 00:00:00',
    `created_user_id`       int(10)         UNSIGNED    NOT NULL DEFAULT '0',
    `created_time`          datetime                    NOT NULL DEFAULT '0000-00-00 00:00:00',
    `modified_user_id`      int(10)         UNSIGNED    NOT NULL DEFAULT '0',
    `modified_time`         datetime                    NOT NULL DEFAULT '0000-00-00 00:00:00',
    `params`                varchar(2048)               NOT NULL DEFAULT '',
    PRIMARY KEY (`id`),
    KEY `access` (`access`),
    KEY `blocked` (`blocked`),
    KEY `type_id` (`type_id`),
    KEY `template_id` (`template_id`),
    KEY `published` (`published`),
    KEY `publish_down` (`publish_down`),
    KEY `publish_up` (`publish_up`),
    KEY `featured` (`featured`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `#__reditem_item_preview`
(
    `id`      varchar(100)     NOT NULL,
    `data`    text             NOT NULL DEFAULT '',
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `#__reditem_item_category_xref`
(
    `item_id`               int(11)         NOT NULL,
    `category_id`           int(11)         NOT NULL,
    PRIMARY KEY (`item_id`,`category_id`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `#__reditem_templates`
(
    `id`                    int(11)         NOT NULL AUTO_INCREMENT,
    `name`                  varchar(255)    NOT NULL,
    `filename`              varchar(255)    NOT NULL DEFAULT '',
    `type_id`               int(11)         NOT NULL DEFAULT '0',
    `description`           varchar(255)    NOT NULL,
    `typecode`              varchar(255)    NOT NULL,
    `published`             tinyint(1)      NOT NULL,
    `ordering`              int(11)         NOT NULL DEFAULT '0',
    `checked_out`           int(11)         NOT NULL DEFAULT '0',
    `checked_out_time`      datetime        NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `#__reditem_types`
(
    `id`                    int(11)         NOT NULL AUTO_INCREMENT,
    `asset_id`              int(255)        UNSIGNED NOT NULL DEFAULT '0',
    `title`                 varchar(255)    NOT NULL,
    `description`           text            NOT NULL DEFAULT '',
    `ordering`              int(11)         NOT NULL DEFAULT '0',
    `table_name`            varchar(200)    NOT NULL,
    `params`                varchar(2048)   NOT NULL DEFAULT '',
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `#__reditem_category_related`
(
    `related_id`    int(11)         NOT NULL,
    `parent_id`     int(11)         NOT NULL,
    KEY `related_id` (`related_id`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    COMMENT="redITEM Related Categories";

CREATE TABLE IF NOT EXISTS `#__reditem_comments` (
  `id`              int(11)     NOT NULL AUTO_INCREMENT,
  `parent_id`       int(11)     NOT NULL DEFAULT '0',
  `item_id`         int(11)     NOT NULL DEFAULT '0',
  `user_id`         int(11)     NOT NULL DEFAULT '0',
  `reply_user_id`   int(11)     NOT NULL DEFAULT '0',
  `private`         tinyint(1)  NOT NULL DEFAULT '0',
  `state`           tinyint(1)  NOT NULL DEFAULT '1',
  `trash`           tinyint(1)  NOT NULL DEFAULT '0',
  `comment`         mediumtext  NOT NULL DEFAULT '',
  `created`         datetime    NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    AUTO_INCREMENT=1
    COMMENT="redITEM Comments";

CREATE TABLE IF NOT EXISTS `#__reditem_item_rating` (
    `id`            int(11)     NOT NULL AUTO_INCREMENT,
    `item_id`       int(11)     NOT NULL DEFAULT '0',
    `rating`        float       NOT NULL DEFAULT '0',
    `user_id`       int(11)     NOT NULL DEFAULT '0',
    `rating_date`   datetime    NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (`id`),
    KEY `item_id` (`item_id`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    AUTO_INCREMENT=1
    COMMENT="redITEM Item Ratings";

CREATE TABLE IF NOT EXISTS `#__reditem_item_reports` (
    `id`        int(11)     NOT NULL AUTO_INCREMENT,
    `item_id`   int(11)     NOT NULL DEFAULT '0',
    `user_id`   int(11)     NOT NULL DEFAULT '0',
    `state`     int(1)      NOT NULL DEFAULT '1',
    `reason`    mediumtext  NOT NULL DEFAULT '',
    `created`   datetime    NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    AUTO_INCREMENT=1
    COMMENT="redITEM Items Reports";

CREATE TABLE IF NOT EXISTS `#__reditem_comment_reports` (
    `id`            int(11)     NOT NULL AUTO_INCREMENT,
    `comment_id`    int(11)     NOT NULL DEFAULT '0',
    `user_id`       int(11)     NOT NULL DEFAULT '0',
    `state`         int(1)      NOT NULL DEFAULT '1',
    `reason`        mediumtext  NOT NULL DEFAULT '',
    `created`       datetime    NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    AUTO_INCREMENT=1
    COMMENT="redITEM Comments Reports";

CREATE TABLE IF NOT EXISTS `#__reditem_reporter_point` (
    `id`        int(11)     NOT NULL AUTO_INCREMENT,
    `user_id`   int(11)     NOT NULL DEFAULT '0',
    `type`      varchar(10) NOT NULL DEFAULT '',
    `report_id` int(11)     NOT NULL DEFAULT '0',
    `point`     float       NOT NULL DEFAULT '5',
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    AUTO_INCREMENT=1
    COMMENT="redITEM Reporter Point";

CREATE TABLE IF NOT EXISTS `#__reditem_mail` (
  `id`                   int(11)      NOT NULL AUTO_INCREMENT,
  `type_id`              int(11)      NOT NULL DEFAULT '0',
  `default`              int(11)      NOT NULL DEFAULT '0',
  `subject`              varchar(255) NOT NULL,
  `description`          varchar(255) NOT NULL,
  `section`              varchar(255) NOT NULL,
  `content`              longtext     NOT NULL,
  `published`            tinyint(4)   NOT NULL,
  `ordering`             int(11)      NOT NULL DEFAULT '0',
  `checked_out`          int(11)      NOT NULL DEFAULT '0',
  `checked_out_time`     datetime     NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8
  COMMENT='redITEM Mail Center' AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `#__reditem_mail_settings` (
  `user_id`              int(11)             NOT NULL DEFAULT '0',
  `state`                int(1)              NOT NULL DEFAULT '1'  COMMENT '0: unsubscribed, 1: subscribed',
  `type`                 int(1)              NOT NULL DEFAULT '0'  COMMENT '0: send now, 1: send daily, 2: send weekly',
  `secret`               varchar(100)        NOT NULL DEFAULT ''   COMMENT 'Secret hash string to check when unsubscribing',
  `params`               varchar(2048)       NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8
  COMMENT='redITEM Notification Settings';

CREATE TABLE IF NOT EXISTS `#__reditem_mail_queue` (
  `id`          int(11)             NOT NULL AUTO_INCREMENT,
  `state`       int(1)              NOT NULL DEFAULT '0'    COMMENT '0: unsend, 1: sent',
  `section`     varchar(255)        NOT NULL DEFAULT ''     COMMENT 'Mail section',
  `subject`     varchar(255)        NOT NULL DEFAULT ''     COMMENT 'Mail subject',
  `body`        text                NOT NULL                COMMENT 'Mail body',
  `recipient`   int(11)             NOT NULL DEFAULT '0'    COMMENT 'Mail recipient (User ID)',
  `created`     datetime            NOT NULL DEFAULT '0000-00-00 00:00:00',
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    COMMENT='redITEM Mail Queue'
    AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `#__reditem_log_useractivity` (
    `id`          int(11)               NOT NULL AUTO_INCREMENT,
    `user_id`     int(11)               NOT NULL DEFAULT '0'                    COMMENT 'ID of user',
    `type`        varchar(255)          NOT NULL DEFAULT ''                     COMMENT 'Type of log (item.*, template.*, type.*, comment.*, field.*)',
    `target_id`   int(11)               NOT NULL DEFAULT '0'                    COMMENT 'ID of target (Base on type of log: item, template, type, comment)',
    `data`        text                  NOT NULL                                COMMENT 'JSON data of log',
    `created`     datetime              NOT NULL DEFAULT '0000-00-00 00:00:00'  COMMENT 'Created time of log',
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    COMMENT='redITEM Log User Activity'
    AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `#__reditem_watch_xref`
(
    `item_id`     int(11)   NOT NULL DEFAULT '0'    COMMENT 'ID of item',
    `user_id`     int(11)   NOT NULL DEFAULT '0'    COMMENT 'ID of user',
    PRIMARY KEY (`item_id`,`user_id`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    COMMENT='redITEM Watch feature reference';

CREATE TABLE IF NOT EXISTS `#__reditem_search_engine`
(
    `id`            int(11)     NOT NULL AUTO_INCREMENT,
    `user_id`       int(11)     NOT NULL DEFAULT '0'       COMMENT 'ID of user',
    `type_id`       int(11)     NOT NULL DEFAULT '0'       COMMENT 'ID of type',
    `send_mail`     tinyint(1)  NOT NULL DEFAULT '0'       COMMENT '1 => Send mail when new item match this search criteria',
    `search_data`   text        NOT NULL                   COMMENT 'Search data, in JSON format',
    PRIMARY KEY (`id`)
)
    ENGINE=InnoDB
    DEFAULT CHARSET=utf8
    COMMENT='redITEM Search Engine for users';

SET FOREIGN_KEY_CHECKS = 1;