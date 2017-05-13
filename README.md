# Devops
Access Log Parser:

Basically Script will work to fetch statitics based on argument provided 


1. Script will generate Statitics report based on Input Provided as Argument.
		Script works based on Argument as describe below:
		
		sh nginx_log.sh IP
		sh nginx_log.sh RESPONSE
		sh nginx_log.sh USERAGENT
		sh nginx_log.sh URL
		sh nginx_log.sh RATIO
		
		Once We got Request from REST API , Machine Execute the  script and generate File in ./result/Ipbased_hotlist_stat Like:
		sh nginx_log.sh IP
		
		REST API will Fetch that Ipbased_hotlist_stat Report in Response.
		
Suggestion : Go with Splunk or Graylog for Log analyis.
