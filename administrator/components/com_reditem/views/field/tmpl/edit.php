<?php
/**
 * @package     RedITEM.Backend
 * @subpackage  Field
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('_JEXEC') or die;

JHtml::_('rjquery.chosen', 'select');
JHTML::_('behavior.formvalidation');
JHtml::_('rbootstrap.tooltip', '.hasTooltip', array('placement' => 'right'));

$optionAvailable        = explode(',', $this->form->getFieldAttribute('options', 'section', ''));
$searchInAdminAvailable = explode(',', $this->form->getFieldAttribute('searchable_in_backend', 'section', ''));
$searchInSiteAvailable  = explode(',', $this->form->getFieldAttribute('searchable_in_frontend', 'section', ''));
$backendFilter          = explode(',', $this->form->getFieldAttribute('backend_filter', 'section', ''));
?>

<script type="text/javascript">
	jQuery(document).ready(function()
	{
		<?php if ($this->item->id): ?>
		jQuery('#jform_type_id').prop('disabled', true).trigger("liszt:updated").prop('disabled', false);
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
	action="index.php?option=com_reditem&task=field.edit&id=<?php echo $this->item->id; ?>"
	method="post" name="adminForm" class="form-validate form-horizontal" id="adminForm">
	<div class="row-fluid">
		<div class="span6">
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
			<?php if (in_array($this->form->getValue('type'), $optionAvailable)) : ?>
				<div class="control-group">
					<div class="control-label">
						<?php echo $this->form->getLabel('options'); ?>
					</div>
					<div class="controls">
						<?php echo $this->form->getInput('options'); ?>
					</div>
				</div>
			<?php endif; ?>
			<?php if (in_array($this->form->getValue('type'), $searchInAdminAvailable)) : ?>
				<div class="control-group">
					<div class="control-label">
						<?php echo $this->form->getLabel('searchable_in_backend'); ?>
					</div>
					<div class="controls">
						<?php echo $this->form->getInput('searchable_in_backend'); ?>
					</div>
				</div>
			<?php endif; ?>
			<?php if (in_array($this->form->getValue('type'), $searchInSiteAvailable)) : ?>
				<div class="control-group">
					<div class="control-label">
						<?php echo $this->form->getLabel('searchable_in_frontend'); ?>
					</div>
					<div class="controls">
						<?php echo $this->form->getInput('searchable_in_frontend'); ?>
					</div>
				</div>
			<?php endif; ?>
			<?php if (in_array($this->form->getValue('type'), $backendFilter)) : ?>
				<div class="control-group">
					<div class="control-label">
						<?php echo $this->form->getLabel('backend_filter'); ?>
					</div>
					<div class="controls">
						<?php echo $this->form->getInput('backend_filter'); ?>
					</div>
				</div>
			<?php endif; ?>
			<div class="control-group">
				<div class="control-label">
					<?php echo $this->form->getLabel('published'); ?>
				</div>
				<div class="controls">
					<?php echo $this->form->getInput('published'); ?>
				</div>
			</div>
			<?php if ($this->versioningEnable): ?>
				<div class="control-group">
					<div class="control-label">
						<?php echo $this->form->getLabel('version_note'); ?>
					</div>
					<div class="controls">
						<?php echo $this->form->getInput('version_note'); ?>
					</div>
				</div>
			<?php endif; ?>
		</div>
		<div class="span6">
			<?php foreach ($this->form->getGroup('params') as $field) : ?>
				<div class="control-group">
					<?php if ($field->type == 'Spacer') : ?>
						<hr />
						<?php echo $field->label; ?>
					<?php elseif ($field->hidden) : ?>
						<?php echo $field->input; ?>
					<?php else : ?>
						<div class="control-label">
							<?php echo $field->label; ?>
						</div>
						<div class="controls">
							<?php echo $field->input; ?>
						</div>
					<?php endif; ?>
				</div>
			<?php endforeach; ?>
		</div>
	</div>
	<?php echo $this->form->getInput('id'); ?>
	<?php echo $this->form->getInput('fieldcode'); ?>
	<input type="hidden" name="task" value="" />
	<input type="hidden" name="oldtype" value="<?php echo $this->item->type ?>" />
	<?php echo JHtml::_('form.token'); ?>
</form>

<?php if ($this->versioningEnable && $this->item->id): ?>
<div id="versionModal" class="modal fade hide" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-body">
		<iframe src="<?php echo $this->versionModalLink ?>" frameborder="0" width="100%"></iframe>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true"><?php echo JText::_('JTOOLBAR_CLOSE') ?></button>
	</div>
</div>
<?php endif; ?>
