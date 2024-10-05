import 'package:flutter/material.dart';
import 'package:mincha/utils/appTheme.dart';
import 'package:mincha/utils/navigation_service.dart';

class ProprieteWidget extends StatelessWidget {
  const ProprieteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.color.whithColor,
        boxShadow: [
          BoxShadow(),
        ],
      ),
      width: width(context) - 60,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                //  margin: const EdgeInsets.all(10),
                width: width(context) - 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(AppTheme.asset.maisonImage1),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.color.whithColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: Text(
                      'Villa',
                      style: TextStyle(color: AppTheme.color.primaryColor),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppTheme.color.whithColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: AppTheme.color.primaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Maison 2 chambres salon',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppTheme.color.secondaryColor),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text('4.9')
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Colors.grey,
                    ),
                    Text(
                      'Abidjan, Cocody',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.bedroom_child_rounded,
                                color: Colors.grey),
                            SizedBox(
                              width: 5,
                            ),
                            Text('3')
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            Icon(Icons.bathtub, color: Colors.grey),
                            SizedBox(
                              width: 5,
                            ),
                            Text('3')
                          ],
                        )
                      ],
                    ),
                    Text(
                      '90 000 FCFA',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppTheme.color.primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
