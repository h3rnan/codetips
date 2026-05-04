# PowerShell Profile

### Requisitos:

- PowerShell 7 (pwsh)
- Scoop
- Chocolatey (optional)
- mise (optional)
- Oh-My-Posh

> [!TIP]
> Si está usando Windows Terminal, usted puede instalar el tema `velvet-horizon` para una mejor experiencia visual.


### Commands:
``` shell
  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
  scoop install mise #(optional)
  scoop install oh-my-posh
  scoop install lsd
  Install-Module -Name PSReadLine -Scope CurrentUser
  Install-Module -Name posh-git -Scope CurrentUser
  Install-Module -Name lsd-aliases -Scope CurrentUser -AllowClobber
```
