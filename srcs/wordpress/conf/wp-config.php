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
define( 'DB_HOST',     'mariadb' );
define( 'DB_CHARSET',  'utf8' );
define( 'DB_COLLATE', '' );


/* MySQL database table prefix. */
$table_prefix = 'wp_';


/* Authentication Unique Keys and Salts. */
/* https://api.wordpress.org/secret-key/1.1/salt/ */
define('AUTH_KEY',         'TR(*-L9(+2:<Idj5+Bqs8%+g|.|.ddEW%{j[c(q[g[o_DfL# .WGy-h_s0 o.)_M');
define('SECURE_AUTH_KEY',  'vr6<r:@^|:/XRN%Dd}=I*Sw:=4C=#,-w-7%OMDfB2ek{LdgN;%H~HJ]AhZKF2tPs');
define('LOGGED_IN_KEY',    '!&M?:S@v]kJY?&ofhrR?fJ4lxZrGlVal65A-Ixm>&gxDTJT(~O80:>z|G^9DXnb}');
define('NONCE_KEY',        '|S<j)W;Rr$!SWW|g| 30H#oRom6j16aR,>Q&;#jPXj@|$t<kp!HjS5QZ569GUQem');
define('AUTH_SALT',        ';qN:q&G-tRPYaW)8IUPt+?vupFreYe~1$`YUq%|oz~9B*zDJbOlA.Q+}oh_x,/zy');
define('SECURE_AUTH_SALT', 'MTmN#K<.SG]B2k3-x[`7+KeIbYf1OV@Q:wy$pA>|DGP?EG{@zH7?kI8K>/YlO<Yn');
define('LOGGED_IN_SALT',   ' =+FZ-w#T(Ko`Z30ADh)TxB3NFifh;g>22mhmbx|Z-Ok-a6|/Ev00`y2]gx:,;B ');
define('NONCE_SALT',       'pgbs[V65-D+,4g+vap%J@Hl(b+8+_jE<Q9.kPLHu3-~(G&-KZ)Np(s%eu$PGf/Il');

/* Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/* Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');