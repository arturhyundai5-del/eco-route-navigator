int calculateEcoPoints(String transport, double distanceKm) {
  switch (transport) {
    case 'walk':
    case 'bike':
      return (distanceKm * 10).round(); // бонус за экологичность
    case 'bus':
      return (distanceKm * 5).round();
    case 'car':
      return (distanceKm * 1).round();
    default:
      return 0;
  }
}

double calculateCO2(String transport, double distanceKm) {
  switch (transport) {
    case 'walk':
    case 'bike':
      return 0;
    case 'bus':
      return distanceKm * 40; // грамм CO₂
    case 'car':
      return distanceKm * 120;
    default:
      return 0;
  }
}
