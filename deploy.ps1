#
# deploy.ps1
#

#Login-AzureRmAccount

#$subscriptionId = '60b6165a-8669-47a2-860c-6ef475127364'
$subscriptionId = '3a4af7b3-b7ac-463d-9940-1d80445961a8'
Set-AzureRmContext -SubscriptionID $subscriptionId


#Get-AzureRmComputeResourceSku | where {$_.Locations.Contains("eastus")}

$timestamp = Get-Date -Format "yyyy-MM-dd_hh-mm-ss"
#
#
#
New-AzureRmResourceGroupDeployment -Name "D_$timestamp" -ResourceGroupName GCbluePrintUser1 `
-TemplateFile .\azuredeploy.json -TemplateParameterFile .\azuredeploy.parameters.json `
-Mode Incremental -DeploymentDebugLogLevel ResponseContent -Verbose 

