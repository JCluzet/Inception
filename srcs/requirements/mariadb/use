if [ "$1" == "--loop" ]
then
    while true
    do
        ./use "--msg"
        # sleep 1
    done
fi

docker build -t inception . >/dev/null 2>&1
if [ $? -eq 0 ]; then
        # echo "---"
        if [ "$1" == "--msg" ]
        then
            clear
        fi
        echo "Inception part is builded ✅"
    else
     if [ "$1" != "--msg" ]; then
        echo "ERROR:"
        echo "---"
        echo " "
        docker build -t inception .
        echo " "
        echo "---"
        fi
        if [ "$1" == "--msg" ]; then
        bal=$(docker build -t inception . 2>&1) 
        clear
        echo "Inception part is not builded ❌ :"
        echo " "
        echo $bal | sed 's/^/\t/' | sed 's/\n/\n\t/' | sed 's/\t$//' | sed 's/^\t//' | sed 's/^/\t/' | sed 's/^/\t/' 
        else
        echo "Solve this problem, Inception is not builded ❌"
        fi
        exit 1
    fi
    if [ "$1" != "--msg" ]; then
        
echo "Launch with -it ? (y/n)"
read answer
if [ "$answer" = "y" ]; then
    echo "Use 'exit' to stop container"
    docker run -it inception
else
    docker run inception
fi
    fi