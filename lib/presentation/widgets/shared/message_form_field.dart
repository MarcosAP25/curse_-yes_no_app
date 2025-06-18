import 'package:flutter/material.dart';

class MessageFormField extends StatelessWidget {
  const MessageFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    final _focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20)
      
    );


    final decoration = InputDecoration(
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      hintText: 'Termina tu mensaje con "?"',
      suffixIcon: IconButton(
        onPressed: () {

          _controller.clear();
        }, 
        icon: Icon(Icons.send_outlined)
      )
    );

    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: decoration,
      onFieldSubmitted: (value) {
        _controller.clear();
        _focusNode.requestFocus();
      },
      onTapOutside: (event) => _focusNode.unfocus(),
    );
  }
}