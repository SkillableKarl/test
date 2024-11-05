@description('Use the Resource Group Location')
param location string = resourceGroup().location

resource acr 'Microsoft.ContainerRegistry/registries@2021-09-01' = {
  name: 'myFixedRegistryName'  // Set a specific name
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: false
  }
}

@description('Output the login server property for later use')
output acrLoginServer string = acr.properties.loginServer
