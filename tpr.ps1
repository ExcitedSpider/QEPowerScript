#Open With typora
param($filename)

$typoraPath = 'C:\Program Files\Typora\Typora.exe'

IF (test-path $filename) {
  (Start-Process -FilePath $typoraPath -ArgumentList $filename) | Out-Null
}
ELSE {
  new-item $filename
  (Start-Process -FilePath $typoraPath -ArgumentList $filename) | Out-Null
}
'Open' + $filename + 'With Typora'
