param(
  $mW
)

"{0}dBm" -f (10*[math]::Log10($mW))