<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Field
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('_JEXEC') or die;

JLoader::import('joomla.form.formfield');
JFormHelper::loadFieldClass('list');

/**
 * RedITEM type select list
 *
 * @package     RedITEM.Backend
 * @subpackage  Field.RIMailDections
 *
 * @since       2.1.5
 */
class JFormFieldRIMailSections extends JFormFieldList
{
	/**
	 * The form field type.
	 *
	 * @var		string
	 */
	protected $type = 'RIMailSections';

	/**
	 * Method to get the field options.
	 *
	 * @return  array  Options to populate the select field
	 */
	public function getOptions()
	{
		$db = JFactory::getDbo();
		$options = array();
		$currentOptions = parent::getOptions();

		// Prepare type list
		$dispatcher	= RFactory::getDispatcher();
		JPluginHelper::importPlugin('reditem');
		$arrays = (array) $dispatcher->trigger('OnPrepareMailSectionField');

		if (count($arrays))
		{
			foreach ($arrays as $reponse)
			{
				foreach ($reponse as $section => $description)
				{
					$options[] = JHTML::_('select.option', $section, $description);
				}
			}
		}

		if (!empty($currentOptions))
		{
			$options = array_merge($currentOptions, $options);
		}

		return $options;
	}
}
