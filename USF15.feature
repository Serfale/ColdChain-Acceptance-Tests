Feature: Firma digital de cadena de custodia en recepción
  Como recepción/laboratorio,
  deseo firmar digitalmente cadena de custodia al recibir los contenedores,
  para validar la entrega.

  Scenario: Firma exitosa con geolocalización
    Dado que un contenedor entrante ("Contenedor-A") ha llegado al laboratorio
    Y el usuario de "Recepción" abre la app
    Cuando el usuario verifica los datos del "Contenedor-A"
    Y captura su firma digital en la app
    Entonces la app guarda la firma
    Y registra la ubicación GPS y la hora exacta de la entrega.

  Scenario: Validación de contenedor incorrecto
    Dado que el usuario de "Recepción" está esperando el "Contenedor-A"
    Cuando el conductor le entrega el "Contenedor-B" por error
    Y el usuario de "Recepción" escanea el QR del "Contenedor-B"
    Entonces la app muestra un aviso de "Discrepancia de Contenedor"
    Y bloquea la opción de firmar la recepción hasta que se escanee el contenedor correcto.

  Scenario: Proceso de doble firma (entrega y recepción)
    Dado que la campaña está configurada con "Doble Firma" para la entrega
    Cuando el "Conductor" llega al destino y presiona "Entregar"
    Entonces la app solicita la firma del "Conductor".
    Y luego, solicita la firma del usuario de "Recepción"
    Y solo cuando ambas firmas son capturadas, la transferencia se marca como "Completada".