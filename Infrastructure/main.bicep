param environment string = 'dev'
param location string = 'westus'

targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: 'rg-demo-${location}-${environment}'
  location: location
}

module env 'modules/aca-environment.bicep' = {
  scope: resourceGroup(rg.name)
  name: 'aca'
  params: {
    location: location
    environmentName: environment
  }
}

module demoApp 'modules/aca-app.bicep' = {
  scope: resourceGroup(rg.name)
  name: 'aca-demo-app'
  params: {
    location: location
    environmentId: env.outputs.environmentId
    appName: 'demo-app'
    containerImage: 'nginx:latest'
  }
}

module demoAppTwo 'modules/aca-app.bicep' = {
  scope: resourceGroup(rg.name)
  name: 'aca-demo-app-two'
  params: {
    location: location
    environmentId: env.outputs.environmentId
    appName: 'demo-app-two'
    containerImage: 'nginx:latest'
  }
}
