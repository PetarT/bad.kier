<?php
/**
 * @package     RedITEM.Libraries
 * @subpackage  Customfield
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */

defined('_JEXEC') or die;

/**
 * RedITEM Customfield generic class
 *
 * @package     RedITEM.Libraries
 * @subpackage  Helpers.Customfield
 * @since       2.1.13
 *
 */
class ReditemHelperCustomfield
{
	/**
	 * Method to return a custom field object according to type
	 *
	 * @param   string  $type  Type of field. Default is "Textbox"
	 *
	 * @return  object         Object class of field
	 */
	public static function getCustomField($type)
	{
		if (empty($type))
		{
			$type = 'Text';
		}

		$className = 'ReditemCustomfield' . ucfirst($type);
		$class = new $className;

		return $class;
	}

	/**
	 * Checks if string is in JSON format and decodes it.
	 *
	 * @param   string  $string  String for checking.
	 *
	 * @return  mixed  json_decode result if string is in JSON format, false otherwise.
	 */
	public static function isJsonValue($string)
	{
		$temp = json_decode($string);

		if (phpversion() > '5.3.0')
		{
			return (json_last_error() == JSON_ERROR_NONE) ? $temp : false;
		}
		else
		{
			return ((is_string($string) && (is_object($temp) || is_array($temp)))) ? $temp : false;
		}
	}

	/**
	 * Convert date format from php/jQuery datepicker to jQuery datepicker/php.
	 *
	 * @param   string  $format  Format for convert.
	 * @param   string  $to      To which format (php/jquery).
	 *
	 * @return  string  Date format.
	 */
	public static function convertDateFormat($format, $to)
	{
		$jquery = array(
			// Day
			'd' => 'dd',
			'D' => 'D',
			'j' => 'd',
			'l' => 'DD',
			'N' => '',
			'S' => '',
			'w' => '',
			'z' => 'o',
			// Week
			'W' => '',
			// Month
			'F' => 'MM',
			'm' => 'mm',
			'M' => 'M',
			'n' => 'm',
			't' => '',
			// Year
			'L' => '',
			'o' => '',
			'Y' => 'yy',
			'y' => 'y',
			// Time
			'a' => '',
			'A' => '',
			'B' => '',
			'g' => '',
			'G' => '',
			'h' => '',
			'H' => '',
			'i' => '',
			's' => '',
			'u' => ''
		);

		$php = array(
			'dd' => 'd',
			'DD' => 'D',
			'D'  => 'D',
			'd'  => 'd',
			'c'  => 'z',
			// Month
			'MM' => 'M',
			'mm' => 'm',
			'M'  => 'M',
			'm'  => 'm',
			// Year
			'yy' => 'Y',
			'y'  => 'y'
		);

		if ($to == 'php')
		{
			$format = str_replace(array_keys($php), array_values($php), $format);
		}
		elseif ($to == 'jquery')
		{
			$format = str_replace(array_keys($jquery), array_values($jquery), $format);
		}

		return $format;
	}

	/**
	 * Method to get custom field's filters in backend
	 *
	 * @return  array
	 */
	public static function getFieldFilters()
	{
		$fieldsModel = RModel::getAdminInstance('Fields', array('ignore_request' => true), 'com_reditem');
		$fieldsModel->setState('filter.backendFilter', 1);
		$fieldFilters = $fieldsModel->getItems();

		return $fieldFilters;
	}

	/**
	 * Method to get available fields based on view_itemdetail template
	 *
	 * @param   string  $template  Template content
	 * @param   array   $fields    List of all custom fields
	 *
	 * @return  mixed
	 */
	public static function getAvailableFields($template, $fields)
	{
		if (empty($template) || empty($fields))
		{
			return false;
		}

		$available = array();

		foreach ($fields as $k => $field)
		{
			$fc = $field->fieldcode;

			if (preg_match("/{+$fc+_value[^}]*}/i", $template, $matches) > 0)
			{
				$available[] = $field;
			}
		}

		return $available;
	}

	/**
	 * Function for getting list of possible fields to use
	 *
	 * @param   string  $fieldType  Field type to use for getting fields list.
	 * @param   array   $fields     Fields array to search in.
	 *
	 * @return  array  Array of possible convert fields.
	 */
	public static function getPossibleConvertFields($fieldType, $fields)
	{
		$fieldsByFieldType = array();
		$result            = array();

		foreach ($fields as $field)
		{
			if (!isset($fieldsByFieldType[$field->type]))
			{
				$fieldsByFieldType[$field->type] = array($field);
			}
			else
			{
				$fieldsByFieldType[$field->type][] = $field;
			}
		}

		/**
		 * We will do 1 to 1 fields convert for now.
		 * Later on, we can expand this and support convert
		 * between different field types.
		 */
		switch ($fieldType)
		{
			case 'addresssuggestion':
			case 'checkbox':
			case 'color':
			case 'date':
			case 'daterange':
			case 'editor':
			case 'file':
			case 'gallery':
			case 'googlemaps':
			case 'image':
			case 'itemfromtype':
			case 'itemfromtypes':
			case 'multitextarea':
			case 'number':
			case 'radio':
			case 'range':
			case 'select':
			case 'tasklist':
			case 'text':
			case 'textarea':
			case 'url':
			case 'user':
			case 'youtube':
				if (isset($fieldsByFieldType[$fieldType]))
				{
					$result = $fieldsByFieldType[$fieldType];
				}

				break;
			default:
				break;
		}

		return $result;
	}
}
