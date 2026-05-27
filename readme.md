//
//  README.md
//  apple_remote_controller
//
//  Created by Nicolas Peeters on 27/05/2026.
//

# apple_remote_controller

[![Platform](https://img.shields.io/badge/platform-macOS-0A84FF.svg)](#)
[![Swift](https://img.shields.io/badge/Swift-5.10+-FA7343.svg)](#)
[![SwiftUI](https://img.shields.io/badge/UI-SwiftUI-34C759.svg)](#)
[![Framework](https://img.shields.io/badge/framework-GameController-8E8E93.svg)](#)
[![Persistence](https://img.shields.io/badge/persistence-UserDefaults-lightgrey.svg)](#)
[![Status](https://img.shields.io/badge/status-in%20progress-F4B400.svg)](#)
[![License](https://img.shields.io/badge/license-MIT-black.svg)](./LICENSE)

A native macOS SwiftUI application that maps game controller inputs to **keyboard**, **mouse**, and **system actions**.

Built as a practical input-remapping experiment and a portfolio-oriented codebase, `apple_remote_controller` focuses on clean architecture, native macOS integration, and a polished desktop UI.

---

## Table of contents

- [Overview](#overview)
- [Features](#features)
- [Screenshots](#screenshots)
- [Architecture](#architecture)
- [Project structure](#project-structure)
- [How it works](#how-it-works)
- [Persistence](#persistence)
- [Default mappings](#default-mappings)
- [Requirements](#requirements)
- [Getting started](#getting-started)
- [macOS permissions](#macos-permissions)
- [Roadmap](#roadmap)
- [Current limitations](#current-limitations)
- [Technical highlights](#technical-highlights)
- [Why this project](#why-this-project)
- [Author](#author)
- [License](#license)

---

## Overview

`apple_remote_controller` turns a game controller into a configurable desktop remote on macOS.

The app currently supports:
- button-to-key mapping
- keyboard shortcut mapping
- mouse button mapping
- analog stick mouse movement
- analog stick scrolling
- local persistent mapping storage

This project is intentionally modest in scope, but it is designed to demonstrate:
- SwiftUI application structure
- separation between UI, state, and runtime services
- `GameController` integration
- system event dispatch with `AppKit` / `CoreGraphics`
- practical persistence without unnecessary complexity

---

## Features

### Current
- Controller input model covering:
  - face buttons
  - shoulders
  - triggers
  - D-pad
  - stick clicks
  - stick movement
- Editable mapping UI
- Keyboard key capture
- Keyboard shortcut capture
- Mouse button actions
- Analog runtime:
  - right stick → mouse movement
  - left stick → scrolling
- Controller preview with active input highlighting
- Automatic local persistence using `UserDefaults`
- Responsive three-panel layout

### In progress
- richer system actions
- analog tuning and ergonomics
- UI/UX refinement
- more robust release behavior for mapped inputs

---

## Screenshots

> Placeholder section — screenshots and GIF previews will be added soon.

### Main interface
![Main interface placeholder](docs/screenshots/main-interface-placeholder.png)

### Mapping editor
![Mapping editor placeholder](docs/screenshots/mapping-editor-placeholder.png)

### Controller preview
![Controller preview placeholder](docs/screenshots/controller-preview-placeholder.png)

Suggested folder structure:

```text
docs/
└── screenshots/
    ├── main-interface-placeholder.png
    ├── mapping-editor-placeholder.png
    └── controller-preview-placeholder.png
````

---

## Architecture

The project is structured around a few simple layers.

### `Models`

Domain types:

- `ControllerInput`
- `ControllerMappingAction`
- `CapturedShortcut`
- `StoredMapping`

### `Stores`

Observable application state:

- `ControllerMappingStore`

### `Services`

Runtime and platform integration:

- `GameControllerManager`
- `AnalogStickRuntime`
- `MappingExecutionEngine`
- `SystemEventDispatcher`
- `KeyCodeMapper`

### `Views`

SwiftUI interface composition:

- `ContentView`
- `ResponsiveThreePanelLayout`
- `SidebarView`
- `MainControllerPanel`
- `MappingEditorView`
- controller preview views

---

## Project structure

```text
text

apple_remote_controller
├── App
│   └── apple_remote_controllerApp.swift
├── Models
│   ├── CapturedShortcut.swift
│   ├── ControllerInput.swift
│   ├── ControllerMappingAction.swift
│   └── StoredMapping.swift
├── Stores
│   └── ControllerMappingStore.swift
├── Services
│   ├── GameController
│   │   ├── AnalogStickRuntime.swift
│   │   └── GameControllerManager.swift
│   ├── Mapping
│   │   └── MappingExecutionEngine.swift
│   └── SystemEvents
│       ├── KeyCodeMapper.swift
│       └── SystemEventDispatcher.swift
├── Views
│   ├── ContentView.swift
│   ├── ControllerPreview
│   ├── Layout
│   ├── Mapping
│   ├── Panels
│   └── Sidebar
```

---

## How it works

### Button flow

1. `GameControllerManager` listens to controller input changes
2. button presses are forwarded to `MappingExecutionEngine`
3. the mapped action is resolved through `ControllerMappingStore`
4. `SystemEventDispatcher` sends the corresponding keyboard, mouse, or system event

### Analog flow

1. thumbstick values are captured through `GameController`
2. stick vectors are updated in real time
3. `AnalogStickRuntime` processes them continuously
4. dead zone filtering is applied
5. resulting values are converted into:
    - mouse movement
    - scroll events

---

## Persistence

Mappings are automatically persisted locally using `UserDefaults`.

### Details

- storage key: `controller.mappings.v1`
- format: JSON
- load on launch: yes
- autosave on change: yes
- fallback to default mappings if decoding fails

This keeps the persistence layer intentionally lightweight and well suited to the current size of the project.

---

## Default mappings

The current default configuration is:

- `buttonA` → `Space`
- `buttonB` → right click
- `buttonX` → `R`
- `buttonY` → `Mission Control`
- `leftStickMove` → vertical scroll
- `rightStickMove` → mouse movement

---

## Requirements

- macOS
- Xcode 15+
- Swift 5.10+ recommended

---

## Getting started

### 1. Clone the repository

```bash
bash

git clone https://github.com/NicoPFr/apple_remote_controller.git
cd apple_remote_controller
```

### 2. Open the project

```bash
bash

open apple_remote_controller.xcodeproj
```

### 3. Build and run

Run the `apple_remote_controller` target from Xcode.

---

## macOS permissions

Because the app sends synthetic keyboard and mouse events, it requires **Accessibility permissions**.

### Enable them

Go to:

- **System Settings**
- **Privacy & Security**
- **Accessibility**

Then allow the app.

Without these permissions, keyboard and mouse dispatching may not work correctly.

---

## Roadmap

### Short term

- [ ] add a software debug panel to simulate analog sticks without a physical controller
- [ ] expose dead zone and sensitivity settings
- [ ] add a reset-to-defaults UI action
- [ ] improve empty states and editing feedback

### Mid term

- [ ] support multiple mapping profiles
- [ ] add mapping import/export
- [ ] improve pressed / released behavior handling
- [ ] complete additional system actions

### Longer term

- [ ] menu bar mode
- [ ] richer automation-oriented actions
- [ ] controller presets
- [ ] public release polish

---

## Current limitations

- some system actions are still placeholders
- `launchpad` and `showDesktop` are not implemented yet
- analog mapping currently models mouse movement with a `MouseAxis`, while the runtime already handles 2D stick motion
- no profile management yet
- no import/export UI yet
- no built-in debug panel yet to simulate sticks without hardware

These are known limitations and part of the roadmap.

---

## Technical highlights

This project demonstrates:

- native macOS event synthesis with `CGEvent`
- controller input integration through `GameController`
- a lightweight persistence strategy with `UserDefaults` + JSON
- state-driven UI with `SwiftUI`
- separation between:
    - input monitoring
    - mapping resolution
    - event dispatch
    - UI presentation

---
## Author

**Nicolas Peeters**
[https://www.linkedin.com/in/nicolas-p-bb3b028b/?locale=fr_FR](https://www.linkedin.com/in/nicolas-p-bb3b028b/?locale=fr_FR)

---

## License

This project is distributed under the **MIT License**.
See `LICENSE` for details.

```bash
git clone https://github.com/NicoPFr/apple_remote_controller.git
````


