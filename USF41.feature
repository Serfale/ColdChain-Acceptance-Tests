Feature: Visibilidad del estado de conexión del sensor
  Como gestor,
  deseo ver la última hora de conexión de un sensor,
  para saber si está transmitiendo datos (online) o si se ha desconectado.

  Scenario: Sensor se muestra "Online"
    Dado que el "Sensor-001" ha enviado una lectura de temperatura hace "2 minutos"
    Cuando el gestor mira el "Contenedor-A" en el dashboard
    Entonces ve un indicador visual "Online" (ej. un punto verde)
    Y al pasar el mouse sobre el indicador, ve el texto "Última conexión: hace 2 minutos".

  Scenario: Sensor se muestra "Offline" por falta de conexión
    Dado que el "Sensor-002" no ha enviado una lectura en los últimos "15 minutos"
    Y el umbral de desconexión es de "10 minutos"
    Cuando el gestor mira el "Contenedor-B" en el dashboard
    Entonces ve un indicador visual "Offline" (ej. un punto rojo)
    Y al pasar el mouse sobre el indicador, ve el texto "Última conexión: hace 15 minutos".

  Scenario: Estado "Offline" genera una alerta de sistema
    Dado que el "Sensor-002" ha entrado en estado "Offline"
    Cuando el sistema detecta la desconexión
    Entonces se genera una alerta de tipo "Sistema" (no crítica)
    Y se notifica al gestor: "Sensor-002 se ha desconectado".