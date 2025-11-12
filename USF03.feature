Feature: Gestión de Plantillas de Campaña
  Como gestor,
  deseo usar plantillas de campaña,
  para evitar re-trabajo.

  Scenario: Crear una campaña usando una plantilla existente
    Dado que existe una plantilla de campaña llamada "Campaña de Donación Estándar"
    Y esta plantilla tiene preconfigurados los umbrales de RBC y un checklist de 5 pasos
    Cuando el gestor crea una "Nueva Campaña"
    Y selecciona la plantilla "Campaña de Donación Estándar"
    Then el formulario de la nueva campaña se precarga con los umbrales de RBC
    And el checklist de 5 pasos ya está asociado a la campaña.

  Scenario: Intentar usar una plantilla no disponible (deshabilitada)
    Dado que una plantilla llamada "Protocolo Antiguo" ha sido deshabilitada por un administrador
    Cuando el gestor crea una "Nueva Campaña"
    Y busca "Protocolo Antiguo" en la lista desplegable de plantillas
    Then la plantilla "Protocolo Antiguo" aparece inactiva (en gris)
    And no puede ser seleccionada.

  Scenario: Edición de una campaña no afecta a la plantilla original
    Dado que el gestor creó la "Campaña Verano" usando la plantilla "Estándar"
    Y la plantilla "Estándar" tiene el rol "Responsable A"
    Cuando el gestor edita la "Campaña Verano"
    And cambia el rol a "Responsable B"
    And guarda la campaña
    Then la "Campaña Verano" se actualiza con el "Responsable B"
    And la plantilla "Estándar" original mantiene al "Responsable A" en su configuración.