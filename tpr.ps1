#Open With typora
param($filename)
IF (test-path $filename){
D:\program\Typora\Typora.exe $filename
}ELSE
{
new-item $filename
D:\program\Typora\Typora.exe $filename
}
'Open' + $filename + 'With Typora'
