# Publish to GitHub — GamePanelHUD Hit Fika Fix

**Статус:** `published`  
**GitHub:** Release + zip  
**Версия:** `1.0.0`  
**Deployment:** `(headless_client)`

## 1. Подготовка (уже сделано этим скриптом)

Папка: `github-repos/GamePanelHUDHitFikaFix/`

## 2. Создать репозиторий и запушить

```powershell
cd github-repos/GamePanelHUDHitFikaFix
git init
git add .
git commit -m "Source backup GamePanelHUD Hit Fika Fix v1.0.0"
git branch -M main
git remote add origin https://github.com/kabzon93region/GamePanelHUDHitFikaFix.git
git push -u origin main
```

Или автоматически:

```powershell
python CURSORAIMODING/tools/publish/publish_github_release.py GamePanelHUDHitFikaFix --create-repo
```

## 3. GitHub Release

Прикрепить zip (только игровые файлы, без INSTALL.md):

`\\Servant\data\Games\EscapeFromTarkov4\CURSORAIMODING\releases\GamePanelHUDHitFikaFix_(headless_client)_v1.0.0_2026-06-27.zip`

```powershell
gh release create v1.0.0 "\\Servant\data\Games\EscapeFromTarkov4\CURSORAIMODING\releases\GamePanelHUDHitFikaFix_(headless_client)_v1.0.0_2026-06-27.zip" ^
  --title "GamePanelHUD Hit Fika Fix v1.0.0" ^
  --notes-file CHANGELOG.md
```

## Описание репозитория (suggested)

Фикс GamePanelHUD Hit в Fika headless на клиенте.

SPT 4.0 + Fika 2.3 headless stack. Deployment: `(headless_client)`.
