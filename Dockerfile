FROM nginx:1.21.1
LABEL maintainer="Léo LEBRAT"
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y curl && \
    apt-get install -y git
COPY nginx.conf /etc/nginx/conf.d/default.conf
ADD static-website-example/ /usr/share/nginx/html/
CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
