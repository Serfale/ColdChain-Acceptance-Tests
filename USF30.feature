Feature: Indicador visual de estado de campaña en el dashboard
  Como gestor,
  deseo ver un indicador visual de estado (ej. 'En Curso', 'Completada'),
  para conocer la situación de mis campañas de un vistazo.

  Scenario: Ver estado 'Planificada'
    Dado que he creado una campaña "Campaña Futura" con fecha de inicio de mañana
    Cuando abro el "Dashboard Principal"
    Entonces la "Campaña Futura" es visible en la lista
    Y muestra una etiqueta gris con el texto "Planificada".

  Scenario: Ver estado 'En Curso'
    Dado que una campaña "Campaña Activa" fue iniciada por un brigadista
    Y está actualmente en progreso
    Cuando abro el "Dashboard Principal"
    Entonces la "Campaña Activa" es visible
    Y muestra una etiqueta verde con el texto "En Curso".

  Scenario: Ver estado 'Completada'
    Dado que la "Campaña Antigua" fue finalizada y cerrada ayer
    Cuando abro el "Dashboard Principal"
    Entonces la "Campaña Antigua" es visible
    Y muestra una etiqueta azul con el texto "Completada".