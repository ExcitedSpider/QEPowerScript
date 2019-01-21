param(
  $title
)

if($null -eq $title)
{
  $title = 'newmd'
}
$dateinfo=Get-Date
$date = "{0}-{1}-{2}-" -f($dateinfo.Year,$dateinfo.Month, $dateinfo.Day)

$markdownPath = 'C:\Users\36064\OneDrive\markdowns'
# change this when need

$title = $date+$title+'.md'


try{
  $md = new-item -Path $markdownPath -Name $title
  tpr $md
}catch{
  throw 'already has markdown with same name.'
}


