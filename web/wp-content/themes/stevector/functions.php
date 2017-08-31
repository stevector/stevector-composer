<?php

/**
 * Remove emoji support as it slows page rendering by using
 * inline script/styles in the header.
 *
 * @link https://wordpress.org/support/topic/emoji-and-smiley-js-and-css-added-to-head/page/2#post-7087304
 */
remove_action( 'wp_head', 'print_emoji_detection_script', 7 );
remove_action( 'admin_print_scripts', 'print_emoji_detection_script' );
remove_action( 'wp_print_styles', 'print_emoji_styles' );
remove_action( 'admin_print_styles', 'print_emoji_styles' );
