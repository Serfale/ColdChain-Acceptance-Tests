Feature: Descargar historial de temperatura por unidad (bolsa)
  Como gestor,
  deseo descargar el historial de temperatura de una sola unidad (bolsa) como un PDF,
  para un análisis de calidad detallado.

  Scenario: Descarga exitosa de historial de unidad
    Dado que el gestor está viendo el detalle de la "Bolsa-123"
    Y esta unidad tiene un estado de "Completada"
    Cuando el gestor presiona el botón "Descargar Historial PDF"
    Entonces el sistema genera un archivo PDF (ej. "Bolsa-123_Historial.pdf")
    Y el PDF contiene el gráfico de temperatura y la lista de eventos de esa unidad específica.

  Scenario: Intento de descarga de historial para unidad "En Curso"
    Dado que el gestor está viendo el detalle de la "Bolsa-456"
    Y esta unidad tiene un estado de "En Curso"
    Cuando el gestor busca el botón "Descargar Historial PDF"
    Entonces el botón está deshabilitado
    Y muestra un texto "Solo disponible al completar la entrega".

  Scenario: Verificación de la integridad de datos en el PDF
    Dado que la app muestra que la "Bolsa-123" tuvo una excursión a las "10:30 AM"
    Cuando el gestor descarga y abre el historial en PDF de esa unidad
    Entonces el PDF también muestra la excursión a las "10:30 AM" en su registro de eventos
    Y el gráfico de temperatura refleja esa excursión.