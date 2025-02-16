task default -Depends list

task list {
    Get-PSakeScriptTasks
}

task clean {
    Remove-Item -Recurse -Force bin
}

task build {
    $out = "./bin/go-min-win-service.exe"
    $env:GOOS = "windows"
    $env:GOARCH = "amd64"
    $env:CGO_ENABLED = "0"
    go build -ldflags "-s -w" -o $out .
    $size = (Get-Item $out).Length
    $sizeInMB = [math]::Round($size / 1MB, 2)
    Write-Output "Size of built exe file: $sizeInMB MB ($size bytes)"
}
