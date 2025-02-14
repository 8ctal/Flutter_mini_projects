# Flutter Project Suite 🚀  

Este repositorio contiene una colección de aplicaciones desarrolladas en Flutter siguiendo buenas prácticas como Clean Architecture y manejo eficiente del estado con Riverpod.  

## 📌 Proyectos Incluidos  

### 1. **Logic Gates Simulator** 🔲  
Aplicación interactiva que permite construir circuitos lógicos utilizando únicamente la compuerta NAND.  
- 🛠️ **Compuertas disponibles**: AND, NOT, OR, XOR, MUX, DMUX, 4WAYMUX, 8-WAY-OR.  
- 🎞️ **Animación dinámica**: Las señales viajan a través del circuito y producen la salida en tiempo real.  
- 📐 **Diseño flexible**: La interfaz se adapta según la compuerta seleccionada.  

📂 Ubicación del código: `logic_gates_app/`  

### 2. **Widgets Showcase** 🏗️  
Aplicación modular en Flutter para explorar widgets reutilizables siguiendo los principios de Clean Code y estado con Riverpod.  
- 📦 **Componentes listos para usar**: Tarjetas, botones, listas dinámicas, inputs, entre otros.  
- ⚡ **Optimización**: Uso eficiente de `Riverpod` para gestión del estado.  
- 📚 **Estructura modular**: Código limpio y desacoplado para facilitar la escalabilidad.  

📂 Ubicación del código: `widgets_app/`  

### 3. **Yes/No App** ❓  
Aplicación simple que consulta una API y devuelve respuestas aleatorias de "Sí" o "No".  
- 🔄 **Integración con API**: Obtiene respuestas dinámicas desde un servicio externo.  
- 📊 **Manejo de estado eficiente**: Implementación de `FutureProvider` en Riverpod.  
- 🎨 **Diseño minimalista**: UI sencilla e intuitiva.  

📂 Ubicación del código: `yes_no_app/`  

### 4. **TikTok Wrapper** 🎥  
Un wrapper en Flutter que integra una API de videos para simular la experiencia de navegación en TikTok.  
- 📡 **Consumo de API**: Obtiene videos de una fuente externa.  
- 🎞️ **Reproductor optimizado**: Manejo de reproducción eficiente en scroll infinito.  
- 🔧 **Personalizable**: Permite cambiar la fuente de datos según la API configurada.  

📂 Ubicación del código: `tiktok_wrapper/`  

---  
## 📷 Screenshots
![alt text](Screenshot_1739563512.png)
![alt text](Screenshot_1739563556.png)
![alt text](Screenshot_1739563528.png)
![alt text](Screenshot_1739563865.png)
![alt text](Screenshot_1739563871.png)
![alt text](Screenshot_1739563896.png)

## 🚀 Instalación  

Cada aplicación es independiente, por lo que puedes clonar este repositorio y entrar a la carpeta del proyecto que quieras ejecutar:  

```sh
git clone https://github.com/tu-usuario/flutter-project-suite.git
cd nombre_de_la_app
flutter pub get
flutter run
