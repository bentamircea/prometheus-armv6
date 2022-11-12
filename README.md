# prometheus-armv6

## Build
```
docker build . --network host --build-arg "version=2.40.1" -t mrbenta/prometheus
```
## Create container
```
docker create --name prometheus -e TZ=Europe/Bucharest --restart unless-stopped -p 9090:9090 -v /home/dani/prometheus/data:/data -v /home/dani/prometheus/config:/config mrbenta/prometheus
docker start prometheus
```
