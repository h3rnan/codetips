# WINDOWS

Acá las instrucciones para configurar Windows para desarrollo.

## Gestion de software
- ### [Scoop](https://scoop.sh): Gestor de paquetes.
#### Instalacion de scoop
``` shell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
```

- ### [Chocolatey](https://chocolatey.org): Gestor de paquetes. (**Opcional**)
#### Instalacion de chocolatey
``` shell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

## Fuentes
- [Nerd Fonts](https://www.nerdfonts.com): Iosevka. Jetbrains.
    Instalacion de fuentes con `scoop`:
    ``` shell
    scoop bucket add nerd-fonts
    scoop install nerd-fonts/Iosevka-NF
    scoop install nerd-fonts/IosevkaTerm-NF
    scoop install nerd-fonts/JetBrainsMono-NF
    ```

## Terminales
- [Windows Terminal](https://aka.ms/terminal): Configuración de colores y fuentes.
- [Oh My Posh](https://ohmyposh.dev): Personalización de la terminal.
- [PSReadLine](https://docs.microsoft.com/en-us/powershell/module/psreadline): Mejoras en la línea de comandos de PowerShell.
- [Configuración de Terminal](./shell/README.md): Configuración personalizada de PowerShell.

## Editores de Código
- [VS Code](https://code.visualstudio.com): Editor multipropósito.
- [IntelliJ IDEA](https://www.jetbrains.com/idea): Editor Java por excelencia. 

## Git
- [Git](https://git-scm.com): Gestion de versiones.

## Azure
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure): Cliente Azure.

## AWS
- [AWS CLI](https://aws.amazon.com/cli): Cliente AWS.

## GCP
- [GCP CLI](https://cloud.google.com/sdk/gcloud): Cliente GCP.

## Instalacion de mise
``` shell
scoop install mise
```
> [!Note]
> Realizar la instalacion de mise para la gestion de versiones de herramientas.
