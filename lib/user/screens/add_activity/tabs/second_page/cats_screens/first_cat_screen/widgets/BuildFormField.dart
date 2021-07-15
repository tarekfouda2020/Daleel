part of 'SecondPageWidgetsImports.dart';

class BuildFormField extends StatelessWidget {
  final String title;
  final TextInputType? type;
  final TextEditingController controller;
  const BuildFormField({required this.title, this.type, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColors.fillColor,
        border: Border.all(color: MyColors.fillColor)
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 45,
              alignment: Alignment.center,
              child: MyText(title: title, color: MyColors.secondary, size: 10,fontWeight: FontWeight.w600,),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
                )
              ),
              child: TextFormField(
                controller: controller,
                style: GoogleFonts.cairo(fontSize: 14,color: MyColors.black,fontWeight: FontWeight.bold),
                autocorrect: false,
                enableSuggestions: false,
                keyboardType: type??TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(bottom: 10,right: 5,left: 5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

