import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoInternetDialog extends StatelessWidget {
  final bool justClose;
  final Future<void> Function()? retry;
  final String? title;
  const NoInternetDialog({
    super.key,
    required this.retry,
    this.title,
    this.justClose = true,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black87,
          ),
          width: 300,
          height: 200,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'هشدار',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              Text(
                title ??
                    'ارتباط Wi-Fi/GPRS غیرفعال شده است. لطفا از تنظیمات دستگاه ارتباط Wi-Fi/GPRS را فعال نموده و مجددا تلاش کنید.',
                maxLines: title != null ? 2 : 3,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                      retry!();
                    },
                    child: Text(
                      'تلاش دوباره',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  if (!justClose) ...[
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        'لغو',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                  InkWell(
                    onTap: () => exit(0),
                    child: Text(
                      'خروج',
                      style:   TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
