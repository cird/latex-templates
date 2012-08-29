latex-templates
===============

Conjunto de templates de LaTeX para escribir artículos, ejercicios o
diferente tipo de material.

Modo de uso
-----------

Una forma de usar un template es simplemente copiándolo y comenzar a
editarlo (y si ya sabe convertir `.tex` a `.pdf` puede usar su propio
método). Igualmente el proyecto ya está listo para utilizar un
*workflow* esperado: Ejecutando el comando `make` deberían convertirse
todos los `.tex` del directorio a `.pdf`, y todas las imágenes en el
directorio `images/` también a `.pdf`.

Requerimientos
--------------

Los requerimientos para que el `Makefile` funcione correctamente es
tener LaTeX, GNU make e Inkscape instalados (y accesibles desde la
línea de comando). En Windows se puede usar MiKTeX y MSYS.
