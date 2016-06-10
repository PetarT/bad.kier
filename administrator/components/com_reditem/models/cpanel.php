<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Model
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

jimport('joomla.application.component.model');

/**
 * RedITEM CPanel Model
 *
 * @package     RedITEM.Backend
 * @subpackage  Model.CPanel
 * @since       2.0
 */
class RedItemModelCpanel extends RModelAdmin
{
	/**
	 * Install demo content
	 *
	 * @todo	This needs to be moved to it's own file
	 * @ToDo:	Need rebuild insert into category and related tables as table nested category query
	 * @return   boolean  Always returns true
	 *
	 * @since	2.0
	 */
	public function demoContentInsert()
	{
		$db                 = JFactory::getDbo();
		$user               = JFactory::getUser();
		$currentDate        = ReditemHelperSystem::getDateWithTimezone();
		$typeId             = 0;
		$typeTableName      = '';
		$templateCategoryId = 0;
		$templateItemId     = 0;

		/*
		 * Insert demo "redITEM" - Type
		 */
		$typeParams = new JRegistry(
			array(
				'thumbnailImageQuality' => '90',
				'thumbnailCreateMethod' => '0',
				'category_gmap_field' => '0',
				'default_categorydetail_template' => 0,
				'default_categoryimage_large_width' => 600,
				'default_categoryimage_large_height' => 600,
				'default_categoryimage_medium_width' => 300,
				'default_categoryimage_medium_height' => 300,
				'default_categoryimage_small_width' => 150,
				'default_categoryimage_small_height' => 150,
				'default_itemdetail_template' => 0
			)
		);

		$typeTable = RTable::getAdminInstance('Type');
		$data = array (
			'id'          => null,
			'title'       => 'Type A',
			'description' => '<p>Type A description</p>',
			'params'      => $typeParams->toString(),
		);
		$typeTable->save($data);
		$typeId = $typeTable->id;
		$typeTableName = ReditemHelperType::getTableName($typeId);

		$typeTable = RTable::getAdminInstance('Type');
		$data = array (
			'id'          => null,
			'title'       => 'Type B',
			'description' => '<p>Type B description</p>',
			'params'      => $typeParams->toString(),
		);
		$typeTable->save($data);
		$typeId1 = $typeTable->id;
		$typeTableName1 = ReditemHelperType::getTableName($typeId1);

		unset($typeTable);

		/*
		 * Insert demo custom fields for "redITEM" type
		 */
		$fieldTable = RTable::getAdminInstance('Field');
		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Checkbox';
		$fieldTable->type = 'checkbox';
		$fieldTable->published = 1;
		$fieldTable->options = "Option 1\r\nOption 2\r\nOption 3\r\nOption 4";
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Select list';
		$fieldTable->type = 'select';
		$fieldTable->published = 1;
		$fieldTable->options = "Option 1\r\nOption 2\r\nOption 3\r\nOption 4";
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Url';
		$fieldTable->type = 'url';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'User';
		$fieldTable->type = 'user';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Items from other types';
		$fieldTable->type = 'itemfromtypes';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '{"types":["' . $typeId1 . '"]}';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Task list';
		$fieldTable->type = 'tasklist';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Color';
		$fieldTable->type = 'color';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Date';
		$fieldTable->type = 'date';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '{"dateFormat":"Y - m - d"}';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Date Range';
		$fieldTable->type = 'daterange';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Range number';
		$fieldTable->type = 'range';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '{"min":"1","max":"100","default":"50","step":"1"}';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Editor';
		$fieldTable->type = 'editor';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Gallery';
		$fieldTable->type = 'gallery';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Google Map';
		$fieldTable->type = 'googlemaps';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'File Upload';
		$fieldTable->type = 'file';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Image';
		$fieldTable->type = 'image';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Number';
		$fieldTable->type = 'number';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '{"number_decimal_sepatator":".","number_thousand_separator":",","number_number_decimals":"2"}';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Radio list';
		$fieldTable->type = 'radio';
		$fieldTable->published = 1;
		$fieldTable->options = "Option 1\r\nOption 2\r\nOption 3\r\nOption 4";
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Select list';
		$fieldTable->type = 'select';
		$fieldTable->published = 1;
		$fieldTable->options = "Option 1\r\nOption 2\r\nOption 3\r\nOption 4";
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Text';
		$fieldTable->type = 'text';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Textarea';
		$fieldTable->type = 'textarea';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '';
		$fieldTable->store();

		$fieldTable->id = null;
		$fieldTable->type_id = $typeId;
		$fieldTable->name = 'Youtube';
		$fieldTable->type = 'youtube';
		$fieldTable->published = 1;
		$fieldTable->options = '';
		$fieldTable->params = '';
		$fieldTable->store();

		unset($fieldTable);

		/*
		 * Insert demo "redITEM" - Templates
		 */
		$templateTable = RTable::getAdminInstance('Template', array('ignore_request' => true));
		$data = array (
			'id'          => null,
			'type_id'     => $typeId,
			'name'        => 'Category Template',
			'description' => 'Template for category',
			'typecode'    => 'view_categorydetail',
			'published'   => 1,
			'content'     => '<div class="toolbox">{print_icon}</div><div class="category">
			<h1><a href="{category_link}">{category_title}</a></h1>{category_image}<p>{category_introtext}</p>
			<p>{category_fulltext}</p></div><p>{items_loop_start}</p><p><a href="{item_link}">{item_title}</a></p>
			<p>{image_value}</p><p>{items_loop_end}</p><hr /><h3>Sub Category (Featured)</h3><p>{sub_featured_category_start}
			<a href="{sub_category_link}">{sub_category_title}</a>{sub_category_image}</p><p>{sub_category_introtext}</p>
			<p>{sub_category_fulltext}</p><p>{sub_featured_category_end}</p><hr /><h3>Sub Category</h3><p>{sub_category_start}
			<a href="{sub_category_link}">{sub_category_title}</a>{sub_category_image}</p>
			<p>{sub_category_introtext}</p><p>{sub_category_fulltext}</p><p>{sub_category_end}</p>'
		);

		$templateTable->save($data);
		$templateCategoryId = $templateTable->id;

		$templateTable = RTable::getAdminInstance('Template', array('ignore_request' => true));
		$data = array (
			'id'          => null,
			'type_id'     => $typeId,
			'name'        => 'Item Template',
			'description' => 'Template for item',
			'typecode'    => 'view_itemdetail',
			'published'   => 1,
			'content'     => '<p><a href="{item_link}">{item_title}</a>{print_icon}</p><p>{editor_text}: {editor_value}</p>'
		);

		$templateTable->save($data);
		$templateItemId = $templateTable->id;

		$templateTable = RTable::getAdminInstance('Template', array('ignore_request' => true));
		$data = array (
			'id'          => null,
			'type_id'     => $typeId1,
			'name'        => 'Item Template',
			'description' => 'Template for item',
			'typecode'    => 'view_itemdetail',
			'published'   => 1,
			'content'     => '<p><a href="{item_link}">{item_title}</a>{print_icon}</p>'
		);

		$templateTable->save($data);
		$templateItemId1 = $templateTable->id;

		$templateTable = RTable::getAdminInstance('Template', array('ignore_request' => true));
		$data = array (
			'id'          => null,
			'type_id'     => $typeId,
			'name'        => 'Archived Items Template',
			'description' => 'Template for archived items',
			'typecode'    => 'view_archiveditems',
			'published'   => 1,
			'content'     => '<p><a href="{item_link}">{item_title}</a>{print_icon}</p><p>{editor_text}: {editor_value}</p>'
		);

		$templateTable->save($data);
		$templateArchivedItemsId = $templateTable->id;

		unset($templateTable);

		/*
		 * Insert demo "redITEM" categories
		 */
		$categoryOneId = 0;
		$categoryTwoId = 0;

		$categoryTable = RTable::getAdminInstance('Category', array('ignore_request' => true));
		$categoryTable->id = null;
		$categoryTable->title = 'Parent Category';
		$categoryTable->introtext = '<p>Cateogory introtext</p>';
		$categoryTable->fulltext = '<p>Cateogory fulltext</p>';
		$categoryTable->path = 'parent-category';
		$categoryTable->type_id = $typeId;
		$categoryTable->template_id = $templateCategoryId;
		$categoryTable->published = 1;
		$categoryTable->publish_up = '0000-00-00 00:00:00';
		$categoryTable->publish_down = '0000-00-00 00:00:00';
		$categoryTable->params = '{"category_image_title":"","category_image_alt":""}';
		$categoryTable->setLocation($categoryTable->getRootId(), 'first-child');
		$categoryTable->store();
		$categoryOneId = $categoryTable->id;

		$categoryTable = RTable::getAdminInstance('Category', array('ignore_request' => true));
		$categoryTable->id = null;
		$categoryTable->title = 'Child Category';
		$categoryTable->introtext = '<p>Child Cateogory introtext</p>';
		$categoryTable->fulltext = '<p>Child Cateogory fulltext</p>';
		$categoryTable->path = 'parent-category/child-category';
		$categoryTable->type_id = $typeId;
		$categoryTable->template_id = $templateCategoryId;
		$categoryTable->published = 1;
		$categoryTable->publish_up = '0000-00-00 00:00:00';
		$categoryTable->publish_down = '0000-00-00 00:00:00';
		$categoryTable->params = '{"category_image_title":"","category_image_alt":""}';
		$categoryTable->setLocation($categoryOneId, 'first-child');
		$categoryTable->store();

		$categoryTwoId = $categoryTable->id;

		unset($categoryTable);

		/*
		 * Insert demo "redITEM" items
		 */
		$itemTable = RTable::getAdminInstance('Item', array('ignore_request' => true));
		$itemOneId = 0;
		$itemTwoId = 0;

		$itemTable->id = null;
		$itemTable->title = 'Item 1';
		$itemTable->access = 1;
		$itemTable->published = 1;
		$itemTable->publish_up = '0000-00-00 00:00:00';
		$itemTable->publish_down = '0000-00-00 00:00:00';
		$itemTable->type_id = $typeId;
		$itemTable->template_id = $templateItemId;
		$itemTable->params = '{"item_image_title":"","item_image_alt":""}';
		$itemTable->store();
		$itemOneId = $itemTable->id;

		$itemTable = RTable::getAdminInstance('Item', array('ignore_request' => true));
		$itemTable->id = null;
		$itemTable->title = 'Item 2';
		$itemTable->access = 1;
		$itemTable->published = 1;
		$itemTable->publish_up = '0000-00-00 00:00:00';
		$itemTable->publish_down = '0000-00-00 00:00:00';
		$itemTable->type_id = $typeId;
		$itemTable->template_id = $templateItemId;
		$itemTable->params = '{"item_image_title":"","item_image_alt":""}';
		$itemTable->store();
		$itemTwoId = $itemTable->id;

		$itemTable = RTable::getAdminInstance('Item', array('ignore_request' => true));
		$itemTable->id = null;
		$itemTable->title = 'Item 3';
		$itemTable->access = 1;
		$itemTable->published = 1;
		$itemTable->publish_up = '0000-00-00 00:00:00';
		$itemTable->publish_down = '0000-00-00 00:00:00';
		$itemTable->type_id = $typeId1;
		$itemTable->template_id = $templateItemId1;
		$itemTable->params = '{"item_image_title":"","item_image_alt":""}';
		$itemTable->store();
		$itemThreeId = $itemTable->id;

		$itemTable = RTable::getAdminInstance('Item', array('ignore_request' => true));
		$itemTable->id = null;
		$itemTable->title = 'Item 4';
		$itemTable->access = 1;
		$itemTable->published = 1;
		$itemTable->publish_up = '0000-00-00 00:00:00';
		$itemTable->publish_down = '0000-00-00 00:00:00';
		$itemTable->type_id = $typeId1;
		$itemTable->template_id = $templateItemId1;
		$itemTable->params = '{"item_image_title":"","item_image_alt":""}';
		$itemTable->store();
		$itemFourId = $itemTable->id;

		unset($itemTable);

		/*
		 * Insert demo "redITEM" - Custom field values for items
		 */
		$columns = array('checkbox', 'date', 'editor', 'gallery', 'google_map', 'file_upload', 'image', 'number', 'radio_list', 'select_list',
			'text', 'textarea', 'youtube', 'range_number', 'date_range', 'color', 'items_from_other_types', 'task_list', 'user', 'url');

		// For item One
		$values = array($db->quote('["Option 1","Option 2"]'), $db->quote($currentDate->toSql()),
			$db->quote('<p>Editor customfield sample text</p>'), $db->quote('[""]'), $db->quote('55.40375599999999,10.402370000000019'),
			$db->quote(''), $db->quote(''), $db->quote('9999'), $db->quote('Option 4'), $db->quote('["Option 1","Option 2"]'), $db->quote('Text sample'),
			$db->quote('Textarea sample'), $db->quote('5it6k8ivvF8'), $db->q(50), $db->q('{"start":"14\/07\/2015 07:00:00","end":"30\/07\/2015 23:00:00"}'),
			$db->q('#FF0000'), $db->q('["' . $typeTableName1 . '|' . $itemThreeId . '"]'),
			$db->q('["Task 1|Lorem ipsum dolor sit amet|0|0","Task 2|Lorem ipsum dolor sit amet|0|0"]'),
			$db->q('["' . $user->id . '"]'), $db->q('["http:\/\/redweb.dk\/","redWEB ApS"]'));

		$query = $db->getQuery(true)
			->update($db->qn($typeTableName))
			->where($db->qn('id') . ' = ' . $itemOneId);

		foreach ($columns as $k => $column)
		{
			$query->set($db->qn($column) . ' = ' . $values[$k]);
		}

		$db->setQuery($query);
		$db->execute();

		// For item Two
		$values = array($db->quote('["Option 3","Option 4"]'), $db->quote($currentDate->toSql()),
			$db->quote('<p>Item 2 editor text</p>'), $db->quote('[""]'), $db->quote('10.8230989,106.6296638'), $db->quote(''),
			$db->quote(''), $db->quote('2000'), $db->quote('["Option 3","Option 4"]'), $db->quote('Option 4'), $db->quote('Item 2 text sample'),
			$db->quote('Item 2 textarea sample'), $db->quote(''), $db->q(50), $db->q('{"start":"14\/07\/2015 07:00:00","end":"30\/07\/2015 23:00:00"}'),
			$db->q('#FF0000'), $db->q('["' . $typeTableName1 . '|' . $itemFourId . '"]'),
			$db->q('["Task 1|Lorem ipsum dolor sit amet|0|0","Task 2|Lorem ipsum dolor sit amet|0|0"]'),
			$db->q('["' . $user->id . '"]'), $db->q('["http:\/\/redweb.dk\/","redWEB ApS"]'));

		$query->clear()
			->update($db->qn($typeTableName))
			->values(implode(',', $values))
			->where($db->qn('id') . ' = ' . $itemTwoId);

		foreach ($columns as $k => $column)
		{
			$query->set($db->qn($column) . ' = ' . $values[$k]);
		}

		$db->setQuery($query);
		$db->execute();

		/*
		 * Insert demo "redITEM" - Item & Categories reference
		 */
		$query->clear()
			->insert($db->qn('#__reditem_item_category_xref'))
			->columns($db->qn(array('item_id', 'category_id')))
			->values($itemOneId . ', ' . $categoryOneId)
			->values($itemTwoId . ', ' . $categoryTwoId);

		$db->setQuery($query);
		$db->execute();
	}
}
