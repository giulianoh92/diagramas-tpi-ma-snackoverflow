# Diagramas TPI — Metodologías Avanzadas (SnackOverflow)

Diagramas (PlantUML `.puml`, Mermaid `.mmd`) y sus renders `.png` del Trabajo
Práctico Integrador. La estructura **espeja las secciones del TPI**: el prefijo
de cada archivo es el número de sección del documento (= código de actividad).

## Convención de nombres

```
NN[.perspectiva][.sub]_Nombre_Descriptivo.ext
```

- `NN` — número de sección del TPI.
- perspectiva — `E` = estática (estructural, clases) · `D` = dinámica (comportamiento, actividad).
- El orden lexicográfico coincide con el orden del documento.
- Renders `.png` se generan automáticamente por CI (`.github/workflows`) al pushear `.puml`/`.mmd`.

## Mapa diagrama ↔ TPI

| Carpeta | Sección TPI |
|---|---|
| `00_Comun/` | Leyenda (transversal, no es sección) |
| `06_Proceso_Global/` | §6 Meta-modelo del proceso de desarrollo global |
| `06_Proceso_Global/06.E_Estatica/` | §6 Perspectiva estática (estructural) |
| `06_Proceso_Global/06.D_Dinamica/` | §6 Perspectiva dinámica (comportamiento) |
| `07_Ing_Requerimientos/` | §7 Meta-modelo de Ingeniería de Requerimientos |
| `08_Diseno/` | §8 Meta-modelo de Diseño |
| `09_Verificacion/` | §9 Meta-modelo de Verificación (Prueba del Software) |
| `11_Ejecucion/` | §11 Ejecución del proceso (Parte II) |
| `11_Ejecucion/11.a_Ing_Requerimientos/` | §11.a Ingeniería de Requerimientos (CDU) |
| `_Viejo/` | Versiones deprecadas — **fuera de la entrega** |

### §6 — Proceso Global (detalle)

| Archivo | Diagrama |
|---|---|
| `06.E.0_Estructura_General` | Estructura general del proceso |
| `06.E.1_Producto_del_Trabajo` | Meta-modelo de Producto del Trabajo |
| `06.E.2_Fases` | Meta-modelo de Fases |
| `06.E.3_Disciplinas` | Meta-modelo de Disciplinas |
| `06.E.4_Roles` | Meta-modelo de Roles |
| `06.E.5_Artefactos` | Meta-modelo de Artefactos |
| `06.E.6_Eventos` | Meta-modelo de Eventos |
| `06.D.0_Ciclo_de_Vida` | Meta-modelo del Ciclo de Vida de Desarrollo |
| `06.D.1_Fase_Concepcion` | Fase de Inicio / Concepción |
| `06.D.2_Fase_Elaboracion` | Fase de Elaboración |
| `06.D.3_Fase_Construccion` | Fase de Construcción |
| `06.D.3.2_Desarrollo_Sprint` | Desarrollo de Sprint |
| `06.D.3.3_Pipeline_SDD/06.D.3.3.1_Pipeline_SDD` | Pipeline SDD (asistido por IA) |
| `06.D.3.3_Pipeline_SDD/06.D.3.3.2_SDD_Redaccion` | SDD 1.1 — Spec ejecutable |
| `06.D.3.3_Pipeline_SDD/06.D.3.3.3_SDD_Diseno` | SDD 1.2 — Diseño detallado |
| `06.D.3.3_Pipeline_SDD/06.D.3.3.4_SDD_Implementacion` | SDD 1.3 — Código fuente |
| `06.D.3.3_Pipeline_SDD/06.D.3.3.5_SDD_Verificacion` | SDD 1.4 — Reporte de validación |
| `06.D.4_Fase_Transicion` | Fase de Transición |

### §7–§9 — Disciplinas

Cada disciplina trae perspectiva estática (`E`, clases) y dinámica (`D`, actividad):

- `07.E_Estatica_Clases` / `07.D_Dinamica_Actividad` / `07.X_Metamodelo_Requerimientos`
- `08.E_Estatica_Clases` / `08.D_Dinamica_Actividad`
- `09.E_Estatica_Clases` / `09.D_Dinamica_Actividad`

## Renderizado

`scripts/render-diagrams.sh` busca recursivamente todo `*.mmd`/`*.puml` y genera
el `.png` junto al fuente. La reorganización no afecta el render (sin paths
hardcodeados).
