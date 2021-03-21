FROM alpine
RUN apk add openssh-client
RUN apk add autossh
RUN adduser -s -H -D kanary-tunnel
WORKDIR /home/kanary-tunnel
RUN mkdir pem
ADD ./start-tunnel.sh ./start-tunnel.sh 
RUN chmod +x start-tunnel.sh 
ENTRYPOINT "/home/kanary-tunnel/start-tunnel.sh" ]

