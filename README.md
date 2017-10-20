# AzureFileBroker PCF Tile

This project is used to generate a PCF tile for [azurefilebroker](https://github.com/cloudfoundry/azurefilebroker). A BOSH release for the [azurefilebroker](https://github.com/cloudfoundry/smb-volume-release).

## Build Tile
* Clone the code to your local bosh machine
* Install [Tile Generator Tool](http://docs.pivotal.io/tiledev/tile-generator.html)
* Run command `tile build`

## Deployment
* Using OpsManager website upload the tile
* Add tile to dashboard
* Configure tile
* Apply Changes
* Run cf service-brokers to check the broker status