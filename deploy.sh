# docker-compose up -d --build
# docker rm $(docker ps -a | grep "Exited" | awk '{print $1 }')
# docker rmi $(docker images | grep "none" | awk '{print $3}')

echo "docker run --rm -it -v $PWD:/src klakegg/hugo:0.78.2-ext-alpine --minify"
docker run --rm -it -v $PWD:/src klakegg/hugo:0.78.2-ext-alpine --minify
echo "./gzip.sh public"
./gzip.sh public
rm -rf /root/nginx/html/blog
mv -f ./public/ /root/nginx/html/blog
