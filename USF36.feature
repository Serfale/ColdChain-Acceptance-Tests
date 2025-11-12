Feature: Marcar alerta como 'recibida' (Acknowledge)
  Como gestor,
  deseo marcar una alerta como 'recibida' (Acknowledge),
  para que mi equipo sepa que ya la estoy gestionando.

  Scenario: Gestor marca una alerta como 'recibida'
    Dado que hay una alerta "Crítica" activa en el "Contenedor-A"
    Y el "Gestor A" está viendo el dashboard
    Cuando el "Gestor A" presiona "Acusar recibo" (Acknowledge) en la alerta
    Entonces el estado de la alerta cambia de "Activa" a "En Revisión"
    Y se registra que el "Gestor A" está a cargo del incidente.

  Scenario: Visibilidad del estado 'En Revisión' para otros gestores
    Dado que el "Gestor A" ha marcado la alerta del "Contenedor-A" como "En Revisión"
    Y el "Gestor B" está viendo el mismo dashboard
    Cuando el "Gestor B" mira la alerta del "Contenedor-A"
    Entonces ve claramente que está "En Revisión" por el "Gestor A"
    Y el botón "Acusar recibo" está deshabilitado para el "Gestor B".

  Scenario: Marcar como 'recibida' detiene el escalamiento automático por SLA
    Dado que la política de SLA (USF12) escalará las alertas "Activas" después de 15 minutos
    Y una alerta "Crítica" se dispara a las 10:00 AM
    Cuando el "Gestor A" marca la alerta como "En Revisión" a las 10:05 AM
    Entonces el temporizador de escalamiento automático de 15 minutos se detiene
    Y la alerta no se escala al "Supervisor General" a las 10:15 AM.