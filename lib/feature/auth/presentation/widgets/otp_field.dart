import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_listing_app/feature/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:product_listing_app/feature/auth/presentation/bloc/auth/auth_event.dart';

class OtpFieldWidget extends StatelessWidget {
  final TextEditingController controller;

  const OtpFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PinInputField(
      length: 4,
      onCompleted: (otp) {
        // Save entered OTP to Bloc
        debugPrint("Entered OTP: $otp");
        context.read<AuthBloc>().add(VerifyOtpEvent(otp));
        controller.text = otp; // update external controller for submit button
      },
    );
  }
}

class PinInputField extends StatefulWidget {
  final int length;
  final void Function(String)? onCompleted;

  const PinInputField({
    super.key,
    this.length = 4,
    this.onCompleted,
  });

  @override
  State<PinInputField> createState() => _PinInputFieldState();
}

class _PinInputFieldState extends State<PinInputField> {
  final List<FocusNode> _focusNodes = [];
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.length; i++) {
      _focusNodes.add(FocusNode());
      _controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var ctrl in _controllers) {
      ctrl.dispose();
    }
    super.dispose();
  }

  /// Clears all fields and resets focus to the first one
  void clearFields() {
    for (final controller in _controllers) {
      controller.clear();
    }
    if (_focusNodes.isNotEmpty) {
      FocusScope.of(context).requestFocus(_focusNodes.first);
    }
    setState(() {});
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      // move to next field
      if (index + 1 < widget.length) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        FocusScope.of(context).unfocus();
        final otp = _controllers.map((c) => c.text).join();
        if (otp.length == widget.length && widget.onCompleted != null) {
          widget.onCompleted!(otp);
        }
      }
    }
  }

  void _onKey(KeyEvent event, int index) {
    if (event is KeyDownEvent &&
        event.logicalKey.keyLabel == 'Backspace' &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.1),
                blurRadius: 6,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: KeyboardListener(
            focusNode: FocusNode(), // for capturing backspace
            onKeyEvent: (event) => _onKey(event, index),
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              maxLength: 1,
              onChanged: (value) => _onChanged(value, index),
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                counterText: "",
                border: InputBorder.none,
              ),
            ),
          ),
        );
      }),
    );
  }
}
