# Cross-Platform Development with Flutter

Learn to build apps that work on Android, iOS, Web, and Desktop

![Author badge](https://img.shields.io/badge/Author-Mohamed%20Ibrahim-red)
![Framework badge](https://img.shields.io/badge/Framework-Flutter-blue)
![Language badge](https://img.shields.io/badge/Language-dart-lightgrey)


[![Course Showcase](https://user-images.githubusercontent.com/26859947/130891486-1079f8c5-4012-4bdf-8702-f1fa399a3f17.png)](https://www.youtube.com/watch?v=ccPni4mBfak&list=PLSpXkMCnT_uY2tcpylu2DsVzpwei8gpIT&index=1&ab_channel=MohamedIbrahim)
[**Go To Course**](https://www.youtube.com/watch?v=ccPni4mBfak&list=PLSpXkMCnT_uY2tcpylu2DsVzpwei8gpIT&index=1&ab_channel=MohamedIbrahim)

Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, desktop, and embedded devices from a single codebase ([flutter.dev](https://flutter.dev/)). In this course, we will dive into Flutter development by building 5 applications from scratch. We will cover building great user interfaces, navigation, persistent storage, network requests (API calls), managing state, integration with Firebase, and all the concepts you need to start bringing your ideas to life. A detailed outline of the course curriculum is shown below:

**Environment Setup** <br />
This section will cover setting up your development environment and getting all the tools you need to start developing apps with Flutter
  - Downloading the Flutter SDK
  - Getting Android Studio and Xcode
  - Git
  - Surge
  - VSCode
    - Downloading useful plugins (flutter, dart, and sublime text key map)

[**Project 1: Building a personal portfolio**](#personal-portfolio) <br/>
In this section, you will build and deploy a personal portfolio application that you can share with the world. You will cover the following topics:
- Creating a new project
- Running your app
- Hot Reload and Hot Restart
- Dart data types
- Stateless widgets
- User interactions with Buttons
- Adding assets and third party dependencies
- Web deployment using surge
- Running app in release mode

[**Project 2: Building a Pokédex app**](#pokedex) <br/>
In this section, you will build and deploy a Pokédex application that displays a list of Pokémon. You will cover the following topics:
- Navigation
- Working with ListViews
- Transferring data between screens
- Object-oriented programming in Dart
- Generating launcher icons and a splash screen

[**Project 3: Building a cryptocurrency tracker**](#cryptospace) <br/>
In this section, you will build and deploy a cryptocurrency tracker that fetches data from an API and displays it on the screen. You will cover the following topics:
- Stateful widgets
- Managing state
- Networking requests (API calls) using the Dio Package
- Working with JSON
- Factory constructors

[**Project 4: Building a notes app**](#notable) <br/>
In this section, you will build and deploy a notes app that persistently stores data across app loads. You will cover the following topics:
- Persistent data storage
- Shared preferences
- Hive database
- Working with FutureBuilders
- Working with GridViews
- Forms and input validation

[**Project 5: Building a real-time chat application using firebase**](#chatly) <br/>
In this section, you will build and deploy a real-time chat application with email authentication using firebase. You will cover the following topics:
- Firebase integration
- User authentication with email and password
- Email verification
- Working with StreamBuilders
- Real-time data with Firestore

# Personal Portfolio

[Web Demo](https://mohamedibrahim.surge.sh/) <br />
[Video Tutorial](https://www.youtube.com/watch?v=4ji881T8zw4&list=PLSpXkMCnT_uY2tcpylu2DsVzpwei8gpIT&index=2&ab_channel=MohamedIbrahim)

![portfolio](https://user-images.githubusercontent.com/26859947/130892183-64da6794-f959-4d8b-af5e-ed03a0de6cf1.png)

## Project Slides
[Slides and Assets](https://drive.google.com/drive/folders/19QtqYkqA89qUIeQZBrVJNKYxEAcpKp5l?usp=sharing)

## Dependencies
```yaml
dependencies:
  animated_text_kit: ^4.2.1
  flutter:
    sdk: flutter
  font_awesome_flutter: ^9.0.0
  url_launcher: ^6.0.4
  
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
  color: "#FFFFFF"
  image: "assets/images/logo.png"
  android: true
  ios: true
```

## Configuring assets
```yaml
  assets:
    - assets/images/
    - assets/badges/
    - assets/projects/
    
  fonts:
    - family: FiraCode
      fonts:
        - asset: assets/fonts/FiraCode/FiraCode-Light.ttf
        - asset: assets/fonts/FiraCode/FiraCode-Medium.ttf
        - asset: assets/fonts/FiraCode/FiraCode-Regular.ttf
        - asset: assets/fonts/FiraCode/FiraCode-SemiBold.ttf
        - asset: assets/fonts/FiraCode/FiraCode-Bold.ttf
```

# Pokedex

Pokemon Explorer

[Web Demo](https://pokedexweb.surge.sh/) <br />
[Video Tutorial](https://www.youtube.com/watch?v=8YW-57RfU78&list=PLSpXkMCnT_uY2tcpylu2DsVzpwei8gpIT&index=8&ab_channel=MohamedIbrahim)

![pokedex3](https://user-images.githubusercontent.com/26859947/130743290-93af253b-cc72-4f45-b08e-63582e6042c3.png)

[Slides and Assets](https://drive.google.com/drive/folders/1seMupFBbLDSVuMu2mvNr4OUMrCzHN2T9?usp=sharing)
<br/>

### Create new project

```bash
$ flutter create pokedex
$ cd pokedex
```

### Add the necessary dependencies and configure launcher icon and splash screen

```yaml
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
include: package:lint/analysis_options.yaml
```

### Add asset and font directories to `pubspec.yaml`

```yaml
  assets:
    - assets/images/
    - assets/images/large/
    - assets/images/small/

  fonts:
    - family: Pokemon
      fonts:
        - asset: assets/fonts/Pokemon-Regular.ttf
```

### Credits

Pokemon thumbnails and data provided by: https://github.com/fanzeyi/pokemon.json

# Cryptospace

Cryptocurrency Tracker

[Web Demo](https://cryptospace.surge.sh/) <br />
[Video Tutorial](https://www.youtube.com/watch?v=UbQe-ljv1ps&list=PLSpXkMCnT_uY2tcpylu2DsVzpwei8gpIT&index=14&ab_channel=MohamedIbrahim)

![cryptospace](https://user-images.githubusercontent.com/26859947/130743604-76a5c67d-59d9-4bd6-8f3f-8de60d12017d.png)

[Slides and Assets](https://drive.google.com/drive/folders/1_FlldcNUqCAPTORbnfyKKBsKpdc-3xBR?usp=sharing)

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


# Notable

Note-taking made simple

[Web Demo](https://notable.surge.sh/) <br />
[Video Tutorial](https://www.youtube.com/watch?v=Lum3RWB7pc4&list=PLSpXkMCnT_uY2tcpylu2DsVzpwei8gpIT&index=20&ab_channel=MohamedIbrahim)

![notable_showcase](https://user-images.githubusercontent.com/26859947/130743438-ecfc329c-e25b-47fd-998d-fb147b2b05ce.png)

[Slides and Assets](https://drive.google.com/drive/folders/1xbDWVOuSpHJqLab3py2FtvPHfjj0HYvG?usp=sharing)

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


# Chatly

Real-time chat built with flutter and firebase

[Web Demo](https://chatly.surge.sh/) <br />
[Video Tutorials](https://www.youtube.com/watch?v=y5poB2Juk4A&list=PLSpXkMCnT_uY2tcpylu2DsVzpwei8gpIT&index=26&ab_channel=MohamedIbrahim)

![chatly](https://user-images.githubusercontent.com/26859947/130743855-9eef34f3-44a7-408d-91cb-17841eea9a7b.png)

[Slides and assets](https://drive.google.com/drive/folders/1ofx4oMNyrpuiUjmVobE5xPaNTHWVbrW5?usp=sharing)

### Get Starter Code

```bash
git clone https://github.com/mibrah42/Chatly.git -b starter-code
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

