Future<int> sum(int a, int b) {
  return Future.sync(() => a + b);
}

void example() async {
  final a = sum(1, 4);
  a.then((a) {
    print(a);
    final b = sum(a, 9);
    b.then((b) {
      print(b);
      final c = sum(a, b);
      c.then((c) {
        print(c);
      });
    });
  });

  final a1 = await sum(1, 4);
  print(a);
  final b = await sum(a1, 9);
  print(b);
  final c = await sum(a1, b);
  print(c);

  [1, 2, 3, 4, 5, 6, 7, 8, 9, 0].forEach((element) async {
    print(element);
  });
}

void main(List<String> args) {
  print('start');
  example();
  print('end');
}
