# Local proxy_getter 1.2.0

Source: <https://pub.dev/packages/proxy_getter/versions/1.2.0>
Upstream: <https://github.com/axel10/proxy_getter>

The package's runtime and build sources are copied unchanged except for
`cargokit/cmake/resolve_symlinks.ps1`: `Get-Item` uses `-LiteralPath -Force`
so paths under hidden Windows `AppData` directories, and paths containing
PowerShell wildcard characters, resolve without errors.

The upstream example and test-driver applications are omitted. The original
LICENSE is retained. No shared Pub cache files are modified.

Regression check from the project root:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File test_proxy_symlinks.ps1 -ScratchRoot <existing-scratch-directory>
```

`powershell` script `test_proxy_symlinks.ps1` reads:

```powershell
param(
    [Parameter(Mandatory = $true)]
    [string] $ScratchRoot
)

$ErrorActionPreference = 'Stop'
$resolver = Join-Path $PSScriptRoot '../plugins/proxy_getter/cargokit/cmake/resolve_symlinks.ps1'
$fixture = Join-Path $ScratchRoot ('proxy-resolver-' + [Guid]::NewGuid())
$hidden = Join-Path $fixture 'AppData [test]'
$target = Join-Path $hidden 'Local/Pub/Cache/cargokit'

try {
    [System.IO.Directory]::CreateDirectory($target) | Out-Null
    $attributes = [System.IO.File]::GetAttributes($hidden)
    [System.IO.File]::SetAttributes($hidden, $attributes -bor [System.IO.FileAttributes]::Hidden)
    $expected = $target.Replace('\', '/')
    $output = (& $resolver $expected 6>&1 | ForEach-Object { $_.ToString() }) -join "`n"
    if ($output.Trim() -ne $expected) {
        throw "Wrong resolved path: '$($output.Trim())'; expected '$expected'."
    }
    Write-Output 'PASS: hidden path with spaces and wildcard characters resolves without errors.'
} finally {
    if (Test-Path -LiteralPath $fixture) {
        Remove-Item -LiteralPath $fixture -Recurse -Force
    }
}
```

Replace the local path dependency with an upstream release once this fix is
included there.
