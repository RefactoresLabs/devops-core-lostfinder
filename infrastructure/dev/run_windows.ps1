#Requires -Version 5.1

Write-Host "Setup Windows..." -ForegroundColor Green

# Verifica se pastas existem
if ((Test-Path "backend-code") -and (Test-Path "frontend-code")) {
    Write-Host "Pastas já existem" -ForegroundColor Yellow
} else {
    Write-Host "Clonando repositórios..." -ForegroundColor Cyan
    
    if (-not (Test-Path "backend-code")) {
        git clone -b test/pr https://github.com/RefactoresLabs/backend-lostfinder.git backend-code
    }
    
    if (-not (Test-Path "frontend-code")) {
        git clone -b test/pr https://github.com/RefactoresLabs/frontend-lostfinder.git frontend-code
    }
}

Write-Host "Subindo containers..." -ForegroundColor Cyan
docker compose build --no-cache
docker compose up -d

Write-Host "Ambiente pronto!" -ForegroundColor Green
docker ps