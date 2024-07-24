import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:instagram_clone/common/routes/navigation.dart';
import 'package:instagram_clone/constant/app_colors.dart';
import 'package:instagram_clone/constant/app_text.dart';
import 'package:instagram_clone/features/maps/cubit/maps_cubit.dart';
import 'package:instagram_clone/features/maps/view/section/info_maps_section.dart';
import 'package:instagram_clone/utils/maps/maps_utils.dart';

class MapsPickerPage extends StatefulWidget {
  const MapsPickerPage({super.key});

  @override
  State<MapsPickerPage> createState() => _MapsPickerPageState();
}

class _MapsPickerPageState extends State<MapsPickerPage> {
  @override
  void initState() {
    super.initState();
    context.read<MapsCubit>().getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MapsCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Location',
          style: AppText.text16.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: BlocBuilder<MapsCubit, MapsState>(
          builder: (context, state) {
            if (state.status == MapStatusState.loading) {
              return const CircularProgressIndicator();
            }
            if (state.status == MapStatusState.error) {
              return Text(state.message);
            }
            if (state.status == MapStatusState.success) {
              return Stack(
                children: [
                  GoogleMap(
                    zoomControlsEnabled: false,
                    mapToolbarEnabled: false,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: state.latLng!,
                      zoom: 18,
                    ),
                    markers: state.markers,
                    onMapCreated: (controller) {
                      bloc.setController(controller);
                    },
                    onTap: (LatLng latLng) {
                      bloc.setLocation(latLng);
                      state.controller!.animateCamera(
                        CameraUpdate.newLatLng(latLng),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 16,
                    child: InfoMapsSection(
                      placemark: state.placemark!,
                    ),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: FloatingActionButton.small(
                        heroTag: 'current-location',
                        onPressed: () => bloc.getCurrentLocation(),
                        child: const Icon(Icons.my_location),
                      )),
                  Positioned(
                      top: MediaQuery.of(context).size.height * 2 / 3 + 15,
                      right: 3,
                      child: FloatingActionButton(
                        heroTag: 'done',
                        backgroundColor: AppColors.blueColor,
                        child: const Icon(Icons.check),
                        onPressed: () {
                          Navigator.of(context).pop({
                            'lat': state.latLng!.latitude,
                            'lon': state.latLng!.longitude,
                            'placeMark': state.placemark!.street,
                          });
                        },
                      )),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
