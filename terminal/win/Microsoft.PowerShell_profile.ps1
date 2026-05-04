# --- 1. Configuración de PSReadLine (Predicciones y Comportamiento) ---
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows
Set-PSReadlineOption -BellStyle None
# Mapear Ctrl+Espacio para mostrar el menú de autocompletado
Set-PSReadLineKeyHandler -Key "Ctrl+SpaceBar" -Function MenuComplete
# Hacer que el menú de autocompletado tenga colores (como lsd)
Set-PSReadLineOption -Colors @{
  Selection = "`e[38;5;37m" # Cyan tenue (ANSI 37)
}

# --- 2. Módulos y Herramientas ---
# Carga automáticamente los alias para lsd (ls, la, ll, lt, etc.)
# ls    -> lsd --group-directories-first @args
# la    -> ls --almost-all @args
# ll    -> ls --long @args
# lt    -> ls --tree --depth=2 @args
# l     -> ll --almost-all @args
# llm   -> ll --timesort @args
# llt   -> ll --tree --depth=2 @args
# llat  -> l --tree --depth=2 @args
# lm    -> l --timesort @args
Import-Module -Name lsd-aliases -DisableNameChecking

# Información de repositorios Git
Import-Module -Name posh-git

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Inicialización de mise (Gestor de versiones)
mise activate pwsh | Out-String | Invoke-Expression

# --- 3. Interfaz Visual (Siempre al final) ---
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/velvet-horizon.omp.json" | Invoke-Expression

# --- 4. Atajos Personalizados ---
function my_profile {
  # Abre el perfil en el Bloc de Notas (puedes cambiar 'notepad' por 'code' si usas VS Code)
  code $profile
  # Al cerrar el editor, recarga el perfil automáticamente
  . $profile
}

function findstr {
  param([Parameter(ValueFromPipeline = $true, Mandatory = $true)] $keyword, $path = "*")
  # El script original de PSToys suele usar Select-String internamente 
  # para emular un findstr más amigable.
  Get-ChildItem $path -Recurse | Select-String -Pattern $keyword
}

function disable-history {
  Set-PSReadLineOption -HistorySaveStyle SaveNothing
  Write-Host "Historial desactivado para esta sesión." -ForegroundColor Yellow
}

function remove-duplicate-history {
  # Esto limpia el archivo físico de PSReadLine que ya tienes configurado
  $historyPath = (Get-PSReadLineOption).HistorySavePath
  $cleanHistory = Get-Content $historyPath | Select-Object -Unique
  $cleanHistory | Set-Content $historyPath
  Write-Host "Duplicados eliminados del historial físico." -ForegroundColor Green
}

function remove-keyword-history {
  param([Parameter(Mandatory = $true)] [string]$Keyword)
  # 1. Obtener la ruta del archivo físico de PSReadLine
  $historyPath = (Get-PSReadLineOption).HistorySavePath
    
  if (Test-Path $historyPath) {
    # 2. Leer el historial y filtrar las líneas que contienen la palabra clave
    $cleanHistory = Get-Content $historyPath | Where-Object { $_ -notmatch $Keyword }
        
    # 3. Guardar el historial limpio de vuelta al archivo
    $cleanHistory | Set-Content $historyPath
        
    # 4. (Opcional) Refrescar la sesión actual
    # Nota: PSReadLine carga el historial al inicio, por lo que el cambio 
    # físico se verá reflejado totalmente en la siguiente terminal que abras.
    Write-Host "Comandos con '$Keyword' eliminados del historial físico." -ForegroundColor Cyan
  }
}
