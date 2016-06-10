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
 * RedITEM category Model
 *
 * @package     RedITEM.Component
 * @subpackage  Models.Category
 * @since       2.0
 *
 */
class ReditemModelCategory extends RModelAdmin
{
	public $category = null;

	/**
	 * Method to save the form data for TableNested
	 *
	 * @param   array  $data  The form data.
	 *
	 * @return  boolean  True on success.
	 *
	 * @since   1.6
	 */
	public function save($data)
	{
		$app = JFactory::getApplication();

		// Initialise variables;
		$dispatcher = RFactory::getDispatcher();
		$table = $this->getTable();
		$pk = (!empty($data['id'])) ? $data['id'] : (int) $this->getState($this->getName() . '.id');
		$isNew = true;

		// Include the content plugins for the on save events.
		JPluginHelper::importPlugin('content');

		// Load the row if saving an existing category.
		if ($pk > 0)
		{
			$table->load($pk);
			$isNew = false;
		}

		// Set the new parent id if parent id not matched OR while New/Save as Copy .
		if ($table->parent_id != $data['parent_id'] || $data['id'] == 0)
		{
			$table->setLocation($data['parent_id'], 'last-child');
		}

		// Alter the title for save as copy
		if ($app->input->getCmd('task', '') == 'save2copy')
		{
			list($title, $alias) = $this->generateNewTitle($data['parent_id'], $data['alias'], $data['title']);
			$data['title'] = $title;
			$data['alias'] = $alias;
		}

		// Bind the data.
		if (!$table->bind($data))
		{
			$this->setError($table->getError());

			return false;
		}

		// Bind the rules.
		if (isset($data['rules']))
		{
			$rules = new JAccessRules($data['rules']);
			$table->setRules($rules);
		}

		// Check the data.
		if (!$table->check())
		{
			$this->setError($table->getError());

			return false;
		}

		// Trigger the onContentBeforeSave event.
		$result = $dispatcher->trigger($this->event_before_save, array($this->option . '.' . $this->name, &$table, $isNew));

		if (in_array(false, $result, true))
		{
			$this->setError($table->getError());

			return false;
		}

		// Store the data.
		if (!$table->store())
		{
			$this->setError($table->getError());

			return false;
		}

		// Trigger the onContentAfterSave event.
		$dispatcher->trigger($this->event_after_save, array($this->option . '.' . $this->name, &$table, $isNew));

		// Rebuild the path for the category:
		if (!$table->rebuildPath($table->id))
		{
			$this->setError($table->getError());

			return false;
		}

		// Rebuild the paths of the category's children:
		if (!$table->rebuild($table->id, $table->lft, $table->level, $table->path))
		{
			$this->setError($table->getError());

			return false;
		}

		$this->setState($this->getName() . '.id', $table->id);

		// Clear the cache
		$this->cleanCache();

		$app->setUserState('com_reditem.global.tid', $table->type_id);
		$app->setUserState('com_reditem.global.cid', array($table->id));

		return true;
	}

	/**
	 * Method to get the row form.
	 *
	 * @param   int  $pk  Primary key
	 *
	 * @return	object
	 */
	public function getItem($pk = null)
	{
		$app = JFactory::getApplication();
		$this->category = parent::getItem($pk);
		$dispatcher = RFactory::getDispatcher();

		// Include the category fields plugins.
		JPluginHelper::importPlugin('reditem_categories');

		if (!empty($this->category))
		{
			if ($app->isAdmin())
			{
				// Load related categories if in Admin.
				$this->category->related_categories = ReditemHelperCategory::getRelatedCategories($this->category->id, true);
			}
			else
			{
				// Define null and now dates
				$nullDate = JFactory::getDbo()->getNullDate();
				$nowDate  = ReditemHelperSystem::getDateWithTimezone()->toSql();

				if (($this->category->published == 1)
					&& (($this->category->publish_up > $nowDate)
					|| (($this->category->publish_down != $nullDate) && ($this->category->publish_down < $nowDate))))
				{
					return null;
				}
			}
		}

		$dispatcher->trigger('onAfterLoadCategory', array($this->category));

		return $this->category;
	}

	/**
	 * Same as getItem but not using method to get related categories to avoid endless loop.
	 *
	 * @param   int  $pk  Primary key
	 *
	 * @return	object
	 */
	public function getItemNoRelated($pk = null)
	{
		$app = JFactory::getApplication();
		$this->category = parent::getItem($pk);

		if (!empty($this->category))
		{
			if (!$app->isAdmin())
			{
				// Define null and now dates
				$nullDate = JFactory::getDbo()->getNullDate();
				$nowDate  = ReditemHelperSystem::getDateWithTimezone()->toSql();

				if (($this->category->published == 1)
					&& (($this->category->publish_up > $nowDate)
					|| (($this->category->publish_down != $nullDate) && ($this->category->publish_down < $nowDate))))
				{
					return null;
				}
			}
		}

		return $this->category;
	}

	/**
	 * Method to save the reordered nested set tree.
	 * First we save the new order values in the lft values of the changed ids.
	 * Then we invoke the table rebuild to implement the new ordering.
	 *
	 * @param   array  $idArray    id's of rows to be reordered
	 * @param   array  $lft_array  lft values of rows to be reordered
	 *
	 * @return   boolean  false on failuer or error, true otherwise
	 */
	public function saveorder($idArray = null, $lft_array = null)
	{
		// Get an instance of the table object.
		$table = $this->getTable();

		if (!$table->saveorder($idArray, $lft_array))
		{
			$this->setError($table->getError());

			return false;
		}

		// Clean the cache
		$this->cleanCache();

		return true;
	}

	/**
	 * Method to set featured of category.
	 *
	 * @param   int  $id     Id of category
	 * @param   int  $state  featured state of category
	 *
	 * @return  boolean
	 */
	public function featured($id = null, $state = 0)
	{
		$db = JFactory::getDbo();

		if ($id)
		{
			$query = $db->getQuery(true);

			$query->update($db->quoteName('#__reditem_categories', 'c'))
				->set($db->quoteName('c.featured') . ' = ' . (int) $state)
				->where($db->quoteName('c.id') . ' = ' . (int) $id);

			$db->setQuery($query);

			if (!$db->execute())
			{
				return false;
			}

			return true;
		}

		return false;
	}

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

		if (!$user->authorise('core.edit.state', 'com_reditem'))
		{
			// Disable change publish state
			$form->setFieldAttribute('published', 'readonly', true);
			$form->setFieldAttribute('published', 'class', 'btn-group disabled');

			// Disable change feature state
			$form->setFieldAttribute('featured', 'readonly', true);
			$form->setFieldAttribute('featured', 'class', 'btn-group disabled');

			// Disable change access state
			$form->setFieldAttribute('access', 'disabled', true);
		}

		return $form;
	}

	/**
	 * Method to change the title & alias.
	 *
	 * @param   integer  $category_id  The id of the category.
	 * @param   string   $alias        The alias.
	 * @param   string   $title        The title.
	 *
	 * @return	array  Contains the modified title and alias.
	 *
	 * @since	12.2
	 */
	protected function generateNewTitle($category_id, $alias, $title)
	{
		// Alter the title & alias
		$table = $this->getTable();

		while ($table->load(array('alias' => $alias, 'parent_id' => $category_id)))
		{
			$title = JString::increment($title);
			$alias = JString::increment($alias, 'dash');
		}

		return array($title, $alias);
	}
}
