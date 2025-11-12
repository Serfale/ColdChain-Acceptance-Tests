Feature: Ver mis campañas asignadas en la app móvil
  Como brigadista,
  deseo ver una lista de mis campañas asignadas en la app,
  para saber qué tareas tengo pendientes.

  Scenario: Ver lista de campañas asignadas
    Dado que estoy logueado como "Brigadista A"
    Y estoy asignado a "Campaña Costa" y "Campaña Sierra"
    Cuando abro la pantalla principal de la app
    Entonces veo "Campaña Costa" y "Campaña Sierra" en mi lista
    Y la "Campaña Sierra" está marcada como "Próxima".

  Scenario: Ver campaña en curso priorizada
    Dado que estoy asignado a "Campaña Costa" y "Campaña Sierra"
    Y la "Campaña Costa" está "En Curso"
    Cuando abro la pantalla principal de la app
    Entonces "Campaña Costa" aparece al inicio de la lista
    Y está resaltada visualmente (ej. indicador verde).

  Scenario: No ver campañas ajenas
    Dado que estoy logueado como "Brigadista A"
    Y existe una "Campaña Selva" a la que no estoy asignado
    Cuando abro la pantalla principal de la app
    Entonces la "Campaña Selva" no es visible en mi lista.