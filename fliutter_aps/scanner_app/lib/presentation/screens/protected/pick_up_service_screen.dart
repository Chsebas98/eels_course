import 'package:flutter/material.dart';
import 'package:scanner_app/core/models/models.dart';
import 'package:scanner_app/core/utils/utils.dart';
import 'package:scanner_app/presentation/widgets/widgets.dart';

class PickUpServiceScreen extends StatelessWidget {
  const PickUpServiceScreen({super.key, required this.dataService});
  final DataInterface dataService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        title: 'Agendar Servicio',
        route: '/details',
        arguments: dataService,
      ),
      body: PickUpController(dataService: dataService),
    );
  }
}

class PickUpController extends StatelessWidget {
  const PickUpController({super.key, required this.dataService});

  final DataInterface dataService;

  @override
  Widget build(BuildContext context) {
    return _PickUpStructure(dataService: dataService);
  }
}

class _PickUpStructure extends StatefulWidget {
  const _PickUpStructure({required this.dataService});

  final DataInterface dataService;

  @override
  State<_PickUpStructure> createState() => _PickUpStructureState();
}

class _PickUpStructureState extends State<_PickUpStructure> {
  final GlobalKey<FormState> _buyServiceFormKey = GlobalKey<FormState>();
  bool _isChecked = false;
  bool _showErrorChecked = false;
  String names = '';
  String address = '';
  String date = '';
  String message = '';

  void _toogleCheck() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _buyServiceFormKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CustomInput(
                placeHolder: 'Ingresa tu nombre y apellido',
                label: 'Nombre y apellido',
                onChanged: (value) => setState(() {
                  names = value;
                }),
                validator: (value) {
                  final nameValidator = Formvalidators.generalValidations(
                    names,
                  );
                  return nameValidator.isValid ? null : nameValidator.message;
                },
              ),
              SizedBox(height: 20),
              CustomInput(
                placeHolder: 'Ingresa tu dirección',
                label: 'Dirección',
                onChanged: (value) => setState(() {
                  address = value;
                }),
                validator: (value) {
                  final addressValidator = Formvalidators.generalValidations(
                    address,
                  );
                  return addressValidator.isValid
                      ? null
                      : addressValidator.message;
                },
              ),
              SizedBox(height: 20),
              CustomInput(
                placeHolder: 'Selecciona la fecha y hora',
                label: 'Fecha y Hora',
                onChanged: (value) => setState(() {
                  date = value;
                }),
                validator: (value) {
                  final dateValidator = Formvalidators.generalValidations(date);
                  return dateValidator.isValid ? null : dateValidator.message;
                },
              ),
              SizedBox(height: 20),
              CustomInput(
                placeHolder: 'Escribe un mensaje (opcional)',
                label: 'Mensaje',
                maxLines: 5,
                onChanged: (value) => setState(() {
                  message = value;
                }),
                validator: (value) {
                  final msmValidate = Formvalidators.generalValidations(
                    message,
                  );
                  return msmValidate.isValid ? null : msmValidate.message;
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) => _toogleCheck(),
                  ),
                  Text(
                    'Al crear un servicio, aceptas nuestros términos y\ncondiciones',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              if (_showErrorChecked)
                Text(
                  'Es necesario aceptar los términos y condiciones',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              const Spacer(),
              CustomButtonDefault(
                description: 'Agendar Servicio',
                widthButton: double.infinity,
                heightButton: 40,
                hasIcon: false,
                isDisabled: false,
                colorButton: Colors.deepPurple,
                action: () {
                  if (_buyServiceFormKey.currentState!.validate() &&
                      _isChecked) {
                    Navigator.pushNamed(context, '/home');
                  } else {
                    if (!_isChecked) {
                      setState(() {
                        _showErrorChecked = true;
                      });
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
