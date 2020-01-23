#!/usr/bin/env bash

if [ -s "/usr/local/etc/php/conf.d/xdebug.ini" ]; then
   mv /usr/local/etc/php/conf.d/xdebug.ini /usr/local/etc/php/conf.d/xdebug.iniOLD \
   && /etc/init.d/apache2 force-reload \
   && echo '========= XDebug was disabled ========='
else
  mv /usr/local/etc/php/conf.d/xdebug.iniOLD /usr/local/etc/php/conf.d/xdebug.ini \
  && /etc/init.d/apache2 force-reload \
  && echo '========= XDebug was enabled ========='
fi
