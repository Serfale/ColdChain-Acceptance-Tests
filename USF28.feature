Feature: Guardar una campaña existente como plantilla
  Como gestor,
  deseo guardar una campaña existente como una nueva plantilla,
  para reutilizar sus configuraciones (umbrales, roles) en el futuro.

  Scenario: Guardado exitoso de campaña como plantilla
    Dado que estoy viendo los detalles de una campaña "Completada"
    Cuando presiono la opción "Guardar como plantilla"
    Y ingreso el nombre "Plantilla de Costa v1"
    Y confirmo
    Entonces se crea una nueva plantilla en la lista de plantillas
    Y esta nueva plantilla contiene los mismos umbrales de la campaña "Completada".

  Scenario: Usar la plantilla recién creada
    Dado que he creado la "Plantilla de Costa v1" en el escenario anterior
    Cuando creo una "Nueva Campaña"
    Y selecciono la "Plantilla de Costa v1" de la lista
    Entonces la nueva campaña se precarga con los umbrales correctos de la plantilla.

  Scenario: Intento de guardar una plantilla con nombre duplicado
    Dado que ya existe una plantilla llamada "Plantilla Hospital Central"
    Cuando intento guardar una nueva plantilla con el mismo nombre "Plantilla Hospital Central"
    Entonces el sistema muestra un error de validación "El nombre de la plantilla ya existe"
    Y me pide que ingrese un nombre diferente.