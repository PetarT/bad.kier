<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Template
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('_JEXEC') or die;

JHtml::_('rjquery.chosen', 'select');
JHtml::_('rbootstrap.tooltip');

?>
<script type="text/javascript">
	jQuery(document).ready(function()
	{
		<?php if ($this->item->id) : ?>
		jQuery('#jform_type_id').prop('disabled', true).trigger("liszt:updated").prop('disabled', false);
		jQuery('#jform_typecode').prop('disabled', true).trigger("liszt:updated").prop('disabled', false);
		<?php endif; ?>

		// Disable click function on btn-group
		jQuery(".btn-group").each(function(index){
			if (jQuery(this).hasClass('disabled'))
			{
				jQuery(this).find("label").off('click');
			}
		});
	});
</script>
<form enctype="multipart/form-data"
	action="index.php?option=com_reditem&task=template.edit&id=<?php echo $this->item->id; ?>"
	method="post" name="adminForm" class="form-validate form-horizontal" id="adminForm">
	<div class="row-fluid">
		<div class="span8">
			<div class="control-group">
				<div class="control-label">
					<?php echo $this->form->getLabel('type_id'); ?>
				</div>
				<div class="controls">
					<?php echo $this->form->getInput('type_id'); ?>
				</div>
			</div>
			<div class="control-group">
				<div class="control-label">
					<?php echo $this->form->getLabel('typecode'); ?>
				</div>
				<div class="controls">
					<?php echo $this->form->getInput('typecode'); ?>
				</div>
			</div>
			<div class="control-group">
				<div class="control-label">
					<?php echo $this->form->getLabel('name'); ?>
				</div>
				<div class="controls">
					<?php echo $this->form->getInput('name'); ?>
				</div>
			</div>
			<div class="control-group">
				<div class="control-label">
					<?php echo $this->form->getLabel('description'); ?>
				</div>
				<div class="controls">
					<?php echo $this->form->getInput('description'); ?>
				</div>
			</div>
			<div class="control-group">
				<div class="control-label">
					<?php echo $this->form->getLabel('published'); ?>
				</div>
				<div class="controls">
					<?php echo $this->form->getInput('published'); ?>
				</div>
			</div>
			<div class="control-group">
				<div class="control-label">
					<?php echo $this->form->getLabel('content'); ?>
				</div>
				<div class="controls">
					<?php echo $this->form->getInput('content'); ?>
				</div>
			</div>
		</div>
		<div class="span4">
			<div class='template_tags'>
			<?php if ($this->item->id) : ?>
				<?php
				switch ($this->item->typecode)
				{
					case 'view_archiveditems':
					case 'view_itemdetail':
					case 'module_items':
					case 'module_relateditems':
						echo $this->loadTemplate('items');
						break;

					case 'view_itemedit':
						echo $this->loadTemplate('itemedit');
						break;

					case 'view_search':
						echo $this->loadTemplate('search');
						break;

					case 'view_categorydetail':
						echo $this->loadTemplate('category');
						break;

					case 'view_categorydetailgmap':
						echo $this->loadTemplate('categorygmap');
						break;

					case "watchitem_watch":
					case "watchitem_edit":
					case "watchitem_delete":
						echo $this->loadTemplate('watched');
						break;

					case "watchitem_rate":
						echo $this->loadTemplate('watched_rate');
						break;

					case 'watchitem_comment':
						echo $this->loadTemplate('watched_comment');
						break;

					case 'module_search':
						echo $this->loadTemplate('search_module');
						break;

					default:
						break;
				}
				?>
			<?php else : ?>
				<div class="alert alert-info">
					<p><?php echo JText::_('COM_REDITEM_TEMPLATE_TAG_NOTICE_SAVE_TEMPLATE_FIRST'); ?></p>
				</div>
			<?php endif; ?>
			</div>
		</div>
	</div>
	<?php echo $this->form->getInput('id'); ?>
	<input type="hidden" name="task" value="" />
	<?php echo JHtml::_('form.token'); ?>
</form>
