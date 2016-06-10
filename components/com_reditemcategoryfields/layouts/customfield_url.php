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

<?php if (!empty($value['link'])) : ?>
<span class="reditem_categoryfield_url reditem_categoryfield_url_<?php echo $tag->id; ?>">
	<a href="<?php echo $value['link']; ?>" title="<?php echo $value['title']; ?>"><?php echo $value['title']; ?></a>
</span>
<?php endif; ?>
