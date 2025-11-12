Feature: Filtrar dashboard por ubicación o responsable
  Como gestor,
  deseo filtrar mi dashboard por ubicación o responsable,
  para supervisar las zonas o campañas que me interesan.

  Scenario: Filtrar dashboard por ubicación
    Dado que el gestor está en el "Dashboard Principal"
    Y hay 3 campañas en "Zona A" y 2 en "Zona B"
    Cuando el gestor aplica el filtro "Ubicación: Zona A"
    Entonces el dashboard se actualiza
    Y solo muestra las 3 campañas de la "Zona A".

  Scenario: Filtrar dashboard por responsable
    Dado que el gestor está en el "Dashboard Principal"
    Y "Brigadista 1" está asignado a 2 campañas
    Y "Brigadista 2" está asignado a 3 campañas
    Cuando el gestor aplica el filtro "Responsable: Brigadista 1"
    Entonces el dashboard se actualiza
    Y solo muestra las 2 campañas asignadas a "Brigadista 1".

  Scenario: Limpiar filtros aplicados
    Dado que el gestor ha aplicado el filtro "Ubicación: Zona A"
    Y solo está viendo 3 campañas
    Cuando el gestor presiona el botón "Limpiar Filtros"
    Entonces el filtro se elimina
    Y el dashboard vuelve a mostrar todas las campañas (las 5).