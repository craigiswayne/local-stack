<?php
namespace Splinter;

if ( ! defined( 'WP_CLI' ) ) return;

use \WP_CLI\Utils;

class Jenkins extends \WP_CLI_Command{
	public function __construct(){
//		echo 'hello daar :)';
	}
	
	/**
	 * Displays information about the jenkins command
	 *
	 * ## EXAMPLE
	 *
	 *    wp jenkins info
	 */
	public function info( $args, $assoc_args ) {
//		echo Utils\get_home_dir();
		$runner = \WP_CLI::get_runner();
//		echo $runner->project_config_path;
		var_export( $runner );
	}
}

\WP_CLI::add_command( 'jenkins', '\Splinter\Jenkins' );