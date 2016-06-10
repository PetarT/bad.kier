<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Field
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('_JEXEC') or die;

JLoader::import('joomla.form.formfield');
JFormHelper::loadFieldClass('list');

/**
 * RedITEM comments list
 *
 * @package     RedITEM.Backend
 * @subpackage  Field.redcomments
 *
 * @since       2.0
 */
class JFormFieldRedComments extends JFormFieldList
{
	/**
	 * The form field type.
	 *
	 * @var		string
	 */
	protected $type = 'RedComments';

	/**
	 * Method to get the field options.
	 *
	 * @return  array  Options to populate the select field
	 */
	public function getOptions()
	{
		$app = JFactory::getApplication();
		$db = JFactory::getDbo();
		$options = array();
		$excludeComment = 0;

		$options = parent::getOptions();

		$excludeComment = $app->getUserState('com_reditem.global.commentId', 0);
		$query = $db->getQuery(true)
			->select('c.id, c.comment, u.name as user_name, i.title as item_title')
			->from($db->qn('#__reditem_comments', 'c'))
			->innerJoin($db->qn('#__users', 'u') . ' ON ' . $db->qn('u.id') . ' = ' . $db->qn('c.user_id'))
			->innerJoin($db->qn('#__reditem_items', 'i') . ' ON ' . $db->qn('i.id') . ' = ' . $db->qn('c.item_id'))
			->order($db->qn('c.id') . ' ASC');

		if ($excludeComment)
		{
			$query->where($db->qn('c.id') . ' <> ' . (int) $excludeComment);
		}

		$db->setQuery($query);
		$comments = $db->loadObjectList();

		if (!empty($comments))
		{
			foreach ($comments as $comment)
			{
				$title = '"' . JHTML::_('string.truncate', strip_tags($comment->comment), 50, true, false) . '..."';
				$title = '[' . $comment->item_title . '] ' . $comment->user_name . ': ' . $title;
				$options[] = JHtml::_('select.option', $comment->id, $title);
			}
		}

		return $options;
	}
}
