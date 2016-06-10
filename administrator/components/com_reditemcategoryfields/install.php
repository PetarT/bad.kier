<?php
/**
 * @package    RedITEMCategoryFields.Installer
 *
 * @copyright  Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license    GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

// Find redCORE installer to use it as base system
if (!class_exists('Com_RedcoreInstallerScript'))
{
	$searchPaths = array(
		// Install
		dirname(__FILE__) . '/redCORE',
		// Discover install
		JPATH_ADMINISTRATOR . '/components/com_redcore'
	);

	if ($redcoreInstaller = JPath::find($searchPaths, 'install.php'))
	{
		require_once $redcoreInstaller;
	}
}

/**
 * Script file of RedITEMCategoryFields component
 *
 * @package  RedITEMCategoryFields.Installer
 *
 * @since    2.0
 */
class Com_RedItemCategoryFieldsInstallerScript extends Com_RedcoreInstallerScript
{
	/**
	 * Method to install the component
	 *
	 * @param   object  $parent  Class calling this method
	 *
	 * @return  boolean          True on success
	 */
	public function installOrUpdate($parent)
	{
		$redItemId = $this->checkRedItemExist();

		if ($redItemId)
		{
			$this->deleteMenu('', $parent);
			$this->com_install();
			parent::installOrUpdate($parent);
		}
		else
		{
			$app = JFactory::getApplication();
			$app->enqueueMessage(JText::_('COM_REDITEMCATEGORYFIELDS_INSTALL_ERROR_MISSING_REDITEM'), 'error');
			$app->redirect('index.php?option=com_installer');
		}

		return true;
	}

	/**
	 * Main redITEM installer Events
	 *
	 * @return  void
	 */
	private function com_install()
	{
		// Diplay the installation message
		$this->displayInstallMsg();
	}

	/**
	 * method to uninstall the component
	 *
	 * @param   object  $parent  class calling this method
	 *
	 * @return void
	 */
	public function uninstall($parent)
	{
		// Error handling
		JError::SetErrorHandling(E_ALL, 'callback', array('Com_RedItemCategoryFieldsInstallerScript', 'error_handling'));

		// Uninstall extensions
		$this->com_uninstall();
	}

	/**
	 * Main redITEM uninstaller Events
	 *
	 * @return  void
	 */
	private function com_uninstall()
	{
	}

	/**
	 * Error handler
	 *
	 * @param   array  $e  Exception array
	 *
	 * @return  void
	 */
	public static function error_handling(Exception $e)
	{
		echo $e->getMessage();
	}

	/**
	 * Display install message
	 *
	 * @return void
	 */
	public function displayInstallMsg()
	{
		echo JText::_('COM_REDITEMCATEGORYFIELDS_INSTALL_SUCCESS');
	}

	/**
	 * Update menu item in Administrator for RedITEM Category Fields component
	 *
	 * @return int extesion ID of redITEM
	 */
	public function checkRedItemExist()
	{
		$db = JFactory::getDbo();
		$app = JFactory::getApplication();

		$query = $db->getQuery(true);
		$query->select($db->qn('e.extension_id'))
			->from($db->qn('#__extensions', 'e'))
			->where($db->qn('e.type') . ' = ' . $db->quote('component'))
			->where($db->qn('e.element') . ' = ' . $db->quote('com_reditem'));

		$db->setQuery($query);
		$result = $db->loadObject();

		if ($result)
		{
			return $result->extension_id;
		}

		return null;
	}
}
