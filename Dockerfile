FROM alpine:3.17.0

EXPOSE 8118 9050

RUN apk --update add privoxy tor runit tini

COPY service /etc/service/

RUN chmod -R 777 /etc/service/

ENTRYPOINT ["tini", "--"]
CMD ["runsvdir", "/etc/service"]
