<?php
/**
 * @package     RedITEMCategoryFields.Backend
 * @subpackage  Template
 *
 * @copyright   Copyright (C) 2008 - 2015 redCOMPONENT.com. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE
 */
defined('_JEXEC') or die;

JHtml::_('behavior.keepalive');
JHtml::_('rdropdown.init');
JHtml::_('rbootstrap.tooltip');
JHtml::_('rjquery.chosen', 'select');

RHelperAsset::load('reditem.backend.min.css', 'com_reditem');

$saveOrderUrl = JRoute::_('index.php?option=com_reditemcategoryfields&task=categoryfields.saveOrderAjax&tmpl=component', false);
$listOrder	= $this->escape($this->state->get('list.ordering'));
$listDirn	= $this->escape($this->state->get('list.direction'));
$saveOrder = ($listOrder == 'f.ordering' && strtolower($listDirn) == 'asc');
$search = $this->state->get('filter.search');
$user = JFactory::getUser();
$userId = $user->id;

if ($saveOrder)
{
	JHTML::_('rsortablelist.sortable', 'table-items', 'adminForm', strtolower($listDirn), $saveOrderUrl, false, true);
}

?>
<script type="text/javascript">
	Joomla.submitbutton = function (pressbutton)
	{
		submitbutton(pressbutton);
	}
	submitbutton = function (pressbutton)
	{
		var form = document.adminForm;
		if (pressbutton)
		{
			form.task.value = pressbutton;
		}

		if (pressbutton == 'categoryfields.delete')
		{
			var r = confirm('<?php echo JText::_("COM_REDITEMCATEGORYFIELDS_FIELD_DELETE_FIELDS")?>');
			if (r == true)    form.submit();
			else return false;
		}
		form.submit();
	}
</script>
<form action="index.php?option=com_reditemcategoryfields&view=categoryfields" class="admin" id="adminForm" method="post" name="adminForm">
	<?php
	echo RLayoutHelper::render(
		'searchtools.default',
		array(
			'view' => $this,
			'options' => array(
				'searchField' => 'search',
				'searchFieldSelector' => '#filter_search',
				'limitFieldSelector' => '#list_fields_limit',
				'activeOrder' => $listOrder,
				'activeDirection' => $listDirn
			)
		)
	);
	?>
	<hr />
	<?php if (empty($this->items)) : ?>
	<div class="alert alert-info">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		<div class="pagination-centered">
			<h3><?php echo JText::_('COM_REDITEMCATEGORYFIELDS_NOTHING_TO_DISPLAY'); ?></h3>
		</div>
	</div>
	<?php else : ?>
	<table class="table table-striped" id="table-items">
		<thead>
			<tr>
				<th width="10" align="center">
					<?php echo '#'; ?>
				</th>
				<th width="10">
					<?php if (version_compare(JVERSION, '3.0', 'lt')) : ?>
						<input type="checkbox" name="toggle" value="" onclick="Joomla.checkAll(this);" />
					<?php else : ?>
						<?php echo JHTML::_('grid.checkall'); ?>
					<?php endif; ?>
				</th>
				<th width="30" nowrap="nowrap">
					<?php echo JHTML::_('rsearchtools.sort', 'JSTATUS', 'published', $listDirn, $listOrder); ?>
				</th>
				<th width="1" nowrap="nowrap">
				</th>
				<?php if ($search == ''): ?>
				<th width="40">
					<?php echo JHTML::_('rsearchtools.sort', '<i class=\'icon-sort\'></i>', 'f.ordering', $listDirn, $listOrder); ?>
				</th>
				<?php endif; ?>
				<th class="title" width="auto">
					<?php echo JHTML::_('rsearchtools.sort', 'COM_REDITEMCATEGORYFIELDS_FIELD_NAME', 'f.name', $listDirn, $listOrder); ?>
				</th>
				<th width="150">
					<?php echo JHTML::_('rsearchtools.sort', 'COM_REDITEMCATEGORYFIELDS_FIELD_FIELDCODE', 'f.fieldcode', $listDirn, $listOrder); ?>
				</th>
				<th width="150">
					<?php echo JHTML::_('rsearchtools.sort', 'COM_REDITEMCATEGORYFIELDS_FIELD_FIELDTYPE', 'f.type', $listDirn, $listOrder); ?>
				</th>
				<th width="10">
					<?php echo JHTML::_('rsearchtools.sort', 'COM_REDITEMCATEGORYFIELDS_ID', 'f.id', $listDirn, $listOrder); ?>
				</th>
			</tr>
		</thead>
		<tbody>
			<?php $n = count($this->items); ?>
			<?php foreach ($this->items as $i => $row) : ?>
				<?php $orderkey = array_search($row->id, $this->ordering[0]); ?>
				<tr>
					<td>
						<?php echo $this->pagination->getRowOffset($i); ?>
					</td>
					<td>
						<?php echo JHtml::_('grid.id', $i, $row->id); ?>
					</td>
					<td align="center" width="8%">
						<?php echo JHtml::_('rgrid.published', $row->published, $i, 'categoryfields.', true, 'cb'); ?>
					</td>
					<td>
						<?php if ($row->checked_out) : ?>
							<?php
							$editor = JFactory::getUser($row->checked_out);
							$canCheckin = $row->checked_out == $userId || $row->checked_out == 0;
							echo JHtml::_('rgrid.checkedout', $i, $editor->name, $row->checked_out_time, 'categoryfields.', $canCheckin);
							?>
						<?php endif; ?>
					</td>
					<?php if ($search == ''): ?>
					<td class="order nowrap center">
						<span class="sortable-handler hasTooltip <?php echo ($saveOrder) ? '' : 'inactive'; ?>">
							<i class="icon-move"></i>
						</span>
						<input type="text" style="display:none" name="order[]" value="<?php echo $orderkey + 1;?>" class="text-area-order" />
					</td>
					<?php endif; ?>
					<td>
						<?php $itemTitle = JHTML::_('string.truncate', $row->name, 50, true, false); ?>
						<?php if ($row->checked_out) : ?>
							<?php echo $itemTitle; ?>
						<?php else : ?>
							<?php echo JHtml::_('link', 'index.php?option=com_reditemcategoryfields&task=categoryfield.edit&id=' . $row->id, $itemTitle); ?>
						<?php endif; ?>
					</td>
					<td>
						<?php echo $row->fieldcode; ?>
					</td>
					<td>
						<?php echo $row->type; ?>
					</td>
					<td>
						<?php echo $row->id; ?>
					</td>
				</tr>
			<?php endforeach; ?>
		</tbody>
	</table>
	<?php echo $this->pagination->getPaginationLinks(null, array('showLimitBox' => false)); ?>
	<?php endif; ?>
	<input type="hidden" name="task" value=""/>
	<input type="hidden" name="boxchecked" value="0"/>
	<input type="hidden" name="filter_order" value="<?php echo $listOrder; ?>"/>
	<input type="hidden" name="filter_order_Dir" value="<?php echo $listDirn; ?>"/>
	<?php echo JHtml::_('form.token'); ?>
</form>
