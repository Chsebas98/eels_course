import 'package:flutter/material.dart';
import 'package:scanner_app/core/models/models.dart';
import 'package:scanner_app/presentation/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.dataService});

  final DataInterface dataService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        title: 'Detalles del Servicio',
        route: '/home',
        hasTheme: true,
      ),
      body: _DetailsController(dataService: dataService),
    );
  }
}

class _DetailsController extends StatelessWidget {
  const _DetailsController({required this.dataService});

  final DataInterface dataService;

  @override
  Widget build(BuildContext context) {
    return _DetailsStructure(
      isNetwork: dataService.image.contains('http'),
      dataService: dataService,
    );
  }
}

class _DetailsStructure extends StatefulWidget {
  const _DetailsStructure({required this.isNetwork, required this.dataService});
  final bool isNetwork;
  final DataInterface dataService;

  @override
  State<_DetailsStructure> createState() => _DetailsStructureState();
}

class _DetailsStructureState extends State<_DetailsStructure> {
  bool _isExpanded = false;
  bool _isOverflowing = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scheduleOverflowCheck();
  }

  @override
  void didUpdateWidget(covariant _DetailsStructure oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.dataService.description != widget.dataService.description) {
      _scheduleOverflowCheck();
    }
  }

  void _scheduleOverflowCheck() {
    // Espera al primer frame para tener tamaños reales (context.size / constraints)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Si conoces el padding horizontal (16), puedes usar el ancho del Scaffold
      final maxWidth =
          (context.size?.width ?? MediaQuery.of(context).size.width) - 32;

      final tp = TextPainter(
        text: TextSpan(
          text: widget.dataService.description,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        maxLines: 4,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: maxWidth);

      final overflow = tp.didExceedMaxLines;
      if (mounted && overflow != _isOverflowing) {
        setState(() => _isOverflowing = overflow);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final availableHeight = size.height - kToolbarHeight;

    return Container(
      height: availableHeight,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(35),
                bottom: Radius.circular(35),
              ),
              child: FadeInImage(
                placeholder: const AssetImage('assets/png/gifLoading.gif'),
                image: widget.isNetwork
                    ? NetworkImage(widget.dataService.image)
                    : AssetImage(widget.dataService.image) as ImageProvider,
                height: size.height * 0.35,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.dataService.title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            widget.dataService.description,
            textAlign: TextAlign.justify,
            maxLines: _isExpanded ? null : 4,
            overflow: _isExpanded
                ? TextOverflow.visible
                : TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          if (_isOverflowing)
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: TextButton(
                onPressed: () => setState(() => _isExpanded = !_isExpanded),
                child: Text(
                  _isExpanded ? "Ver menos" : "Ver más",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),

          Text(
            'Precio: \$${widget.dataService.price}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),

          // const SizedBox(height: 50),
          const Spacer(),
          CustomButtonDefault(
            description: 'Agendar Servicio',
            widthButton: double.infinity,
            colorButton: Colors.deepPurple,
            heightButton: 40,
            hasIcon: false,
            isDisabled: false,
            action: () => Navigator.pushNamed(
              context,
              '/agendar-servicio',
              arguments: widget.dataService,
            ),
          ),
          // const Spacer(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
