@echo off
set CONFIG_PATH=%~dp0..\config\tosca.settings.json
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0run_tosca_ci.ps1" -ConfigPath "%CONFIG_PATH%"
