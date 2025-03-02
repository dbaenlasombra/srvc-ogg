#!/bin/bash

. /home/ogg/.bashrc

function ogg_start {
  INFO=`$OGG_HOME/ggsci << EOF
  start manager
  start extract *
  start replicat *
  exit
EOF`
}


function ogg_stop {
  INFO=`$OGG_HOME/ggsci << EOF
  stop extract *
  stop replicat *
  stop manager !
  exit
EOF`
}


case $1 in
  "1" )
    ogg_start
    ;;
  "0" )
    ogg_stop
    ;;
  * )
    ;;
esac
