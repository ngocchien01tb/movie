import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie/apiClient/base_client.dart';
import 'package:movie/modules/home/models/movie_model.dart';
import 'package:movie/widgets/custom_text_view.dart';

import '../../../theme/colors.dart';
import '../../../theme/style_text.dart';

class ItemMovieView extends StatelessWidget {
  final Result result;
  const ItemMovieView({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    BaseClient bc = BaseClient();
    String voteAverage = result.voteAverage.toString();
    String beforeDot = voteAverage[0];
    String afterDot = voteAverage[2];

    String urlImage = bc.baseURLImage;

    DateTime dateTime = DateTime.parse(result.releaseDate.toString());
    String formattedYear = DateFormat('yyyy').format(dateTime);
    // print('opppp:  $urlImage${result.posterPath}}');
    final size = MediaQuery.of(context).orientation;
    return Card(
        shadowColor: AppColors.kColorTextBlack,
        elevation: 1,
        margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  urlImage + result.posterPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 5,
                right: 10,
                child: Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: AppColors.colors),
                  ),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(text: beforeDot, style: TextStyleView.textStyle1),
                        const TextSpan(text: '.', style: TextStyleView.textStyle1),
                        TextSpan(text: afterDot, style: TextStyleView.textStyle2)
                      ])),
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextView(
                        textAlign: TextAlign.left,
                        text: formattedYear,
                        color: AppColors.kColorTextWhite,
                        sizeText: 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomTextView(
                        text: result.title,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        color: AppColors.kColorTextWhite,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}
