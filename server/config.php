<?php

return [
  'logDir' => realpath(__DIR__ . '/../log'), // Path to directory with logs
  'parsers' => [], // list of custom parsers - if unknown type is found 'parse' function will be used
];
