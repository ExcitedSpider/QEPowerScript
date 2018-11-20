#使用ffmpeg裁剪video以及分离出音频
param($source, $start, $duration, $outname)

ffmpeg -i $source -ss $start -t $duration -c:a copy ($outname+'.mp4')
ffmpeg -i ($outname+'.mp4') -vn -y -ar 44100 -acodec copy ($outname+'.aac')

