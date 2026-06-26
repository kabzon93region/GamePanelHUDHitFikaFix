# GamePanelHUD Hit — Fika Fix

**GitHub:** [kabzon93region](https://github.com/kabzon93region)
Небольшой патч совместимости для **SPT + Fika**: на клиенте снова показываются **хитмаркеры GamePanelHUD** при попадании по противнику.

Это **не замена** GamePanelHUD — только дополнение к уже установленным модам.

## Требуется (установить заранее)

| Мод | Версия | Ссылка |
|-----|--------|--------|
| **GamePanelHUD** | 3.4.0+ | [GitHub](https://github.com/kmyuhkyuk/GamePanelHUD) · [SPT Hub](https://hub.sp-tarkov.com/files/file/652-game-panel-hud) |
| **KmyTarkovApi** | 1.5.0+ | [GitHub](https://github.com/kmyuhkyuk/KmyTarkovApi) |
| **Fika** | 2.3.x | [Fika Project](https://github.com/project-fika/Fika-Plugin) |
| **SPT + BepInEx** | актуальные | — |

Нужен модуль **GamePanelHUDHit** из пакета GamePanelHUD.

## Установка

1. Убедиться, что GamePanelHUD и KmyTarkovApi уже работают.
2. Распаковать архив в корень игры (`EscapeFromTarkov.exe`).
3. Поставить **на каждый Fika-клиент** в coop (критично для не-хоста).

Файл: `BepInEx/plugins/GamePanelHUDHitFikaFix.dll`

## Что исправляет

- **Хост:** хитмаркеры работали и без патча.
- **Клиент:** при своих выстрелах Fika идёт через `ObservedPlayer.ApplyClientShot`, а не `ApplyShot` — в релизе 3.4.0 хук для клиента отсутствует.
- Патч подключает уже существующий `GamePanelHUDHit.CoopApplyShot` к `ApplyClientShot`.

Виджет **убийства** (GamePanelHUDKill) не затрагивается — он и так работал на клиенте.

## Проверка

В `BepInEx/LogOutput.log` после входа в рейд:

```
[Info   :GamePanelHUD Hit Fika Fix] [HIT_FIKA_FIX] Patched ObservedPlayer.ApplyClientShot -> GamePanelHUDHit.CoopApplyShot
```

## Благодарности

- **[kmyuhkyuk](https://github.com/kmyuhkyuk)** — автор [GamePanelHUD](https://github.com/kmyuhkyuk/GamePanelHUD) и [KmyTarkovApi](https://github.com/kmyuhkyuk/KmyTarkovApi). Вся логика хитмаркера и UI — их работа; этот мод лишь добавляет недостающий хук для Fika-клиента.
- **Project Fika** — кооператив для SPT.

Если автор встроит поддержку `ApplyClientShot` в будущие релизы GamePanelHUD — этот патч можно удалить.

## Лицензия

Совместимость-патч (отдельная сборка). Оригинальные моды — **GPL-3.0** (см. репозитории авторов).

## Поддержать проект
Разовый донат картой РФ, СБП, ЮMoney, VK Pay:  
**[DonationAlerts → kabzon93region](https://www.donationalerts.com/r/kabzon93region)**
