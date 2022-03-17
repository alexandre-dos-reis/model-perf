# Test de performance entre 2 modèles

Ce projet a pour but de tester les performances entre 2 modèles de données : 

    - 1 modèle normalisé appelé `normalized`.
    - 1 modèle optimisé appelé `optimized`.

La stack technique est la suivante :
    - Langage coté serveur : NodeJS avec typescript
    - ORM : [Prisma](https://www.prisma.io/)

L'intérêt de cet ORM est qu'il peut effectuer une **instrospection**, il peut lire une base de données et en tirer un schéma de model compréhensible pour lui, ce qui permettra de manipuler la BDD plus facilement.

## Requis

- docker >= 20.10.11
- docker-compose >= 1.29.2
- nodeJS >= 16.14.0
- pnpm >= 6.32.0

## Installation et démarrage

- Se rendre à la racine du projet et démarrer l'infrastructure avec `docker-compose up -d`.
- Se rendre dans les dossiers `normalized` et `optimized`, lancer la commande `pnpm i` pour installer les dépendances
- Puis `pnpm exec prisma generate` pour générer l'api des objets de l'ORM.
- Lancer la commande `pnpm dev` pour lancer l'environnement de dev, cette commande effectue les commandes suivantes simultanément à l'aide de [concurrently](https://www.npmjs.com/package/concurrently):
  - Lance la compilation automatique avec `tsc -w` des fichiers typescript contenu dans `src` vers un fichier javascript situé dans le dossier `dist`.
  - Lance la commande `nodemon` qui éxecute le fichier `dist/app.js` à chaque changement de celui-ci.

## Commandes

### Effectuer une introspection
- Se rendre dans 1 des 2 dossiers, `normalized` ou `optimized`
- Le fichier `.env` doit renseigné la connexion à la BDD.
- Effectuer l'instrospection avec la commande `pnpm exec prisma db pull`
- Prisma crée alors un schéma dans `prisma/schema.prisma`
- [Source](https://www.prisma.io/docs/getting-started/setup-prisma/add-to-existing-project/relational-databases/introspection-typescript-mysql)

### Migrations

- Créer une migration sans l'appliquer : `pnpm exec prisma migrate dev --create-only --preview-feature`
- Créer une migration et l'appliquer : `pnpm exec prisma migrate dev --preview-feature`

- Pour vider la base de données : `pnpm exec prisma migrate reset`

### Générer les objets liés à la BDD
- Taper la commande `pnpm exec prisma generate` pour générer les objets d'ORM.

## Test de performances

Il s'agit de comparer les temps de réponses pour une même requête sur les 2 bases de données.

Pour chaque bdd, les test individuels sont placés dans les dossiers: `[normalized|optimized]/src/measures/nomDuTest.ts`

Pour effectuer la mesure, on utilise une méthode native à javascript permettant de lancer un timer, par exemple :

```js
console.time("Ma mesure")

// Requête...

console.timeEnd("Ma mesure")
// 5.607s
// 5.584s
// 5.467s

```

## Résultats des comparatifs

- Toutes les questions posées qui ont pour réponses exacte 60 points.
  - Normalized: `5.584s`
  - Optimized: `930.396ms`