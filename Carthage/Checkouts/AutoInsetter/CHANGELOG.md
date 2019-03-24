# Change Log
All notable changes to this project will be documented in this file.
`AutoInsetter` adheres to [Semantic Versioning](http://semver.org/).

#### 1.x Releases
- `1.6.x` Releases - [1.6.0](#160)
- `1.5.x` Releases - [1.5.0](#150) | [1.5.1](#151)
- `1.4.x` Releases - [1.4.0](#140) | [1.4.1](#141)
- `1.3.x` Releases - [1.3.0](#130)
- `1.2.x` Releases - [1.2.0](#120) | [1.2.1](#121) | [1.2.2](#122) | [1.2.3](#123) | [1.2.4](#124) | [1.2.5](#125) | [1.2.6](#126)
- `1.1.x` Releases - [1.1.0](#110)
- `1.0.x` Releases - [1.0.0](#100)

---
## [1.6.0](https://github.com/uias/AutoInsetter/releases/tag/1.6.0)
Released on 2019-03-24

#### Updated
- Redesigned insetting engine which takes individual account of `UIScrollView` type.

#### Fixed
- [#11](https://github.com/uias/AutoInsetter/issues/11) Incorrect relative frame calculations of nested `UIScrollView`.
- [#13](https://github.com/uias/AutoInsetter/issues/13) Incorrect insetting values for landscape orientated scroll views.
- Issue where insetting would incorrectly potentially fail due to `UIScrollView` state.

---
## [1.5.1](https://github.com/uias/AutoInsetter/releases/tag/1.5.1)
Released on 2019-03-03

#### Fixed
- Issue where AutoInsetter could never be disabled.

## [1.5.0](https://github.com/uias/AutoInsetter/releases/tag/1.5.0)
Released on 2019-02-23

#### Added
- `enable(with: UIViewController)` mechanism for enabling insetter.

#### Updated
- Disables `automaticallyAdjustsScrollViewInsets` when enabling.
- Deprecated `isEnabled`.

---

## [1.4.1](https://github.com/uias/AutoInsetter/releases/tag/1.4.1)
Released on 2018-10-28

#### Fixed
- Potential lifecycle issues with setting `additionalSafeAreaInsets`.
    - by [msaps](https://github.com/msaps)
    
## [1.4.0](https://github.com/uias/AutoInsetter/releases/tag/1.4.0)
Released on 2018-10-18

#### Updated
- Improved handling of `contentOffset` updates to be more effective and reliable.
    - by [msaps](https://github.com/msaps)

## [1.3.0](https://github.com/uias/AutoInsetter/releases/tag/1.3.0)
Released on 2018-09-17

#### Updated
- Migrated to use Swift 4.2.
    - by [msaps](https://github.com/msaps)

---

## [1.2.6](https://github.com/uias/AutoInsetter/releases/tag/1.2.6)
Released on 2018-08-05

#### Fixed
- [#316](https://github.com/uias/Tabman/issues/316) Fixed issue with contentOffset when pinning to a safe area.
    - by [msaps](https://github.com/msaps)

## [1.2.5](https://github.com/uias/AutoInsetter/releases/tag/1.2.5)
Released on 2018-07-30

#### Fixed
- [#6](https://github.com/uias/AutoInsetter/pull/6) Issue where `UIScrollView` horizontal insets are not maintained.
    - by [rnystrom](https://github.com/rnystrom)

## [1.2.4](https://github.com/uias/AutoInsetter/releases/tag/1.2.4)
Released on 2018-06-14

#### Fixed
- [#300](https://github.com/uias/Tabman/issues/300) Fix content offset updating incorrectly and ignoring a non-default value.
    - by [lowip](https://github.com/lowip) & [msaps](https://github.com/msaps)

## [1.2.3](https://github.com/uias/AutoInsetter/releases/tag/1.2.3)
Released on 2018-03-25

#### Fixed

- [#264](https://github.com/uias/Tabman/issues/264) Incorrect superview would be used for child hierarchy relative calculations.
    - by [msaps](https://github.com/msaps)
- Scroll views were unnecessarily evaluated and insetted when contained within insetted parent scroll views.
    - by [msaps](https://github.com/msaps)

## [1.2.2](https://github.com/uias/AutoInsetter/releases/tag/1.2.2)
Released on 2018-03-19

#### Fixed

- Fixed issue where `UITableViewController` and `UICollectionViewController` would not inset correctly.
    - by [msaps](https://github.com/msaps)

## [1.2.1](https://github.com/uias/AutoInsetter/releases/tag/1.2.1)
Released on 2018-02-11

#### Fixed

- Fixed issues with ignoring and misusing custom `contentInset` values on child scroll views.
    - by [msaps](https://github.com/msaps)

## [1.2.0](https://github.com/uias/AutoInsetter/releases/tag/1.2.0)
Released on 2018-02-05

#### Updated
- Now supports 'extension safe only' API usage.
    - by [msaps](https://github.com/msaps)

---

## [1.1.0](https://github.com/uias/AutoInsetter/releases/tag/1.1.0)
Released on 2018-01-30

#### Updated
- AutoInsetter now takes the relative position of subviews into account when insetting.
    - by [msaps](https://github.com/msaps)

---

## [1.0.0](https://github.com/uias/AutoInsetter/releases/tag/1.0.0)
Released on 2018-01-23

Initial **AutoInsetter** release - Easily provide custom view controller auto-insetting.
