ARG NODE_VERSION
FROM mhart/alpine-node:${NODE_VERSION}
RUN set -e; \
  apk --no-cache add bash git; \
  addgroup node; \
  adduser -h /home/node -G node -D node;
# ENV HOME /home/node
# RUN mkdir -p /home/node
# RUN chown node:node /home/node
WORKDIR /opt
USER node:node
CMD ["node", "."]
