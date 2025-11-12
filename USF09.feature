Feature: Alertas de excursión en tiempo real para el Gestor
  Como gestor,
  deseo recibir alertas de excursión en tiempo real,
  para actuar a tiempo.

  Scenario: Alerta por umbral de temperatura superado
    Dado que los umbrales para "RBC" están configurados entre 2°C y 6°C
    Y el tiempo máximo de excursión es de 5 minutos
    Cuando el "Sensor-001" (vinculado a "RBC") reporta una lectura de "8°C"
    Y esa lectura se mantiene por más de 5 minutos
    Entonces se genera una alerta "Crítica"
    Y se envía una notificación push y un SMS al Gestor responsable.

  Scenario: Notificación a la guardia alterna fuera de horario
    Dado que el Gestor 1 (responsable) tiene un horario de 9 AM a 5 PM
    Y el Gestor 2 está configurado como "guardia alterna" de 5 PM a 9 AM
    Cuando se dispara una alerta "Crítica" a las 7 PM
    Entonces el sistema notifica automáticamente al Gestor 2 (guardia alterna)
    Y no envía la notificación al Gestor 1.

  Scenario: Prevención de alertas por fluctuaciones (anti-ruido)
    Dado que el umbral máximo para "Plaquetas" es 24°C
    Y la histéresis (margen de ruido) está configurada en 0.5°C
    Cuando un sensor reporta "24.2°C" por 10 segundos
    Pero al segundo 11, la temperatura se estabiliza y vuelve a "23.8°C"
    Entonces el sistema registra la fluctuación en el log
    Pero no se dispara una alerta "Crítica" al gestor.