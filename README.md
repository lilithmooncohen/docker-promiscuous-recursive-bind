# Running

```
docker-compose up -d
```
or
```
docker run --name=bind -d \
--restart=always \
-e DNS_SERVERS="8.8.8.8 8.8.4.4" \
-p 53:53 \
-p 53:53/udp \
ryanckoch/promiscuous-recursive-bind
```
