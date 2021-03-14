<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_db' );

/** MySQL database username */
define( 'DB_USER', 'wordpress_user' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'bxg<kPMb_IhgW;x -@}+#:+x@vjPuC<){+x[j(5AKh&9Ah#ik/q,e=$4a,}[PGU~');
define('SECURE_AUTH_KEY',  '=qxmM17|wnuB@mZ0!YP}9{I`r[2mz2[dE9|Ly|^.8%|2vMD<2? R~NS2oT5[OYxw');
define('LOGGED_IN_KEY',    'V6G|x#+H?5}]34|mojV;Q|4N_9@qX@,o4BHC9{Nh[|_SY]R4>}40 Sz%w+DsQw|W');
define('NONCE_KEY',        'TSJ9U;q}9Q}JxzsxD|d[fg@iAT- BOcdB_xGL:6|EN+j3p<#-6G,P,ddW0/0dTFb');
define('AUTH_SALT',        'W+i=f3@i7#C?d(Rw;9~Gy<npt8*5%VE)dmt00blVy8*laz3eS`k;-168{O_sD!|1');
define('SECURE_AUTH_SALT', 'Q>-pqUE%guvq;.OZESNdO$kZyAa,&m>#8/Qw&}djwSnAq :U+`qv+jY6M,O|w]FC');
define('LOGGED_IN_SALT',   '}={l&.w+<~7UE+S-e6+YPC5%ok-Ty !RI uRJvQDs7h#V+QrE9X$T+!UL#jy} eg');
define('NONCE_SALT',       ';1@yAOUvU!]glqB^bTyER*+QR1V_IJk$|CtU1#C-T-BR!>(;o0xozFS>::L,t3d%');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
