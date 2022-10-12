import 'dart:async';

StreamController<int> controller = StreamController<int>(sync: true);
StreamSubscription<int>? subscriptionOne;

main() {
  subscriptionOne = controller.stream.listen((event) async {
    if (event % 2 == 0) {
      await Future.delayed(Duration(seconds: 2));
    }
    print(event);
  });
  print('one');
  controller.add(2);
  controller.add(3);
  controller.add(5);
  controller.add(8);
  controller.add(13);
  print('two');
  print('three');
  controller.add(1);
  controller.add(1);
  controller.add(1);
  controller.add(3);
  controller.add(5);
  controller.add(9);
  controller.add(17);
  controller.add(31);
  Future.delayed(Duration(seconds: 3), () {
    subscriptionOne?.cancel();
    controller.close();
  });
}
