param appserviceplanname string
param webapplicationname string
param instrumentationkey string

param location string


resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: appserviceplanname
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}
resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: webapplicationname
  location: location
  properties:{
    serverFarmId: appServicePlan.id

  }
}

resource webappsettings 'Microsoft.Web/sites/config@2022-03-01' = {
  name: 'appsettings'
  parent: webApplication
  properties: {
    APPINSIGHTS_INSTRUMENTATIONKEY: instrumentationkey
  }
}


