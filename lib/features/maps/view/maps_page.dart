import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:instagram_clone/constant/app_colors.dart';
import 'package:instagram_clone/constant/app_text.dart';
import 'package:instagram_clone/features/maps/cubit/maps_cubit.dart';

import '../../../core/core.dart';
import 'section/info_maps_section.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key, required this.location});

  final Map<String, dynamic> location;

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  void initState() {
    super.initState();
    context.read<MapsCubit>().loadMarkers(
          widget.location['lat'],
          widget.location['lon'],
        );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MapsCubit>();
    final text = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          text!.see_maps,
          style: AppText.text16.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<MapsCubit, MapsState>(
        builder: (context, state) {
          if (state.status == MapStatusState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == MapStatusState.error) {
            return Center(child: Text(state.message));
          }
          if (state.status == MapStatusState.success) {
            final placemark = state.placemark;
            return Center(
              child: Stack(
                children: [
                  GoogleMap(
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                    mapToolbarEnabled: false,
                    markers: state.markers,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          widget.location['lat'], widget.location['lon']),
                      zoom: 18,
                    ),
                    onMapCreated: (controller) {
                      bloc.setController(controller);
                    },
                  ),
                  Positioned(
                    bottom: 16,
                    child: InfoMapsSection(
                      placemark: placemark!,
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
