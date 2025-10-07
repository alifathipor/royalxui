import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

enum SnackbarType { error, warning, success }

class SnackBar extends StatefulWidget {
  final double t;
  final String message;
  final SnackbarType type;

  const SnackBar({
    super.key,
    required this.message,
    required this.t,
    required this.type,
  });

  @override
  State<SnackBar> createState() => _SnackBarState();
}

class _SnackBarState extends State<SnackBar>
    with SingleTickerProviderStateMixin {
  //
  late AnimationController _controller;

  Color snackbarPrimaryColor(SnackbarType type) {
    return type == SnackbarType.error
        ? Colors.red
        : type == SnackbarType.warning
            ? Colors.orange
            : Colors.green;
  }

  Color snackbarSecondaryColor(SnackbarType type) {
    return type == SnackbarType.error
        ? Colors.red.shade300
        : type == SnackbarType.warning
            ? Colors.orange.shade300
            : Colors.green.shade300;
  }

  Color notifBackground = Colors.white;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..addListener(() {
        setState(() {});
      });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.of(context).size.width < 800;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Material(
            color: Colors.transparent,
            child: FractionalTranslation(
              translation: Offset.lerp(
                  Offset(isMobile ? 0 : 1, isMobile ? 1 : 0),
                  const Offset(0, 0),
                  widget.t)!,
              child: Align(
                alignment: isMobile
                    ? AlignmentDirectional.bottomCenter
                    : AlignmentDirectional.bottomStart,
                child: Dismissible(
                  onDismissed: (direction) {
                    OverlaySupportEntry.of(context)!.dismiss(animate: false);
                  },
                  direction: isMobile
                      ? DismissDirection.down
                      : DismissDirection.endToStart,
                  key: ValueKey(widget.key),
                  child: GestureDetector(
                    onVerticalDragEnd: isMobile
                        ? (_) {
                            OverlaySupportEntry.of(context)!
                                .dismiss(animate: true);
                          }
                        : null,
                    child: Container(
                      width: MediaQuery.of(context).size.width *
                          (isMobile ? 1 : 0.4),
                      height: 70,
                      margin: EdgeInsets.all(isMobile ? 0 : 8),
                      child: PhysicalModel(
                        color: notifBackground,
                        elevation: 15,
                        borderRadius: BorderRadius.circular(isMobile ? 0 : 7),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 7,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(isMobile ? 0 : 7),
                                  topRight: Radius.circular(isMobile ? 0 : 7),
                                ),
                                child: LinearProgressIndicator(
                                  value: _controller.value,
                                  backgroundColor:
                                      snackbarSecondaryColor(widget.type),
                                  color: snackbarPrimaryColor(widget.type),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  if (!isMobile) ...[
                                    IconButton(
                                      icon: const Icon(Icons.close_rounded),
                                      splashRadius: 15,
                                      color: snackbarPrimaryColor(widget.type),
                                      onPressed: () =>
                                          OverlaySupportEntry.of(context)!
                                              .dismiss(animate: true),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Container(
                                        margin:
                                            const EdgeInsetsDirectional.only(
                                          end: 10,
                                        ),
                                        width: 1,
                                        height: double.infinity,
                                        color:
                                            snackbarSecondaryColor(widget.type),
                                      ),
                                    ),
                                  ],
                                  Expanded(
                                    child: Text(
                                      widget.message,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color:
                                              snackbarPrimaryColor(widget.type),
                                          fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
