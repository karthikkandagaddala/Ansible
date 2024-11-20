#! bin/bash/
userid=$(id -u)
if [ $userid -ne 0 ]
then
     echo "Please start with Sudo Acess"
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
         echo "$2 is .....Success"
    fi
}
dnf install ansible -y
validate ( $? "Installing ansible" )
dnf install nginx -y
validate ( $? "Installing nginx" )
dnf remove nginx -y
validate ( $? "Removing nginx" )