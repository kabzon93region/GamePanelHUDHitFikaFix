# Changelog

**EN** | [RU](#русский)

## [1.0.0] — 2026-06-16

### Added

- Harmony postfix on `Fika.Core.Main.Players.ObservedPlayer.ApplyClientShot`
- Routes to existing `GamePanelHUDHit.CoopApplyShot` for hit markers on Fika clients
- Duplicate-patch guard if GamePanelHUD already hooks the method

### Notes

- Kill widget (GamePanelHUDKill) was already working; only hit markers were fixed
- Tested on SPT 4.0.13 + Fika 2.3.x + GamePanelHUD 3.4.0

---

# Русский

## [1.0.0] — 2026-06-16

### Добавлено

- Harmony postfix на `Fika.Core.Main.Players.ObservedPlayer.ApplyClientShot`
- Вызов существующего `GamePanelHUDHit.CoopApplyShot` для хитмаркеров на Fika-клиенте
- Защита от двойного патча, если GamePanelHUD уже подключил хук

### Примечания

- Виджет убийства (GamePanelHUDKill) и раньше работал; исправлены только хитмаркеры
- Проверено на SPT 4.0.13 + Fika 2.3.x + GamePanelHUD 3.4.0
