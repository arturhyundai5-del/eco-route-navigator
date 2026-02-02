require('dotenv').config();
const express = require('express');
const cors = require('cors');
const fetch = require('node-fetch');

const app = express();
const PORT = process.env.PORT || 3000;

// Включаем CORS для всех запросов
app.use(cors());

// Логирование всех запросов
app.use((req, res, next) => {
  console.log(`[${new Date().toISOString()}] ${req.method} ${req.path}`);
  next();
});

// Маршрут для Directions API
app.get('/api/directions', async (req, res) => {
  try {
    const { origin, destination, mode, waypoints } = req.query;
    const apiKey = process.env.GOOGLE_MAPS_API_KEY;

    if (!apiKey) {
      return res.status(500).json({ error: 'API key not configured' });
    }

    if (!origin || !destination) {
      return res.status(400).json({ error: 'Missing origin or destination' });
    }

    // Строим URL запроса к Google Maps API
    let url = `https://maps.googleapis.com/maps/api/directions/json?origin=${encodeURIComponent(origin)}&destination=${encodeURIComponent(destination)}&mode=${mode || 'driving'}&key=${apiKey}`;

    // Добавляем waypoints если они есть
    if (waypoints) {
      url += `&waypoints=${encodeURIComponent(waypoints)}`;
    }

    console.log(`Requesting: ${url.split('key=')[0]}key=***`);

    // Делаем запрос к Google Maps API
    const response = await fetch(url);
    const data = await response.json();

    // Возвращаем результат клиенту
    res.json(data);
  } catch (error) {
    console.error('Error:', error.message);
    res.status(500).json({ error: error.message });
  }
});

// Маршрут для Geocoding API (если понадобится)
app.get('/api/geocode', async (req, res) => {
  try {
    const { address } = req.query;
    const apiKey = process.env.GOOGLE_MAPS_API_KEY;

    if (!apiKey) {
      return res.status(500).json({ error: 'API key not configured' });
    }

    if (!address) {
      return res.status(400).json({ error: 'Missing address' });
    }

    const url = `https://maps.googleapis.com/maps/api/geocode/json?address=${encodeURIComponent(address)}&key=${apiKey}`;

    const response = await fetch(url);
    const data = await response.json();

    res.json(data);
  } catch (error) {
    console.error('Error:', error.message);
    res.status(500).json({ error: error.message });
  }
});

// Проверка здоровья сервера
app.get('/health', (req, res) => {
  res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

// Запуск сервера
app.listen(PORT, () => {
  console.log(`✅ Proxy server running on http://localhost:${PORT}`);
  console.log(`📍 Directions API: http://localhost:${PORT}/api/directions`);
  console.log(`📍 Geocoding API: http://localhost:${PORT}/api/geocode`);
});
