echo Building docker image
echo
echo

cd Docker
docker build -t atalablog .

echo
echo
echo Docker image has been built. Launching docker container. The blog will be availble on http://192.168.99.100:5000. 
echo To stop the server press Ctrl-C
echo 
echo

docker-compose up
cd ..