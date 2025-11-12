Feature: Gestión de cuentas de usuario (ABM)
  Como gestor (admin),
  deseo invitar, editar y desactivar cuentas de usuario,
  para gestionar quién tiene acceso al sistema.

  Scenario: Invitar un nuevo usuario al sistema
    Dado que estoy en la pantalla "Gestión de Usuarios" como "admin"
    Cuando ingreso el email "nuevo.brigadista@hospital.org"
    Y selecciono el rol "Brigadista"
    Y presiono el botón "Invitar"
    Entonces el sistema envía un correo de invitación a "nuevo.brigadista@hospital.org"
    Y el usuario aparece en la lista con estado "Pendiente".

  Scenario: Editar el rol de un usuario existente
    Dado que el usuario "usuario@hospital.org" existe con el rol "Brigadista"
    Cuando el "admin" edita el perfil de "usuario@hospital.org"
    Y cambia su rol a "Conductor"
    Y guarda los cambios
    Entonces los permisos del usuario "usuario@hospital.org" se actualizan a los de "Conductor".

  Scenario: Desactivar una cuenta de usuario
    Dado que el usuario "brigadista.antiguo@hospital.org" está "Activo"
    Cuando el "admin" presiona "Desactivar" en el perfil de ese usuario
    Y confirma la acción
    Entonces el estado del usuario cambia a "Inactivo"
    Y el usuario "brigadista.antiguo@hospital.org" ya no puede iniciar sesión en la app.