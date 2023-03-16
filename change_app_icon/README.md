#1: create flutter project `change_app_icon`
#2: Add `flutter_launcher_icons` package under dependency section.
#3: create `flutter_icons:` property.
#4: add `image_path` key then value.
#5: add android true
#6: add ios true
#7: make sure download/create icon.
#8: run `flutter pub get` command in terminal.
#9: run `flutter pub run flutter_launcher_icons` command in terminal
#10: after successfully; run your application.
#11: some white space around, needs to be adaptive `android adaptive icons` which has two layers foreground image and background image
#12: go to `icon.kithen` website and make it adaptive.
#13: after editing  download this file into assets folder.
#14: go to flutter pubspec.yaml file uder `flutter_icons:` add `adaptive_icon_foreground: new adaptive icon path`.
#15: add `adaptive_icon_background` here you can add either color or image.
#16: after done all of these, now again run step #9.