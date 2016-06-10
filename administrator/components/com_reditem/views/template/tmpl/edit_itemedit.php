<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Template
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('_JEXEC') or die;
?>
<div class="accordion" id="accordion_tag_default">
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion_tag_default" href="#collapseOne">
				<?php echo JText::_('COM_REDITEM_TEMPLATE_TAG_REQUIRED_VIEW_ITEM_EDIT'); ?>
			</a>
		</div>
		<div id="collapseOne" class="accordion-body collapse in">
			<div class="accordion-inner">
				<ul>
				<?php foreach ($this->requriedTags as $tag => $tagDesc) : ?>
					<li><span><?php echo $tag; ?></span> <?php echo $tagDesc; ?></li>
				<?php endforeach; ?>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="accordion" id="accordion_tag_default">
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion_tag_default" href="#collapseTwo">
				<?php echo JText::_('COM_REDITEM_TEMPLATE_TAG_DEFAULT_VIEW_ITEM_EDIT'); ?>
			</a>
		</div>
		<div id="collapseTwo" class="accordion-body collapse in">
			<div class="accordion-inner">
				<ul>
					<?php foreach ($this->itemTags as $tag => $tagDesc) : ?>
						<li><span><?php echo $tag; ?></span> <?php echo $tagDesc; ?></li>
					<?php endforeach; ?>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="accordion" id="accordion_tag_extra">
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion_tag_extra" href="#collapseThree">
				<?php echo JText::_('COM_REDITEM_TEMPLATE_TAG_EXTRA'); ?>
			</a>
		</div>
		<div id="collapseThree" class="accordion-body collapse in">
			<div class="accordion-inner">
				<ul>
				<?php foreach ($this->extraTags as $tag => $tagDesc) : ?>
					<li><span><?php echo $tag; ?></span> <?php echo $tagDesc; ?></li>
				<?php endforeach; ?>
				</ul>
			</div>
		</div>
	</div>
</div>