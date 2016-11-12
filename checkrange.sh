#!/bin/bash
for ip in $(seq a b); do
        if ping -c1 -W1 xxx.xxx.xx.$ip; then
                echo $ip "runs" >>ip.txt
                status=$(sshpass -p "password"  ssh -o ConnectTimeout=4  user@xxx.xxx.xx.$ip echo 'success')
                        if [[ $status == 'success' ]];then
                                OS=$(uname -r)
                                echo $ip "is running version" $OS >>ip.txt
                        else
                                echo "can't ssh"
                        fi
        else
                echo "not running"
        fi
done
