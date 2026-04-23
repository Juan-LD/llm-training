# 📱 WhatsApp Flows — Dataset para METApod v2

Repositorio de contribuciones de **WhatsApp Flows** para el entrenamiento del modelo **METApod v2**. Cada entrada incluye un prompt, un flow correcto (`ok`) y un flow incorrecto (`ko`), en inglés y español.

---

## 📋 Tabla de Contenidos

- [¿Qué es un WhatsApp Flow?](#-qué-es-un-whatsapp-flow)
- [Estructura del repositorio](#-estructura-del-repositorio)
- [Formato del template](#-formato-del-template)
- [Cómo contribuir](#-cómo-contribuir)
- [Reglas de validación](#-reglas-de-validación)
- [Licencia](#-licencia)

---

## 💬 ¿Qué es un WhatsApp Flow?

Un **WhatsApp Flow** es una interfaz interactiva que se muestra dentro de WhatsApp y permite a los usuarios completar acciones estructuradas (formularios, selecciones, confirmaciones, etc.) sin salir de la aplicación.

Se define mediante un JSON con pantallas (`screens`), layouts y componentes de UI (`TextHeading`, `TextBody`, `Footer`, etc.).

---

## 🗂 Estructura del repositorio

```
expert-spoon/
├── template.json   # Formato obligatorio para cada contribución
├── LICENSE
└── README.md
```

---

## 📐 Formato del template

Cada contribución debe seguir exactamente el esquema de [`template.json`](./template.json):

```json
{
  "prompt": {
    "EN": "Instrucción en inglés para generar el flow",
    "ES": "Instrucción en español para generar el flow"
  },
  "ok_flows": [
    {
      "EN": { /* Flow correcto en inglés */ },
      "ES": { /* Flow correcto en español */ }
    }
  ],
  "ko_flows": [
    {
      "EN": { /* Flow incorrecto en inglés (con errores intencionados) */ },
      "ES": { /* Flow incorrecto en español (con errores intencionados) */ }
    }
  ]
}
```

### Campos obligatorios

| Campo | Tipo | Descripción |
|---|---|---|
| `prompt.EN` | `string` | Instrucción en inglés que describe el flow esperado |
| `prompt.ES` | `string` | Instrucción en español que describe el flow esperado |
| `ok_flows` | `array` | Lista de flows válidos que responden correctamente al prompt |
| `ko_flows` | `array` | Lista de flows inválidos o incorrectos que **no** deben generarse |

### Estructura de un flow

Cada flow (dentro de `ok_flows` o `ko_flows`) debe contener las versiones `EN` y `ES`, siguiendo la especificación oficial de WhatsApp Flows:

```json
{
  "version": "7.3",
  "screens": [
    {
      "id": "NOMBRE_PANTALLA",
      "title": "Título visible",
      "terminal": true,
      "layout": {
        "type": "SingleColumnLayout",
        "children": [
          { "type": "TextHeading", "text": "Encabezado", "visible": true },
          { "type": "TextSubheading", "text": "Subtítulo", "visible": true },
          { "type": "TextBody", "text": "Cuerpo del texto" },
          { "type": "TextCaption", "text": "Pie de texto" },
          {
            "type": "Footer",
            "label": "Continuar",
            "on-click-action": {
              "name": "complete",
              "payload": {}
            }
          }
        ]
      }
    }
  ]
}
```

---

## 🤝 Cómo contribuir

1. **Haz un fork** de este repositorio.
2. **Crea un nuevo archivo JSON** siguiendo el formato de `template.json`.
3. Asegúrate de que el flow `ok` sea válido y el flow `ko` contenga al menos un error identificable (tipo de componente incorrecto, ID con espacios, texto en idioma equivocado, etc.).
4. Abre un **Pull Request** describiendo brevemente el caso de uso cubierto.

---

## ✅ Reglas de validación

Para que una contribución sea aceptada, debe cumplir lo siguiente:

- **`ok_flows`**: el JSON debe ser un WhatsApp Flow válido, con `id` de pantalla sin espacios, componentes de tipo correcto y acción `complete` en el footer.
- **`ko_flows`**: debe contener al menos un error deliberado y diferente al del flow `ok` correspondiente (p. ej., tipo de componente inexistente, `id` con espacios, campo obligatorio ausente).
- Ambas versiones lingüísticas (`EN` y `ES`) son **obligatorias** en cada flow.
- El prompt debe describir con claridad el objetivo del flow.

---

## 📄 Licencia

Este proyecto está bajo la licencia especificada en el archivo [LICENSE](./LICENSE).
