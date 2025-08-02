# Sistema de Templates Figma - Aplicación de Registro de Vehículos

## Descripción del Proyecto

Este proyecto contiene todos los templates de diseño para una aplicación de registro y gestión de vehículos con las siguientes características principales:

### Funcionalidades Principales

1. **Registro Seguro y Verificado**
   - Verificación por correo electrónico y teléfono
   - Datos personales: país, ciudad, código postal, dirección
   - Información del vehículo: marca, modelo, año, país de fabricación
   - Subida múltiple de fotos del vehículo
   - Configuración de preferencias de notificaciones

2. **Sistema de Notificaciones Personalizado**
   - Notificaciones específicas por marca y modelo
   - Categorías: repuestos, servicios, eventos, mercado
   - Búsqueda filtrada por modelo del usuario

3. **Gestión de Cuentas Múltiples**
   - Cuenta gratuita: 1 vehículo
   - Cuentas de pago: hasta 5 vehículos
   - Restauración de perfil anterior con un clic

4. **Perfil Público del Usuario**
   - Ubicación con bandera del país
   - Contador de visitas
   - Galería de fotos del vehículo
   - Sistema de "Me gusta"
   - Estados: en venta, alquiler, solo exhibición
   - Recepción de ofertas de compra

## Estructura de Templates

### 📱 Pantallas de Autenticación
- `01-onboarding.html` - Introducción y bienvenida
- `02-registro-personal.html` - Datos personales y verificación
- `03-registro-vehiculo.html` - Información del vehículo
- `04-subida-fotos.html` - Galería de fotos del vehículo
- `05-preferencias.html` - Configuración de notificaciones

### 👤 Perfil y Gestión
- `06-perfil-publico.html` - Vista pública del perfil
- `07-editar-perfil.html` - Edición de información personal
- `08-gestion-cuentas.html` - Gestión de múltiples vehículos
- `09-configuracion.html` - Configuraciones generales

### 🔍 Búsqueda y Mercado
- `10-busqueda-principal.html` - Búsqueda filtrada
- `11-resultados-busqueda.html` - Listado de resultados
- `12-detalle-producto.html` - Vista detallada de producto/servicio
- `13-marketplace.html` - Mercado de vehículos

### 💰 Sistema de Ofertas
- `14-crear-oferta.html` - Formulario de oferta
- `15-gestionar-ofertas.html` - Gestión de ofertas recibidas/enviadas
- `16-chat-negociacion.html` - Chat para negociaciones

### 🔔 Notificaciones
- `17-centro-notificaciones.html` - Centro de notificaciones
- `18-configurar-notificaciones.html` - Configuración detallada

## Tecnologías Utilizadas

- HTML5 + CSS3
- JavaScript vanilla
- Responsive Design
- Componentes reutilizables
- Sistema de colores consistente
- Iconografía personalizada

## Colores del Sistema

- **Primary**: #2563EB (Azul principal)
- **Secondary**: #10B981 (Verde éxito)
- **Warning**: #F59E0B (Amarillo advertencia)
- **Danger**: #EF4444 (Rojo error)
- **Dark**: #1F2937 (Gris oscuro)
- **Light**: #F9FAFB (Gris claro)

## Instalación y Uso

1. Clona este repositorio
2. Abre cualquier archivo HTML en tu navegador
3. Los estilos están incluidos inline para facilitar la importación a Figma
4. Utiliza estas estructuras como base para crear los componentes en Figma

## Notas de Diseño

- Todos los templates son responsive
- Incluyen estados de hover, active y disabled
- Formularios con validación visual
- Componentes reutilizables para consistencia
- Diseño centrado en la experiencia del usuario