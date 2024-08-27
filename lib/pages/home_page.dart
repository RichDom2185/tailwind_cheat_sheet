import 'package:flutter/material.dart';
import 'package:tailwind_cheat_sheet/controllers/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController _controller = HomePageController();

  @override
  void initState() {
    super.initState();
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Tailwind Cheat Sheet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                'Showing ${_controller.listItems.length} categories',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final category = _controller.listItems[index];
                  return ExpansionTile(
                    title: Text(category.name),
                    children: category.classes
                        .map((record) => ListTile(
                              title: Text(record.className),
                              subtitle: Text(record.cssMeaning),
                            ))
                        .toList(),
                  );
                },
                // separatorBuilder: (context, index) => const Divider(),
                itemCount: _controller.listItems.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
