param(
  $times
)

"{0}dB" -f (10*[math]::Log10($times))