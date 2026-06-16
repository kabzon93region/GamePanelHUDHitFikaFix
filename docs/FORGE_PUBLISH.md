# Publishing on The Forge / Публикация на The Forge

**EN** | [RU](#русский)

Guide for uploading **GamePanelHUD Hit Fika Fix** to [The Forge](https://forge.sp-tarkov.com/) — the SPT mod catalog.

---

## Before you start

1. Account on [forge.sp-tarkov.com](https://forge.sp-tarkov.com/) (Register / Log in).
2. Built release zip: `..\GamePanelHUDHitFikaFix-release\GamePanelHUDHitFikaFix_v1.0.0.zip`
3. GitHub repo with public source (recommended for Forge).

---

## Step 1 — GitHub (recommended first)

1. Open **GitHub Desktop** → **Add** → **Add Existing Repository**.
2. Choose folder: `github-repos\GamePanelHUDHitFikaFix`
3. **Publish repository** (public).
4. **Releases** → **Create a new release** → tag `v1.0.0`.
5. Attach `GamePanelHUDHitFikaFix_v1.0.0.zip` from `GamePanelHUDHitFikaFix-release\`.
6. Copy release URL for Forge “Source Code” field.

---

## Step 2 — Create mod on The Forge

1. Go to [The Forge](https://forge.sp-tarkov.com/) → log in.
2. Open your profile / **Upload mod** (or equivalent in the creator menu).
3. Fill in the form:

| Field | Value |
|-------|--------|
| **Name** | `GamePanelHUD Hit Fika Fix` |
| **GUID** | `com.dematch.gamepanelhudhitfikafix` |
| **Category** | `Quality of Life` or `Other` |
| **SPT version** | `4.0.13` (match your test build) |
| **Fika compatibility** | **Yes** / Fika-compatible (this mod is for Fika coop) |
| **License** | `MIT` |
| **Source Code** | `https://github.com/YOUR_USER/GamePanelHUDHitFikaFix` |

---

## Step 3 — Description (paste into Forge)

### Short description (EN)

```
Fika compatibility patch for Game Panel HUD: restores hit markers on coop clients. Requires Game Panel HUD 3.4+, Kmy Tarkov Api, and Project Fika.
```

### Full description (EN)

```
Compatibility patch — NOT a standalone HUD.

Problem: In Fika coop, hit markers from Game Panel HUD work on the host but not on clients when you shoot enemies. The kill widget still works.

Fix: Hooks Fika ObservedPlayer.ApplyClientShot and connects it to GamePanelHUDHit's existing CoopApplyShot handler.

REQUIRED (install separately):
• Game Panel HUD 3.4.0+ — https://forge.sp-tarkov.com/mod/456/game-panel-hud
• Kmy Tarkov Api 1.5.0+ — https://forge.sp-tarkov.com/mod/898/kmy-tarkov-api
• Project Fika (client) — https://forge.sp-tarkov.com/mod/2326/project-fika
• Project Fika - Server (on SPT host) — https://forge.sp-tarkov.com/mod/2357/project-fika-server

Install: extract zip to game root. Put on EVERY Fika client in coop.

Credits: kmyuhkyuk (GamePanelHUD, KmyTarkovApi), Project Fika team. This patch only adds the missing client-side hook.
```

### Short description (RU) — optional second block or bilingual page

```
Патч Fika для Game Panel HUD: хитмаркеры на клиенте в coop. Нужны Game Panel HUD 3.4+, Kmy Tarkov Api и Project Fika.
```

### Full description (RU)

```
Патч совместимости — НЕ отдельный HUD.

Проблема: в Fika coop хитмаркеры Game Panel HUD работают на хосте, но не на клиенте при своих выстрелах. Виджет убийства работает.

Решение: хук Fika ObservedPlayer.ApplyClientShot → существующий CoopApplyShot в GamePanelHUDHit.

ОБЯЗАТЕЛЬНО (ставить отдельно):
• Game Panel HUD 3.4.0+ — https://forge.sp-tarkov.com/mod/456/game-panel-hud
• Kmy Tarkov Api 1.5.0+ — https://forge.sp-tarkov.com/mod/898/kmy-tarkov-api
• Project Fika (клиент) — https://forge.sp-tarkov.com/mod/2326/project-fika
• Project Fika - Server (хост SPT) — https://forge.sp-tarkov.com/mod/2357/project-fika-server

Установка: распаковать в корень игры. На КАЖДЫЙ Fika-клиент в coop.

Благодарности: kmyuhkyuk (GamePanelHUD, KmyTarkovApi), команда Project Fika.
```

---

## Step 4 — Dependencies on Forge

Link **required dependencies** (Forge supports dependency mods):

| Dependency | Forge URL |
|------------|-----------|
| Game Panel HUD | https://forge.sp-tarkov.com/mod/456/game-panel-hud |
| Kmy Tarkov Api | https://forge.sp-tarkov.com/mod/898/kmy-tarkov-api |
| Project Fika | https://forge.sp-tarkov.com/mod/2326/project-fika |

Note: Fika Server is for the SPT host, not this client DLL — mention it in the description.

Soft / recommended: same as required for clarity.

---

## Step 5 — Upload version

1. **Version:** `1.0.0`
2. **Upload:** `GamePanelHUDHitFikaFix_v1.0.0.zip`  
   Or: **externally hosted** → GitHub Releases URL (Forge allows external downloads).
3. **Version notes (EN):**

```
Initial release. Fika client hit markers for Game Panel HUD 3.4.0.
Requires Game Panel HUD + Kmy Tarkov Api + Project Fika.
```

4. **Version notes (RU):**

```
Первый релиз. Хитмаркеры на Fika-клиенте для Game Panel HUD 3.4.0.
Требуются Game Panel HUD + Kmy Tarkov Api + Project Fika.
```

5. Optional: [VirusTotal](https://www.virustotal.com/) scan of the DLL — many Forge mods include this.

---

## Step 6 — After publish

- Test install via Forge download on a clean client profile.
- Reply to comments that users must install **all dependencies** first.
- If kmyuhkyuk merges upstream fix — archive this mod and note in description.

---

## Original mods (credits — always link)

- [Game Panel HUD](https://forge.sp-tarkov.com/mod/456/game-panel-hud) — kmyuhkyuk  
- [Kmy Tarkov Api](https://forge.sp-tarkov.com/mod/898/kmy-tarkov-api) — kmyuhkyuk  
- [Project Fika](https://forge.sp-tarkov.com/mod/2326/project-fika) — Lacyway et al.  
- [Project Fika - Server](https://forge.sp-tarkov.com/mod/2357/project-fika-server)

---

# Русский

Инструкция по публикации **GamePanelHUD Hit Fika Fix** на [The Forge](https://forge.sp-tarkov.com/).

---

## Перед началом

1. Аккаунт на [forge.sp-tarkov.com](https://forge.sp-tarkov.com/).
2. Собранный zip: `..\GamePanelHUDHitFikaFix-release\GamePanelHUDHitFikaFix_v1.0.0.zip`
3. Публичный репозиторий на GitHub (рекомендуется для Forge).

---

## Шаг 1 — GitHub

1. **GitHub Desktop** → **Add** → **Add Existing Repository**.
2. Папка: `github-repos\GamePanelHUDHitFikaFix`
3. **Publish repository** (public).
4. **Releases** → тег `v1.0.0` → прикрепить zip из `GamePanelHUDHitFikaFix-release\`.
5. Скопировать URL релиза для поля Source Code на Forge.

---

## Шаг 2 — Создать мод на The Forge

1. [The Forge](https://forge.sp-tarkov.com/) → войти.
2. Профиль → загрузка мода.
3. Поля:

| Поле | Значение |
|------|----------|
| **Название** | `GamePanelHUD Hit Fika Fix` |
| **GUID** | `com.dematch.gamepanelhudhitfikafix` |
| **Категория** | `Quality of Life` или `Other` |
| **Версия SPT** | `4.0.13` |
| **Fika** | Совместим с Fika |
| **Лицензия** | `MIT` |
| **Исходники** | URL вашего GitHub |

---

## Шаг 3 — Описание

Тексты для вставки — в разделе **Step 3** выше (блоки EN и RU).

---

## Шаг 4 — Зависимости на Forge

Указать обязательные зависимости:

| Зависимость | Ссылка |
|-------------|--------|
| Game Panel HUD | https://forge.sp-tarkov.com/mod/456/game-panel-hud |
| Kmy Tarkov Api | https://forge.sp-tarkov.com/mod/898/kmy-tarkov-api |
| Project Fika | https://forge.sp-tarkov.com/mod/2326/project-fika |

Fika Server — для хоста SPT, упомянуть в описании.

---

## Шаг 5 — Загрузить версию

1. Версия `1.0.0`
2. Файл `GamePanelHUDHitFikaFix_v1.0.0.zip` или ссылка на GitHub Releases
3. Заметки к версии — см. EN/RU в шаге 5 выше
4. По желанию — VirusTotal для DLL

---

## Шаг 6 — После публикации

- Проверить установку с Forge на чистом клиенте
- В комментариях напоминать про зависимости
- Если автор GamePanelHUD встроит фикс — заархивировать мод

---

## Оригинальные моды (благодарности)

- [Game Panel HUD](https://forge.sp-tarkov.com/mod/456/game-panel-hud)  
- [Kmy Tarkov Api](https://forge.sp-tarkov.com/mod/898/kmy-tarkov-api)  
- [Project Fika](https://forge.sp-tarkov.com/mod/2326/project-fika)  
- [Project Fika - Server](https://forge.sp-tarkov.com/mod/2357/project-fika-server)
