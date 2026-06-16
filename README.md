# GamePanelHUD Hit Fika Fix

**EN** | [RU](#русский)

Compatibility patch for **SPT + Fika**: restores **[Game Panel HUD](https://forge.sp-tarkov.com/mod/456/game-panel-hud)** hit markers on **coop clients** when you shoot enemies.

> This is **not** a replacement for GamePanelHUD — only an add-on. All HUD UI and hit-marker logic belongs to [kmyuhkyuk](https://github.com/kmyuhkyuk).

## Requirements (install first)

| Mod | Forge | Version |
|-----|-------|---------|
| **Game Panel HUD** | [mod/456](https://forge.sp-tarkov.com/mod/456/game-panel-hud) | 3.4.0+ |
| **Kmy Tarkov Api** | [mod/898](https://forge.sp-tarkov.com/mod/898/kmy-tarkov-api) | 1.5.0+ |
| **Project Fika** (client) | [mod/2326](https://forge.sp-tarkov.com/mod/2326/project-fika) | 2.3.x |
| **Project Fika - Server** | [mod/2357](https://forge.sp-tarkov.com/mod/2357/project-fika-server) | 2.3.x (SPT host) |

The **GamePanelHUDHit** module from the Game Panel HUD package must be enabled.

## Installation

1. Install all dependencies from the table above.
2. Download `GamePanelHUDHitFikaFix_v1.0.0.zip` from GitHub Releases or `GamePanelHUDHitFikaFix-release/` (sibling folder).
3. Extract into your game root (folder with `EscapeFromTarkov.exe`).
4. Install on **every Fika client** in coop (critical for non-host players).

Result: `BepInEx/plugins/GamePanelHUDHitFikaFix.dll`

## Verify

After entering a raid, check `BepInEx/LogOutput.log`:

```
[Info   :GamePanelHUD Hit Fika Fix] [HIT_FIKA_FIX] Patched ObservedPlayer.ApplyClientShot -> GamePanelHUDHit.CoopApplyShot
```

## Build from source

```powershell
dotnet build -c Release
# or with explicit EFT path:
dotnet build -c Release -p:TarkovDir="U:\Games\EscapeFromTarkov4\"
```

Requires `kmyuhkyuk-GamePanelHUD` and `kmyuhkyuk-KmyTarkovApi` installed in the game (compile references).

Release zip:

```powershell
.\scripts\pack-release.ps1
```

Output: `..\GamePanelHUDHitFikaFix-release\`

## How it works

- **Host:** hits use `ObservedPlayer.ApplyShot` — already handled by GamePanelHUDHit.
- **Client:** local hits use `ObservedPlayer.ApplyClientShot` (Fika `ObservedClientBridge`).
- GamePanelHUD 3.4.0 does not hook `ApplyClientShot`.
- This patch adds a Harmony postfix that calls existing `GamePanelHUDHit.CoopApplyShot`.

## Credits

- **[kmyuhkyuk](https://github.com/kmyuhkyuk)** — [GamePanelHUD](https://github.com/kmyuhkyuk/GamePanelHUD), [KmyTarkovApi](https://github.com/kmyuhkyuk/KmyTarkovApi)
- **[Project Fika](https://github.com/project-fika/Fika-Plugin)** — coop for SPT

If the original author adds `ApplyClientShot` support in a future release, you can remove this patch.

## Publish on The Forge

See [docs/FORGE_PUBLISH.md](docs/FORGE_PUBLISH.md) (EN + RU).

## License

MIT — see [LICENSE](LICENSE). Original mods use their authors' licenses (see Forge pages).

---

# Русский

Патч совместимости для **SPT + Fika**: на **клиенте** в coop снова показываются **хитмаркеры [Game Panel HUD](https://forge.sp-tarkov.com/mod/456/game-panel-hud)** при попадании по противнику.

> Это **не замена** GamePanelHUD — только дополнение. Вся логика UI и хитмаркера — работа [kmyuhkyuk](https://github.com/kmyuhkyuk).

## Требуется (установить заранее)

| Мод | Forge | Версия |
|-----|-------|--------|
| **Game Panel HUD** | [mod/456](https://forge.sp-tarkov.com/mod/456/game-panel-hud) | 3.4.0+ |
| **Kmy Tarkov Api** | [mod/898](https://forge.sp-tarkov.com/mod/898/kmy-tarkov-api) | 1.5.0+ |
| **Project Fika** (клиент) | [mod/2326](https://forge.sp-tarkov.com/mod/2326/project-fika) | 2.3.x |
| **Project Fika - Server** | [mod/2357](https://forge.sp-tarkov.com/mod/2357/project-fika-server) | 2.3.x (на хосте SPT) |

Нужен модуль **GamePanelHUDHit** из пакета Game Panel HUD.

## Установка

1. Установить зависимости из таблицы выше.
2. Скачать `GamePanelHUDHitFikaFix_v1.0.0.zip` из GitHub Releases или папки `GamePanelHUDHitFikaFix-release/` (рядом с репозиторием).
3. Распаковать в корень игры (`EscapeFromTarkov.exe`).
4. Поставить **на каждый Fika-клиент** в coop (критично для не-хоста).

Файл: `BepInEx/plugins/GamePanelHUDHitFikaFix.dll`

## Проверка

В `BepInEx/LogOutput.log` после входа в рейд:

```
[Info   :GamePanelHUD Hit Fika Fix] [HIT_FIKA_FIX] Patched ObservedPlayer.ApplyClientShot -> GamePanelHUDHit.CoopApplyShot
```

## Сборка из исходников

```powershell
dotnet build -c Release
# или с явным путём к EFT:
dotnet build -c Release -p:TarkovDir="U:\Games\EscapeFromTarkov4\"
```

Нужны установленные в игре `kmyuhkyuk-GamePanelHUD` и `kmyuhkyuk-KmyTarkovApi` (для ссылок при компиляции).

Релизный zip:

```powershell
.\scripts\pack-release.ps1
```

Архив: `..\GamePanelHUDHitFikaFix-release\`

## Как это работает

- **Хост:** попадания через `ObservedPlayer.ApplyShot` — GamePanelHUDHit уже обрабатывает.
- **Клиент:** свои выстрелы через `ObservedPlayer.ApplyClientShot` (Fika `ObservedClientBridge`).
- В GamePanelHUD 3.4.0 нет хука на `ApplyClientShot`.
- Патч добавляет Harmony postfix к существующему `GamePanelHUDHit.CoopApplyShot`.

## Благодарности

- **[kmyuhkyuk](https://github.com/kmyuhkyuk)** — [GamePanelHUD](https://github.com/kmyuhkyuk/GamePanelHUD), [KmyTarkovApi](https://github.com/kmyuhkyuk/KmyTarkovApi)
- **[Project Fika](https://github.com/project-fika/Fika-Plugin)** — coop для SPT

Если автор встроит поддержку `ApplyClientShot` в будущий релиз — этот патч можно удалить.

## Публикация на The Forge

См. [docs/FORGE_PUBLISH.md](docs/FORGE_PUBLISH.md) (EN + RU).

## Лицензия

MIT — см. [LICENSE](LICENSE). Оригинальные моды — лицензии авторов (см. страницы на Forge).
