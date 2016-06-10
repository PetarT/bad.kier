<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Model
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * RedITEM field Model
 *
 * @package     RedITEM.Component
 * @subpackage  Models.Field
 * @since       2.0
 *
 */
class ReditemModelField extends RModelAdmin
{
	protected $typeAlias = 'com_reditem.field';

	/**
	 * Method for getting the form from the model.
	 *
	 * @param   array    $data      Data for the form.
	 * @param   boolean  $loadData  True if the form is to load its own data (default case), false if not.
	 *
	 * @return  mixed  A JForm object on success, false on failure
	 */
	public function getForm($data = array(), $loadData = true)
	{
		$form = parent::getForm($data, $loadData);
		$user = ReditemHelperSystem::getUser();
		$optionAvaiableFields = array('select', 'radio', 'checkbox');

		$fieldType = JFactory::getApplication()->getUserState('com_reditem.global.field.type', '');

		if ($fieldType)
		{
			$form->loadFile('field_' . $fieldType);
		}

		if (!$user->authorise('core.edit.state', 'com_reditem'))
		{
			// Disable change publish state
			$form->setFieldAttribute('published', 'readonly', true);
			$form->setFieldAttribute('published', 'class', 'btn-group disabled');

			// Disable change searchable in admin state
			$form->setFieldAttribute('searchable_in_backend', 'readonly', true);
			$form->setFieldAttribute('searchable_in_backend', 'class', 'btn-group disabled');

			// Disable change searchable in front state
			$form->setFieldAttribute('searchable_in_frontend', 'readonly', true);
			$form->setFieldAttribute('searchable_in_frontend', 'class', 'btn-group disabled');
		}

		return $form;
	}

	/**
	 * Method for get field data base on fieldcode
	 *
	 * @param   string  $fieldcode  Field code
	 * @param   int     $typeId     ID of type
	 *
	 * @return  object/boolean      Array of data. False otherwise.
	 */
	public function getItemByFieldcode($fieldcode, $typeId = 0)
	{
		if (empty($fieldcode))
		{
			return false;
		}

		$db = JFactory::getDbo();
		$query = $db->getQuery(true)
			->select($db->qn('id'))
			->from($db->qn('#__reditem_fields'))
			->where($db->qn('fieldcode') . ' = ' . $db->quote($fieldcode));

		if ($typeId)
		{
			$query->where($db->qn('type_id') . ' = ' . $typeId);
		}

		$db->setQuery($query);
		$result = $db->loadObject();

		if (!$result)
		{
			return false;
		}

		return $this->getItem($result->id);
	}
}
