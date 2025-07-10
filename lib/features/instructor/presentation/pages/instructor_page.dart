import 'dart:developer';

import 'package:clean_arch_app/core/utilities/constant.dart';
import 'package:clean_arch_app/core/utilities/shared_prefrences_helper.dart';
import 'package:clean_arch_app/features/auth/domain/entities/user_entity.dart';
import 'package:clean_arch_app/features/instructor/presentation/provider/instructor_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InstructorPage extends StatefulWidget {
  const InstructorPage({super.key});

  @override
  State<InstructorPage> createState() => _InstructorPageState();
}

class _InstructorPageState extends State<InstructorPage> {
  late InstructorProvider instructorProvider;
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    instructorProvider =
        Provider.of<InstructorProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      instructorProvider.getCourses(context);
      instructorProvider.getPeriods(context, filterDate: "2025-07-03");
      dateController.text = instructorProvider.selectedDate ?? "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        instructorProvider.getPeriods(context, filterDate: "2025-07-03");
      },
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Consumer<InstructorProvider>(
            builder: (context, provider, child) {
              return provider.isLoading || provider.isPeriodsLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.darkBlue,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.11),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: AppColors.whiteColor,
                                    ),
                                    Text(
                                      "TAT Attendance",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.whiteColor,
                                        decoration: TextDecoration.none,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: MediaQuery.of(context).size.height * 0.17,
                            bottom: 0,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 25),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextField(
                                            onTap: () async {
                                              final picked = await showDatePicker(
                                                  context: context,
                                                  firstDate: DateTime(2025),
                                                  lastDate: DateTime(2026));
                                              if (picked != null) {
                                                String formattedDate =
                                                    "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                                                dateController.text =
                                                    formattedDate;
                                                instructorProvider
                                                    .setSelectedDate(
                                                        formattedDate);
                                              }
                                            },
                                            readOnly: true,
                                            controller: dateController,
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.darkBlue,
                                            ),
                                            textAlign: TextAlign.center,
                                            textAlignVertical:
                                                TextAlignVertical.center,
                                            decoration: InputDecoration(
                                              hintText: "Select Date",
                                              contentPadding: EdgeInsets.zero,
                                              hintStyle: GoogleFonts.inter(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.darkBlue,
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: AppColors.darkBlue,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: AppColors.darkBlue,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  color: AppColors.darkBlue,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 220,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: AppColors.darkBlue,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: DropdownButton<String>(
                                            value: provider.selectedCourseId,
                                            hint: Text(
                                              "Select Course",
                                              style: GoogleFonts.inter(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                            menuMaxHeight: 200,
                                            isExpanded: true,
                                            underline: Container(),
                                            dropdownColor: AppColors.whiteColor,
                                            style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontSize: 16,
                                            ),
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: AppColors.whiteColor,
                                            ),
                                            items: provider
                                                .courses?.availableCourses
                                                ?.map((e) =>
                                                    DropdownMenuItem<String>(
                                                      value: e.id,
                                                      child: Text(
                                                        e.name!,
                                                        style: GoogleFonts.inter(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: AppColors
                                                              .blackColor,
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            selectedItemBuilder: (context) {
                                              return provider
                                                      .courses?.availableCourses
                                                      ?.map((e) => Center(
                                                            child: Text(
                                                              e.name!,
                                                              style: GoogleFonts.inter(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: AppColors
                                                                      .whiteColor),
                                                            ),
                                                          ))
                                                      .toList() ??
                                                  [];
                                            },
                                            onChanged: (String? value) {
                                              provider
                                                  .setSelectedCourseId(value!);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                      height: 50,
                                      width: MediaQuery.of(context).size.width,
                                      color: AppColors.dialogColor,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "All Periods",
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.whiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount:
                                            provider.periods?.periods?.length ??
                                                0,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin:
                                                const EdgeInsets.only(bottom: 10),
                                            constraints: const BoxConstraints(
                                              minHeight: 102,
                                              maxHeight: 102,
                                            ),
                                            width:
                                                MediaQuery.of(context).size.width,
                                            decoration: BoxDecoration(
                                              color: AppColors.whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: AppColors.borderColor2,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: "Course Name: ",
                                                          style:
                                                              GoogleFonts.inter(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .blackColor,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: provider
                                                                  .periods
                                                                  ?.periods?[
                                                                      index]
                                                                  .courseName ??
                                                              "",
                                                          style:
                                                              GoogleFonts.inter(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors
                                                                .blackColor,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: "Chapter Name: ",
                                                          style:
                                                              GoogleFonts.inter(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: AppColors
                                                                .blackColor,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: provider
                                                                  .periods
                                                                  ?.periods?[
                                                                      index]
                                                                  .chapterName ??
                                                              "",
                                                          style:
                                                              GoogleFonts.inter(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors
                                                                .blackColor,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
