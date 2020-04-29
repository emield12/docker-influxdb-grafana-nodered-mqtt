# docker-influxdb-grafana-nodered-mqtt

A docker-compose application that combines the influxdb, grafana, nodered and mqtt.

## Configuring and starting containers (only run once initially)
On the the first run use the -c option to initially configure the images. 
```
./run.sh -c
```
This will prompt for a an admin username and password for the influxdb database. Ensure that the __INFLUXDB_HTTP_AUTH_ENABLED__ variable is set to false in the **influxdb.env** file, otherwise the script will not be able to create the user. Once the configuration is done this variable can be set back to true and the containers restarted. Then you can login to influxd with your admin password and username.

## Starting the containers 
```bash
./run.sh
```

## Stopping the containers
```bash
docker-compose down
```

## Backing up containers
```bash
./backup.sh
```
Will create a backups folder with the container configurations and data.

## Restoring containers
```bash
./restore_backup.sh
```
Will restore the container configurations and data from the backups folder.

## Configuration
### InfluxDB config 
Configuration can be done with the influxdb.env file.

### Grafana config
Configuration is done in the grafana.env file.
To connect it to the influxdb database the 'influxdb' hostname can be used: http://influxdb:8086

### Node-red
Node red configuration has to be done in the docker volume itself.

### MQTT
The mosquitto configuration has to be done in the docker volume itself.

## TODO
- Add node-red password setup to the run.sh script
- Automate influxdb configuration in run script
