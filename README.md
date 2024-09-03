# Aline

## Usage


### NSLayoutConstraint

As [the official documentation](https://developer.apple.com/documentation/uikit/nslayoutconstraint#overview) states:
> Each constraint is a linear equation with the following format:
>
> ```
> item1.attribute1 = multiplier × item2.attribute2 + constant
> ```

Aline makes it easier 

```swift
Aline.activate {
    v0.topAnchor == v1.topAnchor
    v0.leadingAnchor == v1.leadingAnchor
    v0.bottomAnchor == v1.bottomAnchor
    v0.trailingAnchor == v1.trailingAnchor
}
```


### UIStackView

Aline makes `HStack`, `VStack` and `Spacer`:

```swift
let stack = HStack {
    Spacer()
    VStack {
        Spacer()
        centralView
        Spacer()
    }
    Spacer()
}
```
