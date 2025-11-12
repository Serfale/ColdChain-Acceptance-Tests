Feature: Adjuntar evidencia a incidentes
  Como brigadista,
  deseo adjuntar evidencia (foto/notas) al resolver una alerta,
  para auditoría.

  Scenario: Adjuntar evidencia (foto y nota) a una alerta
    Dado que hay una alerta "Crítica" activa en el "Contenedor-A"
    Y el brigadista ha aplicado una acción correctiva
    Cuando el brigadista presiona "Resolver Alerta"
    Y adjunta una foto de la acción
    Y escribe la nota "Se añadieron 2 packs de hielo"
    Y presiona "Confirmar Resolución"
    Entonces el incidente cambia su estado a "Resuelto"
    Y la foto y la nota quedan visibles en el historial de la alerta para el gestor.

  Scenario: Adjuntar evidencia en modo offline
    Dado que el brigadista está en una zona sin conectividad
    Y está resolviendo una alerta
    Cuando toma una foto y escribe una nota de evidencia
    Entonces la app guarda la foto y la nota en la cola de sincronización local
    Y al recuperar la conectividad, la evidencia se sube automáticamente al incidente.

  Scenario: Control de edición de evidencia (inmutabilidad)
    Dado que una evidencia (foto) ya fue registrada y sincronizada por un brigadista
    Cuando el mismo brigadista intenta eliminar esa foto del incidente
    Entonces la app no muestra un botón de "Eliminar"
    Y solo un usuario con rol "Supervisor" o "Gestor" puede anular la evidencia (dejando un rastro de auditoría).