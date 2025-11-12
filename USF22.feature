Feature: Mensajería broadcast por campaña
  Como brigadista,
  deseo enviar mensajes broadcast al equipo,
  para coordinación.

  Scenario: Envío de mensaje a todos los miembros
    Dado que el brigadista está en una campaña en progreso
    Cuando envía un mensaje "Importante: Reunión al final del día" al canal "Todos"
    Entonces todos los miembros de esa campaña reciben una notificación push
    Y ven el mensaje en su canal de campaña.

  Scenario: Adjuntar un archivo a un mensaje broadcast
    Dado que el brigadista está redactando un mensaje para "Todos"
    Cuando adjunta el archivo "protocolo_emergencia.pdf"
    Y envía el mensaje
    Entonces los miembros del canal pueden ver el mensaje
    Y el archivo "protocolo_emergencia.pdf" está disponible para descargar.

  Scenario: Envío de mensaje a un subgrupo (ej. Ruta A)
    Dado que la campaña tiene un subgrupo de roles llamado "Ruta A"
    Y el brigadista necesita avisar solo a ese subgrupo
    Cuando el brigadista selecciona el subgrupo "Ruta A"
    Y envía el mensaje "Cuidado en el desvío km 5"
    Entonces solo los miembros del subgrupo "Ruta A" reciben la notificación.