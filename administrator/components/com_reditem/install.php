<?php
/**
 * @package    RedITEM.Installer
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

// Register component prefix
JLoader::registerPrefix('Reditem', __DIR__);

// Load redITEM Library
JLoader::import('reditem.library');

/**
 * Script file of redITEM component
 *
 * @package  RedITEM.Installer
 *
 * @since    2.0
 */
class Com_RedItemInstallerScript extends Com_RedcoreInstallerScript
{
	/**
	 * Installed redITEM version.
	 *
	 * @var string
	 */
	private $currentVersion = '';

	/**
	 * Array for moving current templates from db to files.
	 * Used on update process to version 2.1.17.
	 *
	 * @var array
	 */
	private $tempTemplates = array();

	/**
	 * Method to install the component
	 *
	 * @param   object  $parent  Class calling this method
	 *
	 * @return  boolean          True on success
	 */
	public function installOrUpdate($parent)
	{
		parent::installOrUpdate($parent);

		$this->com_install();

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
		// Uninstall extensions
		$this->com_uninstall();

		parent::uninstall($parent);
	}

	/**
	 * Main redITEM uninstaller Events
	 *
	 * @return  void
	 */
	private function com_uninstall()
	{
		JTable::addIncludePath(JPATH_ROOT . '/administrator/components/com_reditem/tables');

		// Remove items
		$typesModel = RModel::getAdminInstance('Types', array('ignore_request' => true), 'com_reditem');
		$typeTable  = JTable::getInstance('Type', 'ReditemTable', array('ignore_request' => true));
		$types      = $typesModel->getItems();

		if ($types)
		{
			foreach ($types as $type)
			{
				$typeTable->load($type->id);
				$typeTable->delete();
			}
		}

		unset($typesModel);
		unset($typeTable);
		unset($types);
	}

	/**
	 * Display install message
	 *
	 * @return void
	 */
	public function displayInstallMsg()
	{
		echo '<p><img src="' . JUri::root() . '/media/com_reditem/images/reditem_logo.jpg" alt="redITEM Logo" width="500"></p>';
		echo '<br /><br /><p>Remember to check for updates at:<br />';
		echo '<a href="http://www.redcomponent.com/" target="_new">';
		echo '<img src="' . JUri::root() . '/media/com_reditem/images/redcomponent_logo.jpg" alt="">';
		echo '</a></p>';
	}

	/**
	 * Method to run after an install/update/uninstall method
	 *
	 * @param   object  $type    type of change (install, update or discover_install)
	 * @param   object  $parent  class calling this method
	 *
	 * @return  boolean
	 */
	public function postflight($type, $parent)
	{
		if (parent::postflight($type, $parent))
		{
			if (version_compare($this->currentVersion, '2.1.17', 'lt'))
			{
				JLoader::import('joomla.filesystem.file');
				JLoader::import('joomla.filesystem.folder');

				$db = JFactory::getDbo();

				foreach ($this->tempTemplates as $template)
				{
					$fileName = $template->id . '_' . strtolower(JFile::makeSafe($template->name)) . '.php';
					$fileName = str_replace(' ', '_', $fileName);
					$folder   = $template->typecode;

					if (!JFolder::exists(JPATH_ROOT . '/media/com_reditem/templates/' . $folder))
					{
						if (!JFolder::create(JPATH_ROOT . '/media/com_reditem/templates/' . $folder))
						{
							return false;
						}
					}

					$folder .= '/';

					if (JFile::write(JPATH_ROOT . '/media/com_reditem/templates/' . $folder . $fileName, $template->content))
					{
						$query = $db->getQuery(true)
							->update($db->qn('#__reditem_templates'))
							->set($db->qn('filename') . ' = ' . $db->q($folder . $fileName))
							->where($db->qn('id') . ' = ' . $template->id);
						$db->setQuery($query);

						if (!$db->execute())
						{
							return false;
						}
					}
				}
			}

			// Redirect to the welcome screen.
			if ($type === 'discover_install')
			{
				$app = JFactory::getApplication();
				$app->redirect('index.php?option=com_reditem&view=welcome&type=' . $type);
			}
			else
			{
				$parent->getParent()->setRedirectURL('index.php?option=com_reditem&view=welcome&type=' . $type);
			}

			return true;
		}

		return false;
	}

	/**
	 * Method to run before an install/update/uninstall method
	 *
	 * @param   object  $type    type of change (install, update or discover_install)
	 * @param   object  $parent  class calling this method
	 *
	 * @return  boolean
	 */
	public function preflight($type, $parent)
	{
		if (method_exists('Com_RedcoreInstallerScript', 'preflight') && !parent::preflight($type, $parent))
		{
			return false;
		}

		if ($type == "update")
		{
			$db = JFactory::getDbo();

			if (empty($this->currentVersion))
			{
				// Get existing redITEM version
				$query = $db->getQuery(true)
					->select($db->qn('s.version_id'))
					->from($db->qn('#__schemas', 's'))
					->leftJoin($db->qn('#__extensions', 'e') . ' ON ' . $db->qn('e.extension_id') . '=' . $db->qn('s.extension_id'))
					->where($db->qn('e.name') . '=' . $db->quote('com_reditem'))
					->where($db->qn('e.type') . '=' . $db->quote('component'));
				$db->setQuery($query);
				$this->currentVersion = $db->loadResult();
			}

			if (in_array($this->currentVersion, array('2.0', '2.0.0', '2.0.1', '2.0.2')))
			{
				$this->migrationData();
			}

			if (version_compare($this->currentVersion, '2.1.17', 'lt') && !empty($this->currentVersion))
			{
				// Saving old templates content to temp array
				$query = $db->getQuery(true);
				$query->select(
					array (
						$db->qn('content'),
						$db->qn('typecode'),
						$db->qn('id'),
						$db->qn('name')
					)
				)
					->from($db->qn('#__reditem_templates'));
				$this->tempTemplates = $db->setQuery($query)->loadObjectList();
			}
		}

		return true;
	}

	/**
	 * Method for migration data from old version (2.0 -> 2.0.2)
	 *
	 * @return  void
	 * @throws  Exception
	 */
	public function migrationData()
	{
		$db = JFactory::getDbo();

		// Load redCORE library
		$redcoreLoader = JPATH_LIBRARIES . '/redcore/bootstrap.php';

		if (!file_exists($redcoreLoader) || !JPluginHelper::isEnabled('system', 'redcore'))
		{
			throw new Exception(JText::_('COM_REDITEM_REDCORE_INIT_FAILED'), 404);
		}

		RBootstrap::bootstrap();

		// Add Include path
		RModel::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_reditem/models');
		JTable::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_reditem/tables');

		$typesModel	= RModel::getAdminInstance('Types', array('ignore_request' => true), 'com_reditem');
		$types = $typesModel->getItems();

		// If doesn't have any types
		if (!$types)
		{
			return;
		}

		foreach ($types as $type)
		{
			// Created "Intro text" custom field
			$fieldTable	= JTable::getInstance('Field', 'ReditemTable');
			$fieldTable->id = 0;
			$fieldTable->type_id = $type->id;
			$fieldTable->name = $type->title . ' Introtext';
			$fieldTable->type = 'editor';
			$fieldTable->published = '1';
			$fieldTable->store();
			$fieldIntroCode = str_replace('-', '_', JFilterOutput::stringURLSafe($type->title . ' Introtext'));

			// Created "Full text" custom field
			$fieldTable	= JTable::getInstance('Field', 'ReditemTable');
			$fieldTable->id = 0;
			$fieldTable->type_id = $type->id;
			$fieldTable->name = $type->title . ' Fulltext';
			$fieldTable->type = 'editor';
			$fieldTable->published = '1';
			$fieldTable->store();
			$fieldFullCode = str_replace('-', '_', JFilterOutput::stringURLSafe($type->title . ' Fulltext'));

			// Created "Item image" custom field
			$fieldTable	= JTable::getInstance('Field', 'ReditemTable');
			$fieldTable->id = 0;
			$fieldTable->type_id = $type->id;
			$fieldTable->name = $type->title . ' Image';
			$fieldTable->type = 'image';
			$fieldTable->published = '1';
			$fieldTable->store();
			$fieldImageCode = str_replace('-', '_', JFilterOutput::stringURLSafe($type->title . ' Image'));

			// Process data of items
			$itemsModel	= RModel::getAdminInstance('Items', array('ignore_request' => true), 'com_reditem');
			$itemsModel->setState('filter.filter_types', $type->id);
			$items = $itemsModel->getItems();

			if ($items)
			{
				foreach ($items as $item)
				{
					// Insert data
					$query = $db->getQuery(true)
						->update($db->qn('#__reditem_types_' . $type->table_name, 'cf'))
						->set($db->qn('cf.' . $fieldIntroCode) . '=' . $db->quote($item->introtext))
						->set($db->qn('cf.' . $fieldFullCode) . '=' . $db->quote($item->fulltext))
						->set($db->qn('cf.' . $fieldImageCode) . '=' . $db->quote(json_encode(array($item->id . '/' . $item->item_image))))
						->where($db->qn('cf.id') . '=' . $db->quote($item->id));
					$db->setQuery($query);
					$db->execute();
				}
			}

			// Process content of templates
			$templatesModel	= RModel::getAdminInstance('Templates', array('ignore_request' => true), 'com_reditem');
			$templatesModel->setState('filter.filter_types', $type->id);
			$templatesModel->setState('list.select', 't.id');
			$templates = $templatesModel->getItems();

			if ($templates)
			{
				// Default image thumbnail size
				$imageLargeWidth	= 600;
				$imageLargeHeight	= 600;
				$imageMediumWidth	= 300;
				$imageMediumHeight	= 300;
				$imageSmallWidth	= 150;
				$imageSmallHeight	= 150;

				// If have configuration in Type
				if (isset($type->params))
				{
					$typeConfiguration = new JRegistry($type->params);

					$imageLargeWidth	= $typeConfiguration->get('default_itemimage_large_width', 600);
					$imageLargeHeight	= $typeConfiguration->get('default_itemimage_large_height', 600);
					$imageMediumWidth	= $typeConfiguration->get('default_itemimage_medium_width', 300);
					$imageMediumHeight	= $typeConfiguration->get('default_itemimage_medium_height', 300);
					$imageSmallWidth	= $typeConfiguration->get('default_itemimage_small_width', 150);
					$imageSmallHeight	= $typeConfiguration->get('default_itemimage_small_height', 150);
				}

				foreach ($templates as $template)
				{
					$templateTable = JTable::getInstance('Template', 'ReditemTable');
					$templateTable->load($template->id);

					// Replace template with new tag
					$templateTable->content = str_replace('{item_introtext', '{' . $fieldIntroCode . '_value', $templateTable->content);
					$templateTable->content = str_replace('{item_fulltext', '{' . $fieldFullCode . '_value', $templateTable->content);
					$templateTable->content = str_replace('{item_image}', '{' . $fieldImageCode . '_value}', $templateTable->content);
					$imageLarge = $imageLargeWidth . '|' . $imageLargeHeight;
					$templateTable->content = str_replace('{item_image_large}', '{' . $fieldImageCode . '_value|' . $imageLarge . '}', $templateTable->content);
					$imageMedium = $imageMediumWidth . '|' . $imageMediumHeight;
					$templateTable->content = str_replace('{item_image_medium}', '{' . $fieldImageCode . '_value|' . $imageMedium . '}', $templateTable->content);
					$imageSmall = $imageSmallWidth . '|' . $imageSmallHeight;
					$templateTable->content = str_replace('{item_image_small}', '{' . $fieldImageCode . '_value|' . $imageSmall . '}', $templateTable->content);

					$templateTable->store();
				}
			}
		}

		// Move old folder (components/com_reditem/assets) to new folder (media/com_reditem)
		$oldImageFolder = JPATH_ROOT . '/components/com_reditem/assets/images';
		$newImageFolder = JPATH_ROOT . '/media/com_reditem/images';

		if (!JFolder::exists($newImageFolder))
		{
			JFolder::create($newImageFolder);
		}

		if (JFolder::exists($oldImageFolder))
		{
			$folders = JFolder::folders($oldImageFolder);

			foreach ($folders as $folder)
			{
				// Force copy folder from old location to new location
				JFolder::copy($oldImageFolder . '/' . $folder, $newImageFolder . '/' . $folder, '', true);
			}
		}

		// Copy image from old Item folder to customfield
		$oldItemImageFolder = JPATH_ROOT . '/media/com_reditem/images/item';

		if (!JFolder::exists($oldItemImageFolder))
		{
			return;
		}

		foreach ($types as $type)
		{
			$fieldImageCode = str_replace('-', '_', JFilterOutput::stringURLSafe($type->title . ' Image'));

			$query = $db->getQuery(true)
				->select($db->qn(array('id', $fieldImageCode)))
				->from($db->qn('#__reditem_types_' . $type->table_name));
			$db->setQuery($query);
			$result = $db->loadObjectList();

			foreach ($result as $item)
			{
				$imageFileName = json_decode($item->$fieldImageCode, true);

				if ((count($imageFileName) > 0) && (!empty($imageFileName[0])))
				{
					$imageFileName = $imageFileName[0];

					$oldImagePath = JPATH_ROOT . '/media/com_reditem/images/item/' . $imageFileName;
					$newImagePath = JPATH_ROOT . '/media/com_reditem/images/customfield/' . $imageFileName;

					JFile::copy($oldImagePath, $newImagePath);
				}
			}
		}

		// Remove old Item Image path
		JFolder::delete(JPATH_ROOT . '/media/com_reditem/images/item');
	}
}
