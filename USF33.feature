Feature: Verificación de historial de pre-acondicionamiento
  Como brigadista,
  deseo ver el historial de temperatura de las últimas 2 horas de un sensor,
  para verificar el pre-acondicionamiento antes de salir.

  Scenario: Visualización del gráfico de historial en el checklist
    Dado que estoy en la pantalla del "Checklist Pre-Salida" (USF05)
    Y he vinculado exitosamente el "Sensor-001"
    Cuando presiono el indicador de temperatura actual del sensor
    Entonces se abre un gráfico modal
    Y este gráfico muestra las lecturas de temperatura de las últimas 2 horas.

  Scenario: Aprobación visual de pre-acondicionamiento exitoso
    Dado que el "Sensor-001" ha mantenido una temperatura estable en el rango seguro (ej. 4°C) durante los últimos 30 minutos
    Cuando el brigadista abre el "Checklist Pre-Salida"
    Entonces el ítem del checklist "Verificar Pre-acondicionamiento"
    Y aparece con un indicador de check verde automático.

  Scenario: Rechazo visual de pre-acondicionamiento fallido
    Dado que el "Sensor-001" reporta una temperatura actual de "10°C" (fuera de rango)
    Cuando el brigadista abre el "Checklist Pre-Salida"
    Entonces el ítem "Verificar Pre-acondicionamiento" aparece con una 'X' roja
    Y se muestra el aviso "Temperatura fuera de rango. No iniciar".