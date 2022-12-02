<?php
/**
 * Custom WordPress configurations on "wp-config.php" file.
 *
 * This file has the following configurations: MySQL settings, Table Prefix, Secret Keys, WordPress Language, ABSPATH and more.
 * For more information visit {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php} Codex page.
 * Created using {@link http://generatewp.com/wp-config/ wp-config.php File Generator} on GenerateWP.com.
 *
 * @package WordPress
 * @generator GenerateWP.com
 */


/* MySQL settings */
define( 'DB_NAME',     getenv('MYSQL_DATABASE') );
define( 'DB_USER',     getenv('MYSQL_USER') );
define( 'DB_PASSWORD', getenv('MYSQL_PASSWORD') );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET',  'utf8' );
define( 'DB_COLLATE', '' );


/* MySQL database table prefix. */
$table_prefix = 'wp_';


/* Authentication Unique Keys and Salts. */
/* https://api.wordpress.org/secret-key/1.1/salt/ */
define('AUTH_KEY',         '1L.zM&2w`2-$|R}nQR-_Euraw?.7l+lgC@ k#*8YY5H0U@GXK3/_(OC0-&A+kD=M');
define('SECURE_AUTH_KEY',  '{t~C}]M<a/]))p.g3UdBL|gcag-ul#DXqufj+24#G?-L1jjKG/+Juyg_DL+1SS|W');
define('LOGGED_IN_KEY',    ':9A.{RE0FS{d224J^|^nOgi+{jWQ +iK0yLw%IO-yjuqVQ: y)Maabuk)eXqiKCt');
define('NONCE_KEY',        '=)0dF<o^>w?&|9Pp&S BD-,${3NC[P|61OJ!-W#[W23V_l-~KECcS}t=fOiD&<^j');
define('AUTH_SALT',        '3T+-z>y^=uS|);dhhz {mLaqt5?yJ/)x~Mue7;Mw%*NS9ll==_|NuuJS1~(+|dV]');
define('SECURE_AUTH_SALT', '=u)lxuxFxSj%4{M|Y{Z%8!s3AvCmT+o(C{Zc8Z][>!dz$Qjcqlw9O4oI5nyR-+- ');
define('LOGGED_IN_SALT',   'P{6LN(XDKqF%v0YyOGgVjzBQpLEK,UrzpPy7GB3CQhyz}hD*1i0n%trpH_|,-&,]');
define('NONCE_SALT',       '$P^>&JKK>s&&u<{cyW|Y%>{[Mp|}1kDhhG+l%ta4x,p(I}F`#y)tJUB;[WK}p7m=');


/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';