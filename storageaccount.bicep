param storageaccname string
param location string
resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageaccname
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
}
