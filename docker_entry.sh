#!/bin/bash
NAME=dcmtk
CLI_DIR=/usr/src/dcmtk-build/bin

if [ -e $CLI_DIR ]; then

  CLIs=`cd ${CLI_DIR};find . -type f -perm 755 | cut -d'/' -f 2 | tr '\n' ' '`

  requestedCLI=${CLI_DIR}/${1}

  if [ $# -lt 1 ]; then
    echo "Usage: docker run -v<HOST DIRECTORY>:<CONTAINER DIRECTORY> qiicr/docker-${NAME}-cli <${NAME} tool> <arguments>"
    echo "Recognized ${NAME} commands: ${CLIs}"
  else
    if [ -x $requestedCLI ]; then
      $requestedCLI ${@:2}
    else
      echo "Command not recognized! Recognized ${NAME} commands: ${CLIs}"
    fi
  fi
else
  echo $CLI_DIR does not exist!
fi
