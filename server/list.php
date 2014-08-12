<?php

header('Cache-Control: no-cache, must-revalidate');
header('Content-type: application/json');
header('Access-Control-Allow-Origin: *');

require __DIR__ . '/parsers.php';
$config = require __DIR__ . '/config.php';
$logDir = $config['logDir'];
$parsers = $config['parsers'];

$data = [];

foreach (glob($logDir . '/*.log') as $path) {
  $logType = pathinfo($path, PATHINFO_FILENAME);
  if (!isset($parsers[$logType])) {
    $parsers[$logType] = 'parse';
  }

  $data[$logType] = [];

  $file = fopen($path, 'r');
  if ($file) {
    while (($line = fgets($file)) !== FALSE) {
      $data[$logType][] = call_user_func_array($parsers[$logType], [$line, $logDir]);
    }
    usort($data[$logType], function($a, $b){
      return $a < $b;
    });
  }
  fclose($file);
}

echo json_encode($data);
