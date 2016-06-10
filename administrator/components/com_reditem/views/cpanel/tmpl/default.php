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

<div class="container" id="reditem-cpanel">
	<?php foreach ($this->icons as $group): ?>
		<h3 class="text-error text-center"><?php echo $group['header']; ?></h3>
		<?php $icons = array_chunk($group['icons'], 6); ?>
		<?php foreach ($icons as $row) : ?>
			<div class="row-fluid">
			<?php foreach ($row as $icon) : ?>
				<?php $target = (isset($icon['newTab']) && $icon['newTab']) ? 'target="_blank"' : ''; ?>
				<div class="span2">
					<a href="<?php echo $icon['link']; ?>" <?php echo $target; ?> class="reditem-cpanel-icon-link">
						<div class="reditem-cpanel-icon-wrapper">
							<div class="reditem-cpanel-icon">
								<i class="<?php echo $icon['icon']; ?> icon-5x"></i>
							</div>
							<?php if (isset($icon['stat'])): ?>
								<span class="badge reditem-cpanel-count"><?php echo $icon['stat'] ?></span>
							<?php endif; ?>
						</div>
						<div class="reditem-cpanel-text">
							<?php echo $icon['text']; ?>
						</div>
					</a>
				</div>
			<?php endforeach; ?>
			</div>
		<?php endforeach; ?>
		<hr />
	<?php endforeach; ?>
</div>
