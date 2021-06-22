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
            BlocBuilder<GenericBloc<DropdownModel?>,
                GenericState<DropdownModel?>>(
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
                      child: DropdownButton<DropdownModel>(
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
                        items: homeMainData.data.map((DropdownModel value) {
                          return DropdownMenuItem<DropdownModel>(
                              value: value,
                              child: MyText(
                                  title: value.name,
                                  color: MyColors.black,
                                  size: 12,
                              ),
                          );
                        }).toList(),
                        onChanged: (DropdownModel? value) =>
                            homeMainData.filterCubit.onUpdateData(value),
                      ),
                    ),

                    Visibility(
                      visible: state.data?.id==1,
                      child: LabelTextField(
                        hint: "ادخل اسم النشاط هنا",
                        controller: homeMainData.activity,
                        validate: (value)=> value!.noValidate(),
                        type: TextInputType.name,
                        action: TextInputAction.search,
                        margin: EdgeInsets.only(top: 10),
                        borderColor: MyColors.greyWhite,
                      ),
                    ),
                    Visibility(
                      visible: state.data?.id==2,
                      child: LabelTextField(
                        hint: "ادخل جوال العميل هنا",
                        controller: homeMainData.phone,
                        validate: (value)=> value!.noValidate(),
                        type: TextInputType.number,
                        action: TextInputAction.search,
                        margin: EdgeInsets.only(top: 10),
                        borderColor: MyColors.greyWhite,
                      ),
                    ),
                    Visibility(
                      visible: state.data?.id==3,
                      child: LabelTextField(
                        hint: "ادخل اسم العميل هنا",
                        controller: homeMainData.name,
                        validate: (value)=> value!.noValidate(),
                        type: TextInputType.name,
                        action: TextInputAction.search,
                        margin: EdgeInsets.only(top: 10),
                        borderColor: MyColors.greyWhite,
                      ),
                    ),
                    Visibility(
                      visible: state.data?.id==4,
                      child: InkWellTextField(
                        hint: "ادخل التاريخ هنا",
                        controller: homeMainData.date,
                        validate: (value)=> value!.noValidate(),
                        type: TextInputType.name,
                        margin: EdgeInsets.only(top: 10),
                        icon: Icon(Icons.date_range_outlined,size: 20,),
                        borderColor: MyColors.greyWhite,
                        onTab: (){},
                      ),
                    ),
                    Visibility(
                      visible: state.data?.id==5,
                      child: LabelTextField(
                        hint: "ادخل السعر هنا",
                        controller: homeMainData.price,
                        validate: (value)=> value!.noValidate(),
                        type: TextInputType.number,
                        margin: EdgeInsets.only(top: 10),
                        action: TextInputAction.search,
                        borderColor: MyColors.greyWhite,
                      ),
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
