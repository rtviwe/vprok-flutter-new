# Vprok Flutter

[![style: flutter_lints](https://img.shields.io/badge/style-flutter__lints-4BC0F5)](https://pub.dev/packages/flutter_lints)

При работе с проектом надо запустить кодген, для этого вводим в консоль команду  
 ```flutter packages pub run build_runner watch```

## Интро

1. Тур по языку  <https://dart.dev/guides/language/language-tour>
2. Кодлабы для любителей <https://flutter.dev/docs/codelabs>
3. Эти плейлисты стоит просмотреть:  
<https://www.youtube.com/watch?v=W1pNjxmNHNQ&list=PLjxrf2q8roU2HdJQDjJzOeO6J3FoFLWr2&index=2>  
<https://www.youtube.com/watch?v=TF-TBsgIErY&list=PLjxrf2q8roU0Net_g1NT5_vOO3s_FR02J>
4. По либам и архитекутере нам это нам мастехев:  
<https://pub.dev/packages/riverpod> для провайда зависимостей  
<https://pub.dev/packages/flutter_hooks> хуки как у фронтендеров, чтобы было меньше болейрплейта  
<https://pub.dev/packages/freezed> для data и sealed классов  

## Дизайн

<https://www.figma.com/file/ChdYXZImV3mnsEXUYKHUkU/%F0%9F%8D%8F-%D0%93%D0%BB%D0%B0%D0%B2%D0%BD%D0%B0%D1%8F?node-id=1%3A1085>

## Веб

Как включить локально веб, чтобы не настраивать корсы на беке  
<https://stackoverflow.com/a/66879350/8378445>

## Стенд

Как изменить стенд  
```flutter run --dart-define=URL=https://www.vprok.ru/mobile/api/```

## Флейворы

У нас есть 3 флейвора:

- development
- staging
- production

Запускаем через следующие команды:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```
