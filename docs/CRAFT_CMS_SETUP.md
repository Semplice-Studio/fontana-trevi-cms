# Craft CMS Setup - Fontana di Trevi Landing Page

Questo documento descrive la struttura CMS da creare per il sito della Fontana di Trevi. Il frontend è costruito con Nuxt 3 e comunica con Craft CMS via GraphQL API.

## Requisiti

- Craft CMS Pro (per GraphQL API)
- Plugin consigliati:
  - **CKEditor** o **Redactor** per i campi rich text
  - **SEOmatic** (opzionale, per SEO avanzato)

---

## 1. Configurazione Multilingua (Sites)

Creare 2 siti:

| Handle | Nome | Lingua | Primary |
|--------|------|--------|---------|
| `default` | Italiano | it | ✅ Sì |
| `en` | English | en | No |

**Importante**: Tutti i contenuti devono essere traducibili in entrambe le lingue.

---

## 2. Asset Volumes

Creare i seguenti volumi per gli asset:

### Volume: `immagini`
- **Handle**: `immagini`
- **Base URL**: `@web/uploads/immagini`
- **File System Path**: `@webroot/uploads/immagini`
- **Campi custom**:
  - `alt` (Plain Text) - Testo alternativo

### Volume: `galleria`
- **Handle**: `galleria`
- **Base URL**: `@web/uploads/galleria`
- **File System Path**: `@webroot/uploads/galleria`
- **Campi custom**:
  - `alt` (Plain Text) - Testo alternativo
  - `didascalia` (Plain Text) - Didascalia immagine

### Volume: `video`
- **Handle**: `video`
- **Base URL**: `@web/uploads/video`
- **File System Path**: `@webroot/uploads/video`

---

## 3. Section: Pagine

Creare una Section di tipo **Channel**:

- **Name**: Pagine
- **Handle**: `pagine`
- **Entry Type**: `pagine`

### Campi della Section `pagine`:

| Campo | Handle | Tipo | Note |
|-------|--------|------|------|
| SEO Title | `seoTitle` | Plain Text | Max 60 caratteri |
| SEO Description | `seoDescription` | Plain Text | Max 160 caratteri |
| SEO Image | `seoImage` | Asset (immagini) | Singola immagine |
| Blocchi | `blocchi` | **Matrix** | Vedi sezione 4 |

---

## 4. Matrix Field: `blocchi`

Questo è il campo principale che permette di comporre la pagina a blocchi. Creare un Matrix field con i seguenti Block Types:

---

### 4.1 Block Type: `hero`

La sezione hero con video di sfondo e info in tempo reale.

| Campo | Handle | Tipo | Required | Note |
|-------|--------|------|----------|------|
| Titolo | `titolo` | Plain Text | ✅ | Prima riga del titolo |
| Titolo Riga 2 | `titoloRiga2` | Plain Text | | Seconda riga del titolo |
| Sottotitolo | `sottotitolo` | Plain Text | ✅ | Prima riga del sottotitolo |
| Sottotitolo Riga 2 | `sottotitoloRiga2` | Plain Text | | Seconda riga |
| Video | `video` | Asset (video) | ✅ | Video di sfondo MP4 |
| Avviso Manutenzione | `avvisoManutenzione` | Plain Text | | Messaggio di avviso (es. "Lavori in corso") |
| Testo Aperto Oggi | `testoApertoOggi` | Plain Text | ✅ | Es. "Aperto oggi" |
| Testo Chiuso Oggi | `testoChiusoOggi` | Plain Text | ✅ | Es. "Chiuso oggi" |
| Testo Affluenza Bassa | `testoAffluenzaBassa` | Plain Text | ✅ | Es. "Bassa" |
| Testo Affluenza Media | `testoAffluenzaMedia` | Plain Text | ✅ | Es. "Media" |
| Testo Affluenza Alta | `testoAffluenzaAlta` | Plain Text | ✅ | Es. "Alta" |
| Tooltip Affluenza | `tooltipAffluenza` | Plain Text | | Testo info sull'affluenza |
| CTA Acquista | `ctaAcquista` | Plain Text | ✅ | Es. "Acquista biglietti" |

---

### 4.2 Block Type: `visita`

Sezione con card informative su orari, biglietti e regole.

| Campo | Handle | Tipo | Required | Note |
|-------|--------|------|----------|------|
| Titolo | `titolo` | Plain Text | ✅ | |
| Sottotitolo | `sottotitolo` | Plain Text | | |
| **CARD ORARI** | | | | |
| Card Orari Titolo | `cardOrariTitolo` | Plain Text | ✅ | Es. "Orari di visita" |
| Orari | `orari` | **Table** | ✅ | Colonne: `giorno` (text), `ore` (text) |
| Eccezione Orari | `eccezioneOrari` | Plain Text | | Note eccezioni |
| Eccezione Orari 2 | `eccezioneOrari2` | Plain Text | | |
| Ultimo Ingresso | `ultimoIngresso` | Plain Text | | Es. "Ultimo ingresso: 45 min prima" |
| Dopo Orario Titolo | `dopoOrarioTitolo` | Plain Text | | Es. "Dopo l'orario di chiusura" |
| Dopo Orario Testo | `dopoOrarioTesto` | Plain Text | | |
| **CARD BIGLIETTI** | | | | |
| Card Biglietti Titolo | `cardBigliettiTitolo` | Plain Text | ✅ | Es. "Biglietti d'ingresso" |
| Non Residenti Info | `nonResidentiInfo` | Plain Text | | Info per non residenti |
| Prezzo Intero | `prezzoIntero` | Plain Text | ✅ | Es. "€2,00" |
| Prezzo Residenti | `prezzoResidenti` | Plain Text | | |
| Gratuito Per | `gratuitoPer` | Redactor/CKEditor | | Lista gratuità |
| **CARD REGOLE** | | | | |
| Card Regole Titolo | `cardRegoleTitolo` | Plain Text | ✅ | Es. "Regole di visita" |
| Regole | `regole` | **Table** | ✅ | Colonne: `icona` (dropdown), `testo` (text) |

**Nota per campo `regole.icona`**: Creare un dropdown con opzioni:
- `no-bagagli` - Niente bagagli
- `no-cibo` - Niente cibo/bevande
- `no-foto-flash` - No flash
- `no-fumo` - Vietato fumare
- `no-animali` - No animali
- `silenzio` - Mantenere silenzio
- `accessibile` - Accessibilità

---

### 4.3 Block Type: `accesso`

Sezione con gli step per accedere alla fontana.

| Campo | Handle | Tipo | Required | Note |
|-------|--------|------|----------|------|
| Titolo | `titolo` | Plain Text | ✅ | |
| Sottotitolo | `sottotitolo` | Plain Text | | |
| Steps | `steps` | **Matrix** (nested) o **Table** | ✅ | |

**Steps** (se Matrix nested):
| Campo | Handle | Tipo |
|-------|--------|------|
| Titolo Step | `titoloStep` | Plain Text |
| Contenuto Step | `contenutoStep` | Redactor/CKEditor |

**Oppure Steps** (se Table):
- Colonne: `titolo` (text), `contenuto` (text multiline)

---

### 4.4 Block Type: `comeRaggiungerci`

Sezione con indicazioni per raggiungere la fontana.

| Campo | Handle | Tipo | Required | Note |
|-------|--------|------|----------|------|
| Titolo | `titolo` | Plain Text | ✅ | |
| Sottotitolo | `sottotitolo` | Plain Text | | |
| Indirizzo | `indirizzo` | Plain Text | ✅ | |
| Trasporti | `trasporti` | **Table** | ✅ | Colonne sotto |
| Mappa Immagini | `mappaImmagini` | Asset (immagini) | | Multiple, per zoom mappa |

**Colonne Table `trasporti`**:
- `icona` (Dropdown): `metro`, `bus`, `auto`, `piedi`
- `tipo` (Plain Text): es. "Metro A"
- `linee` (Plain Text): es. "Fermata Barberini"

---

### 4.5 Block Type: `faq`

Sezione FAQ con accordion.

| Campo | Handle | Tipo | Required | Note |
|-------|--------|------|----------|------|
| Titolo | `titolo` | Plain Text | ✅ | |
| Sottotitolo | `sottotitolo` | Plain Text | | |
| Domande | `domande` | **Matrix** (nested) | ✅ | Vedi sotto |

**Matrix `domande`**:
| Campo | Handle | Tipo | Note |
|-------|--------|------|------|
| Domanda | `domanda` | Plain Text | La domanda FAQ |
| Risposta | `risposta` | Redactor/CKEditor | Supporta formattazione |
| Aperto Default | `apertoDefault` | Lightswitch | Se l'accordion è aperto di default |

---

### 4.6 Block Type: `storia`

Sezione con galleria immagini.

| Campo | Handle | Tipo | Required | Note |
|-------|--------|------|----------|------|
| Titolo | `titolo` | Plain Text | ✅ | |
| Sottotitolo | `sottotitolo` | Plain Text | | |
| Galleria | `galleria` | Asset (galleria) | ✅ | Multiple immagini |
| CTA Testo | `ctaTesto` | Plain Text | | Testo del pulsante |
| CTA Link | `ctaLink` | URL | | Link del pulsante |
| CTA Sottotitolo | `ctaSottotitolo` | Plain Text | | Testo sotto il pulsante |

---

### 4.7 Block Type: `testoImmagine` (generico)

Blocco generico per sezioni testo/immagine custom.

| Campo | Handle | Tipo | Required | Note |
|-------|--------|------|----------|------|
| Titolo | `titolo` | Plain Text | ✅ | |
| Sottotitolo | `sottotitolo` | Plain Text | | |
| Corpo | `corpo` | Redactor/CKEditor | | Rich text |
| Immagine | `immagine` | Asset (immagini) | | Singola |
| Layout | `layout` | Dropdown | ✅ | Opzioni: `testo-sinistra`, `testo-destra`, `centrato` |

---

## 5. Global Sets

### 5.1 Global: `impostazioni`

| Campo | Handle | Tipo | Note |
|-------|--------|------|------|
| Nome Sito | `sitoNome` | Plain Text | |
| Descrizione Sito | `sitoDescrizione` | Plain Text | |
| Logo Header | `logoHeader` | Asset (immagini) | |
| Logo Footer | `logoFooter` | Asset (immagini) | |
| Link Social | `linkSocial` | Table | Colonne: `piattaforma` (dropdown), `url` (url) |
| Footer Testo | `footerTesto` | Redactor/CKEditor | |
| Maintenance Mode | `maintenanceMode` | Lightswitch | |
| Maintenance Message | `maintenanceMessage` | Plain Text | |

**Dropdown `piattaforma`**: `facebook`, `instagram`, `twitter`, `youtube`, `linkedin`

---

### 5.2 Global: `orari`

| Campo | Handle | Tipo | Note |
|-------|--------|------|------|
| Orari Settimanali | `orariSettimanali` | Table | Vedi sotto |
| Eccezioni | `eccezioni` | Plain Text | Note su chiusure speciali |
| Ultimo Ingresso | `ultimoIngresso` | Plain Text | |

**Colonne Table `orariSettimanali`**:
- `giorno` (Dropdown): `lunedi`, `martedi`, `mercoledi`, `giovedi`, `venerdi`, `sabato`, `domenica`
- `apertura` (Time)
- `chiusura` (Time)
- `chiuso` (Lightswitch)

---

## 6. GraphQL Configuration

1. Vai su **Settings > GraphQL**
2. Crea uno **Schema** pubblico o con token
3. Abilita le seguenti query:
   - `entries` (per section `pagine`)
   - `globalSets` (per `impostazioni` e `orari`)
   - `assets` (per tutti i volumi)
4. Genera un token se necessario

**Endpoint GraphQL**: `/api` o `/graphql` (configura in `config/general.php`)

---

## 7. Contenuto Iniziale

Dopo aver creato la struttura, crea una Entry nella section `pagine`:

- **Title**: Homepage
- **Slug**: `homepage`
- **Blocchi**: Aggiungi i blocchi nell'ordine:
  1. `hero`
  2. `visita`
  3. `accesso`
  4. `comeRaggiungerci`
  5. `faq`
  6. `storia`

**Ricorda**: Traduci tutti i contenuti anche in inglese nel sito `en`.

---

## 8. Variabili d'ambiente Frontend

Il frontend Nuxt si aspetta queste variabili:

```env
CRAFT_BASE_URL=https://cms.fontanaditrevi.it
CRAFT_GRAPHQL_URL=https://cms.fontanaditrevi.it/api
CRAFT_GRAPHQL_TOKEN=your-token-here
CRAFT_ASSETS_URL=https://cms.fontanaditrevi.it/uploads
```

---

## 9. Query GraphQL di riferimento

Il frontend usa questa query per fetchare la pagina:

```graphql
query GetPagina($slug: [String], $site: [String]) {
  entry(section: "pagine", slug: $slug, site: $site) {
    id
    title
    slug
    ... on pagine_pagine_Entry {
      seoTitle
      seoDescription
      blocchi {
        ... on blocchi_hero_BlockType {
          id
          typeHandle
          titolo
          titoloRiga2
          # ... altri campi
        }
        ... on blocchi_visita_BlockType {
          id
          typeHandle
          titolo
          # ... altri campi
        }
        # ... altri block types
      }
    }
  }
}
```

Il parametro `site` sarà:
- `"default"` per italiano
- `"en"` per inglese

---

## Checklist Setup

- [ ] Configurare Sites (IT + EN)
- [ ] Creare Asset Volumes (immagini, galleria, video)
- [ ] Creare Section `pagine`
- [ ] Creare Matrix field `blocchi` con tutti i block types
- [ ] Creare Global `impostazioni`
- [ ] Creare Global `orari`
- [ ] Configurare GraphQL schema
- [ ] Creare Entry `homepage` con tutti i blocchi
- [ ] Tradurre contenuti in inglese
- [ ] Testare query GraphQL
