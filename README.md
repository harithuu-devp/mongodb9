# Custom MongoDB 9 Container for Local Development

## 1. Clone repo
```
git clone https://github.com/harithuu-devp/mongodb9.git
```

If use docker, rename compose.yml to docker-compose.yml

## 2. inside mongodb9, run compose up

````
cd mongodb9
podman-compose up -d

<!-- if use docker -->
docker-compose up -d
````
## 3. Install MongoDB Compass to easily manage database. 

connect to mongodb://localhost:27017/