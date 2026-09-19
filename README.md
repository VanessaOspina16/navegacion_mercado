# Mercado Campesino

Aplicación móvil desarrollada en Flutter para facilitar la consulta y compra de productos ofrecidos por productores campesinos.

## Flujo de navegación

El usuario inicia en la pantalla principal y puede consultar productores, productos y realizar una compra mediante el carrito.

INICIO
  │
  ├── Toca "Productores"
  │          ↓
  │     PRODUCTORES
  │          │
  │     Toca productor
  │          ↓
  │   DETALLE PRODUCTOR
  │          │
  │     Ver productos
  │          ↓
  │      PRODUCTOS
  │          │
  │     Toca producto
  │          ↓
  │   DETALLE PRODUCTO
  │          │
  │    Agregar al carrito
  │          ↓
  │       CARRITO
  │          │
  │   Continuar compra
  │          ↓
  │  CONFIRMAR PEDIDO

## Tabla de navegación
| Desde | Hacia | Acción del usuario | Método de Navigator | Datos que viajan | Pila después del salto |
|---|---|---|---|---|---|
| Inicio | Productores | Toca "Productores" | `Navigator.push` | Ninguno | Inicio → Productores |
| Productores | Detalle productor | Toca un productor | `Navigator.push` | Productor seleccionado | Inicio → Productores → Detalle productor |
| Detalle productor | Productos | Toca "Ver productos" | `Navigator.push` | Identificador del productor | Inicio → Productores → Detalle productor → Productos |
| Inicio | Productos | Toca "Productos" | `Navigator.push` | Ninguno | Inicio → Productos |
| Productos | Detalle producto | Toca un producto | `Navigator.push` | Producto seleccionado | Inicio → Productos → Detalle producto |
| Detalle producto | Carrito | Toca "Agregar al carrito" | `Navigator.push` | Producto y cantidad | Inicio → Productos → Detalle producto → Carrito |
| Carrito | Confirmar pedido | Toca "Continuar compra" | `Navigator.push` | Productos seleccionados y total | Inicio → Productos → Detalle producto → Carrito → Confirmar pedido |