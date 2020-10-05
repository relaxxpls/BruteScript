mode 300
cls
Write-Host -ForegroundColor Magenta -NoNewline "                            "
Write-Host -ForegroundColor Cyan 			   "--------------------"

Write-Host -ForegroundColor Magenta -NoNewline "<<========================"
Write-Host -ForegroundColor Cyan -NoNewline " // RelaxxPls 2020 // "
Write-Host -ForegroundColor Magenta 		   "========================>>"
Write-Host -ForegroundColor Green -NoNewline "    Program Compiling     "
Write-Host -ForegroundColor Cyan -NoNewline "--------------------"

mkdir -Force ".temp" > $null
# Compile the Input, Output, Input Generator files
g++ .\correct.cpp -o .\.temp\correct.exe
g++ .\wrong.cpp -o .\.temp\wrong.exe	
g++ .\inputgen.cpp -o .\.temp\inputgen.exe

Write-Host -ForegroundColor Green "     Successful Compiling`n"
Write-Host -ForegroundColor Yellow -NoNewline "Enter number of tests "
Write-Host -ForegroundColor DarkYellow -NoNewline "(leave blank for 1st fail): "

$test = Read-Host
$flg = 0
if(!$test) {
	$test = 100000
	$flg = 1
}

for($i = 1; $i -le $test; $i++) {
	$inp = .\.temp\inputgen.exe
	
	$outcorr = $inp | .\.temp\correct.exe
	$outwron = $inp | .\.temp\wrong.exe

	$ans = (Compare-Object $outcorr $outwron).SideIndicator
	if(!$ans) { 
		Write-Host -ForegroundColor Green "`n- Case $i`: Pass"
	}
	else {
		Write-Host -ForegroundColor Red "`n- Case $i`: Fail"
		Write-Host -ForegroundColor Blue "$inp"
		if($flg -eq 1) {
			break
		}
	}
}

Remove-Item -Path ".temp" -Force -Recurse

Write-Host -ForegroundColor Yellow -NoNewline "`n`nPress enter to copy last"
Write-Host -ForegroundColor Yellow -NoNewline " failed test input and exit... "
$res = Read-Host
if(!$res) {
	Set-Clipboard -Value "$inp"
}
