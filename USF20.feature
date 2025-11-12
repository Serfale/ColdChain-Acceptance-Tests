Feature: Recordatorios programados para tareas críticas
  Como gestor,
  deseo programar recordatorios (pre-acondicionamiento de packs, salida),
  para reducir errores.

  Scenario: Programación y aviso de recordatorio
    Dado que una campaña tiene una "Hora de Salida" programada para las 10:00 AM
    Y el gestor ha programado un recordatorio de "Pre-acondicionamiento" 30 minutos antes
    Cuando el reloj marca las 9:30 AM
    Entonces el brigadista asignado recibe una notificación push
    Y la notificación dice "Recordatorio: Iniciar pre-acondicionamiento de packs".

  Scenario: Usuario interactúa con un recordatorio (Posponer o Completar)
    Dado que el brigadista ha recibido un recordatorio de "Pre-acondicionamiento"
    Cuando presiona el botón "Posponer 10 min"
    Entonces la notificación desaparece y se vuelve a activar a las 9:40 AM.
    Y si presiona "Hecho", la tarea se marca como completada y se registra la acción.

  Scenario: Escalamiento por recordatorio crítico no atendido
    Dado que un recordatorio crítico ("Verificar Batería del Sensor") fue enviado
    Y el brigadista no lo ha marcado como "Hecho"
    Cuando vence el tiempo límite del recordatorio
    Entonces el sistema envía automáticamente una alerta al Gestor
    Y la alerta indica "Recordatorio crítico no atendido por Brigadista A".