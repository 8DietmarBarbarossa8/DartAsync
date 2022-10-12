import 'dart:async';

Stream<int>? stream;
StreamSubscription<int>? streamSubscription;

main() {
  print('one');
  stream = Stream.periodic(Duration(seconds: 1), (tick) => tick);
  print('two');
  streamSubscription = stream?.listen((event) {
    print(event);
    // if (event == 20) {
    //   streamSubscription?.cancel();
    // }
  });

  Future.delayed(Duration(seconds: 3), () {
    streamSubscription?.pause();
  });
  Future.delayed(Duration(seconds: 10), () {
    streamSubscription?.resume();
  });
  Future.delayed(Duration(seconds: 25), () {
    streamSubscription?.cancel();
  });
}
