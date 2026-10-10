$ErrorActionPreference = "Stop"
$Dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Jar = Join-Path $Dir "gradle-wrapper.jar"
$Url = "https://raw.githubusercontent.com/gradle/gradle/v9.2.1/gradle/wrapper/gradle-wrapper.jar"
$Expected = "423cb469ccc0ecc31f0e4e1c309976198ccb734cdcbb7029d4bda0f18f57e8d9"

function Test-Hash {
    if (-not (Test-Path $Jar)) { return $false }
    return (Get-FileHash $Jar -Algorithm SHA256).Hash.ToLowerInvariant() -eq $Expected
}

if (Test-Hash) { exit 0 }
if (Test-Path $Jar) { Remove-Item -Force $Jar }
$Tmp = "$Jar.tmp"
if (Test-Path $Tmp) { Remove-Item -Force $Tmp }
Invoke-WebRequest -Uri $Url -OutFile $Tmp
Move-Item -Force $Tmp $Jar
if (-not (Test-Hash)) {
    Remove-Item -Force $Jar -ErrorAction SilentlyContinue
    throw "Gradle wrapper checksum mismatch."
}
Write-Host "Gradle wrapper 9.2.1 bootstrapped and verified."
