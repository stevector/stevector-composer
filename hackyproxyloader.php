<?php

// @TODO Read from ENV or app-config
$url = 'https://us-central1-serverlessplayground.cloudfunctions.net/';

$hackyproxy = new \Stevector\HackyProxy\PantheonToGCPBucket($url);
