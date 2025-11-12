Feature: Asignación de roles y equipo a la campaña
  Como gestor,
  deseo asignar roles y equipo (brigadistas, conductores, recepción),
  para ordenar responsabilidades.

  Scenario: Asignación exitosa de un usuario existente a un rol
    Dado que existe una campaña activa llamada "Campaña Centro" 
    Y existe un usuario "brigadista1@coldchain.pe" con el rol "Brigadista"
    Cuando el gestor asigna a "brigadista1@coldchain.pe" al rol "Brigadista de Campo" en la "Campaña Centro" 
    Entonces el usuario "brigadista1@coldchain.pe" recibe una notificación en su app móvil 
    Y puede ver el checklist de la "Campaña Centro" en su app. 

  Scenario: Invitar a un usuario nuevo durante la asignación
    Dado que el gestor está asignando roles para la "Campaña Centro"
    Cuando el gestor ingresa el correo "nuevo.conductor@hospital.org" (que no tiene cuenta) 
    Y le asigna el rol "Conductor"
    Entonces el sistema ofrece enviar una invitación de registro a "nuevo.conductor@hospital.org" 
    And el rol "Conductor" queda marcado como "Pendiente de Aceptación". 

  Scenario: Reasignación de rol por ausencia
    Dado que el usuario "brigadista1@coldchain.pe" está asignado a la "Campaña Centro"
    Y ese usuario reporta una ausencia 
    Cuando el gestor reasigna el rol "Brigadista de Campo" al usuario "brigadista2@coldchain.pe" 
    Entonces las tareas de "brigadista1@coldchain.pe" se transfieren a "brigadista2@coldchain.pe" 
    And se crea un registro de auditoría del cambio de asignación.