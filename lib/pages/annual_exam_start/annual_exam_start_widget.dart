import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/dosanddont_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/shimmerservice/shimmerservice_widget.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'annual_exam_start_model.dart';
export 'annual_exam_start_model.dart';

class AnnualExamStartWidget extends StatefulWidget {
  const AnnualExamStartWidget({
    super.key,
    required this.subjectid,
    required this.serviceid,
    required this.choosensubject,
    required this.alias,
    required this.round,
  });

  final String? subjectid;
  final String? serviceid;
  final String? choosensubject;
  final String? alias;
  final String? round;

  @override
  State<AnnualExamStartWidget> createState() => _AnnualExamStartWidgetState();
}

class _AnnualExamStartWidgetState extends State<AnnualExamStartWidget>
    with TickerProviderStateMixin {
  late AnnualExamStartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnnualExamStartModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'annualExamStart'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFF272727),
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('ANNUAL_EXAM_START_arrow_back_rounded_ICN');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.choosensubject,
                  'Test',
                ),
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
          actions: [],
          centerTitle: true,
          toolbarHeight: MediaQuery.sizeOf(context).height * 0.08,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 500.0,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (widget.serviceid == '1')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ANNUAL_EXAM_START_PAGE_TEST_BTN_ON_TAP');
                                          logFirebaseEvent('Button_page_view');
                                          await _model.pageViewController
                                              ?.animateToPage(
                                            0,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'yydb38vj' /* Test */,
                                        ),
                                        icon: Icon(
                                          Icons.exposure,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ANNUAL_EXAM_START_PAGE_RESULT_BTN_ON_TAP');
                                          logFirebaseEvent('Button_page_view');
                                          await _model.pageViewController
                                              ?.animateToPage(
                                            1,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'cklmkiq6' /* Result */,
                                        ),
                                        icon: Icon(
                                          Icons.rule,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xD9227272),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ],
                                  ),
                                ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 20.0, 10.0, 0.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: TestCall.call(
                                      subjectId: valueOrDefault<String>(
                                        widget.subjectid,
                                        '7',
                                      ),
                                      round: widget.round,
                                      stdId: FFAppState().userInfo.stdId,
                                      userId: FFAppState().userInfo.userId,
                                      serviceId: valueOrDefault<String>(
                                        widget.serviceid,
                                        '1',
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return ShimmerserviceWidget();
                                      }
                                      final tabBarTestResponse = snapshot.data!;
                                      return Column(
                                        children: [
                                          Align(
                                            alignment: Alignment(0.0, 0),
                                            child: FlutterFlowButtonTabBar(
                                              useToggleButtonStyle: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                      ),
                                              unselectedLabelStyle: TextStyle(),
                                              labelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              unselectedLabelColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              unselectedBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderColor: Color(0x00004696),
                                              unselectedBorderColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              elevation: 0.0,
                                              buttonMargin:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                              padding: EdgeInsets.all(4.0),
                                              tabs: [
                                                Tab(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'f42ez5r5' /* Practise Test */,
                                                  ),
                                                ),
                                                Tab(
                                                  text: () {
                                                    if (widget.serviceid ==
                                                        '1') {
                                                      return 'Monthly Test';
                                                    } else if (widget
                                                            .serviceid ==
                                                        '15') {
                                                      return 'Summer Quiz';
                                                    }else if (widget
                                                            .serviceid ==
                                                        '8'){
                                                      return 'Online Study Material';
                                                    }
                                                     else {
                                                      return 'Annual Test';
                                                    }
                                                  }(),
                                                ),
                                              ],
                                              controller:
                                                  _model.tabBarController,
                                              onTap: (i) async {
                                                [() async {}, () async {}][i]();
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              controller:
                                                  _model.tabBarController,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 30.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final testname = TestCall
                                                                      .practiselist(
                                                                    tabBarTestResponse
                                                                        .jsonBody,
                                                                  )?.toList() ??
                                                                  [];
                                                              return GridView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                gridDelegate:
                                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      2,
                                                                  crossAxisSpacing:
                                                                      0.0,
                                                                  childAspectRatio:
                                                                      0.6,
                                                                ),
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    testname
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        testnameIndex) {
                                                                  final testnameItem =
                                                                      testname[
                                                                          testnameIndex];
                                                                  return Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5.0),
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            2.0,
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            children:
                                                                                [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 117.0,
                                                                                  height: 117.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: Color(0xFFFFBD59),
                                                                                      width: 3.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Material(
                                                                                      color: Colors.transparent,
                                                                                      elevation: 2.0,
                                                                                      shape: const CircleBorder(),
                                                                                      child: Container(
                                                                                        width: 105.0,
                                                                                        height: 105.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).accent4,
                                                                                          image: DecorationImage(
                                                                                            fit: BoxFit.scaleDown,
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            image: Image.network(
                                                                                              getJsonField(
                                                                                                testnameItem,
                                                                                                r'''$.test_icon''',
                                                                                              ).toString(),
                                                                                            ).image,
                                                                                          ),
                                                                                          shape: BoxShape.circle,
                                                                                          border: Border.all(
                                                                                            color: Color(0xFFFFECB2),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsets.all(5.0),
                                                                                            child: Text(
                                                                                              getJsonField(
                                                                                                testnameItem,
                                                                                                r'''$.test_name''',
                                                                                              ).toString(),
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsets.all(5.0),
                                                                                            child: Text(
                                                                                              'Time : ${getJsonField(
                                                                                                testnameItem,
                                                                                                r'''$.time''',
                                                                                              ).toString()} min',
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('ANNUAL_EXAM_START_START_TEST_BTN_ON_TAP');
                                                                                    logFirebaseEvent('Button_request_permissions');
                                                                                    await requestPermission(cameraPermission);
                                                                                    logFirebaseEvent('Button_request_permissions');
                                                                                    await requestPermission(microphonePermission);
                                                                                    logFirebaseEvent('Button_backend_call');
                                                                                    _model.apiResult0o8 = await GetquestionsoxCall.call(
                                                                                      testId: getJsonField(
                                                                                        testnameItem,
                                                                                        r'''$.testId''',
                                                                                      ).toString(),
                                                                                      userId: FFAppState().userInfo.userId,
                                                                                    );

                                                                                    if ((_model.apiResult0o8?.succeeded ?? true)) {
                                                                                      logFirebaseEvent('Button_update_app_state');
                                                                                      FFAppState().questions = QuestionsStruct(
                                                                                        questionName: GetquestionsoxCall.sectionAquestions(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answer1: GetquestionsoxCall.sectionAanswer1(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answer2: GetquestionsoxCall.sectionAanswer2(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answer3: GetquestionsoxCall.sectionAanswer3(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answer4: GetquestionsoxCall.sectionAanswer4(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        questionId: GetquestionsoxCall.sectionAquestionId(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answerimage1: GetquestionsoxCall.sectionAanswerimage1(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answerimage3: GetquestionsoxCall.sectionAanswerimage3(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answerimage2: GetquestionsoxCall.sectionAanswerimage2(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answerimage4: GetquestionsoxCall.sectionAanswerimage4(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        questionimage: GetquestionsoxCall.sectionAquestionImage(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        questionName2: GetquestionsoxCall.sectionBquestions(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        questionImage2: GetquestionsoxCall.sectionBquestionImage(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswer1: GetquestionsoxCall.sectionBanswer1(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswer2: GetquestionsoxCall.sectionBanswer2(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswer3: GetquestionsoxCall.sectionBanswer3(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswer4: GetquestionsoxCall.sectionBanswer4(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswerimage1: GetquestionsoxCall.sectionBanswerImage1(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswerimage2: GetquestionsoxCall.sectionBanswerImage2(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswerimage3: GetquestionsoxCall.sectionBanswerImage3(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswerimage4: GetquestionsoxCall.sectionBanswerImage4(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        question2Id: GetquestionsoxCall.sectionBquestionId(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        question3Id: GetquestionsoxCall.sectionCquestionId(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        questions3: GetquestionsoxCall.sectionCquestions(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        question3image: GetquestionsoxCall.sectionCquestionImage(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3Answer1: GetquestionsoxCall.sectionCanswer1(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3answer2: GetquestionsoxCall.sectionCanswer2(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3answer3: GetquestionsoxCall.sectionCanswer3(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3answer4: GetquestionsoxCall.sectionCanswer4(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3answerimage1: GetquestionsoxCall.sectionCanswerimage1(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3answerimage2: GetquestionsoxCall.sectionCanswerimage2(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3answerimage3: GetquestionsoxCall.sectionCanswerimage3(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3answerimage4: GetquestionsoxCall.sectionCanswerimage4(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        format1: GetquestionsoxCall.testformat1(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        format2: GetquestionsoxCall.testformat2(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        format3: GetquestionsoxCall.testformat3(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                      );
                                                                                      FFAppState().totaltime = getJsonField(
                                                                                        testnameItem,
                                                                                        r'''$.time''',
                                                                                      ).toString();
                                                                                      FFAppState().alias = getJsonField(
                                                                                        testnameItem,
                                                                                        r'''$.alias''',
                                                                                      ).toString();
                                                                                      FFAppState().subjectname = getJsonField(
                                                                                        testnameItem,
                                                                                        r'''$.test_name''',
                                                                                      ).toString();
                                                                                      FFAppState().time = getJsonField(
                                                                                        testnameItem,
                                                                                        r'''$.time''',
                                                                                      ).toString();
                                                                                      safeSetState(() {});
                                                                                      logFirebaseEvent('Button_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'testDetails',
                                                                                        queryParameters: {
                                                                                          'testId': serializeParam(
                                                                                            getJsonField(
                                                                                              testnameItem,
                                                                                              r'''$.testId''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'time': serializeParam(
                                                                                            getJsonField(
                                                                                              testnameItem,
                                                                                              r'''$.time''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'alias': serializeParam(
                                                                                            getJsonField(
                                                                                              testnameItem,
                                                                                              r'''$.alias''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'testName': serializeParam(
                                                                                            getJsonField(
                                                                                              testnameItem,
                                                                                              r'''$.test_name''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'totalTime': serializeParam(
                                                                                            getJsonField(
                                                                                              testnameItem,
                                                                                              r'''$.time''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'category': serializeParam(
                                                                                            getJsonField(
                                                                                              testnameItem,
                                                                                              r'''$.category''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                           'subjectName': serializeParam(
              getJsonField(
                GetquestionsoxCall.testdetails(
                  (_model.apiResult0o8?.jsonBody ?? ''),
                ),
                r'''$.subject_name''',
              ).toString(),
              ParamType.String,
            ),
            'stdid': serializeParam(
              getJsonField(
                GetquestionsoxCall.testdetails(
                  (_model.apiResult0o8?.jsonBody ?? ''),
                ),
                r'''$.std_id''',
              ).toString(),
              ParamType.String,
            ),
            'totalquestion': serializeParam(
              getJsonField(
                GetquestionsoxCall.testdetails(
                  (_model.apiResult0o8?.jsonBody ?? ''),
                ),
                r'''$.total_questions''',
              ).toString(),
              ParamType.String,
            ),
            'totalmarks': serializeParam(
              getJsonField(
                GetquestionsoxCall.testdetails(
                  (_model.apiResult0o8?.jsonBody ?? ''),
                ),
                r'''$.total_marks''',
              ).toString(),
              ParamType.String,
            ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    } else {
                                                                                      logFirebaseEvent('Button_alert_dialog');
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              title: Text('Alert'),
                                                                                              content: Text('You Already Attempted this test'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                  child: Text('Ok'),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    }

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'asrxykhq' /* Start Test */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: 40.0,
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: const Color(0xFF004696),
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: Colors.white,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    elevation: 3.0,
                                                                                    borderSide: const BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              
                                                                            ].divide(SizedBox(height: 8.0)).around(SizedBox(height: 8.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Column(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    if (!(TestCall.practiselist(
              tabBarTestResponse.jsonBody,
            ) !=
            null &&
        (TestCall.practiselist(
          tabBarTestResponse.jsonBody,
        ))!
            .isNotEmpty))
      Align(
        alignment: AlignmentDirectional(0, 0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Text(
            valueOrDefault<String>(
              TestCall.practisemsg(
                tabBarTestResponse.jsonBody,
              ),
              'Not Available',
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).error,
                  fontSize: 16,
                ),
          ),
        ),
      ),
    if (!(TestCall.practiselist(
              tabBarTestResponse.jsonBody,
            ) !=
            null &&
        (TestCall.practiselist(
          tabBarTestResponse.jsonBody,
        ))!
            .isNotEmpty))
      Align(
        alignment: AlignmentDirectional(0, 1),
        child: FFButtonWidget(
          onPressed: () async {
            logFirebaseEvent('ANNUAL_EXAM_START_BUY_NOW_BTN_ON_TAP');
            logFirebaseEvent('Button_navigate_to');
            context.pushNamed('productsmenu');
          },
          text:"Buy Now",
          options: FFButtonOptions(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.05,
            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                ),
            elevation: 3,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
  ],
)

                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 30.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final testname = TestCall
                                                                      .monthlylist(
                                                                    tabBarTestResponse
                                                                        .jsonBody,
                                                                  )?.toList() ??
                                                                  [];
                                                              return GridView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                gridDelegate:
                                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      2,
                                                                  crossAxisSpacing:
                                                                      0.0,
                                                                  childAspectRatio:
                                                                      0.6,
                                                                ),
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    testname
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        testnameIndex) {
                                                                  final testnameItem =
                                                                      testname[
                                                                          testnameIndex];
                                                                  return Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5.0),
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            2.0,
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            children:
                                                                                [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Container(
                                                                                  width: 117.0,
                                                                                  height: 117.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    shape: BoxShape.circle,
                                                                                    border: Border.all(
                                                                                      color: Color(0xFFFFBD59),
                                                                                      width: 3.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 105.0,
                                                                                      height: 105.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFFFFECB2),
                                                                                        image: DecorationImage(
                                                                                          fit: BoxFit.cover,
                                                                                          image: Image.network(
                                                                                            getJsonField(
                                                                                              testnameItem,
                                                                                              r'''$.test_icon''',
                                                                                            ).toString(),
                                                                                          ).image,
                                                                                        ),
                                                                                        shape: BoxShape.circle,
                                                                                        border: Border.all(
                                                                                          color: Color(0xFFFFECB2),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsets.all(5.0),
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  testnameItem,
                                                                                                  r'''$.test_name''',
                                                                                                )?.toString(),
                                                                                                'not found',
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                child: FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    logFirebaseEvent('ANNUAL_EXAM_START_START_TEST_BTN_ON_TAP');
                                                                                    logFirebaseEvent('Button_request_permissions');
                                                                                    await requestPermission(cameraPermission);
                                                                                    logFirebaseEvent('Button_request_permissions');
                                                                                    await requestPermission(microphonePermission);
                                                                                    logFirebaseEvent('Button_backend_call');
                                                                                    _model.apiResult0o8 = await GetquestionsoxCall.call(
                                                                                      testId: getJsonField(
                                                                                        testnameItem,
                                                                                        r'''$.testId''',
                                                                                      ).toString(),
                                                                                      userId: FFAppState().userInfo.userId,
                                                                                    );

                                                                                    if ((_model.apiResult0o8?.succeeded ?? true)) {
                                                                                      logFirebaseEvent('Button_update_app_state');
                                                                                      FFAppState().questions = QuestionsStruct(
                                                                                        questionName: GetquestionsoxCall.sectionAquestions(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answer1: GetquestionsoxCall.sectionAanswer1(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answer2: GetquestionsoxCall.sectionAanswer2(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answer3: GetquestionsoxCall.sectionAanswer3(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answer4: GetquestionsoxCall.sectionAanswer4(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        questionId: GetquestionsoxCall.sectionAquestionId(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answerimage1: GetquestionsoxCall.sectionAanswerimage1(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answerimage3: GetquestionsoxCall.sectionAanswerimage3(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answerimage2: GetquestionsoxCall.sectionAanswerimage2(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        answerimage4: GetquestionsoxCall.sectionAanswerimage4(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        questionimage: GetquestionsoxCall.sectionAquestionImage(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        questionName2: GetquestionsoxCall.sectionBquestions(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        questionImage2: GetquestionsoxCall.sectionBquestionImage(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswer1: GetquestionsoxCall.sectionBanswer1(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswer2: GetquestionsoxCall.sectionBanswer2(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswer3: GetquestionsoxCall.sectionBanswer3(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswer4: GetquestionsoxCall.sectionBanswer4(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswerimage1: GetquestionsoxCall.sectionBanswerImage1(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswerimage2: GetquestionsoxCall.sectionBanswerImage2(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswerimage3: GetquestionsoxCall.sectionBanswerImage3(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        sectionBanswerimage4: GetquestionsoxCall.sectionBanswerImage4(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        question2Id: GetquestionsoxCall.sectionBquestionId(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        question3Id: GetquestionsoxCall.sectionCquestionId(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        questions3: GetquestionsoxCall.sectionCquestions(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        question3image: GetquestionsoxCall.sectionCquestionImage(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3Answer1: GetquestionsoxCall.sectionCanswer1(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3answer2: GetquestionsoxCall.sectionCanswer2(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3answer3: GetquestionsoxCall.sectionCanswer3(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3answer4: GetquestionsoxCall.sectionCanswer4(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3answerimage1: GetquestionsoxCall.sectionCanswerimage1(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3answerimage2: GetquestionsoxCall.sectionCanswerimage2(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3answerimage3: GetquestionsoxCall.sectionCanswerimage3(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        section3answerimage4: GetquestionsoxCall.sectionCanswerimage4(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        format1: GetquestionsoxCall.testformat1(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        format2: GetquestionsoxCall.testformat2(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                        format3: GetquestionsoxCall.testformat3(
                                                                                          (_model.apiResult0o8?.jsonBody ?? ''),
                                                                                        ),
                                                                                      );
                                                                                      FFAppState().totaltime = getJsonField(
                                                                                        testnameItem,
                                                                                        r'''$.time''',
                                                                                      ).toString();
                                                                                      FFAppState().alias = getJsonField(
                                                                                        testnameItem,
                                                                                        r'''$.alias''',
                                                                                      ).toString();
                                                                                      FFAppState().subjectname = getJsonField(
                                                                                        testnameItem,
                                                                                        r'''$.test_name''',
                                                                                      ).toString();
                                                                                      FFAppState().time = getJsonField(
                                                                                        testnameItem,
                                                                                        r'''$.time''',
                                                                                      ).toString();
                                                                                      safeSetState(() {});
                                                                                      logFirebaseEvent('Button_navigate_to');

                                                                                      context.pushNamed(
                                                                                        'testDetails',
                                                                                        queryParameters: {
                                                                                          'testId': serializeParam(
                                                                                            getJsonField(
                                                                                              testnameItem,
                                                                                              r'''$.testId''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'time': serializeParam(
                                                                                            getJsonField(
                                                                                              testnameItem,
                                                                                              r'''$.time''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'alias': serializeParam(
                                                                                            getJsonField(
                                                                                              testnameItem,
                                                                                              r'''$.alias''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'testName': serializeParam(
                                                                                            getJsonField(
                                                                                              testnameItem,
                                                                                              r'''$.test_name''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'totalTime': serializeParam(
                                                                                            getJsonField(
                                                                                              testnameItem,
                                                                                              r'''$.time''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'category': serializeParam(
                                                                                            getJsonField(
                                                                                              testnameItem,
                                                                                              r'''$.category''',
                                                                                            ).toString(),
                                                                                            ParamType.String,
                                                                                          ),
                                                                                           'subjectName': serializeParam(
              getJsonField(
                GetquestionsoxCall.testdetails(
                  (_model.apiResult0o8?.jsonBody ?? ''),
                ),
                r'''$.subject_name''',
              ).toString(),
              ParamType.String,
            ),
            'stdid': serializeParam(
              getJsonField(
                GetquestionsoxCall.testdetails(
                  (_model.apiResult0o8?.jsonBody ?? ''),
                ),
                r'''$.std_id''',
              ).toString(),
              ParamType.String,
            ),
            'totalquestion': serializeParam(
              getJsonField(
                GetquestionsoxCall.testdetails(
                  (_model.apiResult0o8?.jsonBody ?? ''),
                ),
                r'''$.total_questions''',
              ).toString(),
              ParamType.String,
            ),
            'totalmarks': serializeParam(
              getJsonField(
                GetquestionsoxCall.testdetails(
                  (_model.apiResult0o8?.jsonBody ?? ''),
                ),
                r'''$.total_marks''',
              ).toString(),
              ParamType.String,
            ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    } else {
                                                                                      logFirebaseEvent('Button_alert_dialog');
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              title: Text('Alert'),
                                                                                              content: Text('You Already Attempted this test'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                  child: Text('Ok'),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    }

                                                                                    safeSetState(() {});
                                                                                  },    text: FFLocalizations.of(context).getText(
                                                                                    'asrxykhq' /* Start Test */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    height: 40.0,
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: const Color(0xFF004696),
                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          color: Colors.white,
                                                                                          letterSpacing: 0.0,
                                                                                        ),
                                                                                    elevation: 3.0,
                                                                                    borderSide: const BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 8.0)).around(SizedBox(height: 8.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        
                                                       Column(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    if (!(TestCall.monthlylist(
              tabBarTestResponse.jsonBody,
            ) !=
            null &&
        (TestCall.monthlylist(
          tabBarTestResponse.jsonBody,
        ))!
            .isNotEmpty))
      Align(
        alignment: AlignmentDirectional(0, -1),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
          child: Text(
            valueOrDefault<String>(
              TestCall.ground2finalmsg(
                tabBarTestResponse.jsonBody,
              ),
              'Not Available',
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).error,
                  fontSize: 16,
                ),
          ),
        ),
      ),
    if (!(TestCall.monthlylist(
              tabBarTestResponse.jsonBody,
            ) !=
            null &&
        (TestCall.monthlylist(
          tabBarTestResponse.jsonBody,
        ))!
            .isNotEmpty))
      Align(
        alignment: AlignmentDirectional(0, 1),
        child: FFButtonWidget(
          onPressed: () async {
            logFirebaseEvent('ANNUAL_EXAM_START_BUY_NOW_BTN_ON_TAP');
            logFirebaseEvent('Button_navigate_to');
            context.pushNamed('productsmenu');
          },
          text: "Buy Now",
          options: FFButtonOptions(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.05,
            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: FlutterFlowTheme.of(context).primary,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                ),
            elevation: 3,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
  ],
)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (widget.serviceid == '1')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ANNUAL_EXAM_START_PAGE_TEST_BTN_ON_TAP');
                                          logFirebaseEvent('Button_page_view');
                                          await _model.pageViewController
                                              ?.animateToPage(
                                            0,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'utlb7p7c' /* Test */,
                                        ),
                                        icon: Icon(
                                          Icons.exposure,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .success,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ANNUAL_EXAM_START_PAGE_RESULT_BTN_ON_TAP');
                                          logFirebaseEvent('Button_page_view');
                                          await _model.pageViewController
                                              ?.animateToPage(
                                            1,
                                            duration:
                                                Duration(milliseconds: 500),
                                            curve: Curves.ease,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '9b3117uf' /* Result */,
                                        ),
                                        icon: Icon(
                                          Icons.rule,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xD9227272),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ],
                                  ),
                                ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: MonthlyResultsCall.call(
                                      userId: FFAppState().userInfo.userId,
                                      subjectId: widget.subjectid,
                                      stdId: FFAppState().userInfo.stdId,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final containerMonthlyResultsResponse =
                                          snapshot.data!;
                                      return Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final data =
                                                MonthlyResultsCall.results(
                                                      containerMonthlyResultsResponse
                                                          .jsonBody,
                                                    )?.toList() ??
                                                    [];
                                            return FlutterFlowDataTable<
                                                dynamic>(
                                              controller: _model
                                                  .paginatedDataTableController,
                                              data: data,
                                              columnsBuilder: (onSortChanged) =>
                                                  [
                                                DataColumn2(
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'klk35z6s' /* Test Name */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                DataColumn2(
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'txshdhqa' /* Score */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                DataColumn2(
                                                  label: DefaultTextStyle.merge(
                                                    softWrap: true,
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'crpdmd6w' /* Date */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              dataRowBuilder: (dataItem,
                                                      dataIndex,
                                                      selected,
                                                      onSelectChanged) =>
                                                  DataRow(
                                                color:
                                                    MaterialStateProperty.all(
                                                  dataIndex % 2 == 0
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                ),
                                                cells: [
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Text(
                                                      getJsonField(
                                                        dataItem,
                                                        r'''$.test_name''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Text(
                                                      getJsonField(
                                                        dataItem,
                                                        r'''$.score''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Text(
                                                      getJsonField(
                                                        dataItem,
                                                        r'''$.date_time''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                ]
                                                    .map((c) => DataCell(c))
                                                    .toList(),
                                              ),
                                              paginated: true,
                                              selectable: false,
                                              hidePaginator: false,
                                              showFirstLastButtons: false,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              headingRowHeight: 56.0,
                                              dataRowHeight: 60.0,
                                              columnSpacing: 24.0,
                                              headingRowColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              addHorizontalDivider: true,
                                              addTopAndBottomDivider: false,
                                              hideDefaultHorizontalDivider:
                                                  false,
                                              horizontalDividerColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              horizontalDividerThickness: 1.0,
                                              addVerticalDivider: false,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
