#!/bin/bash

echo "Restoring backed up volumes will overwrite the current data in the  docker volumes!"
echo "The containers will be restarted afterwards."

read -r -p "Are you sure you want to continue? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
	echo "Ensuring containers are up"
	docker-compose up -d
    	
	echo "Restoring data..."
	docker run --rm --volumes-from influxdb -v $(pwd)/backups/influxdb:/backup ubuntu bash -c "tar xvf /backup/backup.tar"
	docker run --rm --volumes-from grafana -v $(pwd)/backups/grafana:/backup ubuntu bash -c "tar xvf /backup/backup.tar"
	docker run --rm --volumes-from node-red -v $(pwd)/backups/node-red:/backup ubuntu bash -c "tar xvf /backup/backup.tar"
	docker run --rm --volumes-from mosquitto -v $(pwd)/backups/mosquitto:/backup ubuntu bash -c "tar xvf /backup/backup.tar"
	echo "Rebooting containers..."
	docker-compose down
	./run.sh
	echo "Done!"
        ;;
    *)
	echo "Aborting"
	exit
	;;
esac
