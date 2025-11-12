Feature: Cambio de contraseña de usuario
  Como usuario,
  deseo poder cambiar mi propia contraseña desde mi perfil,
  para mantener la seguridad de mi cuenta.

  Scenario: Cambio de contraseña exitoso
    Dado que estoy logueado como un usuario "gestor1"
    Y navego a la pantalla "Mi Perfil"
    Cuando ingreso mi "contraseña_antigua_correcta" en el campo "Contraseña Antigua"
    Y ingreso "NuevaContraseñaValida123!" en el campo "Contraseña Nueva"
    Y ingreso "NuevaContraseñaValida123!" en el campo "Confirmar Contraseña"
    Y presiono "Guardar Cambios"
    Entonces mi contraseña se actualiza exitosamente
    Y soy redirigido a la pantalla de "Mi Perfil" con un mensaje de éxito.

  Scenario: Intento de cambio con contraseña antigua incorrecta
    Dado que estoy logueado como un usuario "gestor1"
    Y navego a la pantalla "Mi Perfil"
    Cuando ingreso "contraseña_incorrecta" en el campo "Contraseña Antigua"
    Y ingreso "NuevaContraseñaValida123!" en el campo "Contraseña Nueva"
    Y confirmo la nueva contraseña
    Y presiono "Guardar Cambios"
    Entonces la contraseña no se actualiza
    Y veo un mensaje de error "La contraseña antigua es incorrecta".

  Scenario Outline: Intento de cambio con contraseña nueva inválida
    Dado que estoy logueado como un usuario "gestor1"
    Y navego a la pantalla "Mi Perfil"
    Cuando ingreso mi "contraseña_antigua_correcta" en el campo "Contraseña Antigua"
    Y ingreso la contraseña <invalida> en el campo "Contraseña Nueva"
    Y confirmo la contraseña <invalida>
    Y presiono "Guardar Cambios"
    Entonces la contraseña no se actualiza
    Y veo un mensaje de error <mensaje_error>.

    Examples:
      | invalida       | mensaje_error                                         |
      | "corta"        | "La contraseña debe tener al menos 8 caracteres"      |
      | "sinMayuscula" | "La contraseña debe incluir al menos una mayúscula" |
      | "sinNumero"    | "La contraseña debe incluir al menos un número"       |