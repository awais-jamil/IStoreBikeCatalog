import 'package:carousel_images/carousel_images.dart';
import 'package:flutter/material.dart';
import 'package:istores_bike_catalog/app/theme/app_colors.dart';
import 'package:istores_bike_catalog/ui/views/detail/details_viewmodel.dart';
import 'package:istores_bike_catalog/ui/widgets/text_widgets.dart';
import 'package:stacked/stacked.dart';

class DetailView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () => {
                    model.navigateBack()
                  },
                  child: Icon(Icons.arrow_back),
                )
              ),
              CarouselImages(
                listImages: model.selectecBike.images,
                height: 300.0,
                onTap: (index){
                  print('Tapped on page $index');
                },
              ),

              Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headingTextWidgetFontSize30(text: model.selectecBike.name),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        headingTextWidget(text: 'Category: '),
                        headingTextWidget(text: model.selectecBike.category, textColor: AppColors.filterChipText),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        headingTextWidget(text: 'Frame Size: '),
                        headingTextWidget(text: model.selectecBike.frameSize, textColor: AppColors.filterChipText),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        headingTextWidget(text: 'Price: '),
                        headingTextWidget(text: '\u0024'+model.selectecBike.price.toString(), textColor: AppColors.filterChipText),
                      ],
                    ),
                  ],
                ),
              )
            ]
          )
        )
      ),
      viewModelBuilder: () => DetailViewModel(),
    );
  }
}
