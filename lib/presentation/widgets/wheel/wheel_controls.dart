import 'package:flutter/material.dart';

// ========================================
// WHEEL CONTROLS WIDGET
// ========================================
// Widget containing wheel control buttons
class WheelControls extends StatelessWidget {
  final String spinButtonText;
  final TextStyle spinButtonTextStyle;
  final Color spinButtonColor;
  final Widget spinButtonIcon;
  final Widget? customSpinButton;
  final VoidCallback? onSpinPressed;
  final bool isSpinning;

  const WheelControls({
    super.key,
    required this.spinButtonText,
    required this.spinButtonTextStyle,
    required this.spinButtonColor,
    required this.spinButtonIcon,
    this.customSpinButton,
    this.onSpinPressed,
    this.isSpinning = false,
  });

  @override
  Widget build(BuildContext context) {
    return _buildControls(context);
  }

  Widget _buildControls(BuildContext context) {
    return _buildSpinButton(context);
  }

  Widget _buildSpinButton(BuildContext context) {
    final isDisabled = isSpinning;
    if (customSpinButton != null) {
      return InkWell(
        onTap: isDisabled ? null : () => _handleSpinPress(context),
        child: customSpinButton!,
      );
    }
    return SizedBox(
      width: 140,
      height: 40,
      child: ElevatedButton(
        onPressed: isDisabled ? null : () => _handleSpinPress(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: spinButtonColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          minimumSize: const Size(120, 40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isDisabled)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            else
              spinButtonIcon,
            const SizedBox(width: 6),
            Text(
              isDisabled ? '...' : spinButtonText,
              style: spinButtonTextStyle,
            ),
          ],
        ),
      ),
    );
  }

  void _handleSpinPress(BuildContext context) async {
    if (onSpinPressed != null) {
      onSpinPressed!();
    }
  }
}
