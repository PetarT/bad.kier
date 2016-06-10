<?php
/**
 * @package     RedITEM.Libraries
 * @subpackage  Customfield
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * RedITEM Customfield generic class
 *
 * @package     RedITEM.Libraries
 * @subpackage  Helpers.Customfield
 * @since       2.1.13
 *
 */
class ReditemCustomfieldGeneric
{
	public $id;

	public $type;

	public $type_id;

	public $ordering;

	public $published;

	public $name;

	public $options;

	public $fieldcode;

	public $checked_out;

	public $checked_out_time;

	public $searchable_in_frontend;

	public $searchable_in_backend;

	public $params;

	public $value;

	public $divId;

	public $sqlColumnData = ' MEDIUMTEXT NULL DEFAULT NULL';

	/**
	 * Constructor
	 */
	public function __construct()
	{
	}

	/**
	 * returns element form html code
	 *
	 * @param   array  $attributes  [description]
	 *
	 * @return void
	 */
	public function render($attributes = '')
	{
		return;
	}

	/**
	 * bind properties to an object or array
	 *
	 * @param   object/array  $source  [description]\
	 *
	 * @return void
	 */
	public function bind($source)
	{
		// If object
		if (is_object($source))
		{
			// Use only public values defined in the object
			$source = get_object_vars($source);
		}

		// If array
		if (is_array($source))
		{
			$objectKeys = array_keys(get_object_vars($this));

			foreach ($source as $key => $value)
			{
				if (in_array($key, $objectKeys))
				{
					$this->$key = $value;
				}
			}
		}

		$this->divId = 'cform_' . $this->type . '_' . $this->fieldcode;
	}

	/**
	 * returns the value
	 *
	 * @return string
	 */
	public function renderValue()
	{
		return $this->value;
	}

	/**
	 * returns the label
	 *
	 * @return string
	 */
	public function getLabel()
	{
		$layoutData = array('customfield' => $this);

		$type = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem')->getItem($this->type_id);

		return ReditemHelperLayout::render($type, 'customfields.common.label', $layoutData, array('component' => 'com_reditem'));
	}

	/**
	 * Method for replace label tag of customfield
	 *
	 * @param   string  &$content  HTML content
	 * @param   object  $field     Field object of customfield
	 *
	 * @return  boolean           True on success. False otherwise.
	 */
	public function replaceLabelTag(&$content, $field)
	{
		if (empty($content) || empty($field))
		{
			return false;
		}

		$tag = '{' . $field->fieldcode . '_text}';
		$content = str_replace($tag, $field->name, $content);

		return true;
	}

	/**
	 * Method for replace value tag of customfield
	 *
	 * @param   string  &$content  HTML content
	 * @param   object  $field     Field object of customfield
	 * @param   object  $item      Item object
	 *
	 * @return  boolean            True on success. False otherwise.
	 */
	public function replaceValueTag(&$content, $field, $item)
	{
		if (empty($content) || empty($field) || !is_object($field) || empty($item))
		{
			return false;
		}

		$tagString = '{' . $field->fieldcode . '_value}';

		if (strpos($content, $tagString) === false)
		{
			return false;
		}

		$this->prepareData($item);

		$layoutData    = array('tag' => $field, 'value' => '', 'item' => $item);
		$layoutFile    = 'customfield_' . $field->type;
		$layoutOptions = array('component' => 'com_reditem', 'debug' => false);

		if (isset($item->customfield_values[$field->fieldcode]))
		{
			$layoutData['value'] = $item->customfield_values[$field->fieldcode];
		}

		$contentHtml = ReditemHelperLayout::render($item->type, $layoutFile, $layoutData, $layoutOptions);

		$content = str_replace($tagString, $contentHtml, $content);

		return true;
	}

	/**
	 * Method for prepare data before replace
	 *
	 * @param   object  $item  Item data object
	 *
	 * @return  boolean        True on success. False otherwise.
	 */
	public function prepareData($item)
	{
		// Get customfield values if neccessary
		$cfValues = ReditemHelperItem::getCustomFieldValues($item->id);
		$item->customfield_values = array();

		if (isset($cfValues[$item->type_id][$item->id]))
		{
			$item->customfield_values = $cfValues[$item->type_id][$item->id];
		}

		// Get type for item if neccessary
		ReditemHelperItem::getTypeObject($item);

		return true;
	}

	/**
	 * Method for check column data exist for field in type table
	 *
	 * @param   int     $typeId     ID of type
	 * @param   string  $fieldcode  Fieldcode of customfield
	 *
	 * @return  boolean             True on success. False otherwise.
	 */
	public function checkColumnExist($typeId, $fieldcode)
	{
		$typeId = (int) $typeId;

		if (!$typeId || empty($fieldcode))
		{
			return false;
		}

		$typeTable = ReditemHelperType::getTableName($typeId);

		if (!$typeTable)
		{
			return false;
		}

		$db = JFactory::getDbo();
		$db->setQuery('SHOW COLUMNS FROM ' . $db->qn($typeTable));
		$cols = $db->loadObjectList('Field');

		return array_key_exists($fieldcode, $cols);
	}

	/**
	 * Method for insert column data exist for field in type table
	 *
	 * @param   int     $typeId     ID of type
	 * @param   string  $fieldcode  Fieldcode of customfield
	 *
	 * @return  boolean             True on success. False otherwise.
	 */
	public function insertColumn($typeId, $fieldcode)
	{
		$typeId = (int) $typeId;

		if (!$typeId || empty($fieldcode) || $this->checkColumnExist($typeId, $fieldcode))
		{
			return false;
		}

		$typeTable = ReditemHelperType::getTableName($typeId);

		if (!$typeTable)
		{
			return false;
		}

		$db = JFactory::getDbo();
		$query = 'ALTER TABLE ' . $db->qn($typeTable) . ' ADD ' . $db->qn($fieldcode) . $this->sqlColumnData . ';';
		$db->setQuery($query);

		return (boolean) $db->execute();
	}

	/**
	 * Method for change column data for field in type table
	 *
	 * @param   int     $typeId     ID of type
	 * @param   string  $fieldcode  Fieldcode of customfield
	 *
	 * @return  boolean             True on success. False otherwise.
	 */
	public function changeColumn($typeId, $fieldcode)
	{
		$app = JFactory::getApplication();
		$oldFieldCode = $app->getUserStateFromRequest('com_reditem.global.field.oldFieldCode', '');
		$typeId = (int) $typeId;

		if (!$typeId || empty($fieldcode) || !$this->checkColumnExist($typeId, $oldFieldCode))
		{
			return false;
		}

		$typeTable = ReditemHelperType::getTableName($typeId);

		if (!$typeTable)
		{
			return false;
		}

		$db = JFactory::getDbo();
		$query = 'ALTER TABLE ' . $db->qn($typeTable) . ' CHANGE ' . $db->qn($oldFieldCode) . ' ' . $db->qn($fieldcode) . $this->sqlColumnData;
		$db->setQuery($query);

		return (boolean) $db->execute();
	}
}
