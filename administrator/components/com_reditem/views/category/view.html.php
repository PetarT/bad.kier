<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  View
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * Category edit view
 *
 * @package     RedITEM.Backend
 * @subpackage  View
 * @since       0.9.1
 */
class ReditemViewCategory extends ReditemViewAdmin
{
	/**
	 * @var  boolean
	 */
	protected $displaySidebar = false;

	/**
	 * Display the category edit page
	 *
	 * @param   string  $tpl  The template file to use
	 *
	 * @return   string
	 *
	 * @todo Check the extra fields once implemented
	 *
	 * @since   0.9.1
	 */
	public function display($tpl = null)
	{
		$app = JFactory::getApplication();
		$dispatcher = RFactory::getDispatcher();
		JPluginHelper::importPlugin('reditem_categories');
		$user = ReditemHelperSystem::getUser();

		$this->canConfig = false;

		if ($user->authorise('core.admin', 'com_reditem'))
		{
			$this->canConfig = true;
		}

		$this->useGmapField = false;
		$this->form	= $this->get('Form');
		$this->params = $this->form->getGroup('params');
		$this->item	= $this->get('Item');

		$this->extrafields = $dispatcher->trigger('prepareCategoryEdit', array($this->item));

		// Check if category use Google Gmaps field
		if (isset($this->item->id))
		{
			$typeModel = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
			$type = $typeModel->getItem($this->item->type_id);
			$typeParams = new JRegistry($type->params);
			$this->useGmapField = (boolean) $typeParams->get('category_gmap_field', false);
		}

		$this->fromExplore = (int) $app->getUserState('com_reditem.global.fromExplore', 0);
		$this->parentId    = (int) $app->getUserState('com_reditem.global.parentId', 0);
		$this->typeId      = $app->getUserState('com_reditem.global.tid', 0);

		if ($this->parentId > 0)
		{
			$this->form->setValue('parent_id', null, $this->parentId);
		}

		// Display the template
		parent::display($tpl);
	}

	/**
	 * Get the view title.
	 *
	 * @return  string  The view title.
	 */
	public function getTitle()
	{
		$subTitle = ' <small>' . JText::_('COM_REDITEM_NEW') . '</small>';

		if ($this->item->id)
		{
			$subTitle = ' <small>' . JText::_('COM_REDITEM_EDIT') . '</small>';
		}

		return JText::_('COM_REDITEM_CATEGORY_CATEGORY') . $subTitle;
	}

	/**
	 * Get the toolbar to render.
	 *
	 * @todo	We have setup ACL requirements for redITEM
	 *
	 * @return  RToolbar
	 */
	public function getToolbar()
	{
		$group = new RToolbarButtonGroup;

		$save = RToolbarBuilder::createSaveButton('category.apply');
		$saveAndClose = RToolbarBuilder::createSaveAndCloseButton('category.save');
		$saveAndNew = RToolbarBuilder::createSaveAndNewButton('category.save2new');
		$save2Copy = RToolbarBuilder::createSaveAsCopyButton('category.save2copy');

		$group->addButton($save)
			->addButton($saveAndClose)
			->addButton($saveAndNew)
			->addButton($save2Copy);

		if (empty($this->item->category_id))
		{
			$cancel = RToolbarBuilder::createCancelButton('category.cancel');
		}
		else
		{
			$cancel = RToolbarBuilder::createCloseButton('category.cancel');
		}

		$group->addButton($cancel);

		$toolbar = new RToolbar;
		$toolbar->addGroup($group);

		return $toolbar;
	}
}
