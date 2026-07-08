# Flutter Cheat Sheet

  ------------------------------------------------------------------------------------------------------------
  Nhóm                    Lệnh                                                         Mô tả
  ----------------------- ------------------------------------------------------------ -----------------------
  Môi trường              `flutter doctor`                                             Kiểm tra môi trường

  Môi trường              `flutter doctor -v`                                          Thông tin chi tiết

  Môi trường              `flutter --version`                                          Xem phiên bản Flutter

  Package                 `flutter pub get`                                            Tải package

  Package                 `flutter pub upgrade`                                        Cập nhật package

  Package                 `flutter pub outdated`                                       Kiểm tra package cũ

  Chạy app                `flutter run`                                                Chạy Debug

  Chạy app                `flutter run --release`                                      Chạy Release

  Chạy app                `flutter run -d <device_id>`                                 Chạy trên thiết bị chỉ
                                                                                       định

  Thiết bị                `flutter devices`                                            Liệt kê thiết bị

  Thiết bị                `flutter emulators`                                          Liệt kê emulator

  Thiết bị                `flutter emulators --launch <id>`                            Mở emulator

  Build                   `flutter build apk --release`                                Build APK

  Build                   `flutter build appbundle`                                    Build AAB

  Build                   `flutter build ios`                                          Build iOS

  Build                   `flutter build web`                                          Build Web

  Build                   `flutter build windows`                                      Build Windows

  Dọn dẹp                 `flutter clean`                                              Xóa cache build

  Phân tích               `flutter analyze`                                            Phân tích mã nguồn

  Kiểm thử                `flutter test`                                               Chạy test

  Sinh code               `dart run build_runner build`                                Sinh mã

  Sinh code               `dart run build_runner build --delete-conflicting-outputs`   Sinh lại và ghi đè

  Icon                    `dart run flutter_launcher_icons`                            Tạo icon

  Splash                  `dart run flutter_native_splash:create`                      Tạo splash

  Log                     `flutter logs`                                               Xem log

  Cập nhật                `flutter upgrade`                                            Cập nhật Flutter
  ------------------------------------------------------------------------------------------------------------

## Quy trình thường dùng

### Clone dự án

``` bash
flutter pub get
flutter run
```

### Sau khi thêm package

``` bash
flutter pub get
```

### Khi project lỗi build

``` bash
flutter clean
flutter pub get
flutter run
```

### Sinh lại code

``` bash
dart run build_runner build --delete-conflicting-outputs
```

### Build phát hành Android

``` bash
flutter clean
flutter pub get

flutter build appbundle / flutter build apk
```
