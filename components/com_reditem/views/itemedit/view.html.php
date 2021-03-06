<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  View
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

JLoader::import('watch', JPATH_ROOT . '/components/com_reditem/helpers');

/**
 * Item edit view
 *
 * @package     RedITEM.Backend
 * @subpackage  View
 * @since       0.9.1
 */
class ReditemViewItemEdit extends ReditemView
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

		$this->item = $this->get('Item');

		// Get customfield values if item is in edit mode
		if (isset($this->item->id))
		{
			$cfValues = ReditemHelperItem::getCustomFieldValues($this->item->id);

			if (isset($cfValues[$this->item->type_id][$this->item->id]))
			{
				$this->item->customfield_values = $cfValues[$this->item->type_id][$this->item->id];
			}

			if (ReditemHelperWatch::isWatchFeatureEnabled())
			{
				$this->watchButton = RLayoutHelper::render('features.watch', array("item_id" => $this->item->id));
			}
		}

		$this->template = $this->get('Template');
		$this->form     = $this->get('Form');
		$this->typeId   = $app->input->getInt('typeId', 0);

		if (0 == $this->typeId)
		{
			$this->typeId = $app->getUserState('com_reditem.global.tid', '0');
		}

		$app->setUserState('com_reditem.global.tid', $this->typeId);

		$this->customfields = $this->get('CustomFields');
		$this->content      = ReditemHelperItem::prepareItemEditTemplate($this->template, $this->form, $this->customfields, $this->item);

		if (JPluginHelper::isEnabled('system', 'twig'))
		{
			$fields = array();

			if (!empty($this->item->customfield_values))
			{
				foreach ($this->item->customfield_values as $key => $value)
				{
					if (($decode = ReditemHelperCustomfield::isJsonValue($value)) !== false)
					{
						if (is_array($decode))
						{
							if (count($decode) == 1)
							{
								$fields[$key] = $decode[0];
							}
							elseif (count($decode) == 0)
							{
								$fields[$key] = '';
							}
							else
							{
								$fields[$key] = $decode;
							}
						}
						else
						{
							$fields[$key] = $decode;
						}
					}
					else
					{
						$fields[$key] = $value;
					}
				}
			}

			$loader = new Twig_Loader_Array(
				array (
					'itemdetail-' . $this->item->id . '.html' => $this->content
				)
			);
			$twig = new Twig_Environment($loader);
			$twig->addExtension(ReditemHelperTwig::getExtension());
			$this->content = $twig->render(
				'itemdetail-' . $this->item->id . '.html',
				array (
					'fields' => $fields,
					'page'   => $_SERVER
				)
			);
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

		return JText::_('COM_REDITEM_ITEM_ITEM') . $subTitle;
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

		$save = RToolbarBuilder::createSaveButton('itemedit.apply');
		$saveAndClose = RToolbarBuilder::createSaveAndCloseButton('itemedit.save');
		$saveAndNew = RToolbarBuilder::createSaveAndNewButton('itemedit.save2new');
		$save2Copy = RToolbarBuilder::createSaveAsCopyButton('itemedit.save2copy');

		$group->addButton($save)
			->addButton($saveAndClose)
			->addButton($saveAndNew)
			->addButton($save2Copy);

		if (empty($this->item->id))
		{
			$cancel = RToolbarBuilder::createCancelButton('itemedit.cancel');
		}
		else
		{
			$cancel = RToolbarBuilder::createCloseButton('itemedit.cancel');
		}

		$group->addButton($cancel);

		$toolbar = new RToolbar;
		$toolbar->addGroup($group);

		return $toolbar;
	}
}
