import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mozart_flutter_app/features/admin/admin_home_layout.dart';
import 'package:mozart_flutter_app/features/admin/sql_connection/managers/sql_cubit/sql_cubit.dart';
import 'package:mozart_flutter_app/features/admin/sql_connection/presentation/widgets/custom_time/custom_time.dart';
import 'package:mozart_flutter_app/utils/custom_widgets/custom_botton.dart';
import 'package:mozart_flutter_app/utils/styles/colors.dart';
import 'package:mozart_flutter_app/utils/styles/fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChoiceScreenAfterSQLConnection extends StatefulWidget {
   ChoiceScreenAfterSQLConnection({required this.user, required this.password, required this.server, required this.database});
  String user;
  String password;
  String server;
  String database;

  @override
  State<ChoiceScreenAfterSQLConnection> createState() =>
      _ChoiceScreenAfterSQLConnectionState();
}

class _ChoiceScreenAfterSQLConnectionState
    extends State<ChoiceScreenAfterSQLConnection> {
  String? _dropDownValue1 = 'once';
  String? _dropDownValue2 = 'now';
  String? _dropDownValue3 = 'Hours';
  String? _dropDownValue4 = '1';
  String? _dropDownValue5 = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          'Schedule Synchronization',
          style: AppFonts.titleScreen.copyWith(height: 0),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => SqlCubit(),
        child: BlocConsumer<SqlCubit, SqlState>(
          listener: (context, state) {},
          builder: (context, state) {
            var sqlCubit = SqlCubit.get(context);

            return Directionality(
              textDirection: TextDirection.ltr,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      DropdownButton(
                        hint: _dropDownValue1 == null
                            ? Text(
                          'أختار من القائمة',
                          style: GoogleFonts.cairo(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                            : Text(
                          _dropDownValue1!,
                          style: GoogleFonts.cairo(
                              color: AppColors.primaryColor),
                        ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: GoogleFonts.cairo(color: AppColors.primaryColor),
                        items: ['Daily','Weekly','once'].map(
                              (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                                () {
                              _dropDownValue1 = val;
                            },
                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                      DropdownButton(
                        hint: _dropDownValue2 == null
                            ? Text(
                          'One Time',
                          style: GoogleFonts.cairo(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                            : Text(
                          _dropDownValue2!,
                          style: GoogleFonts.cairo(
                              color: AppColors.primaryColor),
                        ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: GoogleFonts.cairo(color: AppColors.primaryColor),
                        items: ['One Time', 'Specific'].map(
                              (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                                () {
                              _dropDownValue2 = val;
                            },
                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                      _dropDownValue2 == 'Specific'
                          ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Start at',
                                style: GoogleFonts.cairo(
                                    fontSize: 16.sp, color: Colors.black)),
                            SizedBox(width: 25.w),
                            CustomTimeInBottomSheet(),
                          ])
                          : Container(),
                      _dropDownValue2 == 'Specific'
                          ? const Divider()
                          : Container(),
                      _dropDownValue2 == 'Specific'
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('End at',
                              style: GoogleFonts.cairo(
                                  fontSize: 16.sp, color: Colors.black)),
                          SizedBox(width: 25.w),
                          CustomTimeInBottomSheet(),
                        ],
                      )
                          : Container(),

                      _dropDownValue2 == 'Specific'
                          ? Row(
                        children: [
                          Text('Chech from options :-',
                              style: GoogleFonts.cairo(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline)),
                        ],
                      )
                          : Container(),
                      SizedBox(height: 20.h),

                      _dropDownValue2 == 'Specific'
                          ? DropdownButton(
                        hint: _dropDownValue3 == null
                            ? Text(
                          'أختار من القائمة',
                          style: GoogleFonts.cairo(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                            : Text(
                          _dropDownValue3!,
                          style: GoogleFonts.cairo(
                              color: AppColors.primaryColor),
                        ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: GoogleFonts.cairo(
                            color: AppColors.primaryColor),
                        items: ['Hours', 'Minutes'].map(
                              (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                                () {
                              _dropDownValue3 = val;
                            },
                          );
                        },
                      )
                          : Container(),

                      _dropDownValue2 == 'Specific'
                          ? _dropDownValue3 == 'Hours'
                          ? DropdownButton(
                        hint: _dropDownValue4 == null
                            ? Text(
                          'أختار من القائمة',
                          style: GoogleFonts.cairo(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                            : Text(
                          _dropDownValue4!,
                          style: GoogleFonts.cairo(
                              color: AppColors.primaryColor),
                        ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: GoogleFonts.cairo(
                            color: AppColors.primaryColor),
                        items: List.generate(
                            12, (index) => (index + 1).toString()).map(
                              (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(() {
                            _dropDownValue4 = val;
                          });
                        },
                      )
                          : DropdownButton(
                        hint: _dropDownValue5 == null
                            ? Text(
                          'أختار من القائمة',
                          style: GoogleFonts.cairo(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                            : Text(
                          _dropDownValue5!,
                          style: GoogleFonts.cairo(
                              color: AppColors.primaryColor),
                        ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: GoogleFonts.cairo(
                            color: AppColors.primaryColor),
                        items: List.generate(
                            59, (index) => (index + 1).toString()).map(
                              (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(() {
                            _dropDownValue5 = val;
                          });
                        },
                      )
                          : Container(),

                      _dropDownValue2 == 'One Time'
                          ? CustomTimeInBottomSheet()
                          : Container(),

                      SizedBox(height: 20.h),

                      /// Button
                      CustomButtonWidget(
                        onPressed: () {

                          sqlCubit.sqlFunction(
                              user: widget.user,
                              password: widget.password,
                              server: widget.server,
                              database: widget.database,
                              syncMethod: _dropDownValue1.toString(),
                              syncTime: _dropDownValue2=='now'?DateTime.now().toString():DateTime.now().toString(),
                              wantSync: true);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminHomeLayout()));
                          print(_dropDownValue1.toString());
                          print(_dropDownValue2.toString());
                          print(_dropDownValue3);
                          print(_dropDownValue4);
                          print(_dropDownValue5);

                        },
                        borderRadius: 10.r,
                        text: AppLocalizations.of(context)!.save,
                        width: 335.w,
                        height: 49.h,
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
