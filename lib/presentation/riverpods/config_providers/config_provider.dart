import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';

//! Este provider guarda la información de los tamaños disponibles en las pantalla
final maxConstrainsProvider = StateProvider<MaxSizePhone>(
    (ref) => MaxSizePhone(maxWidth: 0, maxHeight: 0));

//! Este provider guarda la configuración de los id de BD para ver si tiene que actualizarse
final configDbProvider =
    StateProvider<Config>((ref) => EmptyEntities().newEmptyConfig());

//! Este provider guarda el dato para indicar si ya se conecto a la BD a traer la información para que no haga este proceso todas las veces que se entre
//! a la pantalla "PrincipalEventScreen".
//! IsLoading = No ha cargado la información.
//! IsLoaded = Ya cargo la información.
final dataPrincipalEventScreenProvider =
    StateProvider<DataState>((ref) => DataState.isLoading);

//! Este provider guarda el dato para indicar si ya se conecto a la BD a traer la información para que no haga este proceso todas las veces que se entre
//! a la pantalla "PrincipalMagazineScreen".
//! IsLoading = No ha cargado la información.
//! IsLoaded = Ya cargo la información.
final dataPrincipalMagazineScreenProvider =
    StateProvider<DataState>((ref) => DataState.isLoading);
