# Pokedex

Pokemon Explorer

[Web Demo](https://pokedexweb.surge.sh/) <br />
[Video Tutorial](https://www.youtube.com/watch?v=8YW-57RfU78&list=PLSpXkMCnT_uY2tcpylu2DsVzpwei8gpIT&index=8&ab_channel=MohamedIbrahim) <br />
[Slides and Assets](https://drive.google.com/drive/folders/1seMupFBbLDSVuMu2mvNr4OUMrCzHN2T9?usp=sharing)

![pokedex3](https://user-images.githubusercontent.com/26859947/130743290-93af253b-cc72-4f45-b08e-63582e6042c3.png)


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
