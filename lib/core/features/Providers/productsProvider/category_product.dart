import 'package:cosmeticstest/core/constant/colors.dart';
import 'package:cosmeticstest/core/features/Providers/productsProvider/ProductProvider.dart';
import 'package:cosmeticstest/core/models/Products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constant/AppText.dart';
import '../../../custom/CustomAppBar.dart';
import '../../../custom/CustomButton.dart';
import '../../../custom/CustomContainer.dart';
import '../../../../domain/entities/enums/provider_enum.dart';
import '../../../../widgets/radio_buttom.dart';
import '../../../../presentation/pages/NavigationBarScreen/CategoryDetails/subProductPage.dart';

class CategoryProduct extends StatefulWidget{
  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  final TextEditingController controller = TextEditingController();
  late ProductProvider  productProvider = Provider.of<ProductProvider>(context, listen: false) ;
  ErrorType _currentState = ErrorType.dataLoading;

  int selectedValue = 1;

  @override
  void initState() {
    super.initState();
    productProvider.getDate();
    loadData();

  }
  String getErrorMessage(ErrorType errorType) {
    switch (errorType) {
      case ErrorType.showData:
        return "Data found";

      case ErrorType.dataNotFound:
        return "Data not found";

      case ErrorType.dataLoading:
        return "Data Loading";

      case ErrorType.pageError:
        return "page error";

      case ErrorType.networkProblem:
        return "Network problem";

      default:
        return "An error occurred";
    }
  }

  void loadData() {
    setState(() {
      _currentState = ErrorType.dataLoading;
    });
    // Simulate asynchronous data loading
    Future.delayed(Duration(seconds: 3), () {
      // Replace this with your actual data loading logic
      bool dataLoadedSuccessfully = true;

      if (dataLoadedSuccessfully) {
        setState(() {
          _currentState = ErrorType.showData;
        });
      } else {
        setState(() {
          _currentState = ErrorType.dataNotFound;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final productList = productProvider.items;

    return Scaffold(
      appBar: CustomAppBar(AppText.homefurniture),
      backgroundColor: AppColors.white,
      body : Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CustomFilterBtn(
                    onPressed: (){
                      return showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return
                              RadioBottomSheetWidget(AppText.order_products);
                          });
                    }, prefixIcon: Icon(Icons.filter_alt_outlined),

                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                      width: 300,
                      height: 50,
                      child: CustomSearchBar(controller: controller)),
                ],
              ),
            ),
            SizedBox(height: 20,),
             Visibility(
              visible: _currentState != ErrorType.dataLoading,
              replacement: CircularProgressIndicator(),
              child:  _buildContent(),
            )
          ],
        ),
    );
  }
  Widget _buildContent() {
    late Widget content;
    late ProductProvider  productProvider = Provider.of<ProductProvider>(context, listen: false) ;
    final productList = productProvider.items;
    switch (_currentState) {
      case ErrorType.dataLoading:
        content = Text('Loading...');
        break;
      case ErrorType.showData:
        content = Expanded(
          child: GridView.builder
            (gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // Number of columns in the grid
            mainAxisSpacing: 15.0, // Spacing between rows
            crossAxisSpacing: 15.0, // Spacing between columns
          ),
            itemCount: productList.length,
            itemBuilder: (BuildContext context, int index) {
              final product = productList[index];
              return
                GestureDetector(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => subProductPage(),
                    ),
                  );
                },child: CustomProductItem(productList[index]as Product,200,320));
            },),
        );
        break;
      case ErrorType.dataNotFound:
        content = Text('Error Loading Data');
        break;
    }
    return content;
  }
}
