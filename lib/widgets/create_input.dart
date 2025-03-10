import 'package:flutter/material.dart';

class CreateInput extends StatefulWidget {
  final ValueChanged<String>? onTextChanged;
  final VoidCallback? onSearchClosed;
  final String hintText;
  final Widget suffixIcon;

  const CreateInput({
    super.key,
    this.onTextChanged,
    this.onSearchClosed,
    this.hintText = 'create a new todo...',
    required this.suffixIcon,
  });

  @override
  State<CreateInput> createState() => _CreateInputState();
}

class _CreateInputState extends State<CreateInput> {
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    if (widget.onTextChanged != null) {
      widget.onTextChanged!(_textController.text);
    }
  }

  @override
  void dispose() {
    _textController.removeListener(_onTextChanged);
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        floatingLabelBehavior: FloatingLabelBehavior.never,

        isDense: true,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        fillColor: Theme.of(context).colorScheme.primary,
        hintText: widget.hintText,
        prefixIcon: widget.suffixIcon,
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
      ),
      onChanged: (text) => widget.onTextChanged?.call(text), // Update callback
    );
  }
}
