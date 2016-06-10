<?php
/**
 * @package     RedITEM.Libraries
 * @subpackage  Helper
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('JPATH_BASE') or die;

/**
 * Tags helper
 *
 * @package     RedITEM.Libraries
 * @subpackage  Helper.Helper
 * @since       2.1.5
 *
 */
class ReditemHelperMail
{
	/**
	 * Method to get mail section name from section code
	 *
	 * @param   string  $section  Section code
	 *
	 * @return  string
	 */
	public static function getMailSectionName($section)
	{
		$key = 'COM_REDITEM_MAIL_SECTION_' . JString::strtoupper($section);

		return $key;
	}

	/**
	 * Method to get email template by section
	 *
	 * @param   string  $type  	  Type Id
	 * @param   string  $section  Section code
	 *
	 * @return  mixed
	 */
	public static function getMailTemplate($type, $section)
	{
		$section = JString::trim($section);
		$model = RModel::getAdminInstance('Mails', array('ignore_request' => true), 'com_reditem');
		$model->setState('filter.published', 1);
		$model->setState('filter.section', $section);
		$model->setState('filter.default', 1);

		if (isset($type) && !empty($type))
		{
			$model->setState('filter.filter_types', $type);
		}

		$templates = $model->getItems();

		if (!$templates)
		{
			// If there are not default template has been set. Get all templates in this section and get first template.
			$model->setState('filter.default', null);
			$query = $model->getListQuery();

			$db = JFactory::getDbo();
			$db->setQuery($query);
			$tmpTemplates = $db->loadObjectList();

			if (empty($tmpTemplates))
			{
				return false;
			}

			$templates = $tmpTemplates;
		}

		return $templates[0];
	}

	/**
	 * Method to replace all mail tags in template
	 *
	 * @param   string  &$content  Template Content
	 * @param   array   $data      Replaced Data
	 * @param   string  $section   Mail section
	 *
	 * @return  mixed
	 */
	public static function replaceTags(&$content, $data, $section)
	{
		if (empty($content) || empty($data))
		{
			return false;
		}

		// Replace tag for item
		if (isset($data['item']))
		{
			ReditemHelperItem::replaceTag($content, $data['item']);
			ReditemHelperItem::replaceCustomfieldsTag($content, $data['item']);
		}

		// Replace tag for comment
		if (isset($data['comment']))
		{
			ReditemHelperTags::tagReplaceComment($content, $data['comment']);
		}

		// Replace tag for user
		if (isset($data['user']))
		{
			self::tagReplaceUser($content, $data['user']);
		}

		if (isset($data['commentator']))
		{
			self::tagReplaceUser($content, $data['commentator'], 'commentator');
		}

		// Replace extra tags
		if (isset($data['extra']))
		{
			self::replaceExtraTags($content, $data['extra']);
		}

		// Replace common tags
		self::tagReplaceCommon($content);

		// Convert all image paths to absolute
		$content = str_replace('src="images', 'src="' . JURi::root() . 'images', $content);
		$content = str_replace("url('images/", "url('" . JURi::root() . "images/", $content);
		$content = str_replace('url("images/', 'url("' . JURi::root() . 'images/', $content);

		// Load more sections from plugins
		$dispatcher	= RFactory::getDispatcher();
		JPluginHelper::importPlugin('reditem');

		$dispatcher->trigger('onAfterMailReplaceTags', array(&$content, $data, $section));

		return true;
	}

	/**
	 * Method to replace extra tags
	 *
	 * @param   string  &$content  Template Content
	 * @param   array   $extra     Replaced Data
	 *
	 * @return  mixed
	 */
	public static function replaceExtraTags(&$content, $extra)
	{
		// Checking content & data
		if (empty($content) || empty($extra))
		{
			return false;
		}

		// Replace {report_reason} in item report
		$reportHtml = '';

		if (isset($extra->report_reason) && !empty($extra->report_reason))
		{
			$reportHtml = $extra->report_reason;
		}

		$content = str_replace('{report_reason}', $reportHtml, $content);

		// Replace {item_active_days}
		$itemActiveDaysHtml = '';

		if (isset($extra->item_active_days) && !empty($extra->item_active_days))
		{
			$itemActiveDaysHtml = $extra->item_active_days;
		}

		$content = str_replace('{item_active_days}', $itemActiveDaysHtml, $content);

		// Replace {item_rating_point}
		$itemRatingPointHtml = '';

		if (isset($extra->item_rating_point) && !empty($extra->item_rating_point))
		{
			$itemRatingPointHtml = $extra->item_rating_point;
		}

		$content = str_replace('{item_rating_point}', $itemRatingPointHtml, $content);

		// Replace {user_activation}
		$userActivationHtml = '';

		if (isset($extra->user_activation) && !empty($extra->user_activation))
		{
			$userActivationHtml = $extra->user_activation;
		}

		$content = str_replace('{user_activation}', $userActivationHtml, $content);

		// Replace {user_reactivation}
		$userReactivationHtml = '';

		if (isset($extra->user_reactivation) && !empty($extra->user_reactivation))
		{
			$userReactivationHtml = $extra->user_reactivation;
		}

		$content = str_replace('{user_reactivation}', $userReactivationHtml, $content);

		// Replace category tags
		if (isset($extra->category) && !empty($extra->category))
		{
			ReditemHelperCategorytags::replaceTag($content, $extra->category);
		}

		return true;
	}

	/**
	 * Method to prepare email before send to notify user
	 *
	 * @param   array   $recipientUser  JUser object of recipient
	 * @param   string  $section        Section Code
	 * @param   array   $data           Mail Data
	 * @param   int     $type           Type Id
	 *
	 * @return  boolean
	 */
	public static function send($recipientUser, $section, $data, $type='')
	{
		if (empty($recipientUser) || empty($section) || empty($data))
		{
			return false;
		}

		// Get mail template
		$template = self::getMailTemplate($type, $section);

		if (!$template)
		{
			$app = JFactory::getApplication();
			$sectionName = JText::_(self::getMailSectionName($section));
			$msg = JText::sprintf('COM_REDITEM_MAIL_SECTION_ERROR_MISSING_DEFAULT_TEMPLATE_FOR_SESSION', $sectionName);
			$app->enqueueMessage($msg, 'error');

			return false;
		}

		$subject = $template->subject;
		$body    = $template->content;

		// Handle Twig
		if (JPluginHelper::isEnabled('system', 'twig'))
		{
			if (!empty($data['item']))
			{
				$item = $data['item'];
				$cfValues = ReditemHelperItem::getCustomFieldValues($item->id);
				$item->customfield_values = array();

				if (isset($cfValues[$item->type_id][$item->id]))
				{
					$item->customfield_values = $cfValues[$item->type_id][$item->id];
				}

				// Get customfields
				$fields = array();

				foreach ($item->customfield_values as $key => $value)
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
					array(
						$section . '-template.html' => $body
					)
				);
				$twig = new Twig_Environment($loader);
				$body = $twig->render(
					$section . '-template.html',
					array(
						'fields' => $fields
					)
				);
			}
		}

		// Replace tags
		self::replaceTags($body, $data, $section);

		if (empty($body))
		{
			return false;
		}

		$userNotifications = self::getNotifications($recipientUser->id);

		// Check on Mail Setting about how to get notification
		if (empty($userNotifications->type))
		{
			// Send immediately
			$recipient = array($recipientUser->email, $recipientUser->name);

			return self::sendMail($subject, $body, $recipient);
		}

		// Put in mail queue
		return self::mailQueue($section, $subject, $body, $recipientUser);
	}

	/**
	 * Method for send mail
	 *
	 * @param   string  $subject    Mail subject
	 * @param   string  $body       HTML code of mail body
	 * @param   array   $recipient  Array data of recipient array('email', 'name')
	 *
	 * @return  boolean  True on success. False otherwise.
	 */
	public static function sendMail($subject, $body, $recipient)
	{
		if (empty($recipient))
		{
			return false;
		}

		$mailer = RFactory::getMailer();
		$config = RFactory::getConfig();

		$sender = array(
			$config->get('mailfrom', null, ''),
			$config->get('fromname', null, '')
		);

		$mailer->isHTML(true);
		$mailer->setSubject($subject);
		$mailer->setSender($sender);
		$mailer->setBody($body);
		$mailer->addRecipient($recipient[0], $recipient[1]);
		$sent = $mailer->Send();

		return $sent;
	}

	/**
	 * Method for put mail in queue of user
	 *
	 * @param   string  $section    Mail section
	 * @param   string  $subject    Mail subject
	 * @param   string  $body       HTML code of mail body
	 * @param   object  $recipient  JUser object of recipient user
	 *
	 * @return  boolean             True on success. False otherwise.
	 */
	public static function mailQueue($section, $subject, $body, $recipient)
	{
		if (empty($section) || empty($subject) || empty($body) || empty($recipient))
		{
			return false;
		}

		$db    = RFactory::getDbo();
		$today = ReditemHelperSystem::getDateWithTimezone();

		$columns = array('section', 'subject', 'body', 'recipient', 'created');
		$values  = array(
			$db->quote($section),
			$db->quote($subject),
			$db->quote($body),
			$db->quote($recipient->id),
			$db->quote($today->toSQL())
		);

		$query = $db->getQuery(true)
			->insert($db->qn('#__reditem_mail_queue'))
			->columns($db->qn($columns))
			->values(implode(',', $values));
		$db->setQuery($query);

		return $db->execute();
	}

	/**
	 * Replace tag on content of template
	 *
	 * @param   string  &$content  Content template
	 * @param   object  $user      Item data object
	 * @param   string  $prefix    Prefix of tag
	 *
	 * @return  boolean            True on success. False otherwise.
	 */
	public static function tagReplaceUser(&$content, $user, $prefix = 'user')
	{
		// Check if content is empty or comment object is null
		if (empty($content) || empty($user))
		{
			return false;
		}

		$tags = array(
			'{' . $prefix . '_id}',
			'{' . $prefix . '_name}',
			'{' . $prefix . '_account}',
			'{' . $prefix . '_email}',
			'{' . $prefix . '_registerdate}',
			'{' . $prefix . '_lastvisiteddate}'
		);

		if ($user->guest)
		{
			$content = str_replace($tags, '', $content);

			return true;
		}

		$content = str_replace('{' . $prefix . '_id}', $user->id, $content);
		$content = str_replace('{' . $prefix . '_name}', $user->name, $content);
		$content = str_replace('{' . $prefix . '_account}', $user->username, $content);
		$content = str_replace('{' . $prefix . '_email}', $user->email, $content);
		$content = str_replace('{' . $prefix . '_registerdate}', $user->registerDate, $content);
		$content = str_replace('{' . $prefix . '_lastvisiteddate}', $user->lastvisitDate, $content);

		return true;
	}

	/**
	 * Method for replace sender tags
	 *
	 * @param   string  &$content  Mail content template
	 *
	 * @return  boolean            True on success. False otherwise.
	 */
	public static function tagReplaceCommon(&$content)
	{
		if (empty($content))
		{
			return false;
		}

		$config      = RFactory::getConfig();
		$senderEmail = $config->get('mailfrom', null, '');
		$senderName  = $config->get('fromname', null, '');
		$siteName    = $config->get('sitename', null, '');
		$siteUrl     = JURi::root();

		$content     = str_replace('{sender_name}', $senderName, $content);
		$content     = str_replace('{sender_mail}', $senderEmail, $content);
		$content     = str_replace('{sender_sitename}', $siteName, $content);
		$content     = str_replace('{sender_siteurl}', $siteUrl, $content);

		// Replace {mail_created} tag
		$matches = array();

		if (preg_match_all('/{mail_created[^}]*}/i', $content, $matches) > 0)
		{
			$matches = $matches[0];

			if (!empty($matches))
			{
				// Default format for display Created date
				$defaultDateFormat = 'd-m-Y H:i:s';

				foreach ($matches as $match)
				{
					$tagString = str_replace(array('{', '}'), '', $match);
					$tagString = explode('|', $tagString);
					$itemCreatedDate = ReditemHelperSystem::getDateWithTimezone();
					$dateFormat = $defaultDateFormat;

					if (isset($tagString[1]))
					{
						$dateFormat = (string) $tagString[1];
					}

					$content = str_replace($match, ucfirst($itemCreatedDate->format($dateFormat, true)), $content);

					unset($itemCreatedDate);
				}
			}
		}

		return true;
	}

	/**
	 * Method for get available tags on email
	 *
	 * @param   int  $typeId  ID of type
	 *
	 * @return  array  List of available tags
	 */
	public static function getAvailableItemTags($typeId)
	{
		$typeId = (int) $typeId;

		$itemTags = ReditemHelperHelper::getItemTags($typeId);

		// Unset some not neccessary tags
		unset($itemTags['{item_comments}']);
		unset($itemTags['{item_comment_form}']);
		unset($itemTags['{item_rating}']);
		unset($itemTags['{item_report}']);
		unset($itemTags['{item_watching}']);
		unset($itemTags['{item_sharing}']);

		return $itemTags;
	}

	/**
	 * Method for get all available tags for User
	 *
	 * @param   string  $prefix  Prefix of tag. Default is "user"
	 *
	 * @return  array  List of available tags of user
	 */
	public static function getUserTags($prefix = 'user')
	{
		$userTags = array(
			'{' . $prefix . '_id}'              => JText::_('COM_REDITEM_MAIL_TAG_USER_ID'),
			'{' . $prefix . '_name}'            => JText::_('COM_REDITEM_MAIL_TAG_USER_NAME'),
			'{' . $prefix . '_account}'         => JText::_('COM_REDITEM_MAIL_TAG_USER_ACCOUNT'),
			'{' . $prefix . '_email}'           => JText::_('COM_REDITEM_MAIL_TAG_USER_MAIL'),
			'{' . $prefix . '_registerdate}'    => JText::_('COM_REDITEM_MAIL_TAG_USER_REGISTER_DATE'),
			'{' . $prefix . '_lastvisiteddate}' => JText::_('COM_REDITEM_MAIL_TAG_USER_LAST_VISIT_DATE')
		);

		return $userTags;
	}

	/**
	 * Method for get all available common tags
	 *
	 * @return  array
	 */
	public static function getCommonTags()
	{
		$userTags = array(
			'{sender_name}' => JText::_('COM_REDITEM_MAIL_TAG_SENDER_NAME'),
			'{sender_mail}' => JText::_('COM_REDITEM_MAIL_TAG_SENDER_MAIL'),
			'{sender_sitename}' => JText::_('COM_REDITEM_MAIL_TAG_SENDER_SITENAME'),
			'{sender_siteurl}' => JText::_('COM_REDITEM_MAIL_TAG_SENDER_SITEURL'),
			'{unsubscribe}' => JText::_('COM_REDITEM_MAIL_TAG_COMMON_UNSUBSCRIBE'),
			'{mail_created|<em>dateFormat</em>}' => JText::_('COM_REDITEM_MAIL_TAG_COMMON_MAIL_CREATED'),
		);

		return $userTags;
	}

	/**
	 * Method for get all available tags for Comment
	 *
	 * @return  array  List of available tags of comment
	 */
	public static function getCommentTags()
	{
		$userTags = array(
			'{comment_comment}' => JText::_('COM_REDITEM_MAIL_TAG_COMMENT_DATE_COMMENT')
		);

		return $userTags;
	}

	/**
	 * Method to save notification settings
	 *
	 * @param   array  $data   Settings
	 * @param   bool   $isNew  If true, set all setings to yes
	 *
	 * @return  boolean
	 */
	public static function saveNotifications($data, $isNew = false)
	{
		$db    = RFactory::getDbo();
		$user   = ReditemHelperSystem::getUser();
		$query = $db->getQuery(true);

		if ($user->guest && !$isNew)
		{
			return false;
		}

		$settings = '';
		$userId = (int) $user->id;
		$frequency = (int) $data['frequency'];
		$secret = JApplication::getHash(JUserHelper::genRandomPassword());

		if (isset($data['user_id']) && !empty($data['user_id']))
		{
			$userId = (int) $data['user_id'];
		}
		// Clear settings before save
		$query->delete($db->qn('#__reditem_mail_settings'))->where($db->qn('user_id') . '=' . (int) $userId);
		$db->setQuery($query);
		$db->execute();

		if (!empty($data['settings']))
		{
			$settings = $data['settings'];
		}
		elseif ($isNew)
		{
			// Get all available settings
			$groups = self::getPredefinedSettings();

			$settings = array();

			foreach ($groups as $group)
			{
				foreach ($group->settings as $key => $val)
				{
					$settings[$key] = 1;
				}
			}
		}

		// Convert to JRegistry object
		$settings = new JRegistry($settings);

		// Saving new settings
		$columns = array(
			$db->qn('user_id'),
			$db->qn('type'),
			$db->qn('secret'),
			$db->qn('params'),
		);

		$values = array(
			$userId,
			$frequency,
			$db->q($secret),
			$db->q($settings->toString()),
		);

		$query->clear()
			->insert($db->qn('#__reditem_mail_settings'))
			->columns($columns)
			->values(implode(',', $values));
		$db->setQuery($query);
		$db->execute();

		return true;
	}

	/**
	 * Method to get user notification settings
	 *
	 * @param   int  $userId  User Id
	 *
	 * @return  mixed
	 */
	public static function getNotifications($userId = null)
	{
		$db    = RFactory::getDbo();
		$query = $db->getQuery(true);
		$user  = array();

		if (!isset($userId))
		{
			$user = ReditemHelperSystem::getUser();
		}
		else
		{
			$user = new JUser($userId);
		}

		// If user is guest, return this object
		if ($user->guest)
		{
			return false;
		}

		$query->select('a.*')
			->from($db->qn('#__reditem_mail_settings', 'a'))
			->where($db->qn('user_id') . '=' . (int) $user->id);
		$db->setQuery($query);
		$result = $db->loadObject();

		if ($result)
		{
			if (empty($result->type))
			{
				$result->type = 0;
			}

			if (!empty($result->params))
			{
				$result->params = json_decode($result->params);
			}
		}

		return $result;
	}

	/**
	 * Get predefined user mail settings
	 *
	 * @return  mixed
	 */
	public static function getPredefinedSettings()
	{
		$settings = array();

		$group = new stdClass;
		$group->name = JText::_('COM_REDITEM_MAIL_SETTINGS_ITEMS');
		$group->settings = array(
			'item_reported'            => JText::_('COM_REDITEM_MAIL_SECTION_ITEM_REPORTED'),
			'item_removed_by_expired'  => JText::_('COM_REDITEM_MAIL_SECTION_ITEM_REMOVED_BY_EXPIRED'),
			'item_self_removed'        => JText::_('COM_REDITEM_MAIL_SECTION_ITEM_SELF_REMOVED'),
			'item_removed_by_reported' => JText::_('COM_REDITEM_MAIL_SECTION_ITEM_REMOVED_BY_REPORTED'),
			'get_item_rating'          => JText::_('COM_REDITEM_MAIL_SECTION_GET_ITEM_RATING'),
		);
		$settings[] = $group;

		$group = new stdClass;
		$group->name = JText::_('COM_REDITEM_MAIL_SETTINGS_COMMENTS');
		$group->settings = array(
			'get_item_comment'            => JText::_('COM_REDITEM_MAIL_SECTION_GET_ITEM_COMMENT'),
			'get_private_comment'         => JText::_('COM_REDITEM_MAIL_SECTION_GET_PRIVATE_COMMENT'),
			'comment_self_removed'        => JText::_('COM_REDITEM_MAIL_SECTION_COMMENT_SELF_REMOVED'),
			'comment_reported'            => JText::_('COM_REDITEM_MAIL_SECTION_COMMENT_REPORTED'),
			'comment_removed_by_reported' => JText::_('COM_REDITEM_MAIL_SECTION_GET_ITEM_COMMENT_REPLY'),
			'get_item_comment_reply'      => JText::_('COM_REDITEM_MAIL_SECTION_COMMENT_REMOVED_BY_REPORTED'),
		);
		$settings[] = $group;

		// Load more predefined settings from plugins
		$dispatcher	= RFactory::getDispatcher();
		JPluginHelper::importPlugin('reditem');
		$reponse = (array) $dispatcher->trigger('OnPreparePredefinedSettings');

		if (count($reponse))
		{
			foreach ($reponse as $group)
			{
				$settings[] = $group;
			}
		}

		return $settings;
	}

	/**
	 * Method to check user settings before sending email
	 *
	 * @param   int     $userId   User Id
	 * @param   string  $section  Mail section code to check
	 *
	 * @return  boolean
	 */
	public static function canGetMail($userId, $section)
	{
		$settings = self::getNotifications($userId);

		if (empty($settings))
		{
			return false;
		}

		if (isset($settings->params->$section) && $settings->params->$section == 1)
		{
			return true;
		}

		return false;
	}
}
