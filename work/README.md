For Windows deploy, first install WSL and reboot machine
```
wsl --install
```

Launch up WSL and install Ansible
```
sudo apt update
sudo apt install ansible
```

PowerShell cmds to enable Ansible:

Enable WinRM
```
Enable-PSRemoting -Force
```

Allow Basic Authentication (necessary for Ansible)
```
Set-Item WSMan:\localhost\Client\AllowUnencrypted $true
Set-Item WSMan:\localhost\Client\Auth\Basic $true
```

Set up WinRM listener for HTTP (you can configure HTTPS for more security)
```
New-Item -Path WSMan:\localhost\Listener -Transport HTTP -Address * -Port 5985
```

Create new firewall rule for WinRM:
```
New-NetFirewallRule -Name "WinRM_HTTP_in" -DisplayName "WinRM HTTP Server (Allow)" -Enabled True -Protocol TCP -Direction Inbound -Action Allow -LocalPort 5985
```

To run playbook:
```
ansible-playbook -i inventory.ini install_software.yml
```