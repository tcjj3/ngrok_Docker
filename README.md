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


In this case, `AUTHTOKEN` environment variable is "`xxxxxxxxxxxxxxxxxx`", you can [**get your `authtoken`**](https://dashboard.ngrok.com/auth) from [**ngrok site**](https://ngrok.com/) by [**register an account**](https://dashboard.ngrok.com/signup).
<br>
<br>

If you want to choose the `server region`, just set the `REGION` environment variable to one of the following string: `us, eu, au, ap, sa, jp, in`. The default `server region` is "`us`".
<br>
<br>
The region explains are:

```
    us - United States (Ohio)       ->  tunnel.us.ngrok.com:443  ->  *.ngrok.io   
    eu - Europe (Frankfurt)         ->  tunnel.eu.ngrok.com:443  ->  *.eu.ngrok.io
    ap - Asia/Pacific (Singapore)   ->  tunnel.ap.ngrok.com:443  ->  *.ap.ngrok.io
    au - Australia (Sydney)         ->  tunnel.au.ngrok.com:443  ->  *.au.ngrok.io
    sa - South America (Sao Paulo)  ->  tunnel.sa.ngrok.com:443  ->  *.sa.ngrok.io
    jp - Japan (Tokyo)              ->  tunnel.jp.ngrok.com:443  ->  *.jp.ngrok.io
    in - India (Mumbai)             ->  tunnel.in.ngrok.com:443  ->  *.in.ngrok.io
```
<br>

The `PROTOCOL` environment variable is "`http`" (or can be "`tcp`").
<br>
<br>

If `PROTOCOL` environment variable is "`http`", just set `SUBDOMAIN` environment variable to the name you wish for domain "`.ngrok.io`".
<br>
For example, the `SUBDOMAIN` environment variable is "`test`", and the domain depends on the `REGION` environment variable, are:
```
    us - tunnel.us.ngrok.com:443  ->  test.ngrok.io     ->  http://test.ngrok.io/ or https://test.ngrok.io/
    eu - tunnel.eu.ngrok.com:443  ->  test.eu.ngrok.io  ->  http://test.eu.ngrok.io/ or https://test.eu.ngrok.io/
    ap - tunnel.ap.ngrok.com:443  ->  test.ap.ngrok.io  ->  http://test.ap.ngrok.io/ or https://test.ap.ngrok.io/
    au - tunnel.au.ngrok.com:443  ->  test.au.ngrok.io  ->  http://test.au.ngrok.io/ or https://test.au.ngrok.io/
    sa - tunnel.sa.ngrok.com:443  ->  test.sa.ngrok.io  ->  http://test.sa.ngrok.io/ or https://test.sa.ngrok.io/
    jp - tunnel.jp.ngrok.com:443  ->  test.jp.ngrok.io  ->  http://test.jp.ngrok.io/ or https://test.jp.ngrok.io/
    in - tunnel.in.ngrok.com:443  ->  test.in.ngrok.io  ->  http://test.in.ngrok.io/ or https://test.in.ngrok.io/
```
<br>

If `PROTOCOL` environment variable is "`tcp`", just set `REMOTE_ADDR` environment variable to `the remote address included port`, such as "`1.tcp.ngrok.io:27210`".
<br>
<br>

And the `HOST` environment variable can be just "`a local port`", "`host:port`", or "`http(s)://host:port` (when `PROTOCOL` is `http`)".
<br>
<br>


Finally, the port "`4041`" in the container is the "`HTTP Web Interface`" of ngrok, and forwarded by nginx, you can find your "`tunnel URLs`" in this page (such as **http://127.0.0.1:4040/**). If you don't need this port, just remove the `4041 port forward` argument.






