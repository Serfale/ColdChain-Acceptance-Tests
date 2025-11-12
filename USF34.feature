Feature: Feedback sensorial para escaneo de QR
  Como brigadista,
  deseo recibir un feedback visual (check verde) y auditivo (beep),
  para confirmar que el escaneo QR de una bolsa fue exitoso.

  Scenario: Feedback de escaneo exitoso
    Dado que el brigadista está en la pantalla "Escanear Unidad" del "Contenedor-A"
    Cuando escanea el QR de una "Bolsa-123" válida y nueva
    Entonces la app muestra una animación de "check verde" en pantalla
    Y el dispositivo emite un sonido "beep" de confirmación
    Y la "Bolsa-123" se añade a la lista de unidades del contenedor.

  Scenario: Feedback de escaneo fallido (QR duplicado)
    Dado que la "Bolsa-123" ya ha sido registrada en el sistema
    Cuando el brigadista escanea el QR de la "Bolsa-123" nuevamente
    Entonces la app muestra una animación de "X roja"
    Y el dispositivo emite un sonido de "error" (ej. doble beep)
    Y se muestra el mensaje "Unidad ya registrada".

  Scenario: Feedback de escaneo fallido (QR ilegible)
    Dado que el brigadista está en la pantalla "Escanear Unidad"
    Cuando la cámara no puede enfocar o leer un QR dañado
    Entonces la app muestra un mensaje "QR ilegible, intente de nuevo"
    Y no emite ningún sonido de confirmación o error.