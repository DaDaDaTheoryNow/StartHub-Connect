class ChannelModel {
  final String title;
  final String image;
  final String lastMessage;

  ChannelModel(
      {required this.title,
      required this.image,
      this.lastMessage = "No one. Absolutely..."});

  factory ChannelModel.fromFirebase(MapEntry<dynamic, dynamic> entry) {
    return ChannelModel(
      image: entry.value['imageUrl'] ?? '',
      title: entry.key ?? 'Unknown',
      lastMessage: entry.value['lastMessage'] ?? "No one. Absolutely...",
    );
  }
}
