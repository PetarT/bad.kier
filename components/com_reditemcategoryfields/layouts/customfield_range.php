<?php
/**
 * @package     RedITEM2
 * @subpackage  Layouts
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('JPATH_REDCORE') or die;

$tag	= $displayData['tag'];
$value	= $displayData['value'];
?>

<?php if (!empty($value)) : ?>
<span class="reditem_categoryfield_range reditem_categoryfield_range_<?php echo $tag->id; ?>">
	<?php echo $value; ?>
</span>
<?php endif; ?>
