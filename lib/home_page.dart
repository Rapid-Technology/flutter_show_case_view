import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey add = GlobalKey();
  final GlobalKey item = GlobalKey();
  final GlobalKey search = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ShowCaseWidget.of(context).startShowCase([add, item, search]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ShowCaseView"),
        centerTitle: false,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Showcase(
              key: search,
              description: 'Tap to search item',
              overlayOpacity: 0.5,
              targetShapeBorder: const CircleBorder(),
              targetPadding: const EdgeInsets.all(8),
              child: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      floatingActionButton: Showcase(
        key: add,
        description: 'Tap to add an item',
        overlayOpacity: 0.5,
        targetShapeBorder: const CircleBorder(),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) => index == 4
            ? Showcase(
                key: item,
                description: 'Tap to see item details',
                overlayOpacity: 0.5,
                child: listItem(index),
              )
            : listItem(index),
      ),
    );
  }

  listItem(int index) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.green,
        child: Icon(
          Icons.apps,
          color: Colors.white,
        ),
      ),
      title: Text("Flutter Title Example $index"),
      subtitle: Text("Flutter sub title description $index"),
      trailing: const Text("July 2023"),
    );
  }
}
