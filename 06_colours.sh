USERID=$(id -u)

LOG_DIR="/var/log/shell-script"
LOG_FILE="$LOG_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
if [ $USERID -ne 0 ]; then
    echo "ERROR: please run this in root user"
    exit 1
fi

FUNCTION(){
    if [ $2 -ne 0 ]; then
        echo -e "$TIMESTAMP [ERROR] installing $2....$R FAILED$N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$TIMESTAMP [INFO] installing $2....$G SUCCESS$N" | tee -a $LOG_FILE
    fi
}

for pack in $@
do
    echo "$TIMESTAMP [INFO] installing $pack"
    dnf list installed $pack &>> $LOG_FILE
    if [ $? -ne 0 ]; then
        dnf install $pack -y &>> $LOG_FILE
        FUNCTION pack $?
    else
        echo -e "$TIMESTAMP [INFO] $pack is already installed....$Y SKIPPING$N"
    fi
done