Feature: Cierre de alerta con selección de causa raíz
  Como brigadista,
  deseo 'cerrar' una alerta seleccionando una causa raíz de una lista,
  para documentar la resolución del incidente.

  Scenario: Cierre exitoso seleccionando una causa de la lista
    Dado que una alerta "Crítica" está "En Revisión"
    Y el brigadista ha subido la evidencia (USF11)
    Cuando el brigadista presiona "Resolver Alerta"
    Y selecciona la causa "Tapa mal cerrada" de la lista desplegable
    Y confirma la resolución
    Entonces la alerta cambia su estado a "Resuelta"
    Y la causa "Tapa mal cerrada" queda registrada en el historial del incidente.

  Scenario: Cierre seleccionando la causa "Otro"
    Dado que el brigadista está resolviendo una alerta
    Cuando selecciona la causa "Otro" de la lista
    Entonces el sistema habilita un campo de texto obligatorio para "Detalle de la causa".
    Y si el brigadista intenta guardar sin llenar ese campo de texto, el sistema muestra un error
    Y no permite cerrar la alerta.

  Scenario: Intento de cierre sin seleccionar una causa
    Dado que una alerta "Crítica" está "En Revisión"
    Cuando el brigadista presiona "Resolver Alerta"
    Pero no ha seleccionado ninguna causa raíz de la lista
    Entonces el sistema muestra un error "Debe seleccionar una causa raíz"
    Y la alerta permanece "En Revisión".