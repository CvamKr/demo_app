import 'package:demo_app/src/central/widgets/my_sized_box.dart';
import 'package:flutter/material.dart';

import '../controllers/encryption_controller.dart';
import 'package:get/get.dart';

class EncryptionPage extends StatefulWidget {
  const EncryptionPage({Key? key}) : super(key: key);

  @override
  _EncryptionPageState createState() => _EncryptionPageState();
}

class _EncryptionPageState extends State<EncryptionPage> {
  EncryptionController encryptionController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          // margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: TextField(
            controller: EncryptionController.messageController,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 100.0, horizontal: 16),
              border: const OutlineInputBorder(),
              hintText: 'Message'.tr,
            ),
          ),
        ),
        myH(16),
        Container(
          child: TextField(
            controller: EncryptionController.secretKeyController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Secret Key'.tr,
            ),
          ),
        ),
        myH(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // background
                  onPrimary: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    EncryptionController.encryptMessage(
                        EncryptionController.messageController.text);
                  });
                },
                child: Text('Encrypt'.tr),
              ),
            ),
            myW(8),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // background
                  onPrimary: Colors.white,
                ),
                onPressed: EncryptionController.encryptedMap.isEmpty
                    ? null
                    : () {
                        setState(() {
                          EncryptionController.decryptMessage(
                              EncryptionController.messageController.text);
                        });
                      },
                child: Text('Decrypt'.tr),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SelectableText(
            EncryptionController.showTextt,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
