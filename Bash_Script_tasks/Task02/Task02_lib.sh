#!/usr/bin/env bash
is_root=true
is_user_root(){
if [[ "$(id -u)" -eq 0 ]];
then
        is_root=true
    echo "You are the root!"
else
    is_root=false
    echo "You are not the root please login as root" 
   exit
fi
}

is_user_root

change_port_number()
{

 if [ "$is_root" = true ];
  then
         echo "what is the port number that you want to enter?"
         read number
         sed -i "s/^#Port 22$/Port $number/g" /etc/ssh/sshd_config
echo "port number changed successfuly which port number is $number"
fi

}
change_port_number
disable_root_login(){

        echo "Do you want to disable root login ? (y/n)"
        read yes_or_no

if [ "$is_root" = true ];
then
if [ $yes_or_no = "y" ];
then
       sed -i "s/^PermitRootLogin yes$/PermitRootLogin no/g" /etc/ssh/sshd_config
        echo "disable root login done successfully"
elif [ $yes_or_no = "n" ];
then
        echo "---- Completing to another features ----"
else
        echo "wrong choice"
fi

fi
}

disable_root_login

add_new_user()
{
echo "Do you want to add new user ? (y/n)"
read yes_or_no
if [ "$is_root" = true ];
then
if [ $yes_or_no = "y" ];
then
 echo "Enter The User Name : "
 read username
 useradd $username
 echo "$username is added"
 echo "Do you want to add new user as sudoer? (y/n)"
 read y_or_n
 if [ "y_or_n" = "y" ]
 then
    sudo usermod -aG wheel $username
   elif [ "y_or_n" = "n" ]
   then
 echo "user added as a normal user"
    else
     echo "---- Completing to another features ----"
   fi
elif [ $yes_or_no = "n" ];
then
        echo "---- Completing to another features ----"
else
        echo "wrong choice"
fi

fi


}
add_new_user

backup()
{

echo "Do you want to make backup? (y/n) "
read yes_or_no
if [ "$is_root" = "true" ]
then
        if [ "$yes_or_no" = "y" ]
        then
 crontab -l | { cat; echo "* * * * * rsync -av $HOME/$USER $HOME/backups/"; }  | crontab -
elif [ "yes_or_no" = "n" ]
then
     echo "Finished"
    else
           echo "wrong choice"
fi

fi

echo "backup done"

}
backup

bonus()
{
 while [ ! -f /usr/tmp/bonus.txt ];
do
        echo "looking for /usr/tmp/bonus.txt "
        sleep 3
done

echo "the file is existed now"
}
bonus