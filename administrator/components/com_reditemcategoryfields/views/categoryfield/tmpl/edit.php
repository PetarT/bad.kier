<?php
/**
 * @package     RedITEMCategoryFields.Backend
 * @subpackage  Field
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('_JEXEC') or die;

JHtml::_('rjquery.chosen', 'select');
RHelperAsset::load('reditem.backend.min.css', 'com_reditem');

$isNew = true;

if ($this->item->id)
{
	$isNew = false;
}

?>
<script type="text/javascript">
	function showHideOptions()
	{
		if ((jQuery('#jform_type').val() == 'select') || (jQuery('#jform_type').val() == 'radio') || (jQuery('#jform_type').val() == 'checkbox'))
		{
			jQuery('#options_div').removeClass('hidden');
		}
		else
		{
			jQuery('#options_div').addClass('hidden');
		}
		// Clear data of options
		jQuery('#jform_options').val('');
	}

	<?php
	if (!$isNew)
	{
	?>
	jQuery(document).ready(function()
	{
		jQuery('#jform_fieldcode').attr('readonly', true);
		jQuery('#jform_type_id').attr('readonly', true);
		<?php
		if (($this->form->getValue('type') == 'select') || ($this->form->getValue('type') == 'radio') || ($this->form->getValue('type') == 'checkbox'))
		{
		?>
		jQuery('#options_div').removeClass('hidden');
		<?php
		}
		?>
	});
	<?php
	}
	?>
</script>

<form enctype="multipart/form-data"
	action="index.php?option=com_reditemcategoryfields&task=field.edit&id=<?php echo $this->item->id; ?>"
	method="post" name="adminForm" class="form-validate form-horizontal" id="adminForm">
	<div class="row-fluid">
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
				<?php echo $this->form->getLabel('name'); ?>
			</div>
			<div class="controls">
				<?php echo $this->form->getInput('name'); ?>
			</div>
		</div>
		<div class="control-group">
			<div class="control-label">
				<?php echo $this->form->getLabel('type'); ?>
			</div>
			<div class="controls">
				<?php echo $this->form->getInput('type'); ?>
			</div>
		</div>
		<div class="control-group hidden" id="options_div">
			<div class="control-label">
				<?php echo $this->form->getLabel('options'); ?>
			</div>
			<div class="controls">
				<?php echo $this->form->getInput('options'); ?>
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
	</div>
	<?php echo $this->form->getInput('id'); ?>
	<?php echo $this->form->getInput('fieldcode'); ?>
	<input type="hidden" name="task" value="" />
	<?php echo JHtml::_('form.token'); ?>
</form>
