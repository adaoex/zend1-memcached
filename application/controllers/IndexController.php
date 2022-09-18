<?php

class IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
        $config = Zend_Registry::get('config');

        $backendOptions = $config->cache->backend->memcached->toArray();
        $frontendOptions = $config->cache->frontend->toArray();

        // getting a Zend_Cache_Core object
        $cache = Zend_Cache::factory('Core',
            'Libmemcached',
            $frontendOptions,
            $backendOptions);

        // TEST
        if (!$cache->save(time(), 'ZF1_Connect')) {
            throw new Erfurt_Exception('Memcache server is not available.');
        }

        #$testCache = $cache->getMetadatas('ZF1_Connect');
        $testCache = $cache->load('ZF1_Connect');

        $this->view->testCache = $testCache;

    }

}

