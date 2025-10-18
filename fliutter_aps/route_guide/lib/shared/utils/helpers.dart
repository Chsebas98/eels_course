import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Helpers {
  static double _toRadians(double deg) => deg * pi / 180.0;

  static double distanceBetween(LatLng a, LatLng b) {
    final lat1 = a.latitude;
    final lon1 = a.longitude;
    final lat2 = b.latitude;
    final lon2 = b.longitude;

    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);
    final radLat1 = _toRadians(lat1);
    final radLat2 = _toRadians(lat2);

    final haversin =
        (sin(dLat / 2) * sin(dLat / 2)) +
        cos(radLat1) * cos(radLat2) * (sin(dLon / 2) * sin(dLon / 2));
    final c = 2 * asin(sqrt(haversin));
    const earthRadiusKm = 6371.0; // en kilómetros

    return earthRadiusKm * c * 1000; // devolver distancia en metros
  }

  static double totalDistance(List<LatLng> points) {
    double totalMeters = 0.0;
    if (points.length < 2) return 0.0;
    for (int i = 0; i < points.length - 1; i++) {
      totalMeters += distanceBetween(points[i], points[i + 1]);
    }
    double totalKm = totalMeters / 1000.0;
    return double.parse(totalKm.toStringAsFixed(1));
  }

  static double averageSpeed(List<LatLng> points, List<DateTime> times) {
    if (points.length < 2 || times.length < 2) return 0.0;
    double distMeters = totalDistance(points);
    final start = times.first;
    final end = times.last;
    final durationSeconds = end.difference(start).inSeconds;
    if (durationSeconds <= 0) return 0.0;
    // velocidad en m/s
    double speedMs = distMeters / durationSeconds;
    // convertir a km/h
    return speedMs * 3.6;
  }

  static double getCalories({
    required double speedKmh,
    required double durationHours,
    required double weightKg,
  }) {
    double met;
    if (speedKmh < 5) {
      met = 2.0;
    } else if (speedKmh < 8) {
      met = 4.5;
    } else {
      met = 8.0;
    }
    return met * weightKg * durationHours;
  }

  static double assumeSpeedKmh({
    required double distanceKm,
    required double weightKg,
  }) {
    double baseSpeed;

    if (distanceKm <= 1.0) {
      baseSpeed = 10.0;
    } else if (distanceKm <= 5.0) {
      baseSpeed = 9.0;
    } else {
      baseSpeed = 8.0;
    }

    // Ajuste por peso: si peso es alto, reducir velocidad un poco
    // Supongamos que 70 kg es baseline, por cada 5 kg extra restamos 0.1 km/h
    double adjustment = (weightKg - 70.0) / 5.0 * 0.1;
    double assumed = baseSpeed - adjustment;

    // No bajar demasiado:
    if (assumed < 5.0) assumed = 3.0;

    return assumed;
  }

  static double assumeDurationHours({
    required double distanceKm,
    required double speedKmh,
  }) {
    if (speedKmh <= 0) return 0.0;
    final durationHours = distanceKm / speedKmh;
    final durationMinutes = durationHours * 60;
    return double.parse(
      durationMinutes.toStringAsFixed(2),
    ); // horas = km ÷ (km/h)
  }

  static double estimateCalories({
    double speedKmh = 0,
    double durationHours = 0,
    required double weightKg,
  }) {
    // Si no se pasó velocidad, asumir una velocidad típica según el peso
    if (speedKmh <= 0) {
      // Por ejemplo: persona de más peso podría moverse algo más lento
      // Asumimos:
      //   90kg → 8 km/h, 70kg → 10 km/h, 60kg → 11 km/h (esto es arbitrario)
      if (weightKg >= 90) {
        speedKmh = 4.0;
      } else if (weightKg >= 70) {
        speedKmh = 5.0;
      } else {
        speedKmh = 7.0;
      }
    }

    // Si no se pasó duración, asumir duración estándar (por ejemplo 0.5 h = 30 min)
    if (durationHours <= 0) {
      durationHours = 0.5;
    }

    // Ahora asignar MET basado en velocidad
    double met;
    if (speedKmh < 5) {
      met = 2.0;
    } else if (speedKmh < 8) {
      met = 4.5;
    } else if (speedKmh < 12) {
      met = 8.0;
    } else {
      met = 10.0;
    }

    // Calorías estimadas: MET × peso (kg) × duración en horas
    double calories = met * weightKg * durationHours;

    // Redondear con un decimal
    return double.parse(calories.toStringAsFixed(1));
  }
}
