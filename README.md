# Book Stack App

Book Stack App es un proyecto Flutter diseñado para explorar libros de programación.

Además de la app, se desarrollaron dos paquetes en donde se encuentran el sistema de diseño y el paquete que contiene los widgets de la aplicación:
- Sistema de diseño: https://github.com/luismilopez10/book_stack_design_system
- Paquete de widgets: https://github.com/luismilopez10/book_stack_widget


## Requisitos previos

Antes de comenzar, se deben tener instalados los siguientes componentes:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Proyecto creado en la versión 3.35.5)
- [Dart SDK](https://dart.dev/get-dart)
- Un editor de texto o IDE como [Visual Studio Code](https://code.visualstudio.com/) o [Android Studio](https://developer.android.com/studio)
- Git para clonar el repositorio


## Configuración inicial

1. **Descarga de dependencias**:
    Ejecutar el siguiente comando en la terminal para instalar todas las dependencias necesarias:

   ```shell
   flutter pub get
   ```

2. **Generación de variables de ambiente**: 
    Ejecutar el siguiente comando en la terminal para generar las variables de ambiente:

   ```shell
   dart run build_runner clean && dart run build_runner build --delete-conflicting-outputs
   ```

3. **Ejecutar el proyecto**
    Finalmente, para iniciar la aplicación en un emulador o dispositivo físico, se debe correr el comando:

   ```shell
    flutter run
   ```
