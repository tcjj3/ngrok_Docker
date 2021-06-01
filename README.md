# ngrok_Docker
Docker for setup websites, using [**ngrok**](https://ngrok.com/).


## Start:

1. Install docker-ce:
```
[tcjj3@debian]$ sudo apt install -y curl
[tcjj3@debian]$ curl -fsSL get.docker.com -o get-docker.sh
[tcjj3@debian]$ sudo sh get-docker.sh
[tcjj3@debian]$ sudo groupadd docker
[tcjj3@debian]$ sudo usermod -aG docker $USER
[tcjj3@debian]$ sudo systemctl enable docker && sudo systemctl start docker
```
<br>
<br>

2. Run ngrok_Docker:

```
sudo docker run -d -i -t \
 --restart always \
 --name=ngrok_website \
 -e AUTHTOKEN=xxxxxxxxxxxxxxxxxx \
 -e REGION=us \
 -e PROTOCOL=http \
 -e SUBDOMAIN=test \
 -e HOST="http://192.168.1.1:80" \
 -p 4040:4041 \
 tcjj3/ngrok_docker:latest
```


In this case, `AUTHTOKEN` environment variable is "`xxxxxxxxxxxxxxxxxx`", you can [**get your `authtoken`**](https://dashboard.ngrok.com/get-started/your-authtoken) from [**ngrok site**](https://ngrok.com/) by [**register an account**](https://dashboard.ngrok.com/signup).
<br>
<br>

If you want to choose the `server region`, just set the `REGION` environment variable to one of the following string: `us, eu, au, ap, sa, jp, in`. The default `server region` is "`us`".
<br>
<br>
The region explains are:

```
    us - United States (Ohio)      - *.ngrok.io
    eu - Europe (Frankfurt)        - *.eu.ngrok.io
    ap - Asia/Pacific (Singapore)  - *.ap.ngrok.io
    au - Australia (Sydney)        - *.au.ngrok.io
    sa - South America (Sao Paulo) - *.sa.ngrok.io
    jp - Japan (Tokyo)             - *.jp.ngrok.io
    in - India (Mumbai)            - *.in.ngrok.io
```
<br>

The `PROTOCOL` environment variable is "`http`" (or can be "`tcp`").
<br>
<br>

If `PROTOCOL` environment variable is "`http`", just set `SUBDOMAIN` environment variable to the name you wish for domain "`.ngrok.io`".
<br>
For example, the `SUBDOMAIN` environment variable is "`test`", and the domain depends on the `REGION` environment variable, are:
```
    us - test.ngrok.io
    eu - test.eu.ngrok.io
    ap - test.ap.ngrok.io
    au - test.au.ngrok.io
    sa - test.sa.ngrok.io
    jp - test.jp.ngrok.io
    in - test.in.ngrok.io
```
<br>

If `PROTOCOL` environment variable is "`tcp`", just set `REMOTE_ADDR` environment variable to `the remote address included port`, such as "`1.tcp.ngrok.io:27210`".
<br>
<br>

And the `HOST` environment variable can be just "`a local port`", "`host:port`", or "`http(s)://host:port` (when `PROTOCOL` is `http`)".
<br>
<br>


Finally, the port "`4041`" in the container is the "`HTTP Web Interface`" of ngrok, and forwarded by nginx, you can find your "`tunnel URLs`" in this page (such as **http://127.0.0.1:4040/**). If you don't need this port, just remove the `4041 port forward` argument.






