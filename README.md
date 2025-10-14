# Book Stack App

Book Stack App es un proyecto Flutter diseñado para explorar libros de programación.

Además de la app, se desarrollaron dos paquetes:
- Sistema de diseño: https://github.com/luismilopez10/book_stack_design_system
- Paquete de widgets: https://github.com/luismilopez10/book_stack_widget

## Configuración inicial

1. **Descarga de dependencias**:
    Ejecutar el siguiente comando en la terminal para instalar todas las dependencias necesarias:

   ```bash
   flutter pub get
   ```

2. **Generación de variables de ambiente**: 
    Ejecutar el siguiente comando en la terminal para generar las variables de ambiente:

   ```shell
   dart run build_runner clean && dart run build_runner build --delete-conflicting-outputs
   ```

3. **Ejecutar el proyecto**