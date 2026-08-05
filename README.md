# Custom Alert

*An alert built from scratch, presented over the key window.*

![Swift](https://img.shields.io/badge/Swift-5.0-F05138?style=flat-square&logo=swift&logoColor=white) ![UIKit](https://img.shields.io/badge/UIKit-2396F3?style=flat-square&logo=uikit&logoColor=white) ![iOS](https://img.shields.io/badge/iOS-17.5%2B-000000?style=flat-square&logo=apple&logoColor=white) ![Topic](https://img.shields.io/badge/topic-window%20presentation-6366F1?style=flat-square) ![Dependencies](https://img.shields.io/badge/dependencies-none-16A34A?style=flat-square)

## Overview

`UIAlertController` cannot be restyled. When a design calls for a branded dialog the alert has to be built and presented manually, which means finding the right window, dimming the background, animating in and cleaning up afterwards.

## How it works

```mermaid
sequenceDiagram
    participant VC as ViewController
    participant A as MyAlert
    participant W as Key window

    VC->>A: showAlert(title:message:viewController:)
    A->>W: find the target view
    A->>W: add a dimmed background view at alpha 0
    A->>W: add the alert view above the visible bounds
    A->>A: animate the background to visible
    A->>A: spring animate the alert into the centre
    Note over A: tapping the background calls dismissAlert
    A->>A: animate out, then remove both views
```

## Implementation notes

- **Constants in one struct.** Sizes, corner radius and animation durations live in a nested `Constants` type, so the dialog is resized in one place.
- **Presented on the window, not the controller.** Adding to the window keeps the alert above navigation bars and tab bars without any presentation context work.
- **Two phase animation.** The background fades while the panel springs in, which reads as one motion rather than two.
- **Views removed after dismissal.** The completion of the exit animation removes both views, so repeated presentations do not stack invisible layers.

## Project structure

```
Custom Alert/
├── MyAlert.swift          the alert type and its animation
└── ViewController.swift
```

## Requirements

Xcode 15 or later, iOS 17.5 or later. No external dependencies.
