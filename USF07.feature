Feature: Registro de unidades (bolsas) con QR en el contenedor
  Como brigadista,
  deseo registrar cada bolsa en el contenedor con QR/ID,
  para asegurar trazabilidad por unidad.

  Scenario: Registro correcto de una nueva bolsa
    Dado que el "Contenedor-A" está activo y monitoreando
    Y el brigadista escanea el QR de la "Bolsa-123" (que es nueva)
    Cuando el sistema valida el QR
    Entonces la "Bolsa-123" queda asociada al "Contenedor-A"
    Y se registra el sello de tiempo y el usuario que la escaneó.

  Scenario: Intento de registrar una bolsa duplicada
    Dado que la "Bolsa-123" ya fue registrada en el "Contenedor-A"
    Cuando el brigadista escanea nuevamente el QR de la "Bolsa-123"
    Entonces la app muestra el mensaje "Unidad ya registrada"
    Y muestra la hora y el contenedor donde fue registrada originalmente.

  Scenario: Corrección de un registro erróneo (borrado temprano)
    Dado que el brigadista registró por error la "Bolsa-456"
    Y han pasado menos de 2 minutos desde el registro
    Cuando el brigadista selecciona la "Bolsa-456" y presiona "Desasociar"
    Y provee una justificación (ej. "Escaneo equivocado")
    Entonces la "Bolsa-456" se desvincula del contenedor
    Y la acción queda registrada en el log de auditoría.