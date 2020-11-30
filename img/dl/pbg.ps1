New-Item -Path "C:\" -Name "background" -ItemType "directory" -Force | Out-Null
cd C:\background
$urlimg = "https://www.felsec.com/img/dl/pbg.png"
$outimg = "c:\background\pbg.png"
$urlfle = "https://www.felsec.com/img/dl/pmsg.txt"
$outfle = "c:\background\pmsg.txt"
$outlog = "c:\background\original_reg.txt"
iwr $urlimg -OutFile $outimg
iwr $urlfle -OutFile $outfle
Get-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name * | Out-File $outlog
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallPaperStyle -Value 2
$MethodDefinition = @"
[DllImport("user32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, string pvParam, uint fWinIni);
"@
$u32 = Add-Type -MemberDefinition $MethodDefinition -Name "User32" -Namespace "Win32" -PassThru
$u32::SystemParametersInfo(20, 0, $outimg, 2)
Start-Process notepad $outfle -WindowStyle Maximized
rundll32.exe user32.dll,LockWorkStation