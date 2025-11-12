Feature: Gestión de Playbooks de Acción
  Como gestor (admin),
  deseo crear y editar los 'playbooks' de acción,
  para estandarizar la respuesta que deben seguir los brigadistas.

  Scenario: Creación de un nuevo playbook
    Dado que el gestor (admin) está en la sección "Gestión de Playbooks"
    Cuando crea un nuevo playbook para la alerta tipo "Alta Temperatura"
    Y añade el paso "1. Añadir pack de hielo de repuesto"
    Y añade el paso "2. Verificar cierre hermético de tapa"
    Y guarda el playbook
    Entonces el playbook "Alta Temperatura" está activo
    Y (la próxima alerta de "Alta Temperatura" mostrará estos dos pasos al brigadista).

  Scenario: Edición de un playbook existente
    Dado que el playbook "Alta Temperatura" tiene 2 pasos
    Cuando el gestor (admin) edita dicho playbook
    Y añade el paso "3. Mover contenedor a la sombra"
    Y guarda los cambios
    Entonces el playbook "Alta Temperatura" ahora tiene 3 pasos
    Y (la próxima alerta de "Alta Temperatura" mostrará los tres pasos).

  Scenario: Validación de campos obligatorios
    Dado que el gestor (admin) está creando un nuevo playbook
    Cuando intenta guardar el playbook sin añadir ningún paso de acción
    Entonces el sistema muestra un error "Debe añadir al menos un paso de acción"
    Y el playbook no se guarda.