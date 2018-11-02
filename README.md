<p align="center">
    <img src=".readme/logo.png" width="890" alt="Tinderbar"/>
    <img src=".readme/tinderbar.gif" width="450" alt="Tinderbar"/>
</p>

## 🤔 About
Tinderbar is a recreation of the Tinder iOS app's navigation hierarchy using [Tabman](https://github.com/uias/Tabman), designed to be an showcase of creating custom Tabman components.

## 🚀 Components
Tinderbar uses Tabman for its primary navigation bar and also sub navigation within the Messages section.

### 🔥 TinderBar
A `TMBarView` embedded in a `TMSystemBar`, added to the `.top`.
```swift
TMBarView<TinderBarLayout, TinderBarButton, TMBarIndicator.None>
```

It uses a custom layout in the form of [`TinderBarLayout`](./Sources/Tinderbar/Bars/TinderBar/TinderBarLayout.swift) and custom [`TinderBarButton`](./Sources/Tinderbar/Bars/TinderBar/TinderBarButton.swift) bar buttons.

#### TinderBarLayout
- Uses a horizontal stack view for buttons.
- Buttons are inserted into a container, which is constrained to be `0.5x` the width of the `layoutGuide`.
- Padding views of `0.25x` the `layoutGuide` are inserted at the leading and trailing edges of the stack.
- Buttons are centered along the X-axis of their container, with a constant that is updated as the layout `focusArea` is adjusted (they are centered when selected, and offsetted when unselected to ensure they don't venture off screen).

#### TinderBarButton
- A `TMBarButton` which consists of an image view.
- Image view tint color transitions between `unselectedTintColor` and `tintColor`.
- Image view scales to `1.0` when selected and `0.8` when unselected.

### MessageBar
A more regular `TMBarView` using stock Tabman components, added to the `.top`.
```swift
TMBarView<TMHorizontalBarLayout, TMLabelBarButton, TMBarIndicator.None>
```
- `contentMode` of the layout is set to `.fit`.

## 👨🏻‍💻 About
- Created by [Merrick Sapsford](https://github.com/msaps) ([@MerrickSapsford](https://twitter.com/MerrickSapsford)).

## 👮🏻‍♂️ License
The library is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
