import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:istores_bike_catalog/app/app.router.dart';
import 'package:istores_bike_catalog/app/theme/app_colors.dart';
import 'package:istores_bike_catalog/app/theme/app_icons.dart';
import 'package:istores_bike_catalog/datamodels/bike.dart';
import 'package:istores_bike_catalog/ui/views/home/catalog/bike_list_viewmodel.dart';
import 'package:istores_bike_catalog/ui/widgets/text_widgets.dart';
import 'package:stacked/stacked.dart';

class BikeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BikeListViewModel>.reactive(
        builder: (context, viewModel, child) {
        return (viewModel.isBusy || viewModel.homeService.isLoading)
            ? Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
            : getBikeListView(viewModel);
        },
        viewModelBuilder: () => BikeListViewModel(),
    );
  }

  Widget getBikeListView(BikeListViewModel viewModel) {
    return Expanded(
      child: (viewModel.bikes.isEmpty)? 
          Center(
            child: titleTextWidget(text: 'Sorry, there is not data!!'),
          )
          : Scrollbar(
            child: RefreshIndicator(
              onRefresh: viewModel.fetchData,
              child: ListView.builder(
                  itemCount: viewModel.bikes.length,
                  itemBuilder: (context, index) {
                    var bike = viewModel.bikes[index];
                    return GestureDetector(
                      onTap: () => {
                        viewModel.updateSelectedBike(index),
                        viewModel.navigateTo(Routes.detailView)
                      },
                      child: BikeTile(context, bike),
                    );
                  }
              ),
            )
          ),
    );
  }

  Widget BikeTile(BuildContext context, Bike bike) {
    return Card(
      shadowColor: AppColors.filterChipBackground,
      color: AppColors.filterSelection,
      margin: EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(bike.images[0], height: 200, width: MediaQuery.of(context).size.width, fit: BoxFit.fill,),
          Padding(
            padding: EdgeInsets.all(8.0),
            child:
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleTextWidget(text: bike.name, textColor: Colors.white),
                  subTitleTextWidget(text: '\u0024'+bike.price.toString(), textColor: Colors.white)
                ],
              )
          )
        ],
      ),
    );
  }
}
