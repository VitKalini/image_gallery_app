import 'dart:async';
import 'package:flutter/material.dart';

class ImagesSearchBar extends StatefulWidget {
  final Function(String)? onChanged;
  final Function()? onClearField;
  final FocusNode? focusNode;

  const ImagesSearchBar({
    super.key,
    this.onChanged,
    this.onClearField,
    this.focusNode,
  });

  @override
  State<StatefulWidget> createState() => _ImagesSearchBarState();
}

class _ImagesSearchBarState extends State<ImagesSearchBar> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;
  OutlineInputBorder borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
  );
  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: widget.focusNode,
      controller: _controller,
      onChanged: (value) {
        if (_debounce?.isActive ?? false) _debounce!.cancel();
        _debounce = Timer(const Duration(milliseconds: 500), () {
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        });
      },
      decoration: InputDecoration(
        focusedBorder: borderStyle,
        enabledBorder: borderStyle,
        border: borderStyle,
        hintText: 'Search images...',
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            _controller.clear();
            if (widget.onClearField != null) {
              widget.onClearField!();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }
}
