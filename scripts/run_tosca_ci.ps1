param(
  [string]$ConfigPath = ".\\config\\tosca.settings.json"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (!(Test-Path $ConfigPath)) {
  throw "Config file not found: $ConfigPath"
}

$config = Get-Content $ConfigPath -Raw | ConvertFrom-Json

$resultsDir = $config.ResultsDir
if (-not (Test-Path $resultsDir)) {
  New-Item -ItemType Directory -Path $resultsDir -Force | Out-Null
}

$workspace = $config.WorkspacePath
$toscaCI   = $config.ToscaCIPath

if (!(Test-Path $toscaCI)) {
  throw "ToscaCI.exe not found: $toscaCI"
}
if (!(Test-Path $workspace)) {
  throw "Workspace not found: $workspace"
}

$timestamp   = Get-Date -Format "yyyyMMdd_HHmmss"
$runDir      = Join-Path $resultsDir "run_$($timestamp)"
New-Item -ItemType Directory -Path $runDir -Force | Out-Null

$junitPath   = Join-Path $runDir "report.junit.xml"
$xmlPath     = Join-Path $runDir "report.tosca.xml"

$argList = @(
  '/workspace', "`"$workspace`"",
  '/login', "`"$($config.UserName)`"", "`"$($config.Password)`"",
  '/runExecutionList',
  '/executionList', "`"$($config.ExecutionListPath)`"",
  '/reportXml', "`"$xmlPath`"",
  '/reportJUnit', "`"$junitPath`"",
  '/outputDir', "`"$runDir`""
)

if ($config.UseDEX -and $config.RunOnAgent) {
  $argList += @('/useDEx', '/agent', "`"$($config.DEXAgent)`"")
}

if ($config.Variables) {
  $config.Variables.PSObject.Properties | ForEach-Object {
    $name = $_.Name
    $val  = [string]$_.Value
    $argList += @('/setvar', "`"$name=$val`"")
  }
}

& "$toscaCI" $argList
