import 'dart:async';

Stream<int>? stream;
StreamSubscription<int>? streamSubscription;

Future<void> listenOne() async {
  await for (var it in stream!) {
    print(it);
  }
}

Future<void> listenTwo() async {
  await for (var it in stream!) {
    print(it);
  }
}

main() {
  stream = Stream.periodic(Duration(microseconds: 250000), (t) => t).asBroadcastStream();
  listenOne();
  listenTwo();
}
