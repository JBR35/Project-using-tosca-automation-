# Tosca Automation Sample

Minimal scaffolding to execute Tricentis Tosca ExecutionLists via ToscaCI (CLI),
collect results, and integrate with CI/CD (Jenkins, GitHub Actions, Azure DevOps).

## Prerequisites
- Tricentis Tosca installed (Commander + ToscaCI).
- Access to your Tosca Workspace (.tws) and ExecutionList(s).
- Windows PowerShell 5+ (or PowerShell 7).
- Optional: Distributed Execution (DEX) if you dispatch remotely.

## Quick start
```powershell
# Clone the repo
git clone https://github.com/YOUR_USERNAME/tosca-automation-sample.git
cd tosca-automation-sample

# Edit config/tosca.settings.json first
# Then run:
.\scriptsun_tosca_ci.ps1 -ConfigPath .\config	osca.settings.json
```

## Running in CI
- Call `scripts/run_tosca_ci.bat` or the PowerShell script directly.
- Artifacts:
  - `./results/ci/` contains Tosca execution output (JUnit XML + logs).
  - Use `parse_tosca_report.ps1` to normalize XML for CI test reporting.

## Notes
- **Tosca is model-based**; there isn't “test code” in the repo. Tests live inside the
  Tosca workspace. This repo provides automation glue: config, data, and CI scripts.
- Make sure the **ExecutionList** you reference is present in your workspace and the
  user has permission to execute it.
