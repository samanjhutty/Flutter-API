import 'package:flutter/material.dart';

class ImagePreview extends StatefulWidget {
  const ImagePreview({super.key, required this.url, required this.caption});

  final String url;
  final String caption;
  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
              style: TextButton.styleFrom(alignment: Alignment.center),
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'))
        ],
        contentPadding: EdgeInsets.zero,
        actionsPadding: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        scrollable: true,
        content: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(17)),
                  child: Image.network(widget.url, fit: BoxFit.fill)),
              ListTile(title: Text(widget.caption))
            ],
          ),
        ));
  }
}
