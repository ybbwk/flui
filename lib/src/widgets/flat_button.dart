import 'package:flutter/material.dart';
import 'package:flui/src/common/defines.dart';

@deprecated
class FLFlatButton extends StatelessWidget {
  const FLFlatButton(
      {Key? key,
      required this.onPressed,
      this.onHighlightChanged,
      this.textTheme,
      this.textColor,
      this.disabledColor,
      this.focusColor,
      this.hoverColor,
      this.color,
      this.disabledTextColor,
      this.highlightColor,
      this.splashColor,
      this.colorBrightness,
      this.padding,
      this.shape,
      this.clipBehavior = Clip.none,
      this.materialTapTargetSize,
      this.focusNode,
      this.expanded = false,
      required this.child})
      : super(key: key);

  final VoidCallback? onPressed;
  final ValueChanged<bool>? onHighlightChanged;
  final ButtonTextTheme? textTheme;
  final Color? textColor;
  final Color? disabledTextColor;
  final Color? color;
  final Color? disabledColor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Brightness? colorBrightness;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;
  final Clip clipBehavior;
  final FocusNode? focusNode;
  final MaterialTapTargetSize? materialTapTargetSize;
  final bool expanded;
  final Widget child;

  factory FLFlatButton.icon({
    Key? key,
    required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor,
    Color disabledTextColor,
    Color color,
    Color disabledColor,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    EdgeInsetsGeometry padding,
    OutlinedBorder shape,
    Clip clipBehavior,
    FocusNode focusNode,
    MaterialTapTargetSize materialTapTargetSize,
    FLPosition iconPosition,
    double spacing,
    required Widget icon,
    required Widget label,
  }) = _FLFlatButtonWithIcon;

  @override
  Widget build(BuildContext context) {
    final Widget buttonChild = expanded
        ? Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                child: child,
              )
            ],
          )
        : child;

    return TextButton(
      onPressed: onPressed,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      style: TextButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: color,
        disabledForegroundColor: disabledTextColor,
        disabledBackgroundColor: disabledColor,
        padding: padding,
        tapTargetSize: materialTapTargetSize,
        shape: shape,
      ),
      child: buttonChild,
    );
  }
}

class _FLFlatButtonWithIcon extends FLFlatButton
    with MaterialButtonWithIconMixin {
  _FLFlatButtonWithIcon({
    Key? key,
    required VoidCallback onPressed,
    ValueChanged<bool>? onHighlightChanged,
    ButtonTextTheme? textTheme,
    Color? textColor,
    Color? disabledTextColor,
    Color? color,
    Color? disabledColor,
    Color? hoverColor,
    Color? focusColor,
    Color? highlightColor,
    Color? splashColor,
    Brightness? colorBrightness,
    EdgeInsetsGeometry? padding,
    OutlinedBorder? shape,
    Clip? clipBehavior,
    FocusNode? focusNode,
    MaterialTapTargetSize? materialTapTargetSize,
    this.iconPosition,
    this.spacing,
    required this.icon,
    required this.label,
  }) : super(
            key: key,
            onPressed: onPressed,
            onHighlightChanged: onHighlightChanged,
            textTheme: textTheme,
            textColor: textColor,
            disabledTextColor: disabledTextColor,
            color: color,
            disabledColor: disabledColor,
            hoverColor: hoverColor,
            focusColor: focusColor,
            highlightColor: highlightColor,
            splashColor: splashColor,
            colorBrightness: colorBrightness,
            padding: padding,
            shape: shape,
            clipBehavior: clipBehavior ?? Clip.none,
            focusNode: focusNode,
            materialTapTargetSize: materialTapTargetSize,
            child: Container());

  final FLPosition? iconPosition;
  final double? spacing;
  final Widget icon;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    final bool isHorizontal =
        (iconPosition == FLPosition.left || iconPosition == FLPosition.right);
    final SizedBox spaceBox =
        isHorizontal ? SizedBox(width: spacing) : SizedBox(height: spacing);
    final List<Widget> children =
        (iconPosition == FLPosition.left || iconPosition == FLPosition.top)
            ? [icon, spaceBox, label]
            : [label, spaceBox, icon];

    final Widget buttonChild = isHorizontal
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: children,
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          );

    return TextButton(
      onPressed: onPressed,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      style: TextButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: color,
        disabledForegroundColor: disabledTextColor,
        disabledBackgroundColor: disabledColor,
        padding: padding,
        tapTargetSize: materialTapTargetSize,
        shape: shape,
      ),
      child: buttonChild,
    );
  }
}
