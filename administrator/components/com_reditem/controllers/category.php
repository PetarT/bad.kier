<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Controller
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * The category edit controller
 *
 * @package     RedITEM.Backend
 * @subpackage  Controller.Category
 * @since       2.0
 */
class ReditemControllerCategory extends RControllerForm
{
	protected $text_prefix = "COM_REDITEM_CATEGORY";

	/**
	 * Task for add Category
	 *
	 * @return mixed
	 */
	public function add()
	{
		$app         = JFactory::getApplication();
		$fromExplore = $app->input->get('fromExplore', 0, 'int');
		$parentId    = $app->input->get('parent_id', 0, 'int');

		$app->setUserState('com_reditem.global.tid', '');
		$app->setUserState('com_reditem.global.cid', array());
		$app->setUserState('com_reditem.global.parentId', $parentId);
		$app->setUserState('com_reditem.global.fromExplore', $fromExplore);

		return parent::add();
	}

	/**
	 * For edit an category
	 *
	 * @param   int     $key     [description]
	 * @param   string  $urlVar  [description]
	 *
	 * @return boolean
	 */
	public function edit($key = null, $urlVar = null)
	{
		$app         = JFactory::getApplication();
		$itemmodel   = RModel::getAdminInstance('Category');
		$fromExplore = $app->input->get('fromExplore', 0, 'int');
		$parentId    = $app->input->get('parent_id', 0, 'int');
		$item        = $itemmodel->getItem();

		$app->setUserState('com_reditem.global.tid', $item->type_id);
		$app->setUserState('com_reditem.global.cid', array($item->id));
		$app->setUserState('com_reditem.global.parentId', $parentId);
		$app->setUserState('com_reditem.global.fromExplore', $fromExplore);

		return parent::edit($key, $urlVar);
	}

	/**
	 * For auto-submit form when client choose type
	 *
	 * @return void
	 */
	public function setType()
	{
		$app       = JFactory::getApplication();
		$recordId  = $app->input->getInt('id', 0);
		$data      = $app->input->get('jform', array(), 'array');
		$typemodel = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
		$typemodel->setState('list.select', 'params');
		$params    = $typemodel->getItem($data['type_id'])->params;
		$data['template_id'] = $params['default_categorydetail_template'];

		$app->setUserState('com_reditem.edit.category.data', $data);
		$app->setUserState('com_reditem.global.tid', $data['type_id']);

		if ($recordId)
		{
			$app->setUserState('com_reditem.global.cid', array($recordId));
		}

		$this->setRedirect(JRoute::_('index.php?option=' . $this->option . '&view=' . $this->view_item . $this->getRedirectToItemAppend($recordId), false));
	}

	/**
	 * Get the JRoute object for a redirect to list.
	 *
	 * @param   string  $append  An optionnal string to append to the route
	 *
	 * @return  JRoute  The JRoute object
	 */
	public function getRedirectToListRoute($append = null)
	{
		$returnUrl = $this->input->get('return', '', 'Base64');

		if ($returnUrl)
		{
			$returnUrl = base64_decode($returnUrl);

			return JRoute::_($returnUrl, false);
		}
		else
		{
			return JRoute::_('index.php?option=' . $this->option . '&view=' . $this->view_list . $append, false);
		}
	}
}
