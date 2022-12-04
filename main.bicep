param appserviceplanname string = 'appserviceplan-dev-123z'
param webapplicationname string = 'webapp-dev-123z'
param location string = resourceGroup().location
param storageaccname string = 'storageaccdev123z'
param appinsightsname string = 'appinsight-dev-123z'

module appservice 'appservice.bicep' = {
  name: 'appservice'
#disable-next-line explicit-values-for-loc-params
  params:{
    appserviceplanname: appserviceplanname
    webapplicationname: webapplicationname
    instrumentationkey: appinsights.outputs.Oinstrumentationkey
    location: location
  }
}
module storageaccount 'storageaccount.bicep' = {
  name: 'storageaccount'
  params: {
    storageaccname: storageaccname
    location: location
  }
}
 module appinsights 'appinsights.bicep' = {
  name: 'appinsights'
  params: {
    appinsightsname: appinsightsname
    location: location
  }
 }
