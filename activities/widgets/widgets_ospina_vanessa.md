# Investigación de widgets de Flutter

**Nombre del estudiante:** Vanessa Ospina
**Grupo:** 601
**Fecha:** 9 de octubre de 2026
**Widgets asignados:** `SwitchListTile`, `FilterChip` y `Scrollbar`

# 1. SwitchListTile

## 1.1. Qué es y para qué sirve

`SwitchListTile` es un widget de Flutter que permite mostrar una opción acompañada de un interruptor. El usuario puede activarlo o desactivarlo según lo que necesite.

Se puede utilizar para opciones como recordar una preferencia, activar las notificaciones o habilitar alguna función de la aplicación. El widget muestra el estado del interruptor, pero nosotros debemos programar qué sucede cuando el usuario lo cambia.

## 1.2. Cuándo usarlo y cuándo no

Lo usaría cuando necesite que el usuario active o desactive una opción, por ejemplo, para decidir si quiere recibir notificaciones.

No lo usaría para seleccionar una categoría de productos o productores, porque para eso sería más práctico utilizar `FilterChip`. Este último permite marcar una categoría y utilizar esa selección para filtrar la información que aparece en pantalla.

## 1.3. Ejemplo mínimo

Este código crea una aplicación sencilla con un interruptor que se puede activar y desactivar.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: SwitchMinimo()));
}

class SwitchMinimo extends StatefulWidget {
  const SwitchMinimo({super.key});

  @override
  State<SwitchMinimo> createState() => _SwitchMinimoState();
}

class _SwitchMinimoState extends State<SwitchMinimo> {
  bool _activo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SwitchListTile(
        title: const Text('Recordarme'),
        value: _activo,
        onChanged: (nuevoValor) {
          setState(() {
            _activo = nuevoValor;
          });
        },
      ),
    );
  }
}
```

## 1.4. Explicación del ejemplo

* `main()`: inicia la aplicación.
* `MaterialApp`: permite utilizar los componentes de diseño de Material de Flutter.
* `StatefulWidget`: se utiliza porque el interruptor cambia de estado.
* `_activo`: es una variable que guarda si el interruptor está encendido o apagado. Al iniciar, su valor es `false`.
* `title`: muestra el texto «Recordarme».
* `value`: indica el estado actual del interruptor.
* `onChanged`: se ejecuta cuando el usuario cambia el interruptor.
* `setState()`: actualiza el estado y permite que Flutter vuelva a dibujar la pantalla con el nuevo valor.

En resumen, cuando se toca el interruptor, cambia su estado y la pantalla muestra el resultado.

## 1.5. Propiedades importantes

| Propiedad         | ¿Para qué sirve?                                            | Ejemplo                                                 |
| ----------------- | ----------------------------------------------------------- | ------------------------------------------------------- |
| `title`           | Muestra el texto principal de la opción.                    | `title: const Text('Recordarme')`                       |
| `value`           | Indica si el interruptor está activado.                     | `value: _activo`                                        |
| `onChanged`       | Permite responder cuando cambia el estado.                  | `onChanged: (value) => setState(() => _activo = value)` |
| `subtitle`        | Muestra una explicación debajo del título.                  | `subtitle: const Text('En este dispositivo')`           |
| `secondary`       | Permite agregar un ícono u otro elemento al lado del texto. | `secondary: const Icon(Icons.phone_android)`            |
| `controlAffinity` | Permite elegir en qué lado aparece el interruptor.          | `controlAffinity: ListTileControlAffinity.leading`      |

## 1.6. Ejemplo personalizado

En este ejemplo agregué un ícono, un texto adicional y cambié la ubicación del interruptor para mostrar algunas de sus propiedades.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: SwitchPersonalizado()));
}

class SwitchPersonalizado extends StatefulWidget {
  const SwitchPersonalizado({super.key});

  @override
  State<SwitchPersonalizado> createState() =>
      _SwitchPersonalizadoState();
}

class _SwitchPersonalizadoState extends State<SwitchPersonalizado> {
  bool _recordarme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferencias')),
      body: SwitchListTile(
        title: const Text('Recordarme'),
        subtitle: const Text('Mantener esta opción durante la prueba'),
        secondary: const Icon(Icons.phone_android),
        controlAffinity: ListTileControlAffinity.leading,
        value: _recordarme,
        onChanged: (value) {
          setState(() {
            _recordarme = value;
          });
        },
      ),
    );
  }
}
```

**Explicación:** el ejemplo muestra una pantalla de preferencias con un interruptor. El ícono representa el dispositivo, el subtítulo explica la opción y `controlAffinity` ubica el interruptor al inicio de la fila. Al tocarlo, cambia entre activado y desactivado.

El estado solo se mantiene mientras la pantalla siga funcionando. Si se cierra y se inicia nuevamente la aplicación, no se conserva la selección porque no se implementó un sistema de almacenamiento.

## 1.7. Dónde lo usaría en Mercado Campesino

Lo utilizaría en la pantalla de inicio de sesión, junto al formulario, con la opción «Recordarme».

Esto permitiría que el usuario active o desactive esa preferencia. Para que realmente recuerde los datos de inicio de sesión, sería necesario implementar una lógica adicional de almacenamiento y seguridad.

## 1.8. Fuentes y ayudas usadas

* Documentación oficial de Flutter: [SwitchListTile](https://api.flutter.dev/flutter/material/SwitchListTile-class.html).
* Guía de Semana 4: conceptos de estado local y uso de `setState()`.
* Ayuda usada: GitHub Copilot apoyó la consulta de la actividad, la revisión de los ejemplos y la organización de esta investigación. La explicación final y la sustentación deben ser propias y comprensibles para la autora.

---

# 2. FilterChip

## 2.1. Qué es y para qué sirve

`FilterChip` es un widget que muestra una pequeña etiqueta que el usuario puede seleccionar o deseleccionar. Se utiliza principalmente para elegir filtros y mostrar únicamente la información que cumple con una condición.

Por ejemplo, en una tienda se pueden tener chips con las categorías «Frutas», «Verduras» y «Lácteos». Cuando el usuario selecciona una categoría, la aplicación puede utilizar esa selección para filtrar los productos o los productores que aparecen en la pantalla.

## 2.2. Cuándo usarlo y cuándo no

Lo usaría cuando necesite que el usuario pueda filtrar información de forma rápida, sin tener que abrir otra pantalla. Un ejemplo sería mostrar solamente los productores que venden frutas.

No lo utilizaría como un botón para navegar a otra pantalla, porque su función principal es seleccionar filtros. Si necesito que el usuario elija una sola opción entre varias alternativas, podría utilizar `ChoiceChip` o un grupo de botones de selección, dependiendo de cómo esté diseñada la interfaz.

## 2.3. Ejemplo mínimo

Este ejemplo muestra un chip con el nombre de una categoría. Al tocarlo, cambia su estado de selección.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: FilterMinimo()));
}

class FilterMinimo extends StatefulWidget {
  const FilterMinimo({super.key});

  @override
  State<FilterMinimo> createState() => _FilterMinimoState();
}

class _FilterMinimoState extends State<FilterMinimo> {
  bool _seleccionado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilterChip(
          label: const Text('Frutas'),
          selected: _seleccionado,
          onSelected: (value) {
            setState(() {
              _seleccionado = value;
            });
          },
        ),
      ),
    );
  }
}
```

## 2.4. Explicación del ejemplo

* `Center`: ubica el chip en el centro de la pantalla.
* `FilterChip`: crea la etiqueta que el usuario puede seleccionar.
* `label`: muestra el texto «Frutas».
* `selected`: indica si el chip está seleccionado.
* `onSelected`: recibe el nuevo estado cuando el usuario toca el chip.
* `setState()`: actualiza la variable y permite que el cambio se refleje en la interfaz.

En este ejemplo, el chip cambia su apariencia al seleccionarlo. Todavía no filtra una lista de productos; para hacerlo, tendríamos que conectar la selección con los datos de la aplicación.

## 2.5. Propiedades importantes

| Propiedad       | ¿Para qué sirve?                                           | Ejemplo                                                        |
| --------------- | ---------------------------------------------------------- | -------------------------------------------------------------- |
| `label`         | Define el texto o contenido principal del chip.            | `label: const Text('Frutas')`                                  |
| `selected`      | Indica si el chip está seleccionado.                       | `selected: _seleccionado`                                      |
| `onSelected`    | Permite ejecutar una acción cuando cambia la selección.    | `onSelected: (value) => setState(() => _seleccionado = value)` |
| `avatar`        | Agrega un ícono o imagen antes del texto.                  | `avatar: const Icon(Icons.eco)`                                |
| `showCheckmark` | Permite mostrar u ocultar la marca de selección.           | `showCheckmark: true`                                          |
| `selectedColor` | Define el color de fondo cuando el chip está seleccionado. | `selectedColor: const Color(0xFFE3F0D9)`                       |

## 2.6. Ejemplo personalizado

En este caso, el chip representa la categoría de frutas y tiene un ícono que ayuda a identificarla visualmente.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: FilterPersonalizado()));
}

class FilterPersonalizado extends StatefulWidget {
  const FilterPersonalizado({super.key});

  @override
  State<FilterPersonalizado> createState() =>
      _FilterPersonalizadoState();
}

class _FilterPersonalizadoState extends State<FilterPersonalizado> {
  bool _frutasSeleccionadas = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categorías')),
      body: Center(
        child: FilterChip(
          avatar: const Icon(Icons.eco_outlined),
          label: const Text('Frutas'),
          selected: _frutasSeleccionadas,
          showCheckmark: true,
          selectedColor: const Color(0xFFE3F0D9),
          onSelected: (value) {
            setState(() {
              _frutasSeleccionadas = value;
            });
          },
        ),
      ),
    );
  }
}
```

**Explicación:** se agregó un ícono relacionado con la naturaleza, se dejó visible la marca de selección y se definió un color verde claro para cuando el chip esté seleccionado. La variable `_frutasSeleccionadas` permite controlar su estado.

Este ejemplo solamente muestra el funcionamiento visual del filtro. Para filtrar información real, sería necesario utilizar el valor seleccionado al construir la lista de resultados.

## 2.7. Dónde lo usaría en Mercado Campesino

Lo utilizaría en la pantalla de inicio, encima de la lista de productores. Allí podría colocar categorías como «Todos», «Frutas», «Verduras», «Lácteos» y «Artesanías».

Cuando el usuario seleccione una categoría, la aplicación mostraría únicamente los productores relacionados con ella. La opción «Todos» permitiría volver a consultar la lista completa.

De esta manera, el usuario podría encontrar más fácilmente los productos que busca sin tener que recorrer toda la lista.

## 2.8. Fuentes y ayudas usadas

* Documentación oficial de Flutter: [FilterChip](https://api.flutter.dev/flutter/material/FilterChip-class.html).
* Documentación oficial de Flutter: [ChoiceChip](https://api.flutter.dev/flutter/material/ChoiceChip-class.html).
* Guía de Semana 4: interacción con widgets y actualización del estado mediante `setState()`.
* Ayuda usada: GitHub Copilot apoyó la consulta de la actividad, la revisión de los ejemplos y la organización de esta investigación. La explicación final y la sustentación deben ser propias y comprensibles para la autora.

---

# 3. Scrollbar

## 3.1. Qué es y para qué sirve

`Scrollbar` es un widget que muestra una barra para indicar la posición del usuario dentro de un contenido que se puede desplazar. Por ejemplo, cuando hay una lista muy larga y no todos sus elementos caben en la pantalla, la barra ayuda a identificar qué tan arriba o abajo se encuentra el usuario.

Dependiendo de la configuración, también permite arrastrar el indicador para desplazarse más rápido por el contenido.

## 3.2. Cuándo usarlo y cuándo no

Lo usaría en pantallas que tienen muchas filas o información extensa, como un catálogo de productores o una lista de productos.

No sería necesario si todo el contenido cabe en la pantalla y no hay desplazamiento. En ese caso, la barra no aportaría mucho. Si solo necesito desplazar contenido sin mostrar un indicador, puedo utilizar directamente `ListView` o `SingleChildScrollView`, según la estructura de la pantalla.

## 3.3. Ejemplo mínimo

Este ejemplo crea una lista con veinte productores y agrega una barra de desplazamiento.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ScrollbarMinimo()));
}

class ScrollbarMinimo extends StatelessWidget {
  const ScrollbarMinimo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Productores')),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Productor ${index + 1}'),
            );
          },
        ),
      ),
    );
  }
}
```

## 3.4. Explicación del ejemplo

* `Scaffold`: proporciona la estructura básica de la pantalla.
* `AppBar`: muestra el título «Productores».
* `Scrollbar`: acompaña la lista con un indicador de desplazamiento.
* `ListView.builder`: construye los elementos de la lista según se necesitan.
* `itemCount`: indica que se mostrarán veinte elementos.
* `itemBuilder`: define cómo se verá cada fila.
* `ListTile`: organiza el contenido de cada productor.
* `index + 1`: permite que los nombres empiecen en «Productor 1» y no en «Productor 0».

Al ejecutar el código, se puede desplazar la lista y observar la posición dentro del contenido.

## 3.5. Propiedades importantes

| Propiedad         | ¿Para qué sirve?                                               | Ejemplo                            |
| ----------------- | -------------------------------------------------------------- | ---------------------------------- |
| `child`           | Es el contenido desplazable al que acompaña la barra.          | `child: ListView(...)`             |
| `thumbVisibility` | Permite mantener visible el indicador de desplazamiento.       | `thumbVisibility: true`            |
| `trackVisibility` | Controla si se muestra la pista detrás del indicador.          | `trackVisibility: true`            |
| `thickness`       | Define el grosor del indicador.                                | `thickness: 6`                     |
| `radius`          | Define el redondeo de las esquinas del indicador.              | `radius: const Radius.circular(8)` |
| `interactive`     | Permite que el usuario arrastre el indicador para desplazarse. | `interactive: true`                |

## 3.6. Ejemplo personalizado

En este ejemplo, la barra permanece visible y tiene un grosor y unas esquinas personalizadas. La lista incluye un ícono para representar cada productor.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ScrollbarPersonalizado()));
}

class ScrollbarPersonalizado extends StatelessWidget {
  const ScrollbarPersonalizado({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mercado Campesino')),
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        thickness: 6,
        radius: const Radius.circular(8),
        interactive: true,
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.storefront_outlined),
              title: Text('Productor ${index + 1}'),
              subtitle: const Text('Productos del campo'),
            );
          },
        ),
      ),
    );
  }
}
```

**Explicación:** `thumbVisibility` mantiene visible el indicador y `trackVisibility` permite mostrar la pista. La propiedad `thickness` define el grosor de la barra, mientras que `radius` redondea sus esquinas. Por su parte, `interactive` permite arrastrar el indicador.

La lista presenta veinte productores con un ícono y una descripción. Así se puede observar cómo funciona la barra cuando hay más información de la que cabe en la pantalla.

## 3.7. Dónde lo usaría en Mercado Campesino

Lo utilizaría en la pantalla de inicio, donde se muestran los productores disponibles. Como la aplicación puede tener muchos productores, la lista necesita desplazarse para que el usuario pueda consultar todos los resultados.

La barra ayudaría a identificar la posición dentro de la lista y facilitaría el desplazamiento. Esto sería especialmente útil cuando se agreguen más productores a la aplicación.

## 3.8. Fuentes y ayudas usadas

* Documentación oficial de Flutter: [Scrollbar](https://api.flutter.dev/flutter/material/Scrollbar-class.html).
* Documentación oficial de Flutter: [ListView.builder](https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html).
* Guía de Semana 4: uso de listas y desplazamiento en Flutter.
* Ayuda usada: GitHub Copilot apoyó la consulta de la actividad, la revisión de los ejemplos y la organización de esta investigación. La explicación final y la sustentación deben ser propias y comprensibles para la autora.

---

# Conclusión

Durante esta investigación pude revisar tres widgets de Flutter que tienen funciones diferentes, pero que pueden ser útiles para construir una aplicación como Mercado Campesino.

`SwitchListTile` permite activar o desactivar opciones, `FilterChip` ayuda a seleccionar categorías y `Scrollbar` facilita el desplazamiento cuando hay bastante información en una pantalla.

Conocer estos widgets permite crear interfaces más organizadas y fáciles de utilizar. Además, es importante entender cómo se manejan sus propiedades y estados para poder adaptarlos a las necesidades de la aplicación.
