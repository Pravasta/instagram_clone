import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/init_camera/init_camera_bloc.dart';
import '../repository/camera_repository.dart';
import 'section/camera_bottom_section.dart';
import 'section/camera_page_section.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key, required this.cameras});

  final List<CameraDescription> cameras;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitCameraBloc(context.read<CameraRepository>())
        ..add(OnCameraIntialized(
          cameraDescription: cameras.first,
        )),
      child: CameraView(cameras: cameras),
    );
  }
}

class CameraView extends StatefulWidget {
  const CameraView({super.key, required this.cameras});

  final List<CameraDescription> cameras;

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with WidgetsBindingObserver {
  InitCameraBloc? _cameraBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _cameraBloc = context.read<InitCameraBloc>();
    _cameraBloc!.add(OnCameraIntialized(
        cameraDescription: const CameraDescription(
      name: 'Back Camera',
      lensDirection: CameraLensDirection.back,
      sensorOrientation: 0,
    )));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_cameraBloc != null) {
      if (state == AppLifecycleState.inactive) {
        _cameraBloc!.add(OnDisposeCamera());
      } else if (state == AppLifecycleState.resumed) {
        _cameraBloc!.add(OnCameraIntialized(
          cameraDescription: widget.cameras.first,
        ));
      }
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    _cameraBloc?.add(OnDisposeCamera());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Column(
            children: [
              CameraPageSection(),
              CameraBottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}
