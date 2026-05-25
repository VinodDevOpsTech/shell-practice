USERID=$(id -u)

LOG_DIR=/var/log/shell-script
LOG_FILE=$LOG_DIR/$(basename $0).log

if [ $USERID -ne 0 ]; then
    echo "ERROR: please run this in root user"
    exit 1
fi

FUNCTION(){
    if [ $1 -ne 0 ]; then
        echo "installing $2....FAILED"
        exit 1
    else
        echo "installing $2....SUCCESS!!!"
    fi
}

dnf list installed mysql &>>$LOG_FILE

if [ $? -eq 0 ]; then
    echo "mySQL is already installed....SKIPPING"
    exit 0
else
    echo "installing mySQL"
    dnf install mysql -y &>>$LOG_FILE
    FUNCTION $? MySQL
fi