Feature: Navegación (Drill-down) del Dashboard al Detalle del Equipo
  Como gestor,
  deseo hacer clic en un equipo (cooler) en el dashboard,
  para navegar a su vista de detalle e historial de temperatura.

  Scenario: Navegación a un equipo en estado "Normal"
    Dado que el gestor está en el "Dashboard Principal" (USF19)
    Y ve la tarjeta del "Refrigerador-D3" con estado "Normal"
    Cuando el gestor hace clic en la tarjeta del "Refrigerador-D3"
    Entonces es redirigido a la pantalla de "Detalle de Equipo"
    Y el título de la pantalla es "Refrigerador-D3".

  Scenario: Navegación a un equipo en estado "Crítico"
    Dado que el gestor está en el "Dashboard Principal"
    Y ve la tarjeta de la "Cámara Fría C1" con estado "Crítico"
    Cuando el gestor hace clic en la tarjeta de la "Cámara Fría C1"
    Entonces es redirigido a la pantalla de "Detalle de Equipo"
    Y la pantalla muestra un banner de alerta "Crítico" activo.

  Scenario: Retorno de la vista de detalle al dashboard
    Dado que el gestor se encuentra en la pantalla de "Detalle de Equipo" del "Refrigerador-D3"
    Cuando hace clic en el botón o enlace "Volver al Monitor"
    Entonces es redirigido de vuelta al "Dashboard Principal".