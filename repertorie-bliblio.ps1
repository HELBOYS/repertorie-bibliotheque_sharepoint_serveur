#Charger les assemblies CSOM de SharePoint
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"
    

$SiteURL="http://vm2008-zoran:15000"
   
 
$Ctx = New-Object Microsoft.SharePoint.Client.ClientContext($SiteURL)
$Ctx.Credentials = $Credentials
    
#Obtien les listes
$Ctx.Load($Ctx.Web.Lists)
$Ctx.executeQuery()
  
#Filtrez les bibliothèques de documents de la collection Lists.
$Lists = $Ctx.Web.Lists | Where {$_.BaseType -eq "DocumentLibrary" -and $_.Hidden -eq $False}
 
#Boucle dans chaque bibliothèque de documents et obtien le titre
Foreach ($List in $Lists)
{
    Write-host $List.Title
}
