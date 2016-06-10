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
 * Reditem Table Observer Item category refrence class
 *
 * @since  2.1.16
 */
class ReditemTableObserverItemcategoryxref extends JTableObserver
{
	/**
	 * Categories reference variable
	 *
	 * @var  array
	 */
	protected $categories;

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
		$nullArrayJson = $this->table->getDbo()->escape(json_encode(array()));

		/**
		 * Process on category reference before store to make it work with Versioning feature
		 */

		if (is_array($this->table->categories))
		{
			$this->categories = $this->table->getDbo()->escape(json_encode($this->table->categories));
		}
		else
		{
			$this->categories = $nullArrayJson;
		}

		// Remove this variable from Item table for make sure not cause error when use parent::store()
		unset($this->table->categories);
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
			$this->table->categories = $this->categories;

			$this->updateItemCategoryXref($this->categories, $this->table);

			$this->categories = null;
		}
	}

	/**
	 * Method for upgrade reference between item and categories
	 *
	 * @param   string  $categories  Categories list in JSON Array
	 * @param   object  $table       Item table
	 *
	 * @return  boolean              True on success. False otherwise.
	 */
	private function updateItemCategoryXref($categories, $table)
	{
		// Convert categories back to array for update on database
		$categories = json_decode(stripslashes($categories));

		$db = $table->getDbo();

		/**
		 * Add categories xref
		 */
		$query = $db->getQuery(true)
			->delete($db->qn('#__reditem_item_category_xref'))
			->where($db->qn('item_id') . ' = ' . (int) $table->id);
		$db->setQuery($query);
		$db->execute();

		foreach ($categories as $categoryId)
		{
			if ($categoryId)
			{
				$query->clear()
					->insert($db->qn('#__reditem_item_category_xref'))
					->columns($db->qn(array('item_id', 'category_id')))
					->values((int) $table->id . ',' . (int) $categoryId);
				$db->setQuery($query);
				$db->execute();
			}
		}

		return true;
	}
}
