#!/usr/bin/bash


trapeze () {
	echo ''
}

trap trapeze SIGINT

Splash(){
	clear
echo -e "\e[33m  ____ ____   ____    __ __ __   ___\e[0m";
sleep 0.01
echo -e "\e[33m /    |    \ /    |  /  ]  |  | /  _]\e[0m";
sleep 0.01
echo -e "\e[33m|  o  |  o  )  o  | /  /|  |  |/  [_\e[0m";
sleep 0.01
echo -e "\e[33m|     |   _/|     |/  / |  _  |    _]\e[0m";
sleep 0.01
echo -e "\e[33m|  _  |  |  |  _  /   \_|  |  |   [_\e[0m";
sleep 0.01
echo -e "\e[33m|  |  |  |  |  |  \     |  |  |     |\e[0m";
sleep 0.01
echo -e "\e[33m|__|__|__|_ |__|__|\____|__|__|_____| _\e[0m";
sleep 0.01
echo -e "\e[33m   /  ]/   \|    \|      |    \ /   \| |\e[0m";
sleep 0.01
echo -e "\e[33m  /  /|     |  _  |      |  D  )     | |\e[0m";
sleep 0.01
echo -e "\e[33m /  / |  O  |  |  |_|  |_|    /|  O  | |___\e[0m";
sleep 0.01
echo -e "\e[33m/   \_|     |  |  | |  | |    \|     |     |\e[0m";
sleep 0.01
echo -e "\e[33m\     |     |  |  | |  | |  .  \     |     |\e[0m";
sleep 0.01
echo -e "\e[33m \____|\___/|__|__| |__| |__|\_|\___/|_____|\e[0m";
sleep 0.01
echo " "
}


if [ "$EUID" -ne 0 ]
  then echo -e "You must run as root!";
  exit
fi


Splash
PS3='Option: '
options=("Start Apache2" "Restart Apache2" "Stop Apache2" "Check Status" "Check Port 80" "Check Version" "Kill Process" "Check Errors" "Help" "Quit" "Clear")
while [ "$menu" != 1 ]; do
select opt in "${options[@]}" ; do
	case $opt in
	"Help")
		break
	;;
	"Start Apache2")
		service apache2 start
		echo "Starting..."
		sleep 2
		echo "Apache2 Started!"
	;;
	"Restart Apache2")
		service apache2 restart
		echo "Restarting..."
		sleep 2
        echo "Apache2 Restarted!"
	;;
	"Check Version")
		apache2 -v
        sleep 0.4
	;;
	"Stop Apache2")
		service apache2 stop
		echo "Stopping..."
		sleep 2
		echo "Apache2 Stopped!"
	;;
	"Check Status")
	clear
		echo -e "\e[33mUse q to close results\e[0m";
		service apache2 status
		Splash
	;;
	"Check Port 80")
		netstat -tulpn | grep :80
		sleep 2
	;;
	"Kill Process")
		echo -e "Enter PID to kill:"
		read kpid
		kill $kpid
	;;
	"Check Errors")
		echo -e "Use q to close results";
		journalctl -xe
	;;
		"Clear")
		clear
		Splash
	;;	
	 "Quit")
		echo -e " "
		echo -e "\e[37mThank you for using Apache2 Control by Nya0\e[0m";
		sleep 0.9
		clear
		menu=1
	
	exit
	;;

*)
       
        
		echo -e "$REPLY: command not found, Maybe try '9' for some help";
		echo ""
		echo ""
	;;
	esac
        done
done

exit 0



