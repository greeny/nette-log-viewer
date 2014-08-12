<?php

header('Cache-Control: no-cache, must-revalidate');
header('Content-type: text/html');
header('Access-Control-Allow-Origin: *');
$config = require __DIR__ . '/config.php';
$logDir = $config['logDir'];
$logFile = $_GET['f'];

echo file_get_contents($logDir . '/' . $logFile);
