import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:instagram_clone/features/maps/cubit/maps_cubit.dart';

import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text.dart';

class InfoMapsSection extends StatelessWidget {
  const InfoMapsSection({super.key, required this.placemark});

  final Placemark placemark;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MapsCubit>();

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.primaryDark,
              ),
              child: Column(
                children: [
                  Text(
                    '${placemark.street}',
                    style: AppText.text12.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${placemark.subLocality}, ${placemark.locality}, ${placemark.subAdministrativeArea} ${placemark.postalCode}',
                    textAlign: TextAlign.center,
                    style: AppText.text12.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              FloatingActionButton.small(
                onPressed: () => bloc.zoomInMaps(),
                heroTag: 'zoom-in',
                child: const Icon(Icons.add),
              ),
              FloatingActionButton.small(
                onPressed: () => bloc.zoomOutMaps(),
                heroTag: 'zoom-out',
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
