import 'package:bloc_example/generated/l10n.dart';
import 'package:bloc_example/global/widget/drop_down.dart';
import 'package:bloc_example/global/widget/text_field.dart';
import 'package:bloc_example/page/sign_up_form/bloc/sign_up_form.dart';
import 'package:bloc_example/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({Key? key}) : super(key: key);

  @override
  _SignUpFormPageState createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
  late SignUpFormBloc _bloc;

  @override
  void initState() {
    _bloc = SignUpFormBloc(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: BlocBuilder<SignUpFormBloc, SignUpFormState>(
        builder: (context, state) {

          return Scaffold(
            appBar: AppBar(
              title: Text(
                S.of(context).sign_up_form,
              ),
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    buildTextField(_bloc.firstNameController,
                        label: S.of(context).first_name),
                    SizedBox(height: 20),
                    buildTextField(_bloc.lastNameController,
                        label: S.of(context).last_name),
                    SizedBox(height: 20),
                    buildDateTime(),
                    SizedBox(height: 20),
                    buildDropDownSelectItem("", ["Việt Nam", "Lào", "Sweden"],
                        S.of(context).country, (String? value) {}),
                    SizedBox(height: 20),
                    buildDropDownSelectItem("", ["Việt Nam", "Lào", "Sweden"],
                        S.of(context).city, (String? value) {}),
                    SizedBox(height: 20),
                    buildTextField(_bloc.lastNameController,
                        label: S.of(context).player),
                    SizedBox(height: 20),
                    buildPhoto(),
                    SizedBox(height: 20),
                    buildSaveButton()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildDateTime() {
    return GestureDetector(
      onTap: () {
        DatePicker.showDatePicker(context,
            theme: DatePickerTheme(backgroundColor: AppColor.white),
            showTitleActions: true,
            minTime: DateTime(2018, 3, 5),
            maxTime: DateTime.now(), onChanged: (date) {
          print('change $date');
        }, onConfirm: (date) {
          // _bloc.add(UpdateDateTime(date));
        }, currentTime: DateTime.now(), locale: LocaleType.en);
      },
      child: buildTextField(_bloc.firstNameController,
          label: S.of(context).birthday,
          enable: false,
          suffixIcon: Icon(
            Icons.calendar_today_outlined,
            color: AppColor.grey_500,
          )),
    );
  }

  Widget buildCountry() {
    return buildTextField(_bloc.firstNameController,
        label: S.of(context).country,
        enable: false,
        suffixIcon: Icon(
          Icons.arrow_drop_down,
          color: AppColor.grey_500,
        ));
  }

  Widget buildPhoto() {
    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).face_image,
                style: TextStyle(color: AppColor.grey_500),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.grey_700,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: (MediaQuery.of(context).size.width - 50) / 2,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_a_photo_outlined,
                          color: AppColor.grey_500),
                      SizedBox(height: 10),
                      Text(
                        S.of(context).add_photo,
                        style: TextStyle(color: AppColor.grey_500),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).body_image,
                style: TextStyle(color: AppColor.grey_500),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.grey_700,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: (MediaQuery.of(context).size.width - 50) / 2,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_a_photo_outlined,
                          color: AppColor.grey_500),
                      SizedBox(height: 10),
                      Text(
                        S.of(context).add_photo,
                        style: TextStyle(color: AppColor.grey_500),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSaveButton() {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Text(
        S.of(context).next,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      decoration: BoxDecoration(
        color: AppColor.blue,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
