class ParseDate {
  String parseFechaDia(String fecha) {
    String dia = fecha.substring(6, 8);
    return dia;
  }

  String parseFechaMes(String fecha) {
    String mes = _monthName(int.parse(fecha.substring(4, 6)));

    return mes;
  }

  String parseFechaAnnio(String fecha) {
    String annio = fecha.substring(0, 4);
    return annio;
  }

  String parseFechaCompleta(String fecha) {
    final String fechaToParse;

    String annio = fecha.substring(0, 4);
    String mes = _monthName(int.parse(fecha.substring(4, 6)));
    String dia = fecha.substring(6, 8);

    fechaToParse = '$dia $mes $annio';
    return fechaToParse;
  }

  String _monthName(int month) {
    switch (month) {
      case 1:
        {
          return 'Enero';
        }
      case 2:
        {
          return 'Febrero';
        }
      case 3:
        {
          return 'Marzo';
        }
      case 4:
        {
          return 'Abril';
        }
      case 5:
        {
          return 'Mayo';
        }
      case 6:
        {
          return 'Junio';
        }
      case 7:
        {
          return 'Julio';
        }
      case 8:
        {
          return 'Agosto';
        }
      case 9:
        {
          return 'Septiembre';
        }
      case 10:
        {
          return 'Octubre';
        }
      case 11:
        {
          return 'Noviembre';
        }
      case 12:
        {
          return 'Diciembre';
        }
      default:
        {
          return '';
        }
    }
  }
}
