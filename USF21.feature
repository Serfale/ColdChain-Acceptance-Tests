Feature: Motor de reglas de aceptación
  Como gestor,
  deseo definir reglas de aceptación (p.ej., tiempo fuera de rango <= 5 min),
  para automatizar decisiones.

  Scenario: Regla activa aplica sugerencia de aceptación/rechazo
    Dado que existe una regla activa: "Rechazar si tiempo fuera de rango > 5 min"
    Y el usuario de "Recepción" escanea una unidad con 10 minutos de excursión
    Cuando el sistema analiza el historial de la unidad
    Entonces la app sugiere "No Apta"
    Y muestra la razón "Excursión supera el límite de 5 min".

  Scenario: Cambios en una regla no afectan decisiones ya cerradas
    Dado que la "Unidad-123" fue "Aceptada" ayer bajo la regla "límite 10 min"
    Y hoy el gestor actualiza la regla a "límite 5 min"
    Cuando el gestor guarda la nueva regla
    Entonces las nuevas sugerencias aplicarán solo a unidades pendientes
    Y la "Unidad-123" permanece en estado "Aceptada" en el historial.

  Scenario: Simulación de impacto de una nueva regla
    Dado que el gestor quiere probar una nueva regla: "Rechazar si temp < -20°C"
    Y existen 1000 registros históricos de campañas pasadas
    Cuando el gestor ejecuta "Simular" con la nueva regla sobre esos datos
    Entonces el sistema muestra un impacto estimado
    Y reporta "Esta regla habría causado un 5% adicional de rechazos".