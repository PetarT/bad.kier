<?php
/**
 * @package     RedITEM.Frontend
 * @subpackage  RedITEM
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.view');

/**
 * Item view.
 *
 * @package     RedITEM.Frontend
 * @subpackage  View.Html
 * @since       2.0
 */
class ReditemViewItemlook extends ReditemView
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
		$mainframe = JFactory::getApplication();
		$this->params = $mainframe->getParams();
		$this->item = $this->get('Data');

		$content = '';

		if ($this->item)
		{
			// Load categories of this item
			$categories = ReditemHelperItem::getCategories($this->item->id, false);

			if (isset($categories[$this->item->id]))
			{
				$this->item->categories = $categories[$this->item->id];
			}

			// Check whether category access level allows access.
			$user	= ReditemHelperSystem::getUser();
			$groups	= $user->getAuthorisedViewLevels();

			if (!in_array($this->item->access, $groups))
			{
				return JError::raiseWarning(403, JText::_('JERROR_ALERTNOAUTHOR'));
			}

			// Change custom fields value to array
			if (isset($this->item->customfield_values))
			{
				$this->item->customfield_values = (array) $this->item->customfield_values;
			}

			// Replace item's data and item's custom fields
			// @todo Build central helper for all tags and use this instead separate
			$content = $this->item->template->content;
			ReditemHelperItem::replaceTag($content, $this->item);
			ReditemHelperItem::replaceCustomfieldsTag($content, $this->item);
			ReditemHelperItem::replaceRelatedItems($content, $this->item);

			// Run dispatcher for content's plugins
			JPluginHelper::importPlugin('content');
			$content = JHtml::_('content.prepare', $content);
		}

		if (JPluginHelper::isEnabled('system', 'twig'))
		{
			$fields = array();

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

			$loader = new Twig_Loader_Array(
				array (
					'itemdetail-' . $this->item->id . '.html' => $content
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
		else
		{
			$this->content = $content;
		}

		parent::display($tpl);
	}
}
