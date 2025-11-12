Feature: Historial filtrable de alertas
  Como gestor,
  deseo ver un historial filtrable de todas las alertas (activas y resueltas),
  para auditar la gestión de incidentes de una campaña.

  Scenario: Ver el historial completo de alertas
    Dado que estoy en la "Campaña-A"
    Y esta campaña tiene 5 alertas "Activas" y 10 "Resueltas"
    Cuando navego a la pantalla "Historial de Alertas"
    Entonces veo una lista con un total de 15 alertas.

  Scenario: Filtrar historial por estado
    Dado que estoy en la pantalla "Historial de Alertas" con 15 alertas
    Cuando aplico el filtro "Estado: Resuelta"
    Entonces la lista se actualiza
    Y solo veo las 10 alertas con estado "Resuelta".

  Scenario: Filtrar historial por rango de fechas
    Dado que estoy en la pantalla "Historial de Alertas"
    Y hay 5 alertas registradas "Ayer" y 10 registradas "Hoy"
    Cuando aplico el filtro de fecha "Ayer"
    Entonces la lista se actualiza
    Y solo veo las 5 alertas del día de ayer.