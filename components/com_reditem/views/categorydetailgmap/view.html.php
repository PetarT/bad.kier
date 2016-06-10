<?php
/**
 * @package     RedITEM.Frontend
 * @subpackage  RedITEM
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * Category view.
 *
 * @package     RedITEM.Frontend
 * @subpackage  View.Html
 * @since       2.1.1
 */
class ReditemViewCategoryDetailGmap extends ReditemView
{
	protected $item;

	/**
	 * Display template
	 *
	 * @param   string  $tpl  [description]
	 *
	 * @return void
	 */
	public function display($tpl = null)
	{
		$app          = JFactory::getApplication();
		$this->params = $app->getParams();
		$this->item   = $this->get('Data');
		$content      = '';

		if ($this->item)
		{
			// Check whether category access level allows access.
			$user = ReditemHelperSystem::getUser();

			if (!in_array($this->item->access, $user->getAuthorisedViewLevels()))
			{
				JError::raiseWarning(403, JText::_('JERROR_ALERTNOAUTHOR'));
			}

			$this->prepareDocument();
			$content = ReditemHelperCategorygmap::prepareTemplate($this->item);
		}

		if (JPluginHelper::isEnabled('system', 'twig'))
		{
			$loader = new Twig_Loader_Array(
				array (
					'categorydetailgmap-' . $this->item->id . '.html' => $content
				)
			);
			$twig = new Twig_Environment($loader);
			$twig->addExtension(ReditemHelperTwig::getExtension());
			$this->content = $twig->render(
				'categorydetailgmap-' . $this->item->id . '.html',
				array (
					'items' => $this->item->items,
					'page'  => $_SERVER
				)
			);
		}
		else
		{
			$this->content = $content;
		}

		parent::display($tpl);
	}

	/**
	 * Prepares the document
	 *
	 * @return void
	 */
	protected function prepareDocument()
	{
		$app            = JFactory::getApplication();
		$menus          = $app->getMenu();
		$pathway        = $app->getPathway();
		$title          = null;
		$categoryParams = $this->item->params;
		$redConfig      = JComponentHelper::getParams('com_reditem');

		// Because the application sets a default page title,
		// we need to get it from the menu item itself
		$menu = $menus->getActive();

		if ($menu)
		{
			$this->params->def('page_heading', $this->params->get('page_title', $menu->title));
		}
		else
		{
			$this->params->def('page_heading', JText::_('COM_REDITEM_GLOBAL_CATEGORY'));
		}

		$id = (int) @$menu->query['id'];

		if ($menu && (($menu->query['option'] != 'com_reditem') || ($menu->query['view'] != 'categorydetail') || ($id != $this->item->id)))
		{
			$pathway->addItem($this->item->title, '');
		}

		$title = $this->params->get('page_title', '');

		if (empty($title))
		{
			$title = $app->getCfg('sitename');
		}
		elseif ($app->getCfg('sitename_pagetitles', 0) == 1)
		{
			$title = JText::sprintf('JPAGETITLE', $app->getCfg('sitename'), $title);
		}
		elseif ($app->getCfg('sitename_pagetitles', 0) == 2)
		{
			$title = JText::sprintf('JPAGETITLE', $title, $app->getCfg('sitename'));
		}

		$seoTitleConfig = $redConfig->get('seo_title_config', '');

		switch ($seoTitleConfig)
		{
			case 'append':
				$title = $title . " | " . $this->item->title;
				break;

			case 'prepend':
				$title = $this->item->title . " | " . $title;
				break;

			case 'replace':
				$title = $this->item->title;
				break;

			default:
				break;
		}

		$this->document->setTitle($title);

		// Meta description process
		if ($this->params->get('menu-meta_description'))
		{
			// Use Meta Description from menu
			$this->document->setDescription($this->params->get('menu-meta_description'));
		}
		elseif (isset($categoryParams['meta_description']) && (!empty($categoryParams['meta_description'])))
		{
			// Use Meta Description of this item
			$this->document->setDescription($categoryParams['meta_description']);
		}

		// Meta keywords process
		if ($this->params->get('menu-meta_keywords'))
		{
			// Use Meta Keywords from menu
			$this->document->setMetadata('keywords', $this->params->get('menu-meta_keywords'));
		}
		elseif (isset($categoryParams['meta_keywords']) && (!empty($categoryParams['meta_keywords'])))
		{
			// Use Meta Description of this item
			$this->document->setMetadata('keywords', $categoryParams['meta_keywords']);
		}

		// Robots process
		if ($this->params->get('robots'))
		{
			$this->document->setMetadata('robots', $this->params->get('robots'));
		}
		elseif (isset($categoryParams['meta_robots']) && (!empty($categoryParams['meta_robots'])))
		{
			// Use Meta Description of this item
			$this->document->setMetadata('robots', $categoryParams['meta_robots']);
		}
	}
}
