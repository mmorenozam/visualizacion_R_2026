-- Muestra u oculta los avisos ::: {.sol-pendiente} segun la opcion
-- `live: show-solutions:` del encabezado de cada pagina de ejercicios.
--
-- show-solutions: false  -> {quarto-live} elimina las soluciones y aqui
--                           se mantiene el aviso "La solucion se publicara...".
-- show-solutions: true   -> se muestran las soluciones y se elimina el aviso.
--
-- Las soluciones de ejercicios que se hacen en RStudio (sin recuadro
-- interactivo) van en ::: {.solucion-local} y siguen la misma opcion.

local mostrar_soluciones = true

local function leer_meta(meta)
  if meta.live ~= nil and type(meta.live) == "table" then
    local valor = meta.live["show-solutions"]
    if valor ~= nil then
      mostrar_soluciones = (valor == true)
    end
  end
end

local function avisos(el)
  if el.classes:includes("sol-pendiente") and mostrar_soluciones then
    return {}
  end
  if el.classes:includes("solucion-local") and not mostrar_soluciones then
    return {}
  end
  return nil
end

return {
  { Meta = leer_meta },
  { Div = avisos }
}
