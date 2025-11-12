Feature: Playbooks de acción para el Brigadista
  Como brigadista,
  deseo ver recomendaciones de acción ante una alerta,
  para resolver rápido.

  Scenario: Visualización del playbook guiado
    Dado que estoy en la app móvil y recibo una alerta de "Alta Temperatura"
    Y la alerta está activa
    Cuando abro el detalle de la alerta
    Entonces veo una lista de pasos de acción sugeridos
    Y el primer paso es "1. Añadir pack de hielo"
    Y el segundo paso es "2. Verificar cierre hermético de tapa".

  Scenario: Verificación de recuperación post-acción
    Dado que estoy viendo los pasos de una alerta
    Y he realizado la acción "1. Añadir pack de hielo"
    Cuando presiono el botón "Acción Aplicada"
    Entonces el sistema inicia un temporizador de 5 minutos
    Y la app muestra el estado "Verificando recuperación...".

  Scenario: Escalamiento automático por no recuperación
    Dado que he marcado una "Acción Aplicada"
    Y el temporizador de 5 minutos ha expirado
    Y la temperatura del sensor sigue fuera del rango seguro
    Entonces el sistema escala automáticamente la alerta al Gestor
    Y me muestra el mensaje "Problema no resuelto. Contactando al supervisor".