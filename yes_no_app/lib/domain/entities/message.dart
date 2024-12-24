enum FromWho { me, hers }

class Message {
  final String text;
  final String? imageURL;
  final FromWho fromWho;

  Message({required this.fromWho, required this.text, this.imageURL});
}
