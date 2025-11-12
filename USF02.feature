Feature: Configuración de umbrales de temperatura por insumo
  Como gestor,
  deseo configurar umbrales por hemocomponente (rango °C y tiempo máximo fuera de rango),
  para estandarizar el control.

  Scenario Outline: Configuración exitosa de umbrales para un insumo
    Dado que estoy en la configuración de una campaña planificada
    Y selecciono el tipo de insumo <insumo>
    Cuando ingreso una temperatura mínima de <min_temp>
    Y una temperatura máxima de <max_temp>
    Y un tiempo máximo de excursión de <tiempo>
    Y guardo la configuración
    Entonces los umbrales para <insumo> quedan activos
    Y son visibles en el detalle de la campaña.

    Examples:
      | insumo     | min_temp | max_temp | tiempo    |
      | "RBC"      | "2°C"    | "6°C"    | "15 min"  |
      | "Plasma"   | "-25°C"  | "-18°C"  | "10 min"  |
      | "Plaquetas"| "20°C"   | "24°C"   | "5 min"   |

  Scenario: Aplicación de plantilla de umbrales
    Dado que existe una plantilla de umbrales aprobada llamada "Protocolo MINSA"
    Y estoy creando una "Nueva Campaña"
    Cuando selecciono la plantilla "Protocolo MINSA"
    Entonces los umbrales para RBC, Plasma y Plaquetas se cargan automáticamente
    Y se registra la aplicación de la plantilla en el log de la campaña.

  Scenario: Intento de guardar un rango de temperatura inválido
    Dado que estoy configurando los umbrales para "RBC"
    Cuando ingreso una temperatura mínima de "10°C"
    Y una temperatura máxima de "5°C"
    Y intento guardar
    Entonces el sistema muestra un error "El rango de temperatura es inválido"
    Y los cambios no se guardan.