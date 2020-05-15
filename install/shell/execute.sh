#!/bin/bash -

#export SERVER_PORT=8200
#export MYSQL_URL=127.0.0.1:3306
#export MYSQL_USER=cuteJ_shop
#export MYSQL_PASSWORD=cuteJ_shop123

# server
#export SERVER_PORT=8300
#export SERVER_CONTEXT_PATH=/shop
#export SERVER_SESSION_TIMEOUT=1800
#export SERVER_ERROR_MODE=always
#export APP_CORS_ORIGIN: http://localhost:9527

#Jwt
#export JWT_HEADER=Authorization
#export JWT_SECRET=abkfdsfooi0934
#export JWT_EXPIRATION=86400

# oss
#export APP_OSS_KEY=xxx
#export APP_OSS_SECRET=xxx
#export APP_OSS_ENDPOINT=xxx
#export APP_OSS_URL=xxx
#export APP_OSS_BUCKET=xxx

# Linux 路径
MS_HOME=/data/cuteJ/server
MS_JAR=shop-server-mgt.jar #
APP_NAME=shop-server-mgt #
JAVA_OPTS="-Dspring.profiles.active=prod -Xms1g -Xmx4g -XX:MaxMetaspaceSize=256m -XX:+UseG1GC";

MS_PID=`ps fax|grep java|grep "${MS_JAR}"|awk '{print $1}'`
export MS_PID;

# Function: start
start() {
  pid=${MS_PID}
  if [ -n "${pid}" ]; then {
    echo "${APP_NAME} Service is already running (pid: ${pid})";
  }
  else {
    # Start screener ms
    echo "Starting ${APP_NAME} service";
    cd ${MS_HOME}
    nohup java ${JAVA_OPTS} -jar ./${MS_JAR} > /dev/null 2>&1 &
  } fi;
  # return 0;
}

# Function: stop
stop() {
  pid=${MS_PID}
  if [ -n "${pid}" ]; then {
    echo -ne "Stopping service module";
    kill -15 ${pid}
    sleep 5
    pid=`ps fax|grep java|grep "${MS_JAR}"|awk '{print $1}'`
    if [ ${pid} ]; then {
      echo 'Kill Process!'
      kill -9 ${pid}
    }
    else {
      echo "${APP_NAME} stop success."
    } fi;
  }
  else {
      echo "${APP_NAME} service is not running";
  } fi;

  #return 0;
}

# Main Code

case $1 in
  start)
    start;
    ;;
  stop)
    stop;
    ;;
  restart)
    stop;
    sleep 1;
    start;
    ;;
  status)
    pid=${MS_PID}
    if [ "${pid}" ]; then {
      echo "${APP_NAME} service is running with pid: ${pid}";
    }
    else {
      echo "${APP_NAME} service is not running";
    } fi;
    ;;
esac

exit 0;
