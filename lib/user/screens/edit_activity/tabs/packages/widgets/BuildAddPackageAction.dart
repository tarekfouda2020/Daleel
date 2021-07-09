part of 'PackagesWidgetImports.dart';

class BuildAddPackageAction extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> AutoRouter.of(context).push(AddPackageRoute(type: PackageType.package)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 10),
        child: DottedBorder(
          color: MyColors.grey,
          strokeWidth: 1,
          radius: Radius.circular(20),
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Row(
            children: [
              Icon(Icons.add,size: 25,color: Colors.black54,),
              SizedBox(width: 10),
              MyText(
                title: "اضافة باكدج",
                color: Colors.black54,
                size: 10,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }

}

