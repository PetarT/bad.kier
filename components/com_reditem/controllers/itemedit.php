<?php
/**
 * @package     RedITEM.Front
 * @subpackage  Controller
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

JLoader::import('watch', JPATH_ROOT . '/components/com_reditem/helpers');

/**
 * The item edit controller
 *
 * @package     RedITEM.Front
 * @subpackage  Controller.Item
 * @since       2.0.19
 */

class ReditemControllerItemEdit extends RControllerForm
{
	/**
	 * Method to save a record.
	 *
	 * @param   string  $key     The name of the primary key of the URL variable.
	 * @param   string  $urlVar  The name of the URL variable if different from the primary key (sometimes required to avoid router collisions).
	 *
	 * @return  boolean  True if successful, false otherwise.
	 */
	public function save($key = null, $urlVar = null)
	{
		// Check for request forgeries.
		JSession::checkToken() or jexit(JText::_('JINVALID_TOKEN'));

		$app   = JFactory::getApplication();
		$lang  = JFactory::getLanguage();
		$model = $this->getModel();
		$table = $model->getTable();
		$data  = $this->input->post->get('jform', array(), 'array');
		$checkin = property_exists($table, 'checked_out');
		$context = "$this->option.edit.$this->context";
		$task = $this->getTask();

		// Determine the name of the primary key for the data.
		if (empty($key))
		{
			$key = $table->getKeyName();
		}

		// To avoid data collisions the urlVar may be different from the primary key.
		if (empty($urlVar))
		{
			$urlVar = $key;
		}

		$recordId = $this->input->getInt($urlVar);

		if (!$this->checkEditId($context, $recordId))
		{
			// Somehow the person just went to the form and tried to save it. We don't allow that.
			$this->setError(JText::sprintf('JLIB_APPLICATION_ERROR_UNHELD_ID', $recordId));
			$this->setMessage($this->getError(), 'error');

			// Redirect to the list screen
			$this->setRedirect(
					$this->getRedirectToListRoute($this->getRedirectToListAppend())
			);

			return false;
		}

		// Populate the row id from the session.
		$data[$key] = $recordId;

		// The save2copy task needs to be handled slightly differently.
		if ($task == 'save2copy')
		{
			// Check-in the original row.
			if ($checkin && $model->checkin($data[$key]) === false)
			{
				// Check-in failed. Go back to the item and display a notice.
				$this->setError(JText::sprintf('JLIB_APPLICATION_ERROR_CHECKIN_FAILED', $model->getError()));
				$this->setMessage($this->getError(), 'error');

				// Redirect back to the edit screen.
				$this->setRedirect(
						$this->getRedirectToItemRoute($this->getRedirectToItemAppend($recordId, $urlVar))
				);

				return false;
			}

			// Reset the ID and then treat the request as for Apply.
			$data[$key] = 0;
			$task = 'apply';
		}

		// Access check.
		if (!$this->allowSave($data, $key))
		{
			$this->setError(JText::_('JLIB_APPLICATION_ERROR_SAVE_NOT_PERMITTED'));
			$this->setMessage($this->getError(), 'error');

			// Redirect to the list screen
			$this->setRedirect(
					$this->getRedirectToListRoute($this->getRedirectToListAppend())
			);

			return false;
		}

		// Validate the posted data.
		// Sometimes the form needs some posted data, such as for plugins and modules.
		$form = $model->getForm($data, false);

		if (!$form)
		{
			$app->enqueueMessage($model->getError(), 'error');

			return false;
		}

		// Test whether the data is valid.
		$validData = $model->validate($form, $data);

		// Check for validation errors.
		if ($validData === false)
		{
			// Get the validation messages.
			$errors = $model->getErrors();

			// Push up to three validation messages out to the user.
			for ($i = 0, $n = count($errors); $i < $n && $i < 3; $i++)
			{
				if ($errors[$i] instanceof Exception)
				{
					$app->enqueueMessage($errors[$i]->getMessage(), 'warning');
				}
				else
				{
					$app->enqueueMessage($errors[$i], 'warning');
				}
			}

			// Save the data in the session.
			$app->setUserState($context . '.data', $data);

			// Redirect back to the edit screen.
			$this->setRedirect(
					$this->getRedirectToItemRoute($this->getRedirectToItemAppend($recordId, $urlVar))
			);

			return false;
		}

		if (!isset($validData['tags']))
		{
			$validData['tags'] = null;
		}

		// Attempt to save the data.
		if (!$model->save($validData))
		{
			// Save the data in the session.
			$app->setUserState($context . '.data', $validData);

			// Redirect back to the edit screen.
			$this->setError(JText::sprintf('JLIB_APPLICATION_ERROR_SAVE_FAILED', $model->getError()));
			$this->setMessage($this->getError(), 'error');

			// Redirect back to the edit screen.
			$this->setRedirect(
					$this->getRedirectToItemRoute($this->getRedirectToItemAppend($recordId, $urlVar))
			);

			return false;
		}

		// Save succeeded, so check-in the record.
		if ($checkin && $model->checkin($validData[$key]) === false)
		{
			// Save the data in the session.
			$app->setUserState($context . '.data', $validData);

			// Check-in failed, so go back to the record and display a notice.
			$this->setError(JText::sprintf('JLIB_APPLICATION_ERROR_CHECKIN_FAILED', $model->getError()));
			$this->setMessage($this->getError(), 'error');

			// Redirect back to the edit screen.
			$this->setRedirect(
					$this->getRedirectToItemRoute($this->getRedirectToItemAppend($recordId, $urlVar))
			);

			return false;
		}

		// Show item url after saved
		$params = $app->getMenu()->getParams($app->input->get('Itemid'));
		$showUrlAfterSaved = $params->get('show_item_url_after_save', 0);

		if ($showUrlAfterSaved)
		{
			$itemId = $model->getState($model->getName() . '.id');
			$itemUrl = JRoute::_('index.php?option=com_reditem&view=itemdetail&id=' . $itemId);
			$this->setMessage(JText::sprintf('COM_REDITEM_ITEMEDIT_SAVE_SUCCESS_AND_URL', $itemUrl));
		}
		else
		{
			$this->setMessage(
					JText::_(
							($lang->hasKey($this->text_prefix . ($recordId == 0 && $app->isSite() ? '_SUBMIT' : '') . '_SAVE_SUCCESS')
									? $this->text_prefix
									: 'JLIB_APPLICATION') . ($recordId == 0 && $app->isSite() ? '_SUBMIT' : '') . '_SAVE_SUCCESS'
					)
			);
		}

		// Redirect the user and adjust session state based on the chosen task.
		switch ($task)
		{
			case 'apply':
				// Set the record data in the session.
				$recordId = $model->getState($this->context . '.id');
				$this->holdEditId($context, $recordId);
				$app->setUserState($context . '.data', null);
				$model->checkout($recordId);

				// Redirect back to the edit screen.
				$this->setRedirect(
						$this->getRedirectToItemRoute($this->getRedirectToItemAppend($recordId, $urlVar))
				);
				break;

			case 'save2new':
				// Clear the record id and data from the session.
				$this->releaseEditId($context, $recordId);
				$app->setUserState($context . '.data', null);

				// Redirect back to the edit screen.
				$this->setRedirect(
						$this->getRedirectToItemRoute($this->getRedirectToItemAppend(null, $urlVar))
				);
				break;

			default:
				// Clear the record id and data from the session.
				$this->releaseEditId($context, $recordId);
				$app->setUserState($context . '.data', null);

				// Set redirect
				$this->setRedirect(
						$this->getRedirectToListRoute($this->getRedirectToListAppend())
				);
				break;
		}

		// Invoke the postSave method to allow for the child class to access the model.
		$this->postSaveHook($model, $validData);

		return true;
	}

	/**
	 * Add an item
	 *
	 * @return void
	 */
	public function add()
	{
		$app = JFactory::getApplication();
		$app->setUserState('com_reditem.global.tid', '');
		$app->setUserState('com_reditem.global.cid', array());
		$app->setUserState('com_reditem.global.itemId', '');

		return parent::add();
	}

	/**
	 * Edit an item
	 *
	 * @param   int     $key     [description]
	 * @param   string  $urlVar  [description]
	 *
	 * @return void
	 */
	public function edit($key = null, $urlVar = null)
	{
		$itemmodel = RModel::getAdminInstance('Item');

		$item = $itemmodel->getItem();

		$app = JFactory::getApplication();
		$app->setUserState('com_reditem.global.tid', $item->type_id);
		$app->setUserState('com_reditem.global.cid', array());
		$app->setUserState('com_reditem.global.itemId', $item->id);

		return parent::edit($key, $urlVar);
	}

	/**
	 * For auto-submit form when client choose type
	 *
	 * @return void
	 */
	public function setType()
	{
		$app = JFactory::getApplication();
		$recordId = $app->input->get('id', 0, 'int');
		$data = $app->input->get('jform', array(), 'array');

		// Get default template from type configuration
		$typemodel = RModel::getAdminInstance('Type', array('ignore_request' => true));
		$typemodel->setState('list.select', 'params');
		$params = $typemodel->getItem($data['type_id'])->params;
		$data['template_id'] = $params['default_itemdetail_template'];

		// Check if default template has exist
		$templatemodel = RModel::getAdminInstance('Template', array('ignore_request' => true));
		$templatemodel->setState('list.select', 'id');
		$defaultTemplate = $templatemodel->getItem($params['default_itemdetail_template']);

		$data['template_id'] = ($defaultTemplate) ? $defaultTemplate->id : null;

		$app->setUserState('com_reditem.edit.item.data', $data);

		$app->setUserState('com_reditem.global.tid', $data['type_id']);
		$app->setUserState('com_reditem.global.cid', array());

		$redirect = JRoute::_('index.php?option=' . $this->option . '&view=' . $this->view_item . $this->getRedirectToItemAppend($recordId), false);

		$this->setRedirect($redirect);
	}

	/**
	 * function upload
	 *
	 * @return void
	 */
	public function ajaxUpload()
	{
		$user = ReditemHelperSystem::getUser();

		$app = JFactory::getApplication();
		$files = $app->input->files->get('dragFile');

		$uploadType = $app->input->getString('uploadType', '');
		$uploadTarget = $app->input->getString('uploadType', '');

		$model = $this->getModel();
		echo $model->dragndropUpload($files, $uploadType, $uploadTarget);

		$app->close();
	}

	/**
	 * Method for rating item
	 *
	 * @return  void
	 */
	public function ajaxItemRating()
	{
		$app    = JFactory::getApplication();
		$user   = ReditemHelperSystem::getUser();
		$result = array('status' => 0);
		$itemId = $app->input->getInt('id', 0);

		if (!$itemId)
		{
			echo json_encode($result);
			$app->close();
		}

		// Does not allow guest rating
		if ($user->guest)
		{
			echo json_encode($result);
			$app->close();
		}

		$value = (float) $app->input->get('value', 0.0);
		$model = $this->getModel();

		if ($model->ratingItem($itemId, $value))
		{
			$result['status'] = 1;
			$result['totalValue'] = ReditemHelperRating::getRatingValue($itemId);
		}

		echo json_encode($result);
		$app->close();
	}

	/**
	 * function ajaxWatch
	 *
	 * @return  void
	 */
	public function ajaxWatch()
	{
		$app = RFactory::getApplication();

		$id = $app->input->getInt('id', 0);

		if ($id && is_numeric($id))
		{
			ReditemHelperWatch::watchItem((int) $id);

			// Event after item watched
			JPluginHelper::importPlugin('reditem');
			$dispatcher = RFactory::getDispatcher();
			$dispatcher->trigger('onAfterItemWatched', array($id));
		}

		$app->close();
	}

	/**
	 * function ajaxUnwatch
	 *
	 * @return  void
	 */
	public function ajaxUnwatch()
	{
		$app = RFactory::getApplication();

		$id = $app->input->getInt('id', 0);

		if ($id && is_numeric($id))
		{
			ReditemHelperWatch::unwatchItem((int) $id);
		}

		$app->close();
	}

	/**
	 * Method for report an item
	 *
	 * @return  void
	 */
	public function ajaxReport()
	{
		$app    = JFactory::getApplication();
		$user   = ReditemHelperSystem::getUser();
		$result = array('status' => 0);
		$itemId = $app->input->getInt('id', 0);
		$reason = $app->input->get('reason', '', 'html');

		if (!$itemId)
		{
			echo json_encode($result);
			$app->close();
		}

		// Does not allow guest rating
		if ($user->guest)
		{
			echo json_encode($result);
			$app->close();
		}

		// If user choose "other", get input from user
		if ($reason === 'other')
		{
			$reason = $app->input->get('reason_other', '', 'html');
		}

		$model = $this->getModel();

		if ($model->reportItem($itemId, $reason))
		{
			$result['status'] = 1;
			$result['reason'] = $reason;

			// Email after comment reported
			JPluginHelper::importPlugin('reditem');
			$dispatcher = RFactory::getDispatcher();
			$dispatcher->trigger('onAfterItemReported', array($itemId, $reason));
		}

		echo json_encode($result);
		$app->close();
	}

	/**
	 * Method for remove an report of item for this user
	 *
	 * @return  void
	 */
	public function ajaxRemoveReport()
	{
		$app    = JFactory::getApplication();
		$user   = ReditemHelperSystem::getUser();
		$result = array('status' => 0);
		$itemId = $app->input->getInt('id', 0);

		if (!$itemId)
		{
			echo json_encode($result);
			$app->close();
		}

		// Does not allow guest rating
		if ($user->guest)
		{
			echo json_encode($result);
			$app->close();
		}

		$model = $this->getModel();

		if ($model->unReportItem($itemId))
		{
			$result['status'] = 1;
		}

		echo json_encode($result);
		$app->close();
	}

	/**
	 * ajaxCropImage crop image ajax
	 *
	 * @return  void
	 */
	public function ajaxCropImage()
	{
		$result			= false;
		$app 			= RFactory::getApplication();
		$imageName 		= $app->input->getString('image_name');
		$top 			= $app->input->getInt('top');
		$left 			= $app->input->getInt('left');
		$width 			= $app->input->getInt('width');
		$height 		= $app->input->getInt('height');
		$previewWidth 	= $app->input->getInt('previewWidth');
		$previewHeight 	= $app->input->getInt('previewHeight');
		$path			= JPATH_ROOT . '/media/com_reditem/files/customfield/temporary/';

		if (JFile::exists($path . $imageName))
		{
			$result = ReditemHelperCropimage::cropImage($imageName, $path, $top, $left, $width, $height, $previewWidth, $previewHeight);
		}

		if ($result)
		{
			// Success
			echo '1';
		}
		else
		{
			// Fail
			echo '0';
		}

		$app->close();
	}
}
