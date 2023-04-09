# Automatic `Stripe` Package generator
[`example`](example) is a Dart package containing generator for Stripe APIs. 

[`example_usage`](example_usage) is the Dart package which houses the automatically generated code for Stripe APIs.

# How to run? 🏃‍♂️

1️⃣ Inside `example`
```
 flutter pub get
```
2️⃣ Inside `example_usage`
```
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

# 🛠 Libraries used

- [source_gen](https://pub.dev/packages/source_gen)
- [build_runner](https://pub.dev/packages/build_runner)

# ⭐ Features
- [stripe.com/docs/api](https://stripe.com/docs/api) is parsed and [api.json](example/lib/src/json_files/api.json) created.
- This json is fed to [stripe_library_generator](example/lib/src/stripe_library_generator.dart).
- The generator generates [utils.info.dart](example_usage/lib/utils.info.dart) which contains all the Stripe APIs.
- The package is not platform dependent. It is in pure dart.

# ⭐ Possible Improvements
- Could have used a web scraper to scrape Stripe doc. Currently, only some APIs are available in api.json as it was manually written.
- Can research more about writing tests for generator.