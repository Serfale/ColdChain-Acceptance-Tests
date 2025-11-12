Feature: Creación de Campañas
  Como gestor,
  deseo crear una campaña con fechas, ubicaciones y responsable,
  para iniciar el control de cadena de frío.

  Scenario: Creación exitosa de una campaña
    Dado que el gestor abre "Nueva campaña"
    Y completa todos los campos obligatorios
    Cuando guarda la campaña
    Entonces la campaña queda en estado "Planificada"
    Y se genera un ID único
    Y el responsable de la campaña es notificado.

  Scenario Outline: Validación de campos obligatorios
    Dado que el gestor abre "Nueva campaña"
    Y deja el campo <campo_vacio> sin llenar
    Cuando intenta guardar la campaña
    Entonces se muestra un mensaje de validación sobre el <campo_vacio>
    Y la campaña no se crea
    Y el guardado se bloquea hasta completar los datos.

    Examples:
      | campo_vacio   |
      | "ubicacion"   |
      | "fecha"       |
      | "responsable" |

  Scenario: Intento de crear una campaña duplicada
    Dado que ya existe una campaña con el mismo nombre y fechas
    Y el gestor intenta crear otra campaña exactamente igual
    Cuando intenta guardar la nueva campaña
    Entonces el sistema advierte sobre la duplicidad
    Y sugiere renombrar o confirmar la creación con sufijo.
