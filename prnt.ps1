
#use default printer to print file
param($filename,$whatif)
start-process $filename -Verb Print -wait
'print '+$filename
