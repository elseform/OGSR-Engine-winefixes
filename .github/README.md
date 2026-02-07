# OGSR-Engine-winefixes
Форк https://github.com/OGSR/OGSR-Engine для исправления проблем запуска в **CrossOver / Wine (D3DMetal/DXMT)**.

ВНИМАНИЕ: Если вы воспользовались этим форком и что-то не работает — НЕ мучайте разработчиков основного проекта вопросами и issue.

## RU

### Что включено

- `winetweak_fullscreen` — возврат эксклюзивного fullscreen-пути под Wine/CrossOver.
- `winetweak_clipcursor` — принудительное обновление ClipCursor при активном окне.
- `winetweak_clipcursor_inset` (`0..32`) — сужение прямоугольника курсора.

В меню эти опции не выводил, задать можно через консоль или указав в user.ltx

### Какие проблемы это закрывает

- В fullscreen и после Alt+Tab может отваливаться захват мыши.
- Курсор может выходить за границы окна игры.
- Полноэкранный режим в Wine/CrossOver на macOS может вести себя нестабильно.
- Из-за рассинхрона ClipCursor появляются рывки/дёргания мыши.

### Сборка на macOS

### Конфигурация окружения

- MacBook Pro 14-inch (2021) (`MacBookPro18,3`)
- Chip: **Apple M1 Pro** (8 cores)
- RAM: **16 GB**
- macOS: **26.2** (build `25C56`)
- CrossOver: **26 beta 2**

- Сборка локально на VM Windows 11ARM в **UTM**

---

## ENG

- Fork focused on fixing **OGSR-Engine** issues under **CrossOver / Wine (D3DMetal/DXMT)**.


### Included in 3.501_winefixes

- `winetweak_fullscreen` — restores exclusive fullscreen path under Wine/CrossOver.
- `winetweak_clipcursor` — forces ClipCursor refresh while active.
- `winetweak_clipcursor_inset` (`0..32`) — shrinks ClipCursor rect bounds.

### Problems this fork targets

- Cursor capture breaks in fullscreen and after Alt+Tab.
- Cursor bounds can leak outside the game window.
- Fullscreen behavior is unstable under Wine/CrossOver on macOS.
- Mouse input can stutter due to inconsistent ClipCursor state.

If you use this fork and something breaks, please do NOT bother upstream OGSR developers with questions or issues.


### Building on macOS

### Environment

- MacBook Pro 14-inch (2021) (`MacBookPro18,3`)
- Chip: **Apple M1 Pro** (8 cores)
- RAM: **16 GB**
- macOS: **26.2** (build `25C56`)
- CrossOver: **26 beta 2**

- Tested with the latest publicly released **Gunslinger Addon** version.

- I built this fork in **UTM** using a **Windows 11 VM** on macOS.
- Recommended workflow: build the engine inside the VM (Visual Studio/CMake), then run the game via CrossOver.
