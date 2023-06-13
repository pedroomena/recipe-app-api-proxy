FROM nginxinc/nginx-unprivileged:1-alpine
LABEL maintainer="omenaph@gmail.com"

COPY ./default.conf.tpl /etc/nginx/default.conf.tpl
COPY ./uwsgi_params /etc/nginx/uwsgi_params

ENV LISTEN_PORT=8000
ENV APP_HOST=app
ENV APP_PORT=9000

# Switch to root user to create files and directories
USER root

# Create dir of the static files to be served and
# Give permissions to other users to read from it
RUN mkdir -p /vol/static
RUN chmod 755 /vol/static

# Create the file containing nginx's config and give 
# ownership go nginx user for it to be able to populate 
# it with the command call below
RUN touch /etc/nginx/conf.d/default.conf
RUN chown nginx:nginx /etc/nginx/conf.d/default.conf

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER nginx

CMD ["/entrypoint.sh"]
