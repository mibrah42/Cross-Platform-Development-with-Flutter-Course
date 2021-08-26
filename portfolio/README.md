# Personal Portfolio

[Web Demo](https://mohamedibrahim.surge.sh/) <br />
[Video Tutorial](https://www.youtube.com/watch?v=4ji881T8zw4&list=PLSpXkMCnT_uY2tcpylu2DsVzpwei8gpIT&index=2&ab_channel=MohamedIbrahim) <br />
[Slides and Assets](https://drive.google.com/drive/folders/19QtqYkqA89qUIeQZBrVJNKYxEAcpKp5l?usp=sharing)

![portfolio](https://user-images.githubusercontent.com/26859947/130892183-64da6794-f959-4d8b-af5e-ed03a0de6cf1.png)


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
