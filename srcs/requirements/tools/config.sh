# clear
echo "=== INCEPTION CONFIGURATION ==="

printf "\nEnter the path where to create your mariadb database and wordpress files"
printf "\nExemple : /home/jcluzet/data\n"
read path

#if this repertory doesn't exist, create it and set the permissions
if [ ! -d "$path" ]; then
    echo "This repertory doesn't exist, please create it"
    exit 1
fi

echo "$path" > srcs/requirements/tools/data_path.txt

cp srcs/requirements/tools/template_compose.yml srcs/docker-compose.yml

# replace 'path/to/data' by the path entered by the user in srcs/docker-compose.yml
cat srcs/docker-compose.yml | sed "s+pathtodata+$path+g" > srcs/docker-compose.yml.tmp
mv srcs/docker-compose.yml.tmp srcs/docker-compose.yml
