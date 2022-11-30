#!/usr/bin/env bash
is_root=true
port_number=0
primary_group="Audit"
is_user_root(){
if [[ "$(id -u)" -eq 0 ]];
then
        is_root=true
    echo "You are the root"
else
    is_root=false
    echo "You are not the root please login as root!" 
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
         port_number=$number
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

update_firewall_and_selinux()
{

 echo "Do you want to update selinux with sshd port number? (y/n)"
 read yes_or_no
 if [ "$is_root" = true ];
 then
 if [ $yes_or_no = "y" ];
    then
 semanage port -a -t ssh_port_t -p tcp $port_number
 echo "selinux was updated successfully "
 elif [ $yes_or_no = "n" ];
    then
 echo "---- Completing to another features ----"
 else
 echo "wrong choice"
 fi
 fi       

 echo "Do you want to update firewall with sshd port number ? (y/n)"
 read yes_or_no
 if [ "$is_root" = true ];
 then
 if [ $yes_or_no = "y" ];
 then
 firewall-cmd --zone=public --add-port=$port_number/tcp --permanent
 sudo systemctl reload firewalld.service
 echo "firewall was updated successfully "
 elif [ $yes_or_no = "n" ];
 then
 echo "---- Completing to another features ----"
 else
 echo "wrong choice"
 fi
 fi 

}
update_firewall_and_selinux

add_newgroup () {
sudo groupadd -g 20000 Audit
echo "Audit group was added successfully"
}
add_newgroup

add_new_user()
{
 echo "Do you want to add new user ? (y/n)"
 read yes_or_no
 if [ "$is_root" = true ];
 then
 if [ $yes_or_no = "y" ];
 then
 echo "what is the username you want to add ?"
 read username
 sudo useradd -n $username
 echo "user $username was added successfully"
 echo "please add password for username"
 read trimmedpw
trimmedpw="$(printf  '%s\n' "$password" | sed 's/^[[:digit:][:punct:]]*//; s/[[:digit:][:punct:]]*$//')"

if [ -z "$trimmedpw" ]; then
        echo "You can't use a password with just digits and/or punctuation!"
    else
    case "$username" in
        *"$trimmedpw"* )
            echo "You can't use a password with part of your username in it!" ;;
        * )
            echo "password added successfully to $username" 
            sudo passwd $username

            ;;
    esac
    
fi
 usermod -g $groupname $username
 echo "Audit group added to $username as primary group"

elif [ $yes_or_no = "n" ];
    then
 echo "---- Completing to another features ----"
 else
 echo "wrong choice"
 fi
 fi 





}
add_new_user
 
create_reports_for_2021()
{
 echo "Do you want to make new reports directory for 2021 ? (y/n)"
 read yes_or_no
 if [ "$is_root" = true ];
 then
 if [ $yes_or_no = "y" ];
 then
        mkdir -p $HOME/reports/2021
        for i in 01 03 05 07 08 10 12
        do
                mkdir $HOME/reports/2021/$i/
                touch $HOME/reports/2021/$i/{01..31}.xls
        done
        for i in 04 06 09 11
        do
                mkdir $HOME/reports/2021/$i/
                touch $HOME/reports/2021/$i/{01..30}.xls
        done
        mkdir $HOME/reports/2021/2
        touch $HOME/reports/2021/2/{01..28}.xlsen
 
    echo "reports directory created successfully"
 elif [ $yes_or_no = "n" ];
 then
 echo "---- Completing to another features ----"
 else
 echo "wrong choice"
 fi
 fi 
 


}

create_reports_for_2021

check_reports_permissions()
{
echo "Do you want to change permissions to reports directory? (y/n)"
 read yes_or_no
 if [ "$is_root" = true ];
 then
 if [ $yes_or_no = "y" ];
    then
 setfacl -m u:$USER:rw $HOME/reports
 setfacl -m g:$USER:rw $HOME/reports
 chmod 660 $HOME/reports
 echo "reports permissions changed successfully"
 elif [ $yes_or_no = "n" ];
    then
 echo "---- Completing to another features ----"
 else
 echo "wrong choice"
 fi
 fi        



}


check_reports_permissions

update_and_upgrade_system()
{


echo "Do you want to update and upgrade the system? (y/n)"
 read yes_or_no
 if [ "$is_root" = true ];
 then
 if [ $yes_or_no = "y" ];
    then
 yum -y update
 yum -y upgrade
 echo "system updated and upgraded successfully"
 elif [ $yes_or_no = "n" ];
    then
 echo "---- Completing to another features ----"
 else
 echo "wrong choice"
 fi
 fi 

}

update_and_upgrade_system

enable_epel_repository()
{
 echo "Do you want to enable EPEL repository? (y/n)"
 read yes_or_no
 if [ "$is_root" = true ];
 then
 if [ $yes_or_no = "y" ];
    then
 yum install epel-release -y
 systemctl enable epel
 systemctl start epel
 echo "EPEL repository is enabled successfully"	
 elif [ $yes_or_no = "n" ];
    then
 echo "---- Completing to another features ----"
 else
 echo "wrong choice"
 fi
 fi


}


enable_epel_repository

install_fail2ban()
{
 echo "Do you want to install and enable fail2ban? (y/n)"
 read yes_or_no
 if [ "$is_root" = true ];
 then
 if [ $yes_or_no = "y" ];
    then
    
        yum install fail2ban
		systemctl enable fail2ban
		systemctl start fail2ban
		echo " fail2ban is installed and enabled successfully"
 
 elif [ $yes_or_no = "n" ];
    then
 echo "---- Completing to another features ----"
 else
 echo "wrong choice"
 fi
 fi



}

install_fail2ban


add_chron_job_backup()
{
 echo "Do you want to add chron job that make backup from backup the reports directory every day at 01 AM from MON to FRI  to /root/backups/reports-WEEKNUMBER-DAYNUMBEROFTHEWEEK.tar ? (y/n)"
 read yes_or_no
 if [ "$is_root" = true ];
 then
 if [ $yes_or_no = "y" ];
    then
    mkdir -p $HOME/backups
    touch $HOME/Rbackups.txt
	echo "00 1 * * 1-5 tar -czf $HOME/backups/reports-$(date +%U)-$(date +%w).tar.gz $HOME/reports" > "$HOME/Rbackups.txt"
	crontab "$HOME/Rbackups.txt"
    echo "chron job done successfully"

 
 elif [ $yes_or_no = "n" ];
    then
 echo "---- Completing to another features ----"
 else
 echo "wrong choice"
 fi
 fi



}
add_chron_job_backup

add_new_user_manager()
{
 echo "Do you want to add new user (manager) with uid 30000 ? (y/n)"
 read yes_or_no
 if [ "$is_root" = true ];
 then
 if [ $yes_or_no = "y" ];
    then
   	useradd -u 30000 manager
    echo "user(manager) was added successfully"

 
 elif [ $yes_or_no = "n" ];
    then
 echo "---- Completing to another features ----"
 else
 echo "wrong choice"
 fi
 fi


}
add_new_user_manager

sync()
{
	mkdir -p  ~/manager/audit/reports
     echo "Do you want to sync the reports daily 02AM from MON to FRI to /home/manager/audit/reports ? (y/n)"
 read yes_or_no
 if [ "$is_root" = true ];
 then
 if [ $yes_or_no = "y" ];
    then

  echo "0 2 * * 1-5 sync ~/reports/* ~/manager/audit/reports" >> /var/spool/cron/root-
    echo "sync done successfully"
 
 elif [ $yes_or_no = "n" ];
    then
 echo "---- Completing to another features ----"
 else
 echo "wrong choice"
 fi
 fi
	
}
sync