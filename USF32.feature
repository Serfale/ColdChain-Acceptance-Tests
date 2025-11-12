Feature: Desvincular sensor del contenedor
  Como brigadista,
  deseo desvincular un sensor de un contenedor al finalizar la campaña,
  para que el sensor quede disponible para otro uso.

  Scenario: Desvinculación automática al finalizar la campaña
    Dado que el "Sensor-001" está vinculado al "Contenedor-A" en una campaña "En Curso"
    Cuando el gestor marca la campaña como "Completada"
    Entonces el "Sensor-001" se desvincula automáticamente del "Contenedor-A"
    Y el estado del "Sensor-001" en el inventario (USF18) cambia a "Disponible".

  Scenario: Desvinculación manual por un Gestor
    Dado que el "Sensor-001" está vinculado al "Contenedor-A"
    Y el usuario "Gestor-Admin" está viendo la configuración del "Contenedor-A"
    Cuando el "Gestor-Admin" presiona "Desvincular Sensor"
    Y confirma la acción
    Entonces el "Sensor-001" se desvincula del "Contenedor-A"
    Y el "Contenedor-A" muestra el estado "Sin monitoreo".

  Scenario: Intento de desvinculación por rol no autorizado
    Dado que el "Sensor-001" está vinculado al "Contenedor-A" en una campaña "En Curso"
    Y un usuario con rol "Brigadista" está viendo la app
    Cuando busca la opción "Desvincular Sensor" en la app
    Entonces la opción no está visible o está deshabilitada por permisos.