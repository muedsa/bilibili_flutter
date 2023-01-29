import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DPadControlShortcuts extends StatelessWidget {
  const DPadControlShortcuts({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(shortcuts: <LogicalKeySet, Intent>{
      LogicalKeySet(LogicalKeyboardKey.arrowUp): const DirectionalFocusIntent(
          TraversalDirection.up,
          ignoreTextFields: false),
      LogicalKeySet(LogicalKeyboardKey.arrowDown): const DirectionalFocusIntent(
          TraversalDirection.down,
          ignoreTextFields: false),
      LogicalKeySet(LogicalKeyboardKey.arrowLeft): const DirectionalFocusIntent(
          TraversalDirection.left,
          ignoreTextFields: false),
      LogicalKeySet(LogicalKeyboardKey.arrowRight):
          const DirectionalFocusIntent(TraversalDirection.right,
              ignoreTextFields: false),
      LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent()
    }, child: child);
  }
}

class SimpleDPadFocusTap extends StatefulWidget {
  const SimpleDPadFocusTap({
    required this.child,
    this.onFocusChange,
    this.onTap,
    this.onDPadKey,
    this.focusNode,
    this.debugLabel,
    super.key,
  });

  final Widget child;
  final ValueChanged<bool>? onFocusChange;
  final void Function()? onTap;
  final void Function(DPadControlKey, int)? onDPadKey;
  final FocusNode? focusNode;
  final String? debugLabel;

  @override
  State<StatefulWidget> createState() => _SimpleDPadFocusTapState();

}

class _SimpleDPadFocusTapState extends State<SimpleDPadFocusTap> {

  late final FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onTap?.call();
        FocusScope.of(context).requestFocus(focusNode);
      },
      child: SimpleDPadFocus(
        focusNode: focusNode,
        onFocusChange: widget.onFocusChange,
        onDPadSelected: widget.onTap,
        onDPadKey: widget.onDPadKey,
        child: widget.child,
      ),
    );
  }

}

class SimpleDPadFocus extends StatefulWidget {
  const SimpleDPadFocus({
    required this.child,
    this.onFocusChange,
    this.onDPadSelected,
    this.onDPadKey,
    this.focusNode,
    this.debugLabel,
    super.key,
  });

  final Widget child;
  final ValueChanged<bool>? onFocusChange;
  final void Function()? onDPadSelected;
  final void Function(DPadControlKey, int)? onDPadKey;
  final FocusNode? focusNode;
  final String? debugLabel;

  @override
  State<StatefulWidget> createState() => _SimpleDPadFocusState();
}

class _SimpleDPadFocusState extends State<SimpleDPadFocus> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Focus(
        focusNode: widget.focusNode,
        debugLabel: widget.debugLabel,
        canRequestFocus: true,
        onFocusChange: (hasFocus) {
          _count = 0;
          widget.onFocusChange?.call(hasFocus);
        },
        onKey: (node, event) {
          if (event is RawKeyUpEvent) {
            if (event.logicalKey == LogicalKeyboardKey.select ||
                event.logicalKey == LogicalKeyboardKey.gameButtonA ||
                event.logicalKey == LogicalKeyboardKey.gameButtonSelect ||
                event.logicalKey == LogicalKeyboardKey.enter ||
                event.logicalKey == LogicalKeyboardKey.numpadEnter) {
              widget.onDPadKey?.call(DPadControlKey.select, _count++);
              widget.onDPadSelected?.call();
            } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
              widget.onDPadKey?.call(DPadControlKey.up, _count++);
            } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
              widget.onDPadKey?.call(DPadControlKey.down, _count++);
            } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
              widget.onDPadKey?.call(DPadControlKey.left, _count++);
            } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
              widget.onDPadKey?.call(DPadControlKey.right, _count++);
            }
          }
          return KeyEventResult.ignored;
        },
        child: widget.child);
  }
}

enum DPadControlKey {
  up,
  down,
  left,
  right,
  select;
}
