Feature: Gestión de inventario de sensores y equipos
  Como TI/operaciones,
  deseo gestionar inventario de sensores, coolers y packs,
  para disponibilidad.

  Scenario: Alta de un nuevo sensor en el inventario
    Dado que el usuario de TI/operaciones está en el módulo de "Inventario"
    Cuando registra un "Nuevo Sensor" con ID "Sensor-100"
    Y le asigna la ubicación "Almacén Central"
    Y la fecha de próxima calibración
    Entonces el "Sensor-100" aparece en el inventario
    Y su estado es "Disponible".

  Scenario: Impedir asignación de un sensor en mantenimiento
    Dado que el "Sensor-101" tiene el estado "En Mantenimiento"
    Y un gestor está creando una "Campaña-D"
    Cuando el gestor intenta asignar el "Sensor-101" a un contenedor
    Entonces el sistema lo impide
    Y muestra un mensaje "Sensor no disponible (En Mantenimiento)"
    Y sugiere el próximo sensor "Disponible".

  Scenario: Actualización de ubicación por escaneo de despacho
    Dado que el "Sensor-102" tiene la ubicación "Almacén Central"
    Y un brigadista lo escanea en el punto de "Despacho Zona A"
    Cuando el sistema procesa el escaneo de despacho
    Entonces la ubicación del "Sensor-102" se actualiza automáticamente
    Y su nueva ubicación en el inventario es "Despacho Zona A".