<?php
return array(
    'backend' =>
        array(
            'frontName' => 'admin',
        ),
    'crypt' =>
        array(
            'key' => '5e56dc6d8f24f711bb4f289cca1beda9',
        ),
    'session' =>
        array(
            'save' => 'redis',
            'redis' =>
                array(

                    'host' => 'redis-session',
                    'port' => '6379',
                    'password' => '',
                    'timeout' => '2.5',
                    'persistent_identifier' => '',
                    'database' => '2',
                    'compression_threshold' => '2048',
                    'compression_library' => 'gzip',
                    'log_level' => '1',
                    'max_concurrency' => '6',
                    'break_after_frontend' => '5',
                    'break_after_adminhtml' => '30',
                    'first_lifetime' => '600',
                    'bot_first_lifetime' => '60',
                    'bot_lifetime' => '7200',
                    'disable_locking' => '0',
                    'min_lifetime' => '60',
                    'max_lifetime' => '2592000'
                )
        ),
    'db' =>
        array(
            'table_prefix' => '',
            'connection' =>
                array(
                    'default' =>
                        array(
                            'host' => 'db',
                            'dbname' => 'magento',
                            'username' => 'magento',
                            'password' => 'magento',
                            'active' => '1',
                        ),
                ),
        ),
    'resource' =>
        array(
            'default_setup' =>
                array(
                    'connection' => 'default',
                ),
        ),
    'x-frame-options' => 'SAMEORIGIN',
    'MAGE_MODE' => 'production',
    'cache_types' =>
        array(
            'config' => 1,
            'layout' => 1,
            'block_html' => 1,
            'collections' => 1,
            'reflection' => 1,
            'db_ddl' => 1,
            'eav' => 1,
            'customer_notification' => 1,
            'full_page' => 0,
            'config_integration' => 1,
            'config_integration_api' => 1,
            'translate' => 1,
            'config_webservice' => 1,
            'compiled_config' => 1,
        ),
    'install' =>
        array(
            'date' => 'Thu, 05 Jan 2017 22:49:50 +0000',
        ),
    'cache' =>
        array(
            'frontend' =>
                array(
                    'default' =>
                        array(
                            'backend' => 'Cm_Cache_Backend_Redis',
                            'backend_options' =>
                                array(
                                    'server' => 'redis',
                                    'port' => '6379',
                                    'persistent' => '',
                                    'database' => '0',
                                    'password' => '',
                                    'force_standalone' => '0',
                                    'connect_retries' => '1',
                                    'read_timeout' => '10',
                                    'automatic_cleaning_factor' => '0',
                                    'compress_data' => '1',
                                    'compress_tags' => '1',
                                    'compress_threshold' => '20480',
                                    'compression_lib' => 'gzip',
                                    'use_lua' => '0',
                                ),
                        ),
                    'page_cache' =>
                        array(
                            'backend' => 'Cm_Cache_Backend_Redis',
                            'backend_options' =>
                                array(
                                    'server' => 'redis',
                                    'port' => '6379',
                                    'persistent' => '',
                                    'database' => '1',
                                    'password' => '',
                                    'force_standalone' => '0',
                                    'connect_retries' => '1',
                                    'lifetimelimit' => '57600',
                                    'compress_data' => '0',
                                ),
                        ),
                ),
        ),
);
