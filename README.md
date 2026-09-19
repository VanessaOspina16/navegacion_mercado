# Mercado Campesino

Aplicación móvil desarrollada en Flutter para facilitar la consulta y compra de productos ofrecidos por productores campesinos.

## Flujo de navegación

El usuario inicia en la pantalla principal, debe registrarse, luego  puede consultar productores, productos y realizar una compra mediante el carrito.

                         ┌─────────────────────┐
                         │   INICIO / LOGIN    │
                         │                     │
                         │ ¿Ya tiene cuenta?   │
                         └─────────┬───────────┘
                                   │
                    ┌──────────────┴──────────────┐
                    │                             │
             Toca "Iniciar sesión"         Toca "Registrarse"
                    │                             │
                    ↓                             ↓
          ┌──────────────────┐          ┌──────────────────┐
          │  INICIO SESIÓN   │          │     REGISTRO     │
          │                  │          │                  │
          │ Correo/usuario   │          │ Nombre           │
          │ Contraseña       │          │ Correo           │
          └────────┬─────────┘          │ Contraseña       │
                   │                    └────────┬─────────┘
                   │                             │
                   │       Registro exitoso      │
                   │◄────────────────────────────┘
                   │
                   │ Inicio de sesión exitoso
                   ↓
          ┌──────────────────┐
          │      INICIO      │
          └────────┬─────────┘
                   │
        ┌──────────┼───────────┐
        ↓          ↓           ↓
   Productores  Productos    Carrito
        │          │           │
        ↓          ↓           ↓
   Detalle       Detalle    Resumen
  productor     producto    compra
        │          │
        └────┬─────┘
             ↓
          Carrito
             │
             ↓
      Confirmar pedido

## Tabla de navegación
| Desde | Hacia | Acción del usuario | Método | ¿Por qué? | Datos que viajan | Pila |
|---|---|---|---|---|---|---|
| Inicio de sesión | Registro | Toca "Registrarse" | `Navigator.push` | Permite acceder al formulario sin perder la pantalla de inicio de sesión. | Ninguno | Login → Registro |
| Registro | Inicio de sesión | Registro exitoso | `Navigator.pop` | Permite regresar al inicio de sesión una vez creado el usuario, sin agregar otra pantalla a la pila. | Resultado del registro | Login |
| Inicio de sesión | Inicio | Toca "Ingresar" con credenciales válidas | `Navigator.pushReplacement` | Después de autenticarse, se reemplaza el login para evitar que el usuario vuelva a él al presionar Atrás. | Datos básicos del usuario | Inicio |
| Inicio | Productores | Toca "Productores" | `Navigator.push` | Permite consultar los productores y regresar posteriormente al inicio. | Ninguno | Inicio → Productores |
| Productores | Detalle productor | Toca un productor | `Navigator.push` | Permite consultar la información específica del productor conservando la lista. | Productor seleccionado | Inicio → Productores → Detalle productor |
| Detalle productor | Productos | Toca "Ver productos" | `Navigator.push` | Permite consultar los productos asociados al productor. | ID del productor | Inicio → Productores → Detalle productor → Productos |
| Inicio | Productos | Toca "Productos" | `Navigator.push` | Permite acceder directamente al catálogo. | Ninguno | Inicio → Productos |
| Productos | Detalle producto | Toca un producto | `Navigator.push` | Permite consultar la información detallada del producto y regresar al catálogo. | Producto seleccionado | Inicio → Productos → Detalle producto |
| Detalle producto | Carrito | Toca "Agregar al carrito" | `Navigator.push` | Permite continuar con la compra conservando el detalle del producto. | Producto y cantidad | Inicio → Productos → Detalle producto → Carrito |
| Carrito | Confirmar pedido | Toca "Continuar compra" | `Navigator.push` | Permite pasar al resumen antes de confirmar el pedido. | Productos y total | Inicio → Productos → Detalle producto → Carrito → Confirmar pedido |