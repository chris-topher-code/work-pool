# TaskSite - Plateforme de Distribution de Tâches

Une plateforme connectant les créateurs de projets et les prestataires. Publiez des projets, trouvez des collaborateurs et construisez ensemble.

Aucun serveur backend requis — HTML + CSS + JavaScript + Supabase.

## ✨ Fonctionnalités

- 🔐 Inscription et connexion utilisateur
- 📝 Publication de projets (rôle Demandeur)
- 🎯 Candidature aux projets (rôle Prestataire)
- 📊 Gestion des statuts (Ouvert → En cours → Terminé)
- 💬 Commentaires et mur de messages
- ⭐ Système d'évaluation entre utilisateurs
- 📱 Intégration de paiement QR code (WeChat, Alipay)
- 🌐 Support multilingue (Français / Anglais / Chinois)
- 👤 Profils utilisateurs avec historique et évaluations
- 📱 Design responsive mobile
- 🔍 Outil d'aperçu mobile

## 🚀 Démarrage Rapide

### 1. Cloner le dépôt

```bash
git clone https://github.com/VOTRE_NOM/VOTRE_DEPOT.git
cd VOTRE_DEPOT/project-tasksite
```

### 2. Configurer Supabase (optionnel)

1. Allez sur [supabase.com](https://supabase.com) et créez un projet
2. Ouvrez **SQL Editor** dans votre tableau de bord
3. Exécutez le SQL de [`supabase-setup.sql`](./supabase-setup.sql)

### 3. Modifier la configuration

Ouvrez [`app.js`](./app.js) et modifiez ces deux lignes :

```javascript
const SUPABASE_URL = 'VOTRE_URL_SUPABASE';
const SUPABASE_KEY = 'VOTRE_CLE_SUPABASE';
```

> L'application fonctionne sans Supabase grâce aux données de démonstration intégrées.

### 4. Lancer en local

```bash
npx serve .
# Ouvrir http://localhost:3000
```

### 5. Déployer sur GitHub Pages

1. Poussez les fichiers vers votre dépôt GitHub
2. Allez dans **Settings → Pages**
3. Source : `Deploy from a branch`, sélectionnez `main`
4. Visitez `https://VOTRE_NOM.github.io/VOTRE_DEPOT/`

## 📁 Structure des Fichiers

```
project-tasksite/
├── index.html              ← Page principale
├── style.css               ← Feuilles de style
├── app.js                  ← Logique applicative
├── preview.html            ← Outil d'aperçu mobile
├── supabase-setup.sql      ← Schéma de base de données
├── supabase-demo-data.sql  ← Données de démonstration
├── README_FR.md            ← Ce fichier
└── .gitignore
```

## 📱 Outil d'Aperçu Mobile

Ouvrez `preview.html` via un serveur local pour tester les mises en page mobiles :

```bash
npx serve .
# Ouvrir http://localhost:3000/preview.html
```

Fonctionnalités : préréglages iPhone/Android, rotation, zoom, barre URL, navigation retour.

## 🔧 Tables Supabase

L'exécution de `supabase-setup.sql` crée :

| Table | Description |
|-------|-------------|
| `profiles` | Profils utilisateurs (nom, rôle, codes QR) |
| `projects` | Données des projets (titre, description, budget, statut) |
| Stockage `qr-codes` | Upload d'images de codes QR de paiement |

Inclut des politiques RLS (Row Level Security) pour la protection des données.

## 📄 Licence

MIT
