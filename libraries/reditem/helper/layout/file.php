<?php
/**
 * @package     Reditem
 * @subpackage  Layout
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later, see LICENSE.
 */

defined('JPATH_PLATFORM') or die;

/**
 * Base class for rendering a display layout
 * loaded from from a layout file
 *
 * @package     Reditem
 * @subpackage  Layout
 * @see         http://docs.joomla.org/Sharing_layouts_across_views_or_extensions_with_JLayout
 * @since       2.2.0
 */
class ReditemHelperLayoutFile extends RLayoutFile
{
	/**
	 * Refresh the list of include paths
	 *
	 * @return  void
	 *
	 * @since   2.2.0
	 */
	protected function refreshIncludePaths()
	{
		$template = JFactory::getApplication()->getTemplate();

		// Reset includePaths
		$this->includePaths = array();

		// (0 - lower priority) Frontend base layouts
		$this->addIncludePaths(JPATH_ROOT . '/layouts');

		// (1) Library path
		$this->addIncludePaths(JPATH_LIBRARIES . '/redcore/layouts');

		// (2) Our library path
		$this->addIncludePaths(JPATH_LIBRARIES . '/reditem/layouts');

		// (3) Standard Joomla! layouts overriden
		$this->addIncludePaths(JPATH_THEMES . '/' . JFactory::getApplication()->getTemplate() . '/html/layouts');

		// Component layouts & overrides if exist
		$component = $this->options->get('component', null);

		if (!empty($component))
		{
			// (4) Component path
			if ($this->options->get('client') == 0)
			{
				$this->addIncludePaths(JPATH_SITE . '/components/' . $component . '/layouts');
			}
			else
			{
				$this->addIncludePaths(JPATH_ADMINISTRATOR . '/components/' . $component . '/layouts');
			}

			// (4) Specific type
			if (!empty($this->options['type']))
			{
				$this->addIncludePath(JPATH_THEMES . '/' . $template . '/html/layouts/' . $component . '/type_' . $this->options['type']->table_name);
			}

			// (5) Component template overrides path
			$this->addIncludePath(JPATH_THEMES . '/' . $template . '/html/layouts/' . $component);
		}

		// (6 - highest priority) Received a custom high priority path ?
		if (!is_null($this->basePath))
		{
			$this->addIncludePath(rtrim($this->basePath, DIRECTORY_SEPARATOR));
		}
	}
}
