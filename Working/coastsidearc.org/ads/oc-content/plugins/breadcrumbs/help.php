<?php
/*
 *      OSCLass – software for creating and publishing online classified
 *                           advertising platforms
 *
 *                        Copyright (C) 2010 OSCLASS
 *
 *       This program is free software: you can redistribute it and/or
 *     modify it under the terms of the GNU Affero General Public License
 *     as published by the Free Software Foundation, either version 3 of
 *            the License, or (at your option) any later version.
 *
 *     This program is distributed in the hope that it will be useful, but
 *         WITHOUT ANY WARRANTY; without even the implied warranty of
 *        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *             GNU Affero General Public License for more details.
 *
 *      You should have received a copy of the GNU Affero General Public
 * License along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
?>

<div id="settings_form" style="border: 1px solid #ccc; background: #eee; ">
    <div style="padding: 0 20px 20px;">
        <div>
            <fieldset>
                <legend>
                    <h1><?php _e('Breadcrumbs Help', 'breadcrumbs'); ?></h1>
                </legend>
                <h2>
                    <?php _e('What is Breadcrumbs Plugin?', 'breadcrumbs'); ?>
                </h2>
                <p>
                    <?php _e('Breadcrumbs plugin allows you to show a breadcrumbs-style navigation bar on any part of your site you want, something like <blockquote>OSClass / Category / Subcategory / Item title</blockquote>', 'breadcrumbs'); ?>
                </p>
                <h2>
                    <?php _e('How does Breadcrumbs plugin work?', 'breadcrumbs'); ?>
                </h2>
                <p>
                    <?php _e('In order to use Breadcrumbs plugin, you should edit your theme files and add the following line anywhere in the code you want the breadcrumb-style navigation bar to appear', 'breadcrumbs'); ?>:
                </p>
                <pre>
                    &lt;?php breadcrumbs(); ?&gt;
                </pre>
                <h2>
                <?php _e('Could I cutomize the style of Breadcrumbs plugin?', 'breadcrumbs'); ?>
                </h2>
                <p>
                    <?php _e("Of course you can. The main crumb has a style class of 'bc_root'. The last crumb of 'bc_last'. The middle crumbs have classes as 'bc_level_X' where X is the number of depth. For example 'OSClass / category / subcategory / item_title' has style classes as 'bc_root / bc_level_1 / bc_level_2 / bc_last'. You should modify your theme's .css file to change the style", 'breadcrumbs'); ?>. 
                </p>
                <p>
                    <?php _e("You could also specify the separator you want. The default one is '/', but you could feel more comfortable with '&raquo;', ':', etc. For example:", 'breadcrumbs'); ?>
                </p>
                <pre>
                    &lt;?php breadcrumbs('&raquo;'); ?&gt;
                </pre>
            </fieldset>
        </div>
    </div>
</div>