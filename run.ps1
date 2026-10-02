# ===== CHAY DU AN CUSTOMER MANAGEMENT =====
$root   = "D:\Hoc Tap\Nam 3\TTCS\customer-management"
$tomcat = "D:\TOMCAT"
$url    = "http://localhost:8080/customer-management/customers"

Write-Host "[1/4] Tat Tomcat cu..." -ForegroundColor Cyan
Get-Process java -ErrorAction SilentlyContinue | Stop-Process -Force
Start-Sleep -Seconds 3

Write-Host "[2/4] Build du an..." -ForegroundColor Cyan
Set-Location $root
mvn clean package

if (-not (Test-Path "target\customer-management.war")) {
    Write-Host "BUILD FAILED" -ForegroundColor Red
    return
}

Write-Host "[3/4] Deploy war..." -ForegroundColor Cyan
Remove-Item "$tomcat\webapps\customer-management*" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$tomcat\work\Catalina" -Recurse -Force -ErrorAction SilentlyContinue
Copy-Item "target\customer-management.war" "$tomcat\webapps\" -Force
Start-Process "cmd.exe" -ArgumentList "/c", "$tomcat\bin\startup.bat" -WindowStyle Hidden

Write-Host "[4/4] Cho Tomcat deploy (15s)..." -ForegroundColor Cyan
Start-Sleep -Seconds 15

if (Test-Path "$tomcat\webapps\customer-management\WEB-INF\classes\com\codegym\controller\CustomerServlet.class") {
    Write-Host "THANH CONG! Dang mo web..." -ForegroundColor Green
    Start-Process $url
} else {
    Write-Host "Loi deploy. Xem log:" -ForegroundColor Red
    $log = Get-ChildItem "$tomcat\logs\catalina.*.log" | Sort-Object LastWriteTime -Descending | Select-Object -First 1
    Get-Content $log.FullName -Tail 30
}