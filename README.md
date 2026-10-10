# NeoForge 1.21.1 Build Environment

Socle de build NeoForge pour les projets RP de Hugo.

## Stack verrouillée

- Minecraft: 1.21.1
- NeoForge: 21.1.248
- Java: 21
- Gradle Wrapper: 9.2.1
- NeoForge ModDevGradle: 2.0.148

Ce dépôt est basé sur le MDK officiel `NeoForgeMDKs/MDK-1.21.1-ModDevGradle`.

## Utilisation

Windows:

```powershell
.\gradlew.bat --version
.\gradlew.bat build
```

Linux/macOS:

```bash
./gradlew --version
./gradlew build
```

Le projet exemple fourni par le MDK sert uniquement de smoke test du toolchain. Pour un mod RP, remplacer les sources exemple et adapter les propriétés `mod_*` dans `gradle.properties`.

## Objectif

Conserver dans GitHub un environnement NeoForge/Gradle reproductible pour compiler et tester les mods Minecraft 1.21.1 sans dépendre d'une installation Gradle globale.
