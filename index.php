<?php
define("APP_PATH",dirname(__FILE__));
define("SP_PATH",dirname(__FILE__).'/SpeedPHP');
$spConfig = array(
	"db" => array(
		'host' => 'localhost',
		'login' => 'xiaojiaoya',
		'password' => 'tDYcJVF4MTjsMAWy',
		'database' => 'xiaojiaoya_test',
	),
	'view' => array(
		'enabled' => TRUE, // 开启Smarty
		'config' =>array(
			'template_dir' => APP_PATH.'/tpl', // 模板存放的目录
			'compile_dir' => APP_PATH.'/tmp', // 编译的临时目录
			'cache_dir' => APP_PATH.'/tmp', // 缓存的临时目录
			'left_delimiter' => '<{',  // smarty左限定符
			'right_delimiter' => '}>', // smarty右限定符
		),
	),
/*
	"url" => array(
		'url_path_info' => TRUE, // 是否使用path_info方式的URL
		'url_path_base' => '/index.php', // URL的根目录访问地址
	),
	'launch' => array( // 加入挂靠点，以便开始使用Url_ReWrite的功能
		'router_prefilter' => array( 
				array('spUrlRewrite', 'setReWrite'),  // 对路由进行挂靠，处理转向地址
			),
	 	'function_url' => array(
				array("spUrlRewrite", "getReWrite"),  // 对spUrl进行挂靠，让spUrl可以进行Url_ReWrite地址的生成
		    ),
	),
	 'ext' => array(
 		'spUrlRewrite' => array(
			'suffix' => '.html', 
			'sep' => '/', 
			'map' => array( 
				'search' => 'main@search'，
				 '@' => 'main@no' 	
			),
			'args' => array(
				 'search' => array('q','page'), 
			),
		),
 ),
*/
);
require(SP_PATH."/SpeedPHP.php");
spRun();
