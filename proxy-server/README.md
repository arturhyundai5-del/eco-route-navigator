# 🚀 Инструкция по запуску CORS Proxy для Google Maps

## ✅ Что было сделано:

1. **Создана папка `proxy-server`** с настроенным сервером
2. **Обновлён `directions_service.dart`** для использования прокси
3. **Добавлена поддержка fallback** на прямой API если прокси недоступен

---

## 📋 Требования:

- **Node.js** и **npm** установлены на вашем ПК
- Скачайте отсюда: https://nodejs.org/ (выберите LTS версию)

---

## 🔧 Шаги запуска:

### Шаг 1: Установите Node.js
1. Откройте https://nodejs.org/
2. Скачайте LTS версию
3. Установите (нажимайте Next во всех диалогах)
4. **Перезагрузите** PowerShell / CMD

### Шаг 2: Откройте папку proxy-server
```powershell
cd c:\Users\student\Desktop\eco-route-navigator-master\proxy-server
```

### Шаг 3: Установите зависимости
```powershell
npm install
```

### Шаг 4: Запустите прокси-сервер
```powershell
npm start
```

Вы должны увидеть:
```
✅ Proxy server running on http://localhost:3000
📍 Directions API: http://localhost:3000/api/directions
📍 Geocoding API: http://localhost:3000/api/geocode
```

### Шаг 5: В **другом** PowerShell окне запустите приложение
```powershell
cd c:\Users\student\Desktop\eco-route-navigator-master
flutter run -d web
```

---

## 🔐 Важно о .env файле:

Ваш **API ключ хранится в `.env`** файле в папке `proxy-server`:
```
GOOGLE_MAPS_API_KEY=AIzaSyDzJwHQiLjy_rLKx10tV56yCrHdfE1HqQw
```

⚠️ **НЕ загружайте `.env` в GitHub!** (файл уже в `.gitignore`)

---

## 🧪 Проверка что работает:

### Проверить здоровье сервера:
```bash
curl http://localhost:3000/health
```

Должен вернуть:
```json
{"status":"OK","timestamp":"2025-01-31T..."}
```

### Проверить directions API:
```bash
curl "http://localhost:3000/api/directions?origin=Москва&destination=Санкт-Петербург&mode=driving"
```

---

## ❓ Если что-то не работает:

1. **Ошибка "npm не найден"** → Перезагрузите PowerShell после установки Node.js

2. **Ошибка "Cannot find module"** → Запустите `npm install` ещё раз

3. **Porт 3000 занят** → Измените в `.env`:
   ```
   PORT=3001
   ```
   И в `route_details_screen.dart`:
   ```dart
   proxyUrl: "http://localhost:3001"
   ```

4. **CORS ошибка всё ещё появляется** → Приложение должно работать через прокси, а не напрямую

---

## 📁 Структура проекта:

```
eco-route-navigator-master/
├── proxy-server/              ← Новая папка с прокси
│   ├── package.json
│   ├── proxy.js              ← Сервер
│   ├── .env                  ← Ваш API ключ
│   └── .gitignore
├── lib/
│   ├── screens/
│   │   ├── directions_service.dart  ← Обновлён
│   │   └── route_details_screen.dart ← Обновлён
│   └── ...
└── ...
```

---

## 🎯 Как это работает:

```
Ваше Web приложение
         ↓
   (без CORS ошибок)
         ↓
Localhost:3000 прокси-сервер
         ↓
    Google Maps API
         ↓
Обратный путь (JSON ответ)
```

Браузер **не блокирует** запросы к `localhost:3000` потому что это то же происхождение (same-origin).

---

**Готово! Теперь CORS ошибка должна быть решена! 🎉**
