# Notable

Note-taking made simple

[Web Demo](https://notable.surge.sh/) <br />
[Video Tutorial](https://www.youtube.com/watch?v=Lum3RWB7pc4&list=PLSpXkMCnT_uY2tcpylu2DsVzpwei8gpIT&index=20&ab_channel=MohamedIbrahim) <br />
[Slides and Assets](https://drive.google.com/drive/folders/1xbDWVOuSpHJqLab3py2FtvPHfjj0HYvG?usp=sharing)

![notable_showcase](https://user-images.githubusercontent.com/26859947/130743438-ecfc329c-e25b-47fd-998d-fb147b2b05ce.png)

### Create new project

```bash
$ flutter create notable
$ cd notable
```

### Add the necessary dependencies and configure launcher icon and splash screen

```yaml
dependencies:
  flutter:
    sdk: flutter
  hive: ^2.0.4
  hive_flutter: ^1.0.0
  intl: ^0.17.0
  keyboard_dismisser: ^2.0.0
  shared_preferences: ^2.0.6

dev_dependencies:
  build_runner: ^2.0.4
  flutter_launcher_icons: ^0.9.0
  flutter_native_splash: ^1.1.8+4
  flutter_test:
    sdk: flutter
  hive_generator: ^1.1.0
  lint: ^1.0.0

flutter_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/images/logo.png"
  adaptive_icon_background: "assets/images/logo.png"
  adaptive_icon_foreground: "assets/images/logo.png"

flutter_native_splash:
  color: "#181818"
  image: "assets/images/logo.png"
  android: true
  ios: true
```

### Create the file `analysis_options.yaml` in the root directory and add the following line

```yaml
include: package:lint/analysis_options.yaml
```

### Add asset and font directories to `pubspec.yaml`

```yaml
  fonts:
    - family: Satisfy
      fonts:
        - asset: assets/fonts/Satisfy/Satisfy-Regular.ttf
```

### Add constants `constants.dart`

```dart
import 'package:flutter/material.dart';

const kYellowColor = Color(0xFFF8B425);
const kRedColor = Color(0xFFCF6679);
const kLightGrey = Color(0xFF212121);
const kDarkGrey = Color(0xFF181818);
```
