Feature: Archivar campañas
  Como gestor,
  deseo archivar una campaña 'Completada',
  para ocultarla de mi dashboard principal y mantenerlo limpio.

  Scenario: Archivar una campaña completada
    Dado que estoy en el "Dashboard Principal"
    Y la "Campaña-A" tiene el estado "Completada"
    Cuando hago clic en "Archivar" para la "Campaña-A"
    Y confirmo la acción
    Entonces la "Campaña-A" desaparece de la lista principal del dashboard.

  Scenario: Intento de archivar una campaña en curso
    Dado que estoy en el "Dashboard Principal"
    Y la "Campaña-B" tiene el estado "En Curso"
    Cuando busco la opción "Archivar" para la "Campaña-B"
    Entonces la opción "Archivar" no está visible o está deshabilitada.

  Scenario: Ver campañas archivadas
    Dado que he archivado la "Campaña-A"
    Cuando navego a la vista "Campañas Archivadas"
    Entonces la "Campaña-A" es visible en esa lista.