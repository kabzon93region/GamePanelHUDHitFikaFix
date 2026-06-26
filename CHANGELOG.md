# GamePanelHUD Hit Fika Fix v1.0.0

## Проблема

На Fika-клиенте хитмаркер GamePanelHUD не показывается при попадании по противнику, хотя виджет убийства работает.

## Причина

- **Хост** обрабатывает попадания через `ObservedPlayer.ApplyShot` — хук есть в `GamePanelHUDHit`.
- **Клиент** при своих выстрелах идёт через `ObservedPlayer.ApplyClientShot` (`ObservedClientBridge`).
- В развёрнутых DLL (`KmyTarkovApi 1.5.0`, `GamePanelHUDHit 3.4.0`) отсутствует хук `ObservedCoopApplyClientShot` / `ApplyClientShot`.
- В исходниках `gitarchive/new4` фикс уже есть, но не был собран и задеплоен.

## Решение

Мод-патч подключает существующий `GamePanelHUDHit.CoopApplyShot` как postfix к `Fika.Core.Main.Players.ObservedPlayer.ApplyClientShot`.

## Зависимости

- `com.kmyuhkyuk.GamePanelHUDHit` 3.4.0
- `com.kmyuhkyuk.KmyTarkovApi` 1.5.0
- Fika.Core (runtime)

## Сборка

```bash
python build_and_deploy_mod.py client-mods/GamePanelHUDHitFikaFix client
```

## Статус

Отдельный compatibility-мод: не форк GamePanelHUD / KmyTarkovApi.  
См. README.md — ссылки на оригиналы и благодарности [kmyuhkyuk](https://github.com/kmyuhkyuk).

Если автор встроит `ApplyClientShot` в будущий релиз — патч можно удалить.
