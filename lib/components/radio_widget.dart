import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'radio_model.dart';
export 'radio_model.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    this.parameter4,
    this.parameter5,
    this.parameter6,
  });

  final dynamic parameter1;
  final dynamic parameter2;
  final dynamic parameter3;
  final dynamic parameter4;
  final dynamic parameter5;
  final dynamic parameter6;

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  late RadioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            FlutterFlowRadioButton(
              options: widget.parameter1!.toList(),
              onChanged: (val) async {
                setState(() {});
                logFirebaseEvent('RADIO_RadioButton_z0pkvprj_ON_FORM_WIDGE');
                logFirebaseEvent('RadioButton_update_app_state');
                setState(() {
                  FFAppState().addToTotalcombocart(Round2cartStruct(
                    productId: widget.parameter2?.toString(),
                    productname: widget.parameter1?.toString(),
                    productamount: widget.parameter3?.toString(),
                    discountamout: widget.parameter4?.toString(),
                    deliverablecount: widget.parameter5?.toString(),
                  ));
                  FFAppState().addToComboid(widget.parameter2!.toString());
                });
                logFirebaseEvent('RadioButton_show_snack_bar');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Product added to the cart',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    action: SnackBarAction(
                      label: 'Go to cart',
                      textColor: FlutterFlowTheme.of(context).primaryBackground,
                      onPressed: () async {
                        context.pushNamed('CartvalueCopy');
                      },
                    ),
                  ),
                );
              },
              controller: _model.radioButtonValueController ??=
                  FormFieldController<String>(null),
              optionHeight: 32.0,
              textStyle: FlutterFlowTheme.of(context).labelMedium,
              selectedTextStyle: FlutterFlowTheme.of(context).bodyMedium,
              buttonPosition: RadioButtonPosition.left,
              direction: Axis.vertical,
              radioButtonColor: FlutterFlowTheme.of(context).primary,
              inactiveRadioButtonColor:
                  FlutterFlowTheme.of(context).secondaryText,
              toggleable: false,
              horizontalAlignment: WrapAlignment.start,
              verticalAlignment: WrapCrossAlignment.start,
            ),
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: RichText(
                textScaleFactor: MediaQuery.of(context).textScaleFactor,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.parameter3!.toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        '9gnl1vi6' /*  /  */,
                      ),
                      style: TextStyle(),
                    ),
                    TextSpan(
                      text: widget.parameter4!.toString(),
                      style: TextStyle(
                        color: Color(0x95FF0000),
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
            ),
            Builder(
              builder: (context) {
                final products = widget.parameter6?.toList() ?? [];
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  itemBuilder: (context, productsIndex) {
                    final productsItem = products[productsIndex];
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              2.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.check,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                        ),
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                productsItem.toString(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
