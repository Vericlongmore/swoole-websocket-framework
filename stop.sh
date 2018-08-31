#!/bin/sh
echo `ps -ef | grep "swoole_websocket 20"| grep -v grep | cut -c 9-15 | xargs kill -9`
echo `ps -ef | grep "swoole_websocket 21"| grep -v grep | cut -c 9-15 | xargs kill -9`
