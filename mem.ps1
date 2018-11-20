$ops = Get-WmiObject -Class Win32_OperatingSystem
"¿ÉÓÃÄÚ´æ(MB): {0}" -f ([math]::round($ops.FreePhysicalMemory / 1kb, 2))