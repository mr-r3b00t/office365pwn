$email = "targetemail@targetdomain.local"

$office365 = Invoke-WebRequest -Uri "https://login.microsoftonline.com/getuserrealm.srf?login=$email&xml=1" -Body $body -ContentType "application/xml"-Headers $headers

foreach($element in $office365.Content){
$status = select-xml -content $element -XPath "//NameSpaceType" | foreach {$_.node.InnerXML}
$DomainName = select-xml -content $element -XPath "//DomainName" | foreach {$_.node.InnerXML}
}

$DomainName

if($status -like "*Managed*"){write-host "Office 365 Managed" -ForegroundColor Green}
if($status -like "*Federated*"){write-host "Office 365 Federated" -ForegroundColor Green}
if($status -like "*Unknown*"){write-host "Not Managed" -ForegroundColor Red}

#Now we have a domain attack this via some tools
#But make sure you do Recon first - head to the website, LinkedIn, Facebook, IG, Twitter etc.
#Also check breach databases, pastebin, ghostbin, google dorks etc.

#Office365Recon
#https://github.com/nyxgeek/o365recon

#MailSniper
#https://github.com/dafthack/MailSniper
