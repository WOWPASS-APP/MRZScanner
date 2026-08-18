## 이 저장소에 대해

[appintheair/MRZScanner](https://github.com/appintheair/MRZScanner)를 fork 한 저장소입니다.
WOWPASS iOS 앱의 여권 MRZ 인식 기능에 사용합니다.

## 이 조직에 유지되어야 하는 이유

WOWPASS iOS 앱이 SPM 의존성으로 **이 저장소 주소를 직접 참조**합니다.

- `Tuist/Dependencies.swift`
- `Tuist/Dependencies/Lockfiles/Package.resolved`
- `WOWPASS.xcworkspace/xcshareddata/swiftpm/Package.resolved`

브랜치가 아니라 **특정 커밋(`e3cf442ed115c03fceeced03a6e70b8bcfffeb78`)에 고정**되어 있어,
저장소가 삭제되거나 주소가 바뀌면 의존성 해석이 실패하고 **로컬·CI 양쪽 모두 빌드가 즉시 깨집니다.**

여권 촬영 플로우에서 MRZScanner와 NFCPassportReader를 함께 사용하므로,
[NFCPassportReader](https://github.com/WOWPASS-APP/NFCPassportReader) 저장소도 같은 이유로 유지되어야 합니다.
두 저장소 중 하나만 옮기거나 지우면 빌드가 깨집니다.

upstream을 그대로 쓰지 않는 것은 WOWPASS 전용 수정이 적용되어 있기 때문입니다.

## 비공개로 전환할 수 없는 이유

fork 저장소는 원본이 public인 경우 private으로 전환할 수 없습니다.
GitHub의 제약이라 설정으로 우회할 수 없고, fork 관계를 해제(detach)해야만 가능합니다.
해제는 GitHub Support 요청이 필요합니다.

## 정리 계획

앱 저장소로 코드를 편입해 이 fork 자체를 제거하는 방향으로 정리할 예정입니다.
그 전까지는 **삭제 · 이름 변경 · 소유자 이전을 하지 말아주세요.**
변경이 필요하면 모바일팀에 먼저 공유 부탁드립니다.

---

[![Build and test](https://github.com/appintheair/MRZScanner/actions/workflows/Build%20and%20test.yml/badge.svg?branch=develop)](https://github.com/appintheair/MRZScanner/actions/workflows/Build%20and%20test.yml)
[![SPM](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://github.com/appintheair/MRZParser/blob/develop/Package.swift)
[![codecov](https://codecov.io/gh/appintheair/MRZScanner/branch/develop/graph/badge.svg?token=BAvvoujCum)](https://codecov.io/gh/appintheair/MRZScanner)

# MRZScanner
Library for scanning documents via [MRZ](https://en.wikipedia.org/wiki/Machine-readable_passport) using [ Vision API](https://developer.apple.com/documentation/vision/vnrecognizetextrequest).

## Example
The example project is located inside the [Example](https://github.com/appintheair/MRZScanner/tree/develop/Example) folder. 

![gif](https://github.com/appintheair/MRZScanner/blob/develop/docs/img/example.gif)

*To run it, you need a device with the [minimum required OS version](https://github.com/appintheair/MRZScanner#requirements).*

## Requirements
* iOS 13.0+
* macOS 10.15+
* Mac Catalyst 13.0+
* tvOS 13.0+

## Installation guide
### Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/appintheair/MRZScanner.git", .upToNextMajor(from: "0.0.1"))
]
```
*The library has an SPM [dependency](https://github.com/appintheair/MRZParser) for MRZ code parsing.*

## Usage
Currently there are 2 scanners available, `LiveMRZScanner` and `ImageMRZScanner`.
The first is used to scan the MRZ code on a single image, and the second in real-time scanning.

To scan, you need to call the `scanFrame` / `scan` method of the scanner.

## License
The library is distributed under the MIT [LICENSE](https://opensource.org/licenses/MIT).
