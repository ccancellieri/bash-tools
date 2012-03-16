#! /bin/bash
# tomcat          Start/Stop the tomcat server.
# chkconfig: 2345 90 60
# description: Tomcat script by Carlo Cancellieri

start() {
        echo -n $"Starting $prog: "
        echo 
        su - tomcat -s /bin/sh -c "CATALINA_BASE=$CATALINA_BASE $CATALINA_HOME/bin/startup.sh"
        return $?
}

restart() {
        stop
	sleep 5
        start
}

stop() {
        echo -n $"Stopping $prog: "
        echo 
	su - tomcat -s /bin/sh -c "CATALINA_BASE=$CATALINA_BASE $CATALINA_HOME/bin/shutdown.sh -force"
        return $?
}


# TODO change me!
SERVICE="tomcat"
CATALINA_HOME="/usr/local/share/tomcat/"
CATALINA_BASE="/var/lib/$SERVICE"


prog="Apache Tomcat - $SERVICE"


case "$1" in
  start)
        start
        ;;
  stop)
        stop
        ;;
  restart)
        restart
        ;;
  *)
        echo $"Usage: $0 {start|stop|restart}"
        exit 1
esac
