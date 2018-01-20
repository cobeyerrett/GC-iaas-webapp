#
# deploy.ps1
#

#Login-AzureRmAccount

$subscriptionId = '60b6165a-8669-47a2-860c-6ef475127364'

$parameters=@{
    workspaceRegion = "canadacentral"
    environmentName ="AzureCloud"
    keyVaultName = "GCKeystoreUser1"
    keyVaultResourceGroupName = "GCbluePrintUser1"
    domainName = "GCblueprint.local"
    configureSQLAO = "yes"
    environmentPrefix = "prod"
    numberOfWebInstances = 2
    useExistingKek = "kek"
   # encryptionEnabled = true
    adVMSize = "Standard_DS1"
    sqlVMSize = "Standard_DS1"
    webVMSize = "Standard_DS1"
    mgtVMSize = "Standard_DS1"
    witnessVMSize = "Standard_DS1"
    sqlStorageAccountType = "Standard_GRS"
    dcStorageAccountType = "Standard_GRS"
    webStorageAccountType = "Standard_GRS"
    mgtStorageAccountType = "Standard_GRS"
    templatesBaseUrl = "https://raw.githubusercontent.com/mosharafMS/GC-iaas-webapp/court/nestedtemplates"
    dscBaseUrl = "https://raw.githubusercontent.com/mosharafMS/GC-iaas-webapp/court/DSC"
    scriptsBaseUrl = "https://raw.githubusercontent.com/mosharafMS/GC-iaas-webapp/court/custom-scripts"
    sqlServerVersion = "SQL2016-WS2012R2"
    gatewaySkuName = "WAF_Medium"
}


$timestamp = Get-Date -Format "yyyy-MM-dd_hh-mm-ss"
New-AzureRmResourceGroupDeployment -Name "D_$timestamp" -ResourceGroupName GCbluePrintUser1 `
-TemplateFile .\azuredeploy.json -TemplateParameterObject $parameters `
-Mode Incremental -DeploymentDebugLogLevel ResponseContent -Verbose 
