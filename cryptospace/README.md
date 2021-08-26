# Cryptospace

Cryptocurrency Tracker

[Web Demo](https://cryptospace.surge.sh/) <br />
[Video Tutorial](https://www.youtube.com/watch?v=UbQe-ljv1ps&list=PLSpXkMCnT_uY2tcpylu2DsVzpwei8gpIT&index=14&ab_channel=MohamedIbrahim) <br />
[Slides and Assets](https://drive.google.com/drive/folders/1_FlldcNUqCAPTORbnfyKKBsKpdc-3xBR?usp=sharing)


![cryptospace](https://user-images.githubusercontent.com/26859947/130743604-76a5c67d-59d9-4bd6-8f3f-8de60d12017d.png)


### API 

[coincap.io](https://docs.coincap.io/)

### Create new project

```bash
$ flutter create cryptospace
$ cd cryptospace
```

### Add the necessary dependencies and configure launcher icon and splash screen

```yaml
dependencies:
  flutter:
    sdk: flutter
  dio: ^4.0.0

dev_dependencies:
  flutter_launcher_icons: ^0.9.0
  flutter_native_splash: ^1.1.8+4
  flutter_test:
    sdk: flutter
  lint: ^1.0.0
 
flutter_icons:
  android: "launcher_icon"
  ios: true
  remove_alpha_ios: true
  image_path: "assets/images/logo.png"
  adaptive_icon_background: "assets/images/logo.png"
  adaptive_icon_foreground: "assets/images/logo.png"

flutter_native_splash:
  color: "#EC4561"
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
  assets:
    - assets/images/
```

### Constants

```dart
const baseUrl = 'api.coincap.io';
const cryptosPath = '/v2/assets';

const kGreenColor = Color(0xFF21CE99);
const kGreyColor = Color(0xFFA0A2A4);
const kBlackColor = Color(0xFF171A1E);
const kRedColor = Color(0xFFCF6679);
```

