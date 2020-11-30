# docker-compose up -d --build
# docker rm $(docker ps -a | grep "Exited" | awk '{print $1 }')
# docker rmi $(docker images | grep "none" | awk '{print $3}')

docker run --rm -it -v $(pwd):/src klakegg/hugo:0.78.2-ext-alpine --minify
./gzip.sh public
mv -f ./public/ /root/nginx/html/blog
