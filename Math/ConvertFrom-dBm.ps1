param(
  $dBm
)

"{0}mW" -f([Math]::Pow(10,($dBm)/10.0))