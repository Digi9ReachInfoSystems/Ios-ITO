import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({super.key});

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'editProfile'});
    _model.textController1 ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().userInfo.studentName,
      'Student Name',
    ));
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().userInfo.mobileNo,
      'Student Name',
    ));
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().userInfo.parentEmail,
      'Parent Email',
    ));
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController(
        text: valueOrDefault<String>(
      FFAppState().userInfo.parentName,
      'Parent Name',
    ));
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??=
        TextEditingController(text: FFAppState().userInfo.address);
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController6 ??=
        TextEditingController(text: FFAppState().userInfo.district);
    _model.textFieldFocusNode6 ??= FocusNode();

    _model.textController7 ??=
        TextEditingController(text: FFAppState().userInfo.state);
    _model.textFieldFocusNode7 ??= FocusNode();

    _model.textController8 ??=
        TextEditingController(text: FFAppState().userInfo.city);
    _model.textFieldFocusNode8 ??= FocusNode();

    _model.textController9 ??=
        TextEditingController(text: FFAppState().userInfo.pincode);
    _model.textFieldFocusNode9 ??= FocusNode();

    _model.textController10 ??=
        TextEditingController(text: FFAppState().userInfo.schoolName);
    _model.textFieldFocusNode10 ??= FocusNode();

    _model.textController11 ??=
        TextEditingController(text: FFAppState().userInfo.schoolAddress);
    _model.textFieldFocusNode11 ??= FocusNode();

    _model.textController12 ??=
        TextEditingController(text: FFAppState().userInfo.schoolCity);
    _model.textFieldFocusNode12 ??= FocusNode();

    _model.textController13 ??=
        TextEditingController(text: FFAppState().userInfo.schoolState);
    _model.textFieldFocusNode13 ??= FocusNode();

    _model.textController14 ??=
        TextEditingController(text: FFAppState().userInfo.schoolPincode);
    _model.textFieldFocusNode14 ??= FocusNode();

    _model.textController15 ??=
        TextEditingController(text: FFAppState().userInfo.username);
    _model.textFieldFocusNode15 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: const AlignmentDirectional(0, 1),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () async {
                logFirebaseEvent('EDIT_PROFILE_arrow_back_rounded_ICN_ON_T');
                logFirebaseEvent('IconButton_navigate_back');
                context.pop();
              },
            ),
          ),
          title: Align(
            alignment: const AlignmentDirectional(0, 1),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 30, 20),
              child: Text(
                FFLocalizations.of(context).getText(
                  'nbickxmg' /* Edit Profile */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
          actions: const [],
          centerTitle: true,
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'psmp10d7' /* Edit Profile */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: const Color(0xFF435EBE),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '7j4truf8' /* Student Name */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: TextFormField(
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode1,
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintText: FFLocalizations.of(context).getText(
                                'ev0fm8lu' /* Student Name */,
                              ),
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Color(0xFF272727),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'jkanu6xh' /* Mobile Number */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: TextFormField(
                            controller: _model.textController2,
                            focusNode: _model.textFieldFocusNode2,
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintText: FFLocalizations.of(context).getText(
                                'wfa8b0ui' /* Mobile No */,
                              ),
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              prefixIcon: const Icon(
                                Icons.phone_sharp,
                                color: Color(0xFF272727),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'vb2xv1xr' /* Parent's Email */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: TextFormField(
                            controller: _model.textController3,
                            focusNode: _model.textFieldFocusNode3,
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintText: FFLocalizations.of(context).getText(
                                'k4dn27g7' /* User Name */,
                              ),
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              prefixIcon: const Icon(
                                Icons.email_rounded,
                                color: Color(0xFF272727),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.textController3Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'hk5w03cl' /* Parent’s Name */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: TextFormField(
                            controller: _model.textController4,
                            focusNode: _model.textFieldFocusNode4,
                            autofocus: true,
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              hintText: FFLocalizations.of(context).getText(
                                'ktljmaut' /* Parent’s Name */,
                              ),
                              hintStyle:
                                  FlutterFlowTheme.of(context).labelMedium,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context).alternate,
                              prefixIcon: Icon(
                                Icons.supervised_user_circle,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: _model.textController4Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'zcaic49v' /* Postal Address */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: const Color(0xFF435EBE),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'ru2d3fhy' /* Address */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        controller: _model.textController5,
                        focusNode: _model.textFieldFocusNode5,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: FFLocalizations.of(context).getText(
                            'm2a711rp' /* Address */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFE3E3E3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          contentPadding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController5Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'fokiu55k' /* District */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        controller: _model.textController6,
                        focusNode: _model.textFieldFocusNode6,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: FFLocalizations.of(context).getText(
                            'q5j8lk02' /* District */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFE3E3E3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          contentPadding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController6Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '7vwhhypu' /* State */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        controller: _model.textController7,
                        focusNode: _model.textFieldFocusNode7,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: FFLocalizations.of(context).getText(
                            'ixh5c2tq' /* State */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFE3E3E3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          contentPadding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController7Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'jqcuahqn' /* City */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        controller: _model.textController8,
                        focusNode: _model.textFieldFocusNode8,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: FFLocalizations.of(context).getText(
                            'ugryr4aq' /* City */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFE3E3E3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          contentPadding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController8Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'm4ejm7su' /* Pin Code */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        controller: _model.textController9,
                        focusNode: _model.textFieldFocusNode9,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: FFLocalizations.of(context).getText(
                            '4awpo02z' /* Pin Code */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFE3E3E3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          contentPadding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        keyboardType: TextInputType.number,
                        validator: _model.textController9Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 15, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '2cxgs2ta' /* School Details */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: const Color(0xFF435EBE),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'si17vigj' /* School Name */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        controller: _model.textController10,
                        focusNode: _model.textFieldFocusNode10,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: FFLocalizations.of(context).getText(
                            'b46ztmkm' /* School Name */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFE3E3E3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          contentPadding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController10Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '63392axd' /* School Address */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                      child: TextFormField(
                        controller: _model.textController11,
                        focusNode: _model.textFieldFocusNode11,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: FFLocalizations.of(context).getText(
                            'bg345486' /* School Address */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController11Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        't9gmrusd' /* School City */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        controller: _model.textController12,
                        focusNode: _model.textFieldFocusNode12,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: FFLocalizations.of(context).getText(
                            'w2l3ckf3' /* School City */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFE3E3E3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          contentPadding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController12Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'n7w8dflp' /* School State */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        controller: _model.textController13,
                        focusNode: _model.textFieldFocusNode13,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: FFLocalizations.of(context).getText(
                            'xqml6y5s' /* School State */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFE3E3E3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          contentPadding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController13Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'vktnb9x8' /* School Pin Code */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        controller: _model.textController14,
                        focusNode: _model.textFieldFocusNode14,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: FFLocalizations.of(context).getText(
                            '8st8e63c' /* School Pin Code */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFE3E3E3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          contentPadding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        keyboardType: TextInputType.number,
                        validator: _model.textController14Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'i82ysvhv' /* UserName */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 16,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(18, 0, 18, 0),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        controller: _model.textController15,
                        focusNode: _model.textFieldFocusNode15,
                        autofocus: true,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelStyle: FlutterFlowTheme.of(context).labelMedium,
                          hintText: FFLocalizations.of(context).getText(
                            '4yzbwj28' /* Username */,
                          ),
                          hintStyle: FlutterFlowTheme.of(context).labelMedium,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFE3E3E3),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          contentPadding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        validator: _model.textController15Validator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'EDIT_PROFILE_PAGE_UPDATE_BTN_ON_TAP');
                          logFirebaseEvent('Button_backend_call');
                          _model.apiResult34a = await EditprofileCall.call(
                            token: FFAppState().userInfo.token,
                            studentName: FFAppState().userInfo.studentName,
                            parentName: FFAppState().userInfo.parentName,
                            address: _model.textController5.text,
                            district: _model.textController6.text,
                            state: _model.textController7.text,
                            city: _model.textController8.text,
                            pinCode: _model.textController9.text,
                            schoolName: _model.textController10.text,
                            schoolState: _model.textController13.text,
                            schoolAddress: _model.textController11.text,
                            schoolCity: _model.textController12.text,
                            schoolPincode: _model.textController14.text,
                            userName: _model.textController15.text,
                          );
                          if ((_model.apiResult34a?.succeeded ?? true)) {
                            logFirebaseEvent('Button_update_app_state');
                            FFAppState().update(() {
                              FFAppState().updateUserInfoStruct(
                                (e) => e
                                  ..address = _model.textController5.text
                                  ..district = _model.textController6.text
                                  ..state = _model.textController7.text
                                  ..city = _model.textController8.text
                                  ..pincode = _model.textController9.text
                                  ..schoolName = _model.textController10.text
                                  ..schoolState = _model.textController13.text
                                  ..schoolAddress = _model.textController11.text
                                  ..schoolCity = _model.textController12.text
                                  ..schoolPincode = _model.textController14.text
                                  ..username = _model.textController15.text,
                              );
                            });
                            logFirebaseEvent('Button_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    title: const Text('Success!'),
                                    content:
                                        const Text('Profile Updated Succesfully !'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                            logFirebaseEvent('Button_navigate_to');

                            context.goNamed(
                              'profile',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.rightToLeft,
                                ),
                              },
                            );
                          } else {
                            logFirebaseEvent('Button_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return WebViewAware(
                                  child: AlertDialog(
                                    title: const Text('Failed!!'),
                                    content: const Text('Some Fields are Missing'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }

                          setState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          '9mvwv57d' /* Update */,
                        ),
                        options: FFButtonOptions(
                          width: 343,
                          height: 48,
                          padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                          iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: const Color(0xFF004696),
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                  ),
                          elevation: 3,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(height: 10)).around(const SizedBox(height: 10)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
