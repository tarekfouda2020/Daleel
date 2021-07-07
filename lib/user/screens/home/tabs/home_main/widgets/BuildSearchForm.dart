part of 'HomeMainWidgetsImports.dart';

class BuildSearchForm extends StatelessWidget {
  final HomeMainData homeMainData;

  const BuildSearchForm({required this.homeMainData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            MyText(
                title: "فلتر الحجوزات المتقدم", color: Colors.black54, size: 10),
            BlocBuilder<GenericBloc<FilterModel?>,
                GenericState<FilterModel?>>(
              bloc: homeMainData.filterCubit,
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColors.greyWhite),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<FilterModel>(
                        isExpanded: true,
                        underline: Container(),
                        value: state.data,
                        style: GoogleFonts.cairo(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: MyColors.blackOpacity),
                        hint: MyText(
                          title: "اختر نطاق البحث",
                          color: Colors.black45,
                          size: 10,
                          fontWeight: FontWeight.w600,
                        ),
                        items: homeMainData.allFilters.map((FilterModel value) {
                          return DropdownMenuItem<FilterModel>(
                              value: value,
                              child: MyText(
                                  title: value.name,
                                  color: MyColors.black,
                                  size: 12,
                              ),
                          );
                        }).toList(),
                        onChanged: (FilterModel? value) {
                          homeMainData.filterCubit.onUpdateData(value);
                        },
                      ),
                    ),

                    Visibility(
                      visible: state.data?.key==homeMainData.allFilters[0].key,
                      child: LabelTextField(
                        hint: "ادخل اسم النشاط هنا",
                        controller: homeMainData.allFilters[0].value,
                        validate: (value)=> value!.noValidate(),
                        type: TextInputType.name,
                        action: TextInputAction.search,
                        margin: EdgeInsets.only(top: 10),
                        borderColor: MyColors.greyWhite,
                      ),
                    ),
                    Visibility(
                      visible: state.data?.key==homeMainData.allFilters[1].key,
                      child: LabelTextField(
                        hint: "ادخل جوال العميل هنا",
                        controller: homeMainData.allFilters[1].value,
                        validate: (value)=> value!.noValidate(),
                        type: TextInputType.number,
                        action: TextInputAction.search,
                        margin: EdgeInsets.only(top: 10),
                        borderColor: MyColors.greyWhite,
                      ),
                    ),
                    Visibility(
                      visible: state.data?.key==homeMainData.allFilters[2].key,
                      child: LabelTextField(
                        hint: "ادخل اسم العميل هنا",
                        controller: homeMainData.allFilters[2].value,
                        validate: (value)=> value!.noValidate(),
                        type: TextInputType.name,
                        action: TextInputAction.search,
                        margin: EdgeInsets.only(top: 10),
                        borderColor: MyColors.greyWhite,
                      ),
                    ),
                    Visibility(
                      visible: state.data?.key==homeMainData.allFilters[3].key,
                      child: Row(
                        children: [
                          Flexible(
                            child: InkWellTextField(
                              hint: "التاريخ من",
                              controller: homeMainData.allFilters[3].value,
                              validate: (value)=> value!.noValidate(),
                              type: TextInputType.name,
                              margin: EdgeInsets.only(top: 10),
                              borderColor: MyColors.greyWhite,
                              onTab: ()=> homeMainData.setFromDate(context),
                            ),
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: InkWellTextField(
                              hint: "التاريخ الي",
                              controller: homeMainData.allFilters[3].value2!,
                              validate: (value)=> value!.noValidate(),
                              type: TextInputType.name,
                              margin: EdgeInsets.only(top: 10),
                              borderColor: MyColors.greyWhite,
                              onTab: ()=> homeMainData.setToDate(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: state.data?.key==homeMainData.allFilters[4].key,
                      child: LabelTextField(
                        hint: "ادخل السعر هنا",
                        controller: homeMainData.allFilters[4].value,
                        validate: (value)=> value!.noValidate(),
                        type: TextInputType.number,
                        margin: EdgeInsets.only(top: 10),
                        action: TextInputAction.search,
                        borderColor: MyColors.greyWhite,
                      ),
                    ),

                    DefaultButton(
                      title: "بحث",
                      onTap: ()=> homeMainData.filterOrderByFilter(context),
                    ),

                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
