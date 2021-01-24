# Gaminder_R
Proyecto R en equipo: Borja Puig - Kerstin Kleinert - Ernesto del Puerto

## Directrices
1. El trabajo en equipo se realiza empleando control de versiones con Git, integrado en RStudio
2. Prever 3 validaciones del archivo de configuración: lectura - estructura - valores
3. Creación de un logfile que registre todos los hitos de ejecución del programa y también los errores detallados
4. Realizar un control de errores con "stop" o "tryCatch", según ocasión
5. Depurar el código para distinguir los 3 tipos de errores posibles: bloqueante, crítico y leve
6. Realizar QA mediante testeo
7. Se entrega el proyecto "empaquetato" para poder instalarlo como una libreria
8. Evitar "Spagghetti-Code": el código se estructura en 5 bloques con función principal (una por script) y funciones auxiliares si necesario

## Estructura del código

1. Lectura del archivo de configuración
2. Lectura de los datos
3. Pre-procesamiento de los datos
4. Generación del modelo
5. Generación de la predicción
