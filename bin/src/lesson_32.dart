import 'dart:async';

Stream<int>? stream;
StreamSubscription<int>? streamSubscription;

main() {
  stream = Stream.periodic(Duration(milliseconds: 799), (tick) => tick)
      .asBroadcastStream();
  var sub1 = stream?.listen((event) {
    print(event);
  });
  var sub2 = stream?.listen((event) {
    print(event);
  });
  Future.delayed(Duration(seconds: 10), () {
    sub1?.cancel();
    sub2?.cancel();
  });
}
