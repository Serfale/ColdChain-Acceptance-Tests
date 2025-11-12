Feature: Micro-capacitaciones in-app
  Como usuario nuevo,
  deseo acceso a micro-capacitaciones in-app (videos 1-2 min),
  para aprender rápidamente.

  Scenario: Progreso de capacitación
    Dado que el módulo "Cómo escanear una unidad" tiene 3 videos
    Y el usuario ha completado 1 de 3 videos
    Cuando el usuario completa el segundo video
    Y lo marca como "Completado"
    Entonces la barra de progreso del módulo se actualiza a "2/3 (66%)".

  Scenario: Requisito inicial para funciones críticas
    Dado que es la primera vez que un "Brigadista" inicia sesión
    Y el módulo "Registro de Unidades" es obligatorio
    Cuando el brigadista intenta acceder a la función "Escanear Unidad"
    Entonces la app lo redirige a la pantalla del módulo "Registro de Unidades"
    Y muestra el mensaje "Por favor, completa esta capacitación obligatoria para continuar".

  Scenario: Certificación interna con quiz
    Dado que el usuario ha completado todos los videos del módulo "Gestión de Alertas"
    Y se le presenta un quiz de 5 preguntas
    Cuando el usuario responde 4 de 5 preguntas correctamente (80%)
    Y finaliza el quiz
    Entonces obtiene un certificado interno en su perfil
    Y se habilitan las funciones avanzadas de "Gestión de Alertas".