#!/bin/bash 

#check internet connection

echo Checking internet connection....

wget -q --tries=10 --timeout=20 --spider http://google.com > /dev/null

if [[ $? -eq 0 ]]; then
        echo "Internet OK"
else
        echo "NO INTERNET CONNECTION!"
	exit 1
fi 

#check if display is available
if [ -z $DISPLAY ];	then
	echo 'display is not available'
	exit 1
	

else 
	if [ -z "$(man dialog)" ]; then
		echo 'dialog is not installed ,try sudo apt install dialog'
		exit 1
	else
		DIALOG=dialog
	fi
fi

cd $HOME

#check if the user has the scripts, if he doesn't, it clones from git, needs internet connection
echo Checking files......

[ -e "bin" ] &&  cd bin || mkdir bin

#LOGOFF=$(find logoff.sh)


[ -d "manutencao" ] ||  git clone https://github.com/lorenzomoulin/manutencao/

cd manutencao
	

$DIALOG --menu "MAINTENANCE APP" 10 30 3 1 Logoff 2 Shutdown 3 Reboot 2> log

for FILE in logoff.sh shutdown.sh reboot.sh
do
	chmod +x $FILE
done


ACTION=$(cat log)

case "$ACTION" in 

"1")
	./logoff.sh
	$DIALOG --msgbox "Executing logoff.sh..." 10 30
	
	clear
	
;;
"2")

	$DIALOG --msgbox "Executing shutdown.sh..." 10 30
	clear

;;

"3")

	$DIALOG --msgbox "Executing reboot.sh..." 10 30
	clear

;;
*)
	clear	
	exit 1
	

;;

esac
