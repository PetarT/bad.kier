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
 * Control panel view for redITEM.
 *
 * @package     RedITEM.Backend
 * @subpackage  View
 * @since       0.9.1
 */
class RedItemViewCpanel extends ReditemViewAdmin
{
	/**
	 * Hide sidebar in cPanel
	 *
	 * @var  boolean
	 */
	protected $displaySidebar = false;

	/**
	 * Display the control panel
	 *
	 * @param   string  $tpl  The template file to use
	 *
	 * @return   string
	 *
	 * @since   2.0
	 */
	public function display($tpl = null)
	{
		$this->user = ReditemHelperSystem::getUser();
		$userType   = array_keys($this->user->groups);
		$this->user->usertype = $userType[0];
		$this->user->gid = $this->user->groups[$this->user->usertype];

		require_once JPATH_COMPONENT_ADMINISTRATOR . '/helpers/cpanel.php';

		// Get stats
		$icons = ReditemHelperCpanel::getIconArray();
		$stats = ReditemHelperSystem::getStats();

		foreach ($icons as &$extension)
		{
			foreach ($extension['icons'] as $key => $icon)
			{
				$view = $icon['view'];

				if (in_array($view, array('cpanel', 'dashboard')))
				{
					unset($extension['icons'][$key]);

					continue;
				}

				if (isset($stats->$view) && ($extension['option'] == 'com_reditem'))
				{
					$extension['icons'][$key]['stat'] = $stats->$view;
				}
			}
		}

		$this->icons = $icons;

		parent::display($tpl);
	}
}
