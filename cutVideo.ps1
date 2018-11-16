
param($source, $start, $duration, $outname)
$outvideo = $outname + ".mp4"
$outaac=$outname + ".aac"
ffmpeg -i $source -ss $start -t $duration -c:a copy $outvideo
ffmpeg -i $outvideo -vn -y -ar 44100 -acodec copy $outaac

