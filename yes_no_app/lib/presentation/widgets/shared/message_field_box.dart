import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValueChange;

  const MessageFieldBox({super.key, required this.onValueChange});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();
    // final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final InputDecoration inputDecoration = InputDecoration(
      hintText: 'End ur message with a "?"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
          onPressed: () {
            final textValue = textController.value.text;
            onValueChange(textValue);
            textController.clear();
          },
          icon: const Icon(Icons.send_outlined)),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValueChange(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
