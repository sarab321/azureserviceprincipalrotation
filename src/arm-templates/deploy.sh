# Deploy the Rotator
az deployment group create --name RotatorFunction --resource-group 'testsrelabrg' --template-file function.json  --parameters keyVaultName='testsrelabkeyvault' functionAppName='testsrelabfapp' secretName='testsrelabsecret'

# deploy the function app code
func azure functionapp publish testsrelabfapp

# Deploy the Event listener for the secret you want to rotate (one per secret, or simply remove the filter to include all events)
az deployment group create --name RotatorEventSubscription --resource-group 'testsrelabrg' --template-file events.json  --parameters keyVaultName='testsrelabkeyvault' functionAppName='testsrelabfapp' secretName='testsrelabsecret'


