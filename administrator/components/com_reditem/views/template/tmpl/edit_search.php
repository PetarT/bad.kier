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
<div class="accordion" id="accordion_tag_filter">
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion_tag_filter" href="#collapseTwo">
				<?php echo JText::_('COM_REDITEM_TEMPLATE_TAG_VIEW_SEARCH_FILTER'); ?>
			</a>
		</div>
		<div id="collapseTwo" class="accordion-body collapse in">
			<div class="accordion-inner">
				<ul>
				<?php foreach ($this->filterSearchTags as $tag => $tagDesc) : ?>
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
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion_tag_default" href="#collapseOne">
				<?php echo JText::_('COM_REDITEM_TEMPLATE_TAG_SEARCH_VIEW'); ?>
			</a>
		</div>
		<div id="collapseOne" class="accordion-body collapse in">
			<div class="accordion-inner">
				<ul>
				<?php foreach ($this->searchTags as $tag => $tagDesc) : ?>
					<li>
					<?php if (is_array($tagDesc)) : ?>
						<ul>
						<?php foreach ($tagDesc as $subTag => $subTagDesc) : ?>
							<li><span><?php echo $subTag; ?></span><?php echo $subTagDesc; ?></li>
						<?php endforeach; ?>
						</ul>
					<?php else : ?>
						<span><?php echo $tag; ?></span><?php echo $tagDesc; ?>
					<?php endif; ?>
					</li>
				<?php endforeach; ?>
				</ul>
			</div>
		</div>
	</div>
</div>