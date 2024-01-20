import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../Data/models/SurveyFullModel.dart';
import '../../../Data/models/SurveyPurposeModel.dart';
import '../../../shared/sizes.dart';
import '../../../utils/CustomLoading.dart';
import '../../../utils/MyImages.dart';
import '../../../utils/MyLanguages.dart';
import 'NewQuestionnaire.dart';
import 'QuestionnaireProvider.dart';

class QuestionnaireTypes extends StatelessWidget {
  final QuestionnaireProvider provider = QuestionnaireProvider();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Image.asset(
              MyImages.app_logo,
              height: 200,
              width: 200,
            ),
            Text(MyLanguageKeys.sloganTitle.toString().tr,style: Theme.of(context).textTheme.headline4,),
            Text(MyLanguageKeys.sloganDesc.toString().tr,style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,),
          ],
        ).marginSymmetric(vertical: MySizes.defaultMargin*2),
        Divider(),
        Expanded(
          child: FutureBuilder<SurveyFullModel>(
              future: provider.checkData(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                if (!snapshot.hasData) return Container();
                List<SurveyPurposeModel> types = snapshot.data!.SurveyPurposes!;
                return snapshot.data!.SurveyPurposes != null
                    ? ListView.builder(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => ChangeNotifierProvider.value(
                                  value: provider,
                                  builder: (context, _) {
                                    return NewQuestionnaire();
                                  }));
                            },
                            child: Card(
                              margin: EdgeInsets.all(MySizes.defaultMargin),
                              child: Center(
                                child: Text(
                                  types[index].Name ?? '',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline6,
                                ).marginAll(MySizes.defaultMargin / 2),
                              ),
                            ),
                          );
                        },
                        itemCount: types.length,
                      )
                    : emptyListWidget(context);
              }),
        ),
      ],
    );
  }
}
