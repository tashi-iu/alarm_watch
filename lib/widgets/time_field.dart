import 'package:flutter/material.dart';
import 'package:alarm_watch/models/time.dart';

class TimeField extends StatefulWidget {
  final Time time;
  final Function(Time)? onChange;
  const TimeField({
    super.key,
    required this.time,
    this.onChange,
  });

  @override
  State<TimeField> createState() {
    return _TimeFieldState();
  }
}

class _TimeFieldState extends State<TimeField> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTimeUnitField(
            24,
            widget.time.hour,
            (value) {
              widget.onChange?.call(
                widget.time.copyWith(
                  hour: value % 24,
                ),
              );
            },
          ),
          const Text(
            ':',
            style: TextStyle(fontSize: 56),
          ),
          _buildTimeUnitField(
            60,
            widget.time.minute,
            (value) {
              widget.onChange?.call(
                widget.time.copyWith(
                  minute: value % 60,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimeUnitField(
      int count, int value, void Function(int) onChange) {
    return SizedBox(
      height: 150,
      width: 85,
      child: ShaderMask(
        shaderCallback: (Rect rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.background,
              Colors.transparent,
              Theme.of(context).colorScheme.background
            ],
            stops: const [0.0, 0.5, 1.0],
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: PageController(
            viewportFraction: 0.4,
            initialPage: value * 999,
          ),
          onPageChanged: onChange,
          physics: const _CustomPageViewScrollPhysics(),
          itemBuilder: (_, i) {
            return AnimatedScale(
              scale: (i % count) == value ? 1 : 0.9,
              curve: Curves.decelerate,
              duration: const Duration(milliseconds: 300),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    _formatTime(i % count),
                    style: const TextStyle(fontSize: 56),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _formatTime(int time) {
    String timeStr = time.toString();
    return timeStr.length > 1 ? timeStr.toString() : '0${timeStr.toString()}';
  }
}

class _CustomPageViewScrollPhysics extends ScrollPhysics {
  const _CustomPageViewScrollPhysics({ScrollPhysics? parent})
      : super(parent: parent);

  @override
  _CustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _CustomPageViewScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 90,
        stiffness: 100,
        damping: 1,
      );
}
