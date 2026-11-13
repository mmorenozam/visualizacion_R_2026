# Visualización de datos en R (UCE 2026)

Sitio del curso *Visualización de datos en R*: cuatro módulos de tres horas, en línea, construido con Quarto. Es el segundo curso de la serie, después de [Introducción a R](https://github.com/mmorenozam/introduccion_R_2026). Mismo estilo que [example-teaching](https://github.com/mmorenozam/example-teaching).

## Renderizar

```bash
quarto render
```

El sitio se escribe en `docs/` (listo para GitHub Pages), con las diapositivas en `docs/diapositivas/`. Los ejercicios usan la extensión `r-wasm/live` incluida en `_extensions/`, así que no hace falta instalar nada más.

## Estructura

| Archivo | Contenido |
|:--|:--|
| `index.qmd` | Inicio: anuncios, tarjetas de los módulos, cómo aprendemos |
| `programa.qmd` | Objetivos, horario, requisitos, tabla de alineación, evaluación |
| `modulo-N.qmd` | Página de cada sesión: objetivos, estructura, trabajo autónomo, datos |
| `ejercicios-N.qmd` | Ejercicios interactivos (webR) con pestañas Ejercicio, Pista y Solución |
| `autoevaluacion-N.qmd` | Preguntas de opción múltiple con explicación (`selfcheck.lua` + `selfcheck.html`) |
| `recursos.qmd`, `acerca.qmd` | Instalación, libros, instructor |
| `diapositivas/modulo-N.qmd` | Diapositivas de cada módulo (revealjs con letterbox, temporizador y pizarra, como en 2025) |
| `examen/` | Examen final (script de R y reporte de Quarto para completar), datos del examen y, en `examen/clave/`, la clave (no publicar) |
| `datos/pinguinos.csv` | Datos de `{palmerpenguins}` (Gorman et al. 2014, licencia CC0), usados en todo el curso |
| `_variables.yml` | Fechas y horario del curso, en un solo lugar |

## Publicar las soluciones de un módulo

Las soluciones están **ocultas** por defecto. Después de cada sesión, en `ejercicios-N.qmd` cambia

```yaml
live:
  show-solutions: false
```

a `true` y vuelve a renderizar. `soluciones.lua` quita entonces el aviso "La solución se publicará..." y muestra también las soluciones de los ejercicios que se hacen en RStudio. Las pistas están siempre visibles. En el Módulo 4 todos los ejercicios se hacen en RStudio.

## Por actualizar

- **Fechas:** todas salen de `_variables.yml` (`fecha-m1` a `fecha-m4`, `fecha-examen` y `horario`). Cámbialas ahí y vuelve a renderizar: se actualizan en el sitio, las diapositivas y los avisos de soluciones.
- **Código oculto:** en las diapositivas, los fragmentos que preparan datos o generan figuras usan `code-fold: true` (botón "Mostrar el código"). En los ejercicios, cada página tiene un recuadro desplegable "Ver el código que prepara los datos".
- **Rutas:** `_quarto.yml` tiene `execute-dir: project`, así que las diapositivas leen `datos/pinguinos.csv` con la misma ruta que usan los estudiantes en su proyecto.
- **Diapositivas:** el código de R de las diapositivas se ejecuta al renderizar. Necesitas R con `tidyverse`, `patchwork`, `knitr` y `rmarkdown`.
- **Anuncios:** en el recuadro del inicio de `index.qmd`.
