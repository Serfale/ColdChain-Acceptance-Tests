Feature: Notificación Push nativa para el Brigadista
  Como brigadista,
  deseo recibir una notificación push nativa en mi móvil,
  para enterarme de una alerta incluso si la app está cerrada.

  Scenario: Recepción de alerta con la app cerrada o en segundo plano
    Dado que el brigadista está logueado en la app
    Y la app está en segundo plano o cerrada
    Y el brigadista ha permitido las notificaciones para "ColdChain" en su móvil
    Cuando se dispara una alerta "Crítica" para el "Contenedor-A"
    Entonces el móvil del brigadista recibe una notificación push nativa
    Y la notificación muestra el título "Alerta Crítica: Contenedor-A".

  Scenario: Tocar la notificación abre la app en la alerta correcta
    Dado que el brigadista ha recibido una notificación push de la alerta "ALERTA-123"
    Cuando el brigadista toca (taps) la notificación
    Entonces la app "ColdChain" se abre
    Y la app navega directamente a la pantalla de detalle de la "ALERTA-123"
    Y le muestra los pasos de acción (Playbook USF10).

  Scenario: No se reciben notificaciones si están deshabilitadas
    Dado que el brigadista ha deshabilitado las notificaciones para "ColdChain" en los ajustes de su móvil
    Cuando se dispara una alerta "Crítica" para el "Contenedor-A"
    Entonces el móvil del brigadista no recibe ninguna notificación push
    Y (la alerta sigue siendo visible dentro de la app y para el gestor).