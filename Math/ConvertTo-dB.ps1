param(
  $times,
)

"{0}dBm" -f (10*[math]::Log10($times))