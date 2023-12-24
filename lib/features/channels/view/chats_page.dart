import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starthub_connect/features/channels/controller/controller.dart';
import 'package:starthub_connect/features/channels/view/widgets/channel_widget.dart';

class ChannelsPage extends GetView<ChannelsController> {
  const ChannelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.state.channels.isNotEmpty)
        ? SliverList.builder(
            itemCount: controller.state.channels.length,
            itemBuilder: (context, index) {
              return ChannelWidget(controller.state.channels[index]);
            },
          )
        : const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator())));
  }
}
