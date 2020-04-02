# docker-influxdb-grafana-nodered-mqtt

## InfluxDB 
A time series database.  
Configuration can be done with the influxdb.env file.

## Grafana
A dashboard tool.
Configuration is done in the grafana.env file.
To connect it to the influxdb database the 'influxdb' hostname can be used: http://influxdb:8086

## Node-red
Node red configuration has to be done in the docker volume itself.

## Node red configuration doesn

## Usage of the scripts
### Intial configuration and starting the containers (only run once)
```bash
./run.sh -c
```

### Starting the containers 
```bash
./run.sh
```

### Stopping the containers
```bash
docker-compose down
```

### Backing up containers
```bash
./backup.sh
```
Will create a backups folder with the container configurations and data.

### Restoring containers
```bash
./restore_backup.sh
```
Will restore the container configurations and data from the backups folder.

## TODO
- Add mqtt container.
- Add node-red password setup to the run.sh script
