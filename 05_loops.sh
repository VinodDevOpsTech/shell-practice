USERID=$(id -u)

LOG_DIR=/var/log/shell-script
LOG_FILE=$LOG_DIR/$(basename $0).log

if [ $USERID -ne 0 ]; then
    echo "ERROR: please run this in root user"
    exit 1
fi

FUNCTION(){
    if [ $2 -ne 0 ]; then
        echo "installing $2....FAILED"
        exit 1
    else
        echo "installing $2....SUCCESS!!!"
    fi
}

for pack in $@
do
    echo "installing $pack"
    dnf list installed $pack &>> $LOG_FILE
    if [ $? -ne 0 ]; then
        dnf install $pack -y &>> $LOG_FILE
        FUNCTION pack $?
    else
        echo " $pack is already installed.... SKIPPING!!!"
    fi
done