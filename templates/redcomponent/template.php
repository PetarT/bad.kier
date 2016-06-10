<?php
/**
 * @package    Template.Template
 *
 * @copyright  Copyright (C) 2005 - 2015 redCOMPONENT.com. All rights reserved.
 * @license    GNU General Public License version 2 or later; see LICENSE
 */

// No direct access
defined('_JEXEC') or die('Restricted access');

?>
<!DOCTYPE html>
	<html>
	<head>
		<!--
            ##########################################
            ## redWEB ApS                     		##
            ## Blangstedgaardsvej 1                 ##
            ## 5220 Odense SØ                       ##
            ## Danmark                              ##
            ## email@redweb.dk             			##
            ## http://www.redweb.dk          		##
            ## Dato: 2015-07-21                  ##
            ##########################################
        -->

		<w:head />
		<link href="//fonts.googleapis.com/css?family=Gudea:400normal,400italic,700normal" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="templates/redcomponent/js/jquery.easing.1.3.js"></script> 
		<script type="text/javascript" src="templates/redcomponent/js/jquery.scrollTo-1.4.3.1-min.js"></script>
		<script type="text/javascript" src="templates/redcomponent/js/owl.carousel.js"></script>
		<script type="text/javascript" src="templates/redcomponent/js/jquery.row-grid.js"></script>
		<script type="text/javascript" src="templates/redcomponent/js/jquery.row-grid.min.js"></script>
		<link href="templates/redcomponent/css/owl.carousel.min.css" rel="stylesheet">
		<meta property="og:url"                content="http://kier-bad.lu.intern.redweb.dk/" />
		<meta property="og:type"               content="article" />
		<meta property="og:title"              content="Kier bad" />
		<meta property="og:description"        content="Kier bad" />		
		<meta property="og:image"              content="http://kier-bad.lu.intern.redweb.dk/images/banners/banner-8.jpg" />

	</head>
	<body <?php if ($bodyclass != "") : ?> class="<?php echo $bodyclass ?>"<?php endif; ?>>
	<?php if ($this->countModules('toolbar')) : ?>
		<!-- menu -->
		<w:nav containerClass="container" rowClass="row" wrapClass="navbar-fixed-top navbar-inverse" type="toolbar" name="toolbar" />
	<?php endif; ?>

	<div id="fullpage" class="wrapper-container">
		<!-- header -->
		<header id="header">
			<div class="row clearfix">
                <w:logo name="top" />
				<a class="menu-toolbar" href="#0">
					<span class="menu-text">Menu</span><span class="menu-icon"></span>
				</a> <!-- menu-toolbar -->
				<div class="clear"></div>
			</div>
			
		</header>
		
		<?php if ($this->countModules('menu')) : ?>
					<!-- menu -->
					<w:nav name="menu" />
				<?php endif; ?>
		

		<?php if ($this->countModules('featured')) : ?>
			<!-- featured -->
			<div id="featured" class="section">
				<w:module type="none" name="featured" chrome="xhtml" />
			</div>
		<?php endif; ?>

		<?php if ($this->countModules('grid-top')) : ?>
			<!-- grid-top -->
			<div id="grid-top" class="section">
				<w:module type="row" name="grid-top" chrome="wrightflexgrid" />
			</div>
		<?php endif; ?>
		<?php if ($this->countModules('grid-top2')) : ?>
			<!-- grid-top2 -->
			<div id="grid-top2">
				<w:module type="row" name="grid-top2" chrome="wrightflexgrid" />
			</div>
		<?php endif; ?>
		<?php if ($this->countModules('grid-top3')) : ?>
			<!-- grid-top2 -->
			<div id="grid-top3">
				<w:module type="row" name="grid-top3" chrome="wrightflexgrid" />
			</div>
		<?php endif; ?>
		<div id="main-content" class="row">
			<!-- sidebar1 -->
			<aside id="sidebar1">
				<w:module name="sidebar1" chrome="xhtml" />
			</aside>
			<!-- main -->
			<section id="main">
				<?php if ($this->countModules('above-content')) : ?>
					<!-- above-content -->
					<div id="above-content">
						<w:module type="none" name="above-content" chrome="xhtml" />
					</div>
				<?php endif; ?>
				<?php if ($this->countModules('breadcrumbs')) : ?>
					<!-- breadcrumbs -->
					<div id="breadcrumbs">
						<w:module type="single" name="breadcrumbs" chrome="none" />
					</div>
				<?php endif; ?>
				<!-- component -->
				<w:content />
				<?php if ($this->countModules('below-content')) : ?>
					<!-- below-content -->
					<div id="below-content">
						<w:module type="none" name="below-content" chrome="xhtml" />
					</div>
				<?php endif; ?>
			</section>
			<!-- sidebar2 -->
			<aside id="sidebar2">
				<w:module name="sidebar2" chrome="xhtml" />
			</aside>
		</div>
		<?php if ($this->countModules('grid-bottom')) : ?>
			<!-- grid-bottom -->
			<div id="grid-bottom">
				<w:module type="row" name="grid-bottom" chrome="wrightflexgrid" />
			</div>
		<?php endif; ?>
		<?php if ($this->countModules('grid-bottom2')) : ?>
			<!-- grid-bottom2 -->
			<div id="grid-bottom2">
				<w:module type="row" name="grid-bottom2" chrome="wrightflexgrid" />
			</div>
		<?php endif; ?>
		<?php if ($this->countModules('bottom-menu')) : ?>
			<!-- bottom-menu -->
			<w:nav containerClass="container" rowClass="row" name="bottom-menu" />
		<?php endif; ?>

		<!-- footer -->
		<div class="wrapper-footer">
			<footer id="footer" <?php if ($this->params->get('stickyFooter', 1)) : ?> class="sticky"<?php endif;?>>
				<div class="container">
					<?php if ($this->countModules('footer')) : ?>
						<w:module type="row" name="footer" chrome="wrightflexgrid" />
					<?php endif; ?>

				</div>
			</footer>
		</div>

	    <w:footer />
	</div>

	

	</body>
	</html>
