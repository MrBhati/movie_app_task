import 'package:fasai_task/custom_widget/large_vr_line.dart';
import 'package:fasai_task/theme/colors.dart';
import 'package:fasai_task/theme/text_styles.dart';
import 'package:fasai_task/view_model/movie_details_provider.dart';
import 'package:flutter/material.dart';

void AddPlayList(
    {required BuildContext context,
    required String title,
    required Widget childWidget,
    required MovieDetailsScreenProvider model,
    required Function onSave}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext _) {
      return Container(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top,
        margin: const EdgeInsets.only(top: 30),
        decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14), topRight: Radius.circular(14))),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Image(
                            image: AssetImage(
                              "assets/icons/close.png",
                            ),
                            color: AppColors.whiteColor,
                            height: 12,
                            width: 12,
                          ),
                        ),
                        Column(
                          children: [
                            Text((title).toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.whiteColor,
                                    fontFamily: 'InterRegular',
                                    height: 1.5,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            onSave.call();
                          },
                          child: const Text(
                            "Save Wachlist",
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColors.accentColor,
                                fontFamily: 'InterMedium',
                                height: 1.5,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                  LargeVrLine(
                      height: 1,
                      hrMargin: 0,
                      veMargin: 2,
                      lineColor: AppColors.whiteColor.withOpacity(0.3)),
                  const SizedBox(
                    height: 14,
                  ),
                  Form(
                    key: model.wachlistKeyKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Create new Wachlist".toUpperCase(),
                            style: const TextStyle(
                                fontSize: 16,
                                color: AppColors.whiteColor,
                                fontFamily: 'InterRegular',
                                height: 1.5,
                                fontWeight: FontWeight.w700)),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Enter Wachlist name",
                          style: TextStryles.textFiledText,
                        ),
                        TextFormField(
                          controller: model.playlistNameController,
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                          ),
                          decoration: AppColors.textInputDecoration(
                              hint: "Eg. Action movies"),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.length < 4) {
                              return 'Please enter Wachlist Name its required';
                            } else {
                              return null;
                            }
                          },
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                              child: Checkbox(
                                value: model.ispublic,
                                onChanged: (value) {
                                  // model.updateCheckbox(value);
                                  // model.notifyListeners();
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Text("Wachlist will be public?",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.whiteColor,
                                    fontFamily: 'InterRegular',
                                    height: 1.5,
                                    fontWeight: FontWeight.w700)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    },
    isScrollControlled: true,
  );
}
