FROM alpine/git AS build

# I decided to use server directly because 
# framework was just too hacky for me

RUN git clone --depth=1 https://github.com/kaboomserver/server.git /server

FROM eclipse-temurin:21-jre-alpine AS runtime

ADD start.sh /start.sh

COPY --from=build /server /server

CMD ["/start.sh"]

# https://github.com/kaboomserver/framework/blob/master/config/iptables
EXPOSE 25565/tcp
EXPOSE 19132/udp
