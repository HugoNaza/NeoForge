# Toolchain versions

This repository intentionally pins the RP Minecraft 1.21.1 build stack.

- Minecraft: `1.21.1`
- NeoForge: `21.1.248`
- Java: `21`
- Gradle: `9.2.1`
- NeoForge ModDevGradle: `2.0.148`
- Parchment Minecraft: `1.21.1`
- Parchment mappings: `2024.11.17`

## Wrapper integrity

The Gradle wrapper JAR is bootstrapped from the official Gradle repository on first local invocation and verified against:

`423cb469ccc0ecc31f0e4e1c309976198ccb734cdcbb7029d4bda0f18f57e8d9`

The Gradle 9.2.1 binary distribution is pinned by:

`72f44c9f8ebcb1af43838f45ee5c4aa9c5444898b3468ab3f4af7b6076c5bc3f`
