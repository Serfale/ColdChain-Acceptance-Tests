Feature: Emparejamiento de sensor BLE/NFC con contenedor
  Como brigadista,
  deseo emparejar (pairing) el sensor BLE/NFC con el contenedor,
  para empezar a monitorear.

  Scenario: Emparejamiento exitoso de un sensor disponible
    Dado que el sensor "Sensor-001" está encendido y disponible
    Y el brigadista está en la pantalla "Vincular Sensor" del "Contenedor-A"
    Cuando el brigadista selecciona el "Sensor-001" de la lista de dispositivos cercanos
    Entonces la app vincula el "Sensor-001" al "Contenedor-A"
    Y el estado del contenedor cambia a "Monitoreando"
    Y la app comienza a recibir lecturas de temperatura.

  Scenario: Intento de emparejar un sensor ya vinculado
    Dado que el "Sensor-001" ya está vinculado y activo en el "Contenedor-A"
    Y el brigadista está en la pantalla "Vincular Sensor" del "Contenedor-B"
    Cuando el brigadista intenta seleccionar el "Sensor-001" de la lista
    Entonces la app bloquea la acción
    Y muestra un mensaje de error "El sensor ya está en uso en Contenedor-A".

  Scenario: Reconexión automática de sensor
    Dado que el "Sensor-001" está correctamente vinculado al "Contenedor-A"
    Y la app está monitoreando activamente
    Y la conexión BLE se pierde temporalmente (ej. por distancia)
    Cuando el brigadista vuelve al rango de alcance del sensor
    Entonces la app se reconecta automáticamente al "Sensor-001" en menos de 5 segundos
    Y el monitoreo continúa sin pérdida de datos.