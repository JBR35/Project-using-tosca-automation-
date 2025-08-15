param(
  [string]$JUnitPath,
  [string]$OutPath = $null
)

if (!(Test-Path $JUnitPath)) {
  throw "JUnit file not found: $JUnitPath"
}

[xml]$doc = Get-Content $JUnitPath -Raw
$ts = $doc.testsuite
if (-not $ts) {
  if ($doc.testsuites -and $doc.testsuites.testsuite.Count -gt 0) {
    $ts = $doc.testsuites.testsuite[0]
  }
}

if ($ts -and (-not $ts.name)) {
  $ts.SetAttribute("name", "Tosca Execution")
}

if (-not $OutPath) {
  $OutPath = $JUnitPath
}
$doc.Save($OutPath)
