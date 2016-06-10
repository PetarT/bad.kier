<?php
/**
 * @package     RedITEMCategoryFields.Backend
 * @subpackage  Table
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * Custom Field table
 *
 * @package     RedITEMCategoryFields.Backend
 * @subpackage  Table
 * @since       2.0
 */
class ReditemCategoryFieldsTableCategoryField extends RTable
{
	/**
	 * The name of the table with category
	 *
	 * @var string
	 * @since 0.9.1
	 */
	protected $_tableName = 'reditem_category_fields';

	/**
	 * The primary key of the table
	 *
	 * @var string
	 * @since 0.9.1
	 */
	protected $_tableKey = 'id';

	/**
	 * Field name to publish/unpublish table registers. Ex: state
	 *
	 * @var  string
	 */
	protected $_tableFieldState = 'published';

	/**
	 * Method to store a node in the database table.
	 *
	 * @param   boolean  $updateNulls  True to update fields even if they are null.
	 *
	 * @return  boolean  True on success.
	 */
	public function store($updateNulls = false)
	{
		$db		= JFactory::getDBO();
		$isNew	= false;

		if (!$this->id)
		{
			$isNew = true;
			$this->fieldcode = str_replace('-', '_', JFilterOutput::stringURLSafe($this->name));
		}

		if (!parent::store($updateNulls))
		{
			return false;
		}

		if ($isNew)
		{
			// Check if columns exists
			$query = 'SHOW COLUMNS FROM ' . $db->qn('#__reditem_category_fields_value');
			$db->setQuery($query);
			$cols = $db->loadObjectList('Field');

			if (!array_key_exists($this->fieldcode, $cols))
			{
				$query = 'ALTER TABLE ' . $db->qn('#__reditem_category_fields_value') . ' ADD ' . $db->qn($this->fieldcode) . ' mediumtext NULL';
				$db->setQuery($query);

				if (!$db->execute())
				{
					return false;
				}
			}
		}

		return true;
	}

	/**
	 * Deletes this row in database (or if provided, the row of key $pk)
	 *
	 * @param   mixed  $pk  An optional primary key value to delete.  If not set the instance property value is used.
	 *
	 * @return  boolean  True on success.
	 */
	public function delete($pk = null)
	{
		$db = JFactory::getDBO();

		if (isset($this->fieldcode))
		{
			// Check if columns exists
			$query = 'SHOW COLUMNS FROM ' . $db->qn('#__reditem_category_fields_value');
			$db->setQuery($query);
			$cols = $db->loadObjectList('Field');

			if (array_key_exists($this->fieldcode, $cols))
			{
				$query = 'ALTER TABLE ' . $db->qn('#__reditem_category_fields_value') . ' DROP ' . $db->qn($this->fieldcode);
				$db->setQuery($query);

				if (!$db->execute())
				{
					return false;
				}
			}
		}

		return parent::delete($pk);
	}
}
