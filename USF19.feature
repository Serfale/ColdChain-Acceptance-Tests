Feature: Dashboard en tiempo real para el Gestor
  Como gestor,
  deseo ver un tablero en tiempo real (semáforo, TTR, unidades),
  para priorizar acciones.

  Scenario: Filtrar el dashboard por estado de riesgo
    Dado que el gestor está en el "Dashboard Principal"
    Y hay 2 campañas "Críticas" y 5 "Normales"
    Cuando el gestor aplica el filtro "Estado: Crítico"
    Entonces el dashboard se actualiza
    Y solo muestra las 2 campañas "Críticas".

  Scenario: Auto-refresco del dashboard
    Dado que el gestor tiene el "Dashboard Principal" abierto
    Y una campaña "Normal" cambia a estado "Advertencia" en el servidor
    Cuando pasan 60 segundos (el intervalo de refresco)
    Entonces el dashboard se actualiza automáticamente sin recargar la página
    Y la campaña ahora muestra el estado "Advertencia".

  Scenario: Exportar un snapshot del dashboard
    Dado que el gestor está en una reunión operativa viendo el "Dashboard Principal"
    Cuando presiona el botón "Exportar Snapshot"
    Entonces el sistema genera una imagen (ej. PNG) del estado actual del dashboard
    Y la imagen incluye una marca de tiempo con la fecha y hora de la exportación.