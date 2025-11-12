Feature: Escalamiento de alertas críticas
  Como gestor,
  deseo escalar alertas críticas al supervisor,
  para soporte inmediato.

  Scenario: Escalamiento manual de una alerta
    Dado que existe una alerta "Crítica" activa en el "Contenedor-A"
    Y el gestor está viendo el detalle de la alerta
    Cuando el gestor presiona el botón "Escalar"
    Y selecciona al "Supervisor General"
    Entonces se envía una notificación push y SMS al "Supervisor General"
    Y se crea una tarea de seguimiento asignada al supervisor.

  Scenario: Escalamiento automático por SLA (Service Level Agreement)
    Dado que existe una política de SLA de "15 minutos para alertas Críticas"
    Y se dispara una alerta "Crítica" en el "Contenedor-B"
    Cuando la alerta permanece en estado "Activa" por más de 15 minutos
    Y no ha sido marcada como "recibida"
    Entonces el sistema escala automáticamente la alerta al "Supervisor General"
    Y la alerta se etiqueta como "SLA Excedido" en el dashboard.

  Scenario: Cierre y desescalamiento de una alerta
    Dado que una alerta "Crítica" fue escalada al "Supervisor General"
    Y el brigadista ha resuelto el incidente (ej. USF11)
    Cuando el gestor confirma la resolución y cierra la alerta
    Entonces se notifica el cierre de la alerta a todos los involucrados
    Y la tarea de seguimiento del supervisor se marca como "Completada".