Feature: Editar detalles de una campaña planificada
  Como gestor,
  deseo editar los detalles de una campaña 'Planificada',
  para corregir errores antes de iniciar.

  Scenario: Edición exitosa de una campaña planificada
    Dado que estoy viendo la campaña "Campaña Costa" con estado "Planificada"
    Y el responsable actual es "Gestor A"
    Cuando cambio el responsable a "Gestor B"
    Y presiono "Guardar"
    Entonces los cambios se guardan
    Y el responsable de la "Campaña Costa" ahora es "Gestor B"
    Y el estado de la campaña sigue siendo "Planificada".

  Scenario: Intento de editar una campaña en curso
    Dado que estoy viendo la campaña "Campaña Sierra" con estado "En Curso"
    Cuando intento editar el campo "Ubicación"
    Entonces el campo "Ubicación" está deshabilitado (solo lectura)
    Y se muestra un mensaje "No se puede editar una campaña en curso".

  Scenario: Validación de campos obligatorios durante la edición
    Dado que estoy editando la campaña "Campaña Costa"
    Cuando borro el contenido del campo obligatorio "Fecha de Inicio"
    Y presiono "Guardar"
    Entonces el sistema muestra un error de validación "La fecha de inicio es obligatoria"
    Y los cambios no se guardan.