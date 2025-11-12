Feature: Modo offline y Sincronización Automática
  Como brigadista,
  deseo operar en modo offline y que la app sincronice,
  para trabajar sin cobertura de internet.

  Scenario: Captura de datos en modo offline
    Dado que el brigadista está en una zona sin conectividad a internet
    Y la app muestra el indicador "Modo Offline"
    Cuando el brigadista escanea el QR de la "Bolsa-789"
    Y adjunta una foto al incidente "Temperatura alta"
    Entonces los datos (escaneo y foto) se almacenan localmente en una cola de sincronización.

  Scenario: Sincronización automática y resolución de conflictos
    Dado que la app tiene 10 eventos en la cola de sincronización offline
    Y el dispositivo recupera la conectividad a internet
    Cuando la app detecta la conexión
    Entonces inicia la sincronización automática de los 10 eventos.
    Y si ocurre un conflicto (ej. "Bolsa-789" ya registrada por otro usuario), el sistema resuelve por el sello de tiempo más reciente e informa la colisión al gestor.

  Scenario: Forzar sincronización manual
    Dado que la app está en modo offline y tiene 5 eventos pendientes
    Y el brigadista recupera señal momentáneamente
    Cuando presiona el botón "Sincronizar Ahora"
    Entonces la app intenta enviar los 5 eventos de inmediato
    Y muestra una barra de progreso de la sincronización.