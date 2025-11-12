Feature: Contador de eventos pendientes de sincronizar
  Como brigadista,
  deseo ver un contador de eventos pendientes de sincronizar,
  para saber el estado de la sincronización offline.

  Scenario: El contador incrementa en modo offline
    Dado que el brigadista está en "Modo Offline"
    Y el contador de sincronización muestra "0"
    Cuando el brigadista escanea una "Bolsa-101" (1 evento)
    Y luego escanea una "Bolsa-102" (2 eventos)
    Entonces el contador de sincronización en la app muestra "2 eventos pendientes".

  Scenario: El contador se reinicia a cero después de sincronizar
    Dado que el brigadista tiene "5 eventos pendientes" en la cola
    Y la app recupera la conectividad a internet
    Cuando la app completa la sincronización automática
    Entonces el contador de sincronización desaparece o muestra "Sincronizado"
    Y el contador vuelve a "0".

  Scenario: El contador no es visible cuando todo está sincronizado
    Dado que el brigadista está en "Modo Online"
    Y no hay eventos pendientes en la cola
    Cuando el brigadista mira la pantalla principal
    Entonces el contador de sincronización no es visible
    Y en su lugar se muestra un indicador de "Conectado".