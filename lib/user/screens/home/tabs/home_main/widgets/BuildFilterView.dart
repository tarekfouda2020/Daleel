part of 'HomeMainWidgetsImports.dart';


class BuildFilterView extends StatelessWidget {
  final HomeMainData homeMainData;

  const BuildFilterView({required this.homeMainData});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
        color: MyColors.bg,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: IconTextFiled(
              hint: "ابحث برقم الحجز",
              filledColor: Colors.transparent,
              enableColor: Colors.transparent,
              prefixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    Res.search,
                    color: MyColors.grey,
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
              validate: (value)=>value!.noValidate(),
              submit: (value)=>homeMainData.onNumberSearch(value, context),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: ()=> homeMainData.showFilterDialog(context,homeMainData),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Res.filter,
                    color: MyColors.grey,
                    width: 15,
                    height: 15,
                    alignment: Alignment.center,
                  ),
                  SizedBox(width: 10),
                  MyText(title: "فلتر الحجوزات", color: Colors.black54, size: 8,fontWeight: FontWeight.w600,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

