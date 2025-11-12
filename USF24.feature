Feature: Exportación de datos de campaña
  Como gestor,
  deseo exportar datos (unidades, incidentes, lecturas),
  para análisis externo.

  Scenario: Exportación directa de datos
    Dado que el gestor ha aplicado filtros a una campaña
    Y hay menos de 50,000 filas de resultados
    Cuando el gestor presiona "Exportar" y selecciona "CSV"
    Entonces el sistema genera el archivo CSV
    Y se descarga directamente en el navegador con los campos seleccionados.

  Scenario: Exportación grande (asíncrona)
    Dado que el gestor ha solicitado una exportación que supera las 50,000 filas
    Cuando el gestor presiona "Exportar"
    Entonces el sistema crea una tarea asíncrona
    Y muestra el mensaje "Tu reporte se está generando, te enviaremos un correo con el enlace de descarga".

  Scenario: Control de permisos en la exportación
    Dado que un usuario con rol "Auditor Externo" solo tiene permisos para ver incidentes (no costos)
    Cuando ese usuario intenta exportar los datos de una campaña
    Entonces el archivo CSV generado
    Y solo incluye los campos de incidentes y temperaturas, excluyendo los campos de costos.