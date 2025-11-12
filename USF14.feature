Feature: Visualización de ruta y tiempos para el conductor
  Como conductor,
  deseo ver mi ruta y tiempos estimados,
  para cumplir la programación.

  Scenario: Navegación con ruta y tiempo estimado (ETA)
    Dado que estoy logueado como "Conductor" y tengo una ruta asignada para hoy
    Cuando abro la sección "Mi Ruta" en la app
    Entonces veo un mapa con la ruta trazada
    Y una lista ordenada de paradas
    Y el tiempo estimado de llegada (ETA) para la siguiente parada.

  Scenario: Funcionalidad de mapa en modo offline
    Dado que estoy siguiendo mi ruta y entro en una zona sin conectividad
    Cuando la app pierde la señal de internet
    Entonces el mapa sigue visible usando los datos en caché (offline)
    Y la app continúa registrando mi trayecto GPS localmente
    Y al recuperar la señal, sincroniza el trayecto completado.

  Scenario: Check-in en un punto de entrega
    Dado que he llegado al "Centro de Salud A" (mi primera parada)
    Cuando presiono el botón "Check-in"
    Entonces el sistema registra mi llegada y la hora
    Y el gestor recibe una actualización de estado en su dashboard
    Y mi ETA para la siguiente parada se recalcula.