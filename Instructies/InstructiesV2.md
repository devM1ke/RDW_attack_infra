# Docker Setup

The docker setup is pretty straight forward.  It installs docker on your host which will then allow you to use the **Dockerfiles** for the other pieces of the infrastructure.

**Example**

`sudo .\dockersetup.sh `

# C2 Server Docker build

## Empire

```dockerfile
# with persistent storage
docker pull bcsecurity/empire:latest
docker create -v /empire --name data1 bcsecurity/empire:latest
docker run -it --volumes-from data1 bcsecurity/empire:latest
```

Finally to expose it to a public IP: 

```dockerfile
docker run -ti --volumes-from data1 -p 70.x.x.x:80:80 bcsecurity/empire:latest
```

To overwrite the entry point simply do:

```dockerfile
$ docker run -ti --entrypoint bash ebcsecurity/empire:latest
```

More reading and examples:

https://github.com/BC-SECURITY/Empire/wiki/Quickstart

# REDIRECTORS USAGE GUIDE

## DNS

The DNS redirector uses IPTables to forward traffic from the victim machine to the TeamServer. The usage is pretty straight forward.. ***dns_redir.sh ip.to.fwd.to port\***

**EXAMPLE**

```bash
.\DNS_redir.sh help  
sudo .\DNS_redir.sh *ip to fwd* *port*
```



## HTTP/HTTPS

The HTTP/HTTPS redirector is a docker that uses NGINX proxy forwarding to forward traffic from
 the victim maching to the TeamServer.

**Build the Docker Image**

**TEAM_SERVER** - This is the IP ADDR of the Team Server
**LPORT** - This is the Port that the NGINX Server will listen on (use 80 for http 443 for https)

**HTTP**(Run command in HTTP folder)

```dockerfile
sudo docker build --build-arg TEAM_SERVER="http://TEAM_SERVER_IP:port_fwdg_to" --build-arg LPORT=80 ./
```

**HTTPS**(Run command in HTTPS folder)

```dockerfile
sudo docker build --build-arg TEAM_SERVER="https://TEAM_SERVER_IP:port_fwdg_to" --build-arg LPORT=443 ./
```

**Create a container**
**a.b.c.d** - This is the public IP for the Redirector(if using AWS, use the internal IP for the server)
**e** - This is the port that will be exposed on the host
**f** - This is the port that will correspond with the port you specified with the LPORT value when the image was built.  It will be mapped to the port exposed on the host.

```dockerfile
docker run -d -p a.b.c.d:e:f ./
```

**HTTP Example:**(Run command in HTTP folder)

```dockerfile
docker run -d -p 53.43.177.239:80:80 ./
```

**HTTPS Example**(Run command in HTTPS folder)

```dockerfile
docker run -d -p 53.43.177.239:443:443 ./
```

# GoPhish setup

The GoPhish container allows you to manage your phishing campaign.   It allows you to monitor emails delivered, opened, and clicked links. Gophish is a phishing framework that makes  the simulation of real-world phishing attacks dead-simple. Per the  creators of GoPhish [Located Here](https://www.gitbook.com/book/gophish/user-guide/details); "The idea behind gophish is simple – make industry-grade phishing training available to everyone."



## **Build Docker image**

```dockerfile
sudo su

sudo docker build ./

sudo cd /opt

sudo ./gophish
```

## Use GoPhish

After Gophish starts up, you can open a browser and navigate to **https://127.0.0.1:3333** to reach the login page.

The default credentials are: Username: **admin** Password: **gophish**