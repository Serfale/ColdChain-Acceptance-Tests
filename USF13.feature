Feature: Traslado de unidades a contenedor de backup
  Como brigadista,
  deseo mover unidades a un contenedor de backup en caso de falla,
  para salvar los insumos.

  Scenario: Traslado validado y exitoso
    [cite_start]Dado que el "Contenedor-A" está en estado "Crítico" (rojo) [cite: 745]
    Y el "Contenedor-B" (backup) está "Apto" (verde)
    [cite_start]Cuando el brigadista selecciona "Trasladar al backup" [cite: 745]
    [cite_start]Y escanea el "Contenedor-B" [cite: 745]
    Y confirma el traslado de 5 unidades
    Entonces las 5 unidades se reasignan al "Contenedor-B"
    [cite_start]Y el historial de auditoría de ambas unidades refleja el traslado. [cite: 745]

  Scenario: Intento de traslado a un contenedor de backup no apto
    [cite_start]Dado que el "Contenedor-B" (backup) está fuera de rango de temperatura [cite: 745]
    Cuando el brigadista intenta mover unidades al "Contenedor-B"
    [cite_start]Entonces la app bloquea el traslado [cite: 745]
    [cite_start]Y muestra un mensaje sugiriendo acciones de acondicionamiento. [cite: 745]

  Scenario: Traslado parcial de unidades
    [cite_start]Dado que el "Contenedor-A" tiene 20 unidades que deben moverse [cite: 745]
    [cite_start]Cuando el brigadista selecciona mover solo 10 de esas unidades al "Contenedor-B" [cite: 745]
    Y confirma
    [cite_start]Entonces el sistema permite el movimiento parcial [cite: 745]
    Y los conteos de ambos contenedores se actualizan correctamente.