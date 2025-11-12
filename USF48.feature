Feature: Bandeja de entrada de mensajes de campaña
  Como brigadista,
  deseo tener una bandeja de entrada de mensajes con indicadores de 'no leído',
  para gestionar la comunicación de la campaña.

  Scenario: Recepción de nuevo mensaje y actualización de contador
    Dado que el brigadista está logueado en la app
    Y su bandeja de entrada tiene "2" mensajes no leídos
    Cuando el gestor envía un nuevo mensaje broadcast (USF22)
    Entonces el icono de la bandeja de entrada en la app muestra un contador "3"
    Y el nuevo mensaje aparece al inicio de la lista y marcado como "No Leído".

  Scenario: Marcar mensaje como leído al abrirlo
    Dado que el brigadista tiene un mensaje "No Leído"
    Y el contador de la bandeja de entrada muestra "1"
    Cuando el brigadista abre el mensaje para leerlo
    Entonces el mensaje se marca automáticamente como "Leído"
    Y al volver a la bandeja de entrada, el contador muestra "0".

  Scenario: Ver historial de mensajes en la bandeja de entrada
    Dado que el brigadista ha recibido 20 mensajes durante la campaña
    Cuando abre la bandeja de entrada
    Entonces ve los 10 mensajes más recientes en orden cronológico inverso
    Y puede hacer scroll (desplazarse) hacia abajo para cargar y ver los mensajes más antiguos.