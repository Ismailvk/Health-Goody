import 'package:flutter/material.dart';
import 'package:health_goody/core/presentation/utils/theme.dart';

class AnimatedClickableTextContainer extends StatefulWidget {
  final String iconSrc;
  final String title;
  final Color bgColor;
  final VoidCallback press;

  const AnimatedClickableTextContainer({
    Key? key,
    required this.iconSrc,
    required this.title,
    required this.press,
    required this.bgColor,
  }) : super(key: key);

  @override
  State createState() {
    return _AnimatedClickableTextContainerState();
  }
}

class _AnimatedClickableTextContainerState
    extends State<AnimatedClickableTextContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.bgColor,
      ),
      child: InkWell(
        child: ListTile(onTap: widget.press, title: getMenuItem()),
      ),
    );
  }

  Widget getMenuItem() {
    return Container(
      padding: const EdgeInsets.only(bottom: 5, right: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.iconSrc.isNotEmpty)
            Image.asset(widget.iconSrc,
                height: 24,
                fit: BoxFit.contain,
                color: appColors.sideMenuHighlight),
          if (widget.iconSrc.isNotEmpty) const SizedBox(width: 15),
          Text(
            widget.title,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: appColors.buttonTextColor),
          ),
        ],
      ),
    );
  }
}
