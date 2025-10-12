part of 'permission_cubit.dart';

class PermissionState extends Equatable {
  final PermissionStatus ubicacion;
  final PermissionStatus ubicacionAlways;
  final PermissionStatus ubicacionWhenInUse;
  final PermissionStatus archivos;

  const PermissionState({
    this.ubicacionAlways = PermissionStatus.denied,
    this.ubicacionWhenInUse = PermissionStatus.denied,
    this.ubicacion = PermissionStatus.denied,
    this.archivos = PermissionStatus.denied,
  });

  bool get ubicacionGranted => ubicacion == PermissionStatus.granted;
  bool get archivosGranted => archivos == PermissionStatus.granted;
  bool get ubicacionAlwaysGranted =>
      ubicacionAlways == PermissionStatus.granted;
  bool get ubicacionWhenInUseGranted =>
      ubicacionWhenInUse == PermissionStatus.granted;

  PermissionState copyWith({
    PermissionStatus? ubicacion,
    PermissionStatus? ubicacionAlways,
    PermissionStatus? ubicacionWhenInUse,
    PermissionStatus? archivos,
  }) {
    return PermissionState(
      ubicacion: ubicacion ?? this.ubicacion,
      ubicacionAlways: ubicacionAlways ?? this.ubicacionAlways,
      ubicacionWhenInUse: ubicacionWhenInUse ?? this.ubicacionWhenInUse,
      archivos: archivos ?? this.archivos,
    );
  }

  @override
  List<Object> get props => [
    ubicacion,
    archivos,
    ubicacionAlways,
    ubicacionWhenInUse,
  ];
}
