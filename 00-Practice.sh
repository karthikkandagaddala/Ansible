#! bin/bash/
userid=$(id -u)
if [ $userid -ne 0 ]
then
     echo "PLease Proceed with Sudo Access"
     exit 1
else 
     echo "Your a super user"
fi
validate () {
    if [ $1 -ne 0 ]
    then
         echo "$2 is ....Failure"
         exit 1
    else
         echo "$2 is ....Success"
         
    fi
}
dnf install mysql -y
validate $? "Installing mysql"
dnf install nginx -y
validate $? "Installing nginx"
dnf remove mysql -y
validate $? "Removing mysql"