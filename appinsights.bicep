param appinsightsname string
param location string
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: appinsightsname
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

output Oinstrumentationkey string = appInsights.properties.InstrumentationKey
