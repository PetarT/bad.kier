<?php
/**
 * @package     RedITEM
 * @subpackage  Layouts
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('JPATH_REDCORE') or die;

RHelperAsset::load('reditem.backend.min.css', 'com_reditem');

// Run plugin event
JPluginHelper::importPlugin('reditem_quickicon');
$dispatcher = RFactory::getDispatcher();
$icons = $dispatcher->trigger('getSidebarIcons');

$option = JFactory::getApplication()->input->get('option', '');
$component = JFactory::getApplication()->input->get('component', '');
$active = null;

if (isset($displayData['active']))
{
	$active = $displayData['active'];
}
?>
<script type="text/javascript">
	(function($){
		$(document).ready(function(){
			$('.reditem-sidebar .reditem-sidebar-item.active').parent().parent().addClass('in');
		});
	})(jQuery);
</script>

<?php if (!empty($icons)): ?>
<div class="accordion reditem-sidebar" id="reditemSideBarAccordion">
	<?php $index = 0; ?>
	<?php foreach ($icons as $group): ?>
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#reditemSideBarAccordion" href="#collapse<?php echo $index ?>">
				<?php echo $group['header'] ?>
			</a>
		</div>
		<div id="collapse<?php echo $index ?>" class="accordion-body collapse">
			<?php if (!empty($group['icons'])): ?>
				<ul class="nav nav-tabs nav-stacked">
				<?php foreach ($group['icons'] as $icon): ?>
					<?php $class = ''; ?>
					<?php if ((($icon['view'] == 'configuration') && ($component == $group['option']))
										|| (($active === $icon['view']) && ($group['option'] == $option))): ?>
						<?php $class = 'active'; ?>
					<?php endif; ?>
					<li class="reditem-sidebar-item <?php echo $class ?>">
						<a href="<?php echo $icon['link'] ?>">
							<i class="<?php echo $icon['icon'] ?>"></i>
							<?php echo $icon['text'] ?>
						</a>
					</li>
				<?php endforeach; ?>
				</ul>
			<?php endif; ?>
		</div>
	</div>
	<?php $index++; ?>
	<?php endforeach; ?>
</div>
<?php endif; ?>
