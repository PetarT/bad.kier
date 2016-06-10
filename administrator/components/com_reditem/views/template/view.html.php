<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  View
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

require_once JPATH_ADMINISTRATOR . '/components/com_reditem/helpers/helper.php';

/**
 * Category edit view
 *
 * @package     RedITEM.Backend
 * @subpackage  View
 * @since       0.9.1
 */
class ReditemViewTemplate extends ReditemViewAdmin
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
		$this->form	= $this->get('Form');
		$this->item	= $this->get('Item');

		if (isset($this->item->id))
		{
			if (!isset($this->item->type))
			{
				$typeModel = RModel::getAdminInstance('Type', array('ignore_request' => true), 'com_reditem');
				$this->type = $typeModel->getItem($this->item->type_id);
			}

			$typeParams = new JRegistry($this->type->params);
			$itemGmapField = (boolean) $typeParams->get('item_gmap_field');

			switch ($this->item->typecode)
			{
				case 'view_itemdetail':
					$this->itemTags    = ReditemHelperHelper::getItemTags($this->item->type_id);
					$this->itemRelated = ReditemHelperHelper::getRelatedItemsTag($this->item->type_id);
					break;

				case 'view_itemedit':
					$this->itemTags     = ReditemHelperHelper::getItemEditTags($this->item->type_id);
					$this->requriedTags = ReditemHelperHelper::getItemEditRequiredTags();
					break;

				case 'view_archiveditems':
				case 'module_items':
				case 'module_relateditems':
					$this->itemTags = ReditemHelperHelper::getItemTags($this->item->type_id);
					break;

				case 'view_search':
					$this->searchTags       = ReditemHelperHelper::getSearchTags($this->item);
					$this->filterSearchTags = ReditemHelperHelper::getFilterTags();
					break;

				case 'view_categorydetail':
					$this->categoryTags            = ReditemHelperHelper::getCategoryTags($this->item);
					$this->filterTags              = ReditemHelperHelper::getFilterTags();
					$this->filterCategoryExtraTags = ReditemHelperHelper::getCategoryFilterTags($this->item);

					if ($itemGmapField)
					{
						$this->filterTags = array_merge($this->filterTags, ReditemHelperHelper::getCategoryGmapFilterTags());
					}

					break;

				case 'view_categorydetailgmap':
					$this->categoryTags     = ReditemHelperHelper::getCategoryTags($this->item);
					$this->categoryGmapTags = ReditemHelperHelper::getCategoryGmapTags();
					$this->filterTags       = ReditemHelperHelper::getFilterTags();

					if ($itemGmapField)
					{
						$this->filterTags = array_merge($this->filterTags, ReditemHelperHelper::getCategoryGmapFilterTags());
					}

					// Remove unused tags
					unset($this->categoryTags['{items_sort|<em>Name</em>|<em>Destination</em>}']);
					unset($this->categoryTags['{sub_category_start}']);
					unset($this->categoryTags['{sub_category_tags}']);
					unset($this->categoryTags['{sub_category_end}']);
					unset($this->categoryTags['{sub_category_pagination|<em>limit</em>}']);
					unset($this->categoryTags['{sub_featured_category_start}']);
					unset($this->categoryTags['{sub_featured_category_tags}']);
					unset($this->categoryTags['{sub_featured_category_end}']);
					unset($this->categoryTags['{related_category_start}']);
					unset($this->categoryTags['{related_category_tags}']);
					unset($this->categoryTags['{related_category_end}']);
					unset($this->categoryTags['{items_masonry|<em>itemWidth</em>}']);
					unset($this->categoryTags['{group_items|<em>CustomFieldID</em>}']);
					unset($this->categoryTags['{items_pagination|<em>limit</em>}']);
					unset($this->categoryTags['{category_gmap}']);
					break;

				case 'watchitem_watch':
				case 'watchitem_edit':
				case 'watchitem_delete':
					$this->itemTags = ReditemHelperHelper::getItemTags($this->item->type_id);
					$this->userTags = ReditemHelperHelper::getUserTags();
					break;

				case 'watchitem_comment':
					$this->commentTags = ReditemHelperHelper::getCommentTags();
					$this->userTags    = ReditemHelperHelper::getUserTags();
					break;

				case 'watchitem_rate':
					$this->itemTags   = ReditemHelperHelper::getItemTags($this->item->type_id);
					$this->userTags   = ReditemHelperHelper::getUserTags();
					$this->ratingTags = ReditemHelperHelper::getRatingTags();
					break;

				case 'module_search':
					$this->filterTags = ReditemHelperHelper::getFilterTags();
					break;

				default:
					break;
			}
			// Load extra tags from plugin
			$dispatcher	= RFactory::getDispatcher();
			JPluginHelper::importPlugin('reditem');
			$this->extraTags = array();
			$dispatcher->trigger('onPrepareExtraTags', array(&$this->extraTags));
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

		return JText::_('COM_REDITEM_TEMPLATE_TEMPLATE') . $subTitle;
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

		$save = RToolbarBuilder::createSaveButton('template.apply');
		$saveAndClose = RToolbarBuilder::createSaveAndCloseButton('template.save');
		$saveAndNew = RToolbarBuilder::createSaveAndNewButton('template.save2new');
		$save2Copy = RToolbarBuilder::createSaveAsCopyButton('template.save2copy');

		$group->addButton($save)
			->addButton($saveAndClose)
			->addButton($saveAndNew)
			->addButton($save2Copy);

		if (empty($this->item->id))
		{
			$cancel = RToolbarBuilder::createCancelButton('template.cancel');
		}
		else
		{
			$cancel = RToolbarBuilder::createCloseButton('template.cancel');
		}

		$group->addButton($cancel);

		$toolbar = new RToolbar;
		$toolbar->addGroup($group);

		return $toolbar;
	}
}
