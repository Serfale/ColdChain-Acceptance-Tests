Feature: Recomendación de Aceptación/Rechazo en Recepción
  Como recepción/laboratorio,
  deseo que el sistema me muestre una recomendación (Aceptar / Rechazar) al escanear una unidad,
  para tomar una decisión informada.

  Scenario: Sugerencia de "Apta" para unidad en rango
    Dado que la regla de aceptación es "Rechazar si excursión > 5 min"
    Y el usuario de "Recepción" escanea la "Unidad-200"
    Y la "Unidad-200" no tuvo excursiones de temperatura
    Cuando el sistema analiza el historial de la unidad
    Entonces la app muestra una recomendación "Apta"
    Y muestra la razón "Unidad se mantuvo en rango".

  Scenario: Sugerencia de "No Apta" para unidad fuera de rango
    Dado que la regla de aceptación es "Rechazar si excursión > 5 min"
    Y el usuario de "Recepción" escanea la "Unidad-201"
    Y la "Unidad-201" tuvo una excursión de 10 minutos
    Cuando el sistema analiza el historial de la unidad
    Entonces la app muestra una recomendación "No Apta"
    Y muestra la razón "Excursión de 10 minutos (límite 5 min)".

  Scenario: Sugerencia de "Revisión Manual" por datos incompletos
    Dado que el usuario de "Recepción" escanea la "Unidad-202"
    Y el historial de la unidad muestra una pérdida de conexión del sensor de 30 minutos
    Cuando el sistema analiza el historial de la unidad
    Entonces la app muestra una recomendación "Revisión Manual Requerida"
    Y muestra la razón "Datos incompletos por sensor desconectado".