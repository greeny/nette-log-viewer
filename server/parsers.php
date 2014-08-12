<?php

define('P_DATE', '~\[(.*)\]~');
define('P_MESSAGE', '~\](.+)@~');
define('P_URL', '~@(.*?)(?:[@*]|$)~');
define('P_LOGFILE', '~@@(.+)~');

function extract_by_pattern($pattern, $line)
{
  preg_match($pattern, $line, $matches);
  return isset($matches[1]) ? trim($matches[1]) : NULL;
}

function extract_date($line) {
  return substr($line, 1, 19);
}

function parse($line, $logDir)
{
  $data = [];
  $data['date'] = extract_date($line);
  $data['message'] = extract_by_pattern(P_MESSAGE, $line);
  $data['url'] = extract_by_pattern(P_URL, $line);
  $data['logFileName'] = extract_by_pattern(P_LOGFILE, $line);
  $data['logFilePath'] = $logDir . '/' . $data['logFileName'];
  $data['logFileExists'] = file_exists($data['logFilePath']) && !is_dir($data['logFilePath']);
  return $data;
}
