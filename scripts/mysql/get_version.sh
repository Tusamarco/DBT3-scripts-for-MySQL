#!/bin/bash

$MYSQL_CLIENT -s -e "show global variables like 'version'" | awk '{print $2}' || exit 1

exit 0
