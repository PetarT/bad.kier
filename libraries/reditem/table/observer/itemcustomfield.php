<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  TableObserver
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * Reditem Table Observer Item customfield values class
 *
 * @since  2.1.16
 */
class ReditemTableObserverItemcustomfield extends JTableObserver
{
	/**
	 * Customfield values variable
	 *
	 * @var  array
	 */
	protected $customfieldValues;

	/**
	 * Creates the associated observer instance and attaches it to the $observableObject
	 * Creates the associated tags helper class instance
	 * $typeAlias can be of the form "{variableName}.type", automatically replacing {variableName} with table-instance variables variableName
	 *
	 * @param   JObservableInterface  $observableObject  The subject object to be observed
	 * @param   array                 $params            ( 'typeAlias' => $typeAlias )
	 *
	 * @return  JTableObserverTags
	 *
	 * @since   3.1.2
	 */
	public static function createObserver(JObservableInterface $observableObject, $params = array())
	{
		$observer = new self($observableObject);

		return $observer;
	}

	/**
	 * Pre-processor for $table->store($updateNulls)
	 *
	 * @param   boolean  $updateNulls  The result of the load
	 * @param   string   $tableKey     The key of the table
	 *
	 * @return  void
	 *
	 * @since   3.1.2
	 */
	public function onBeforeStore($updateNulls, $tableKey)
	{
		$this->customfieldValues = $this->table->customfield_values;

		/**
		 * Process on customfield values before store to make it work with Versioning feature
		 */
		if (is_array($this->customfieldValues) || is_object($this->customfieldValues))
		{
			$this->customfieldValues = $this->table->getDbo()->escape(json_encode($this->customfieldValues));
		}

		unset($this->table->customfield_values);
	}

	/**
	 * Post-processor for $table->store($updateNulls)
	 * You can change optional params newTags and replaceTags of tagsHelper with method setNewTagsToAdd
	 *
	 * @param   boolean  &$result  The result of the load
	 *
	 * @return  void
	 *
	 * @since   3.1.2
	 */
	public function onAfterStore(&$result)
	{
		if ($result)
		{
			// Assign back to table for JContenHistory work
			$this->table->customfield_values = $this->customfieldValues;

			$this->customfieldValues = null;
		}
	}
}
