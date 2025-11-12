Feature: Análisis de causas recurrentes de excursión
  Como gestor,
  deseo ver análisis de causas recurrentes de excursión,
  para mejora continua.

  Scenario: Ranking de causas por frecuencia e impacto
    Dado que he cerrado 10 campañas en el último mes
    Y la causa "Falla de pack de hielo" se registró 15 veces
    Y la causa "Tapa mal cerrada" se registró 5 veces
    Cuando abro la pantalla "Análisis de Causas"
    Entonces veo un ranking de causas
    Y "Falla de pack de hielo" aparece en primer lugar por frecuencia.

  Scenario: Filtrar el análisis de causas
    Dado que estoy en la pantalla "Análisis de Causas"
    Cuando aplico el filtro "Ubicación: Zona A"
    Y el filtro "Tipo de Contenedor: Cooler Pequeño"
    Entonces las gráficas y el ranking se actualizan
    Y solo muestran las causas recurrentes para esa zona y tipo de equipo.

  Scenario: Drill-down (profundizar) a incidentes asociados
    Dado que estoy viendo el ranking de causas
    Y la causa "Falla de pack de hielo" muestra 15 incidentes
    Cuando hago clic en "Falla de pack de hielo"
    Entonces navego a una nueva pantalla
    Y veo la lista detallada de los 15 incidentes específicos asociados a esa causa.