# Project-using-tosca-automation
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
.\scripts\run_tosca_ci.ps1 -ConfigPath .\config\tosca.settings.json
