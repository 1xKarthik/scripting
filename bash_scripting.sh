#!/bin/bash
VARIABLE="bas"
echo "YOLO $VARIABLE NIGGA!"
echo "YOLO ${VARIABLE}ing NIGGA!"
SERVER_NAME=$(hostname)
SERVER=`pwd`
echo "hostname: $SERVER_NAME $SERVER"
if [ -e /etc/passwd ]
then
    echo "YEASS"
fi
if [ "$VARIABLE" = "bash" ]
then
    echo "YAYYY"
elif [ -z /tmp/sleepy.sh ]
then
    echo "YEP"
else
    echo "FO!"
fi
#for COLOR in red green blue
#do
#echo "COLOR: $COLOR"
#done

COLORS="red green blue"
for COLOR in $COLORS
do
    echo "COLOR: $COLOR"
done

#!/bin/bash
FILES=$(ls *.jpg)
DATE=$(date +%F)
for FILE in $FILES
do
    echo "renaming $FILE to $FILE-$DATE"
    mv $FILE "$FILE-$DATE"
done

#!/bin/bash
FILES=$(ls f*)
for FILE in $FILES
do
    case "$FILE" in
        *.jpg) echo "NOPE" ;;
        *) mv $FILE "${FILE}.jpg" ;;
    esac
done

#!/bin/bash
read -p "Enter a user name: " USER
for USER in $@
do
    passwd -l $USER
    mkdir -p /archives && tar cf $_/${USER}.tar.gz /home/${USER}
done

!/bin/bash
for ARG in $@
do
    if [ -r $ARG ];
    then
        echo "readable"
        file $ARG
        file --mime-type -b $ARG
        echo -e "$(ls -al ${ARG})\n"
    else
        echo "not readable"
    fi
done

---
!/bin/bash
read -p "Enter the name: " ARG
if [ -r $ARG ];
then
    echo "readable"
    file $ARG
    file --mime-type -b $ARG
    echo -e "$(ls -al ${ARG})\n"
else
    echo "not readable"
fi
---

#!/bin/bash
read -p "Enter the name of a file or directory: " NAME
if [ -f $NAME  ]
then
        TYPE=$(file --mime-type -b $NAME)
        echo "FILE: this is a $TYPE"
        exit 0
elif [ -d $NAME ]
then
        echo "this is directory"
        exit 1
else
        echo "OTHER: this is a $TYPE"
        exit 2
fi
---

#!/bin/bash
cat /etc/shado 1> /dev/null
STATUS=$?
if [ $STATUS -eq "0" ]
then
        echo "Command succeeded"
        exit 0
else
        echo "Command failed"
        exit 1
fi
---

#!/bin/bash
function backup_file() {
        if [ -f $1 ]
        then
                BACK="/tmp/$(basename ${1}).$(date +%F).$$"
                echo "Backing up $1 to ${BACK}"
                cp $1 $BACK
        fi
}
backup_file $1
if [ $? -eq 0 ]
then
        echo "Backup Succeeded!"
fi
---

#!/bin/bash
function file_count(){
        local COUNT=$(ls -1 | wc -l)
        echo $COUNT
}
file_count
---

# for directory
#!/bin/bash
function file_count(){
        echo "$(basename ${1}:)"
        local COUNT=$(ls -1 $1 | wc -l)
        echo $COUNT
}
file_count $1