FROM klakegg/hugo:0.78.2-ext-alpine-onbuild AS hugo

FROM nginx:1.19.3-alpine
COPY --from=hugo /target /usr/share/nginx/html