Feature: Gráfico de Pareto de causas de falla
  Como gestor,
  deseo ver un gráfico de Pareto de causas de falla,
  para identificar los problemas más recurrentes y enfocar la mejora continua.

  Scenario: Visualización del gráfico de Pareto
    Dado que estoy en la pantalla "Análisis de Causas" (USF23)
    Y la causa "Falla de pack de hielo" ha ocurrido 20 veces
    Y la causa "Tapa mal cerrada" ha ocurrido 5 veces
    Cuando el sistema genera el gráfico de Pareto
    Entonces la barra "Falla de pack de hielo" es la más alta (mostrando 20)
    Y "Tapa mal cerrada" es la segunda barra más alta (mostrando 5).

  Scenario: Identificación de la regla 80/20
    Dado que estoy viendo el gráfico de Pareto
    Cuando observo la línea de porcentaje acumulativo
    Entonces puedo ver que las 2 causas principales (el 20% de las causas)
    Y suman el 80% del total de incidentes reportados.

  Scenario: Filtrar el gráfico de Pareto
    Dado que estoy en el "Dashboard Principal"
    Cuando aplico el filtro "Ubicación: Zona A"
    Y navego a la pantalla "Análisis de Causas"
    Entonces el gráfico de Pareto se recalcula
    Y solo muestra el análisis de causas para los incidentes de la "Zona A".