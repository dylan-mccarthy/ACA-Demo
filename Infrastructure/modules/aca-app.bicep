param appName string
param environmentId string
param containerImage string
param location string = resourceGroup().location

resource containerApp 'microsoft.App/containerApps@2022-03-01' = {
  name: appName
  location: location
  properties: {
    managedEnvironmentId: environmentId
    configuration: {
      ingress: {
        targetPort: 80
        external: true
      }
    }
    template: {
      containers: [
        {
          name: '${appName}-container'
          image: containerImage
        }
      ]
    }
  }
}
