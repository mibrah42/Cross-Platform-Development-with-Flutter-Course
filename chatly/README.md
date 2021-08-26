# Chatly

Real-time chat built with flutter and firebase

[Web Demo](https://chatly.surge.sh/) <br />
[Video Tutorials](https://www.youtube.com/watch?v=y5poB2Juk4A&list=PLSpXkMCnT_uY2tcpylu2DsVzpwei8gpIT&index=26&ab_channel=MohamedIbrahim) <br />
[Slides and assets](https://drive.google.com/drive/folders/1ofx4oMNyrpuiUjmVobE5xPaNTHWVbrW5?usp=sharing)


![chatly](https://user-images.githubusercontent.com/26859947/130743855-9eef34f3-44a7-408d-91cb-17841eea9a7b.png)


### Create new project

```bash
$ flutter create chatly
$ cd chatly
```

### Dependencies

```yaml
dependencies:
  adaptive_dialog: ^1.1.0
  cloud_firestore: ^2.4.0
  firebase_auth: ^3.0.1
  firebase_core: ^1.4.0
  flutter:
    sdk: flutter
  keyboard_dismisser: ^2.0.0
  timeago: ^3.1.0
  validators: ^3.0.0

dev_dependencies:
  flutter_launcher_icons: ^0.9.1
  flutter_native_splash: ^1.2.1
  flutter_test:
    sdk: flutter
  lint: ^1.5.3

flutter_icons:
  android: "launcher_icon"
  ios: true
  remove_alpha_ios: true
  image_path: "assets/images/logo.png"
  adaptive_icon_background: "assets/images/logo.png"
  adaptive_icon_foreground: "assets/images/logo.png"

flutter_native_splash:
  color: "#CD84F1"
  image: "assets/images/logo.png"
  android: true
  ios: true
```

### Configuring font

```yaml
  fonts:
    - family: VT323
      fonts:
        - asset: assets/fonts/VT323-Regular.ttf
```

### Constants
```dart
import 'package:flutter/material.dart';

const kPurpleColor = Color(0xFFCD84F1);
const kDarkGrey = Color(0xFF181818);
const kLightGrey = Color(0xFF212121);
```

## Firebase web dependencies
```html
<script src="https://www.gstatic.com/firebasejs/8.9.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.9.1/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.9.1/firebase-firestore.js"></script>
```

### Create the file `analysis_options.yaml` in the root directory and add the following line
```yaml
include: package:lint/analysis_options.yaml
```
