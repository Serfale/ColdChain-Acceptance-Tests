Feature: Generación de Reporte de Cierre de Campaña
  Como gestor,
  deseo generar reporte de cierre (PDF/CSV) con KPIs y bitácora,
  para evidencias.

  Scenario: Generación correcta de reporte de campaña finalizada
    Dado que la "Campaña-A" está en estado "Finalizada"
    Y el dashboard muestra 0 incidentes abiertos
    Cuando el gestor selecciona "Exportar Reporte" en formato PDF
    Entonces se genera un archivo PDF
    Y los KPIs del reporte (ej. % de excursiones) coinciden con los del dashboard.

  Scenario: Intento de generar reporte final con incidentes abiertos
    Dado que la "Campaña-B" tiene 1 incidente "Crítico" aún "Activo"
    Cuando el gestor intenta "Generar Reporte Final"
    Entonces el sistema genera el reporte
    Pero lo marca visiblemente con una filigrana (watermark) de "BORRADOR"
    Y muestra un aviso de que existen incidentes sin resolver.

  Scenario: Envío automático de reporte por correo
    Dado que la "Campaña-C" está configurada para notificar automáticamente al "auditor@hospital.org"
    Cuando el gestor marca la campaña como "Finalizada" y confirma el cierre
    Entonces el sistema envía automáticamente el reporte PDF final
    Y el usuario "auditor@hospital.org" recibe un correo con el reporte adjunto.