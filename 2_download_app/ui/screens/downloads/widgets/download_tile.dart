import 'package:flutter/material.dart';
import 'package:flutter_lab/TERM-2/W4-PRACTICE/2_download_app/ui/theme/theme.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({super.key, required this.controller});

  final DownloadController controller;

  // TODO
  String getProgressText(double progress, int size) {
    return '${(progress * 100).toStringAsFixed(1)}% completed - ${size * progress} of ${size.toString()} MB';
  }

  IconData getIcon() {
    switch (controller.status) {
      case DownloadStatus.notDownloaded:
        return Icons.download;
      case DownloadStatus.downloading:
        return Icons.downloading;
      case DownloadStatus.downloaded:
        return Icons.folder;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          return Card(
            color: Colors.white,
            clipBehavior: Clip.none,
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(
                controller.ressource.name,
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                controller.status == DownloadStatus.notDownloaded
                    ? ''
                    : getProgressText(
                        controller.progress, controller.ressource.size),
                style: TextStyle(
                    fontSize: 11,
                    color: AppColors.neutralLight,
                    fontWeight: FontWeight.w500),
              ),
              trailing: IconButton(
                  onPressed: controller.startDownload,
                  icon: Icon(getIcon())
              ),
            ),
          );
        });
  }
}
