import 'package:flutter/material.dart';
import 'package:repertorio/app/utils/color.dart';

class TextInput extends StatefulWidget {
  const TextInput({
    super.key,
    required String label,
    required TextEditingController controller,
    required String? Function(String?)? validators,
  })  : _controller = controller,
        _label = label,
        _validators = validators;

  final TextEditingController _controller;
  final String _label;
  final String? Function(String?)? _validators;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget._label,
          style: const TextStyle(fontSize: 16, color: ColorsOptions.secondary),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(6)),
            child: TextFormField(
              style: const TextStyle(color: Colors.white),
              controller: widget._controller,
              validator: widget._validators,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(
                    left: 15,
                    top: 20,
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
