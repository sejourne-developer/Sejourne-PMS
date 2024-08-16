import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/layouts/list_layout.dart';
import '../../../../common/widgets/layouts/profile_features_item_list.dart';
import '../../../../data/services/exporter.dart';
import '../../../../utils/popups/profile_popups/reports/statement_popup.dart';

class Reports extends StatelessWidget {
  const Reports({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      "Expense",
      "Commission",
      "Remittance",
      "Owner Payouts",
      "Statements",
    ];
    List<String> subTitle = [
      "Expense summary or details itemized expenses report.",
      "Commission summary or details itemized commission.",
      "Owner remittance summary or details itemized remittance.",
      "The periodic (eg. monthly) reports you send to the owner, showing the owner's revenue and expenses.",
      "Statement booking and expenses line items that were remitted with a statement.",
    ];
    List<String> icons = [
      TImage.expenseIcon,
      TImage.commissionIcon,
      TImage.remittanceIcon,
      TImage.ownersIcon,
      TImage.statementsIcon,
    ];
    return Scaffold(
      body: BackgroundImageContainer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TAppBar(
                leadingIcon: TImage.backArrow,
                title: Text("Reports"),
              ),
              ListLayout(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: TSizes.sm, vertical: TSizes.sm),
                  separatorHeight: TSizes.md,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: ()=>index==title.length-1?showDialog(
                        context: context,
                        builder: (_)=>const StatementPopup()
                    ):null,
                    child: ProfileFeaturesItemList(
                          showEditButton: false,
                          isDottedBorder: true,
                          isSlide:index==title.length-1 ? false: true,
                          icon: icons[index],
                          margin: EdgeInsets.zero,
                          title: title[index],
                          subTitle: subTitle[index],
                        ),
                  ),
                  itemCount: title.length),
            ],
          ),
        ),
      ),
    );
  }
}
