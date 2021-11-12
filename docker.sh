cwd=`cd $(dirname $0); pwd -P`
echo $cwd
docker run --name nginx-test -v $cwd/dist:/usr/share/nginx/html -p 8080:80 -d nginx