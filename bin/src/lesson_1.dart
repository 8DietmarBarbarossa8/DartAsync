import 'dart:io';

main() {
  print('Beer 0000');
  sleep(Duration(milliseconds: 2000));
  print('Beer 2000');
  Future<Object?> future = Future<Object?>.delayed(Duration(seconds: 10));
  future.then((value) => print('Value: $value'));
  for (var i = 0; i < 10; i++) {
    print(i);
    sleep(Duration(seconds: 1));
  }

  final file = File('bin/text.txt').readAsString();
  file.then((value) {
    List<String> str = value.split('\n');
    for (var s in str) {
      print(s);
      sleep(Duration(milliseconds: 700));
    }
  });

  final f1 = Future.delayed(Duration(seconds: 2));
  f1.whenComplete(() => print(1));
  final f2 = Future.delayed(Duration(seconds: 5));
  f2.whenComplete(() => print(2));
  final f3 = Future.wait([f1, f2]);
  f3.then((value) => print(4));
}
