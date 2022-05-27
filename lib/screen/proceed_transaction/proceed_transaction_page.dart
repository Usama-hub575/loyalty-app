import 'package:aactivpay/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProceedTransactionPage extends GetView<ProceedTransactionController> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: colors.primaryLight,
        appBar: ProceedTransactionAppBar(
          'Transaction detail',
          onBack: controller.onBack,
        ),
        body: getBody(context)
        // controller.obx(
        //     (state) => getBody(context),
        // ),
        );

    // throw UnimplementedError();
  }

  getBody(BuildContext context) {
    return Container(
      width: sizes.width,
      height: sizes.height,
      child: Column(
        children: [
          Expanded(
            flex: 15,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ActivateCard(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: horizontalValue(20.0), vertical: 24),
                    color: colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VerticalStapper('Upload receipts'),
                        VerticalDotedDivider(5, colors.primaryDark.withOpacity(0.05)),
                        VerticalStapper('Your receipts are in review'),
                        VerticalDotedDivider(5, colors.primaryDark.withOpacity(0.05)),
                        VerticalStapper('Hurray! it’s approved'),
                      ],
                    ),
                  ),
                  DateAndDetailCard(),
                ],
              ),
            ),
          ),
          Spacer(),
          UploadedReceiptList(
              controller.imagesList, controller.removeImageFromList),
          Obx(()=>BottomContainer(
            onAttachmentTap: () =>
                pickReceiptImage(context, controller.pickImageCallBack),
            isButtonEnable: controller.isEnable.value,
          ),
          ),
        ],
      ),
    );
  }
}
