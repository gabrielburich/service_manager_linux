#!/bin/sh

SERVICE_DIR="/opt/scripts"
SERVICE_NAME="hello.sh"
SERVICE_PID_FILE="$SERVICE_DIR/$SERVICE_NAME.pid"


service_status(){
	if [[ -e $SERVICE_PID_FILE ]]; then
		echo "The $SERVICE_NAME service is running, PID: $(cat $SERVICE_PID_FILE)"
	else
		echo "The $SERVICE_NAME service is stopped"
	fi
}

service_start(){
	if [[ !(-e $SERVICE_PID_FILE) ]]; then
		sh $SERVICE_DIR/$SERVICE_NAME.sh &
		echo "$(pgrep -f $SERVICE_DIR/$SERVICE_NAME.sh)" > $SERVICE_PID_FILE
		echo "$SERVICE_NAME start"
	else
		echo "The $SERVICE_NAME service is already running "
	fi

}

service_stop(){
	if [[ -e $SERVICE_PID_FILE ]]; then
		servicePid=$(cat $SERVICE_PID_FILE)
		kill -9 $servicePid
		rm -f $SERVICE_PID_FILE
		echo "$SERVICE_NAME stopped"
	else
		echo "The $SERVICE_NAME service is stopped"
	fi

}

service_restart(){
	service_stop
	sleep 1
	service_start
}


case "$1" in
  start)
        service_start
        exit $?
        ;;
  stop)
        service_stop
        exit $?
        ;;
  restart)
        service_restart
        ;;
  status)
        service_status
        exit $?
        ;;
  *)
        echo "Usage: service $SERVICE_NAME {start|stop|restart|status}"
        echo "       or"
        echo "       /etc/init.d/$SERVICE_NAME {start|stop|restart|status}"
        exit 1
esac

exit 0