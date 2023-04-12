import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_explanation/models/count_data.dart';
import 'package:flutter_riverpod_explanation/providers/provider.dart';
import 'package:flutter_riverpod_explanation/notifiers/count_data_notifier.dart';

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
    CountData countData = ref.watch(countDataProvider);

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
              countData.count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () => ref.read(countDataProvider.notifier).decrease(),
                  child: const Icon(CupertinoIcons.minus),
                ),
                FloatingActionButton(
                  onPressed: () => ref.read(countDataProvider.notifier).increase(),
                  child: const Icon(CupertinoIcons.plus),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(countData.countDown.toString()),
                Text(countData.countUp.toString()),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(countDataProvider.notifier).reset(),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
