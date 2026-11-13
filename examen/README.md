# Examen final: Visualización de datos en R

Examen de **código para completar**, en dos partes:

- **Parte A (7 puntos):** `examen_visualizacion_R.R`, un script de R con espacios en blanco (`____`): importar, `{dplyr}`, `{tidyr}` y gráficos con `{ggplot2}`.
- **Parte B (3 puntos):** `reporte_examen.qmd`, un reporte de Quarto para completar y renderizar.

## Qué se entrega a los estudiantes

Solo estos tres archivos (a partir de la fecha del examen, definida en `_variables.yml`):

- `examen_visualizacion_R.R`
- `reporte_examen.qmd`
- `datos_examen.csv`: 120 muestras de café de Loja, Pichincha y Manabí, datos simulados para el examen.

Los estudiantes entregan `examen_apellido_nombre.R` y `reporte_apellido_nombre.qmd`.

**No distribuyas la carpeta `clave/`.** Está en `.gitignore` para que no llegue a GitHub ni al sitio.

## Contenido y puntaje (10 puntos)

| Pregunta | Tema | Módulo | Puntos |
|:--|:--|:--:|:--:|
| 1 | Importar con `read_csv()` | 1, 2 | 0.5 |
| 2 | `filter()`, `group_by()`, `summarise()`, `arrange()` | 2 | 1 |
| 3 | `mutate()` y valores faltantes | 1, 2 | 1 |
| 4 | `pivot_wider()` | 2 | 0.5 |
| 5 | Dispersión con color y rectas de tendencia, más una interpretación | 2, 3 | 1 |
| 6 | Diagramas de caja con etiquetas, más una interpretación | 3 | 1 |
| 7 | Medias y barras de error | 3 | 1 |
| 8 | Facetas, título, tema y `ggsave()` | 3 | 1 |
| 9 | Reporte de Quarto: encabezado, fragmentos, código en línea, figura y tabla numeradas, conclusiones | 4 | 3 |

## Carpeta `clave/`

- `examen_resuelto.R` y `reporte_resuelto.qmd`: el examen completo, con respuestas de referencia.
- `clave.json`: valores esperados, estructura esperada de cada gráfico, puntaje por componente y criterios para las respuestas escritas.
- `valores_completos.json`: resultados de apoyo (útiles para retroalimentación).
- `revisar_examen.R`: la revisión automática.
- `prompt_revision_ia.md`: instrucciones para que un modelo de IA puntúe las respuestas escritas.

Los valores se calcularon fuera de R. Antes del examen, ejecuta una vez `clave/examen_resuelto.R` y comprueba que coincide con `clave.json`.

## Revisión automática

**8.75 puntos** los revisa un script de R; **1.25 puntos** (`r5_relacion`, `r6_provincia` y el texto del reporte) los revisa una IA (o tú) con una rúbrica.

Pon las entregas en `examen/entregas/` y, desde la carpeta `examen/`, ejecuta:

```bash
Rscript clave/revisar_examen.R entregas
```

El script:

- ejecuta cada script en una sesión de R separada, en una carpeta temporal con `datos/datos_examen.csv`, con un máximo de 180 segundos; si una línea da error, la anota y sigue;
- compara las tablas y valores con `clave.json`;
- en los gráficos, revisa la **estructura** del objeto `ggplot`: geometrías, estéticas (x, y, color, ymax), método de `geom_smooth()`, facetas, títulos y tema;
- comprueba que `resultados/acidez.png` exista y tenga unos 1890 píxeles de ancho (16 cm a 300 dpi);
- en el reporte, revisa el encabezado, las opciones de los fragmentos, el código en línea, las etiquetas `fig-` y `tbl-` con sus títulos y referencias, y, si Quarto está instalado, que se renderice a html.

Resultados en `examen/revision/` (en `.gitignore`):

| Archivo | Contenido |
|:--|:--|
| `notas_codigo.csv` | una fila por estudiante: nombre, puntos por pregunta, total automático y si conviene revisarla a mano |
| `detalle/estudiante_XX.txt` | retroalimentación componente por componente |
| `para_ia/estudiante_XX.json` | respuestas escritas, criterios y resultados correctos, **sin el nombre del estudiante** |

**Pruébalo antes del examen.** Copia `clave/examen_resuelto.R` y `clave/reporte_resuelto.qmd` a `entregas/` y ejecuta el script: debe dar 8.75 de 8.75 (8.5 si Quarto no está instalado). Luego prueba con la versión en blanco (`examen_visualizacion_R.R` y `reporte_examen.qmd`, renombrada como `reporte_visualizacion_R.qmd` para que se emparejen): debe dar casi 0. El script no se ha ejecutado todavía en R: si algo falla, pásame el mensaje y lo corrijo.

**Seguridad:** el script ejecuta código escrito por los estudiantes. Úsalo en una carpeta aparte, sin permisos de administrador, o mejor en un contenedor.

### Respuestas escritas y nota final

Para cada `para_ia/estudiante_XX.json`, un modelo de IA lee `clave/prompt_revision_ia.md` y devuelve los puntos y una retroalimentación corta, marcando los casos dudosos. Los archivos son anónimos; `notas_codigo.csv` guarda la correspondencia con los nombres.

Nota = `total_automatico` + puntos de las respuestas escritas. Revisa las entregas marcadas en `revisar_a_mano` y las respuestas marcadas `"revisar": true`, y firma la nota.
