#!/usr/bin/env bash
Year=$(date +%Y)
Month=$(date +%m)
Day=$(date +%d)
Current_Time=$(date +%H)
AM_Or_PM=$(date +%p)
Start_of_time=00
End_of_time=05



if [ -d ~/Reports ];

then
echo " Reports directory exist "
echo "$Current_Time"
elif [ ! -d ~/Reports ];
then
        mkdir -p ~/Reports/$Year
        mkdir ~/backups
        for i in 1 3 5 7 8 10 12
        do
                mkdir ~/Reports/$Year/$i/
                             touch ~/Reports/$Year/$i/{01..31}.xls
        done
        for i in 4 6 9 11
        do
                mkdir ~/Reports/$Year/$i/
                touch ~/Reports/$Year/$i/{1..30}.xls
        done
        mkdir ~/Reports/$Year/2
        touch ~/Reports/$Year/2/{1..28}.xls
elif [! -d ~/Reports/$Year ];
then
        mkdir -p ~/Reports/$Year
        mkdir ~/backups
        for i in 1 3 5 7 8 10 12
        do
                mkdir ~/Reports/$Year/$i/
                touch ~/Reports/$Year/$i/{01..31}.xls
        done
        for i in 4 6 9 11
        do
                mkdir ~/Reports/$Year/$i/
                touch ~/Reports/$Year/$i/{1..30}.xls
        done
 mkdir ~/Reports/$Year/2
        touch ~/Reports/$Year/2/{1..28}.xls


elif [ ! -f ~/Reports/$Year/$Month/$Day.xls ];
then
        touch ~/Reports/$Year/$Month/$Day.xls
fi


if [ $Current_Time <= $End_of_time ] || [ $Current_Time == $Start_of_time ] && [ $AM_Or_PM -eq "AM" ]
then
     echo "backup done"
     cp -г ~/Reports ~/backups

else
     echo " backup starts between 12AM and 5AM not now "
fi
                                                              41,4          51%
            
                            