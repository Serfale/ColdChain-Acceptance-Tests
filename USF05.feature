Feature: Checklist pre-salida del brigadista
  Como brigadista,
  deseo ejecutar un checklist pre-salida (packs, sensor, batería),
  para asegurar el acondicionamiento.

  Scenario: Completar el checklist pre-salida exitosamente
    Dado que estoy en la app y he seleccionado una campaña "En Alistamiento"
    Y completo todos los pasos críticos del checklist
    Y adjunto la foto de evidencia requerida
    Cuando presiono el botón "Iniciar Salida"
    Entonces la app habilita la salida
    Y registra la fecha y hora de inicio de la campaña.

  Scenario: Intento de iniciar salida con un checklist incompleto
    Dado que estoy en la pantalla del checklist
    Y el paso crítico "Packs pre-acondicionados" no está marcado
    Cuando intento presionar "Iniciar Salida"
    Entonces el botón está deshabilitado
    Y la app muestra un mensaje indicando el paso pendiente
    Y la salida es impedida.

  Scenario: Completar el checklist en modo offline
    Dado que estoy en una zona sin conectividad a internet
    Y abro el checklist de mi campaña asignada
    Cuando marco todos los pasos y adjunto la foto (guardada localmente)
    Y presiono "Iniciar Salida"
    Entonces la app guarda el estado "Iniciada" localmente
    Y al recuperar la conectividad, sincroniza automáticamente el estado con el servidor.