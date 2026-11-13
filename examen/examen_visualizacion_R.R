# =============================================================================
#  EXAMEN FINAL: Visualización de datos en R (UCE 2026)
#  Parte A: este script (7 puntos) · Parte B: reporte_examen.qmd (3 puntos)
#  Valor: 60% de la nota final
# =============================================================================
#
#  Nombre completo: ____
#  Correo:          ____
#
#  INSTRUCCIONES
#  1. Copia en tu proyecto de R del curso: este script y reporte_examen.qmd en
#     la carpeta del proyecto, y "datos_examen.csv" en la carpeta datos/.
#  2. Reemplaza cada ____ por el código o el valor que corresponda.
#  3. NO cambies los nombres de los objetos que empiezan con p1_, p2_, ...,
#     r5_, r6_, ni el de la tabla cafe. La revisión busca exactamente esos
#     nombres.
#  4. Las respuestas escritas (r5_, r6_) van entre comillas, en una o dos frases.
#  5. Antes de entregar, reinicia R (Session > Restart R) y ejecuta TODO el
#     script con el botón "Source". Si aparece un error, el script no corre
#     completo y las preguntas siguientes no se pueden revisar.
#  6. Entrega este archivo y reporte_examen.qmd, con tu nombre:
#     examen_apellido_nombre.R y reporte_apellido_nombre.qmd
#
#  LOS DATOS
#  "datos_examen.csv": 120 muestras de café de tres provincias del Ecuador.
#    muestra      : número de la muestra
#    provincia    : Loja, Manabi, Pichincha
#    variedad     : Caturra, Sarchimor, Typica
#    altitud_m    : altitud de la finca (m s. n. m.)
#    puntaje_taza : puntaje de calidad en taza (escala SCA, sobre 100)
#    acidez       : puntaje de acidez (de 1 a 10)
#    humedad      : humedad del grano (%); faltan algunos valores
#  Los datos son simulados para este examen.
# =============================================================================

library(tidyverse)


# -----------------------------------------------------------------------------
# PREGUNTA 1 (0.5 puntos). Importar
# Importa el archivo con read_csv() y guarda el número de filas y de columnas.
# -----------------------------------------------------------------------------

cafe <- read_csv("____")
cafe

p1_n_filas    <- ____(cafe)
p1_n_columnas <- ____(cafe)


# -----------------------------------------------------------------------------
# PREGUNTA 2 (1 punto). Filtrar y resumir con {dplyr}
# a) ¿Cuántas muestras de Loja vienen de fincas a más de 1500 m?
# b) Para cada provincia: número de muestras, puntaje medio y su desviación
#    estándar, ordenado del puntaje medio más alto al más bajo.
# -----------------------------------------------------------------------------

p2_loja_altas <- cafe |>
  filter(provincia == "____", altitud_m ____ 1500) |>
  nrow()

p2_resumen <- cafe |>
  group_by(____) |>
  summarise(n = n(),
            puntaje_medio = mean(puntaje_taza),
            puntaje_de = ____(puntaje_taza)) |>
  arrange(____(puntaje_medio))
p2_resumen


# -----------------------------------------------------------------------------
# PREGUNTA 3 (1 punto). Crear columnas y valores faltantes
# a) Crea la columna altitud_km (altitud en kilómetros).
# b) Cuenta cuántos valores faltan en humedad.
# c) Calcula la humedad media por variedad, ignorando los valores faltantes.
# -----------------------------------------------------------------------------

cafe <- cafe |>
  mutate(altitud_km = ____ / 1000)

p3_n_faltantes <- sum(is.na(cafe$____))

p3_humedad <- cafe |>
  group_by(variedad) |>
  summarise(humedad_media = mean(humedad, ____))
p3_humedad


# -----------------------------------------------------------------------------
# PREGUNTA 4 (0.5 puntos). De largo a ancho
# Cuenta las muestras por provincia y variedad, y pasa la tabla a formato
# ancho: una fila por provincia y una columna por variedad.
# -----------------------------------------------------------------------------

p4_ancho <- cafe |>
  count(provincia, variedad) |>
  pivot_wider(names_from = ____, values_from = n, values_fill = 0)
p4_ancho


# -----------------------------------------------------------------------------
# PREGUNTA 5 (1 punto). Relación entre dos variables numéricas
# Gráfico de dispersión de altitud_m (eje x) y puntaje_taza (eje y), coloreado
# por variedad, con una recta de regresión ("lm") por variedad.
# Luego describe la relación en r5_relacion.
# -----------------------------------------------------------------------------

p5_grafico <- ggplot(cafe, aes(x = ____, y = puntaje_taza, color = ____)) +
  geom_point() +
  geom_smooth(method = "____", se = FALSE)
p5_grafico

r5_relacion <- "____"


# -----------------------------------------------------------------------------
# PREGUNTA 6 (1 punto). Comparar grupos
# Diagramas de caja del puntaje en taza por provincia, con los títulos de los
# ejes en español. Luego indica en r6_provincia qué provincia tiene los puntajes
# más bajos y una posible razón, a la vista de la pregunta 5.
# -----------------------------------------------------------------------------

p6_grafico <- ggplot(cafe, aes(x = provincia, y = puntaje_taza)) +
  geom_____() +
  labs(x = "____", y = "____")
p6_grafico

r6_provincia <- "____"


# -----------------------------------------------------------------------------
# PREGUNTA 7 (1 punto). Una figura con estadísticos
# Calcula la media y el error estándar del puntaje por variedad, y grafica las
# medias con barras (geom_col) y barras de error de ± un error estándar.
# -----------------------------------------------------------------------------

p7_resumen <- cafe |>
  group_by(variedad) |>
  summarise(media = mean(puntaje_taza),
            ee = sd(puntaje_taza) / sqrt(____))
p7_resumen

p7_grafico <- ggplot(p7_resumen, aes(x = variedad, y = media)) +
  geom_col() +
  geom_errorbar(aes(ymin = media - ee, ymax = ____), width = 0.2)
p7_grafico


# -----------------------------------------------------------------------------
# PREGUNTA 8 (1 punto). Facetas, formato y exportar
# Histograma de la acidez con un panel por provincia (facet_wrap), un título,
# y el tema theme_minimal(). Guárdalo en "resultados/acidez.png" con 16 x 10 cm
# y 300 dpi.
# -----------------------------------------------------------------------------

p8_grafico <- ggplot(cafe, aes(x = acidez)) +
  geom_histogram(binwidth = 0.5) +
  facet_wrap(~ ____) +
  labs(title = "____") +
  theme_minimal()
p8_grafico

dir.create("resultados", showWarnings = FALSE)
ggsave("resultados/acidez.png", plot = ____, width = 16, height = 10, units = "cm", dpi = ____)


# =============================================================================
#  FIN DE LA PARTE A. Reinicia R, ejecuta todo con "Source" y sigue con
#  reporte_examen.qmd (Parte B).
# =============================================================================
