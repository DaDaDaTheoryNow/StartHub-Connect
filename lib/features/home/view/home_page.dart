import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/features/channels/view/chats_page.dart';
import 'package:starthub_connect/features/home/controller/controller.dart';
import 'package:starthub_connect/features/home/view/widgets/drawer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            floating: true,
            centerTitle: true,
            title: Text(
              'StartHub Connect',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const FaIcon(FontAwesomeIcons.barsStaggered),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ),
          const ChannelsPage(),
        ],
      ),
    );
  }
}
