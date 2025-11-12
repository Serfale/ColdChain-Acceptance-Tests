Feature: Escalamiento de recordatorios no atendidos
  Como gestor,
  deseo que los recordatorios no atendidos por el brigadista se me escalen,
  para asegurar que las tareas críticas se cumplan.

  Scenario: Escalamiento exitoso de un recordatorio ignorado
    Dado que un recordatorio crítico ("Verificar Batería") fue enviado al "Brigadista A"
    Y la política de escalamiento es de "15 minutos"
    Cuando el "Brigadista A" no marca el recordatorio como "Hecho" (USF20)
    Y han pasado 15 minutos
    Entonces el sistema envía automáticamente una alerta al "Gestor de Campaña"
    Y la alerta indica "Recordatorio crítico no atendido por Brigadista A".

  Scenario: No se escala un recordatorio completado a tiempo
    Dado que un recordatorio crítico ("Verificar Batería") fue enviado al "Brigadista A" a las 10:00 AM
    Y la política de escalamiento es de "15 minutos"
    Cuando el "Brigadista A" marca el recordatorio como "Hecho" a las 10:10 AM
    Y llega la hora 10:15 AM
    Entonces el sistema NO envía una alerta de escalamiento al "Gestor de Campaña".

  Scenario: No se escala un recordatorio pospuesto (se reinicia el temporizador)
    Dado que un recordatorio crítico fue enviado al "Brigadista A" a las 10:00 AM
    Y la política de escalamiento es de "15 minutos"
    Cuando el "Brigadista A" presiona "Posponer 10 min" a las 10:05 AM
    Y llega la hora 10:15 AM (tiempo original de escalamiento)
    Entonces el sistema NO envía una alerta de escalamiento
    Y (el nuevo tiempo de escalamiento ahora es a las 10:25 AM).