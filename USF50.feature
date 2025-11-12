Feature: Configuración de preferencias de notificación
  Como gestor,
  deseo configurar mis preferencias de notificación (email, push, SMS),
  para evitar saturarme de alertas y recibir solo las más críticas.

  Scenario: Deshabilitar un canal de notificación (SMS)
    Dado que el "Gestor A" tiene activadas las notificaciones por "push" y "SMS"
    Y navega a la pantalla "Mis Preferencias de Notificación"
    Cuando deshabilita la opción de "Alertas por SMS"
    Y guarda los cambios
    Entonces cuando se dispara una alerta "Crítica"
    Y el sistema envía una notificación "push", pero NO envía un "SMS".

  Scenario: Habilitar un canal de notificación (Email)
    Dado que el "Gestor A" solo tiene activadas las notificaciones "push"
    Y navega a la pantalla "Mis Preferencias de Notificación"
    Cuando habilita la opción de "Alertas por Email"
    Y guarda los cambios
    Entonces cuando se dispara una alerta "Crítica"
    Y el sistema envía una notificación "push" Y TAMBIÉN envía un "Email".

  Scenario: Configuración avanzada por nivel de criticidad
    Dado que el "Gestor A" está en la pantalla "Configuración Avanzada de Notificación"
    Cuando configura "Alertas Críticas" para enviar por "SMS y Push"
    Y configura "Alertas de Advertencia" para enviar solo por "Push"
    Y guarda los cambios
    Entonces cuando se dispara una alerta de "Advertencia", solo recibe "Push".
    Y cuando se dispara una alerta "Crítica", recibe "SMS y Push".