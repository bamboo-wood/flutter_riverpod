import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_explanation/models/count_data.dart';
import 'package:flutter_riverpod_explanation/providers/provider.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ref.watch(titleProvider),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(
              builder: (context, ref, child) {
                return Text(
                  ref.watch(messageProvider),
                  style: Theme.of(context).textTheme.bodySmall,
                );
              },
            ),
            const SizedBox(height: 20.0),
            Text(
              ref.watch(countDataProvider).count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    CountData countData = ref.watch(countDataProvider);
                    ref.read(countDataProvider.notifier).state = CountData(
                      count: countData.count - 1,
                      countUp: countData.countUp,
                      countDown: countData.countDown - 1,
                    );
                  },
                  child: const Icon(CupertinoIcons.minus),
                ),
                FloatingActionButton(
                  onPressed: () {
                    CountData countData = ref.watch(countDataProvider);
                    ref.read(countDataProvider.notifier).state = CountData(
                      count: countData.count + 1,
                      countUp: countData.countUp + 1,
                      countDown: countData.countDown,
                    );
                  },
                  child: const Icon(CupertinoIcons.plus),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  ref.watch(countDataProvider.select((value) => value.countDown)).toString(),
                ),
                Text(
                  ref.watch(countDataProvider.select((value) => value.countUp)).toString(),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(countDataProvider.notifier).state = const CountData(
            count: 0,
            countUp: 0,
            countDown: 0,
          );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
