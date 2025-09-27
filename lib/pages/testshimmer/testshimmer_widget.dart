import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'testshimmer_model.dart';
export 'testshimmer_model.dart';

class TestshimmerWidget extends StatefulWidget {
  const TestshimmerWidget({super.key});

  @override
  State<TestshimmerWidget> createState() => _TestshimmerWidgetState();
}

class _TestshimmerWidgetState extends State<TestshimmerWidget>
    with TickerProviderStateMixin {
  late TestshimmerModel _model;

  final animationsMap = {
    'imageOnPageLoadAnimation1': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, 200.0),
          end: const Offset(0.0, -200.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 1000.ms,
          begin: 0.765,
          end: 1.0,
        ),
      ],
    ),
    'imageOnPageLoadAnimation2': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, 200.0),
          end: const Offset(0.0, -200.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 1000.ms,
          begin: 0.765,
          end: 1.0,
        ),
      ],
    ),
    'imageOnPageLoadAnimation3': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, 200.0),
          end: const Offset(0.0, -200.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 1000.ms,
          begin: 0.765,
          end: 1.0,
        ),
      ],
    ),
    'imageOnPageLoadAnimation4': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, 200.0),
          end: const Offset(0.0, -200.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 1000.ms,
          begin: 0.765,
          end: 1.0,
        ),
      ],
    ),
    'imageOnPageLoadAnimation5': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, 200.0),
          end: const Offset(0.0, -200.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 1000.ms,
          begin: 0.765,
          end: 1.0,
        ),
      ],
    ),
    'imageOnPageLoadAnimation6': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, 200.0),
          end: const Offset(0.0, -200.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 1000.ms,
          begin: 0.765,
          end: 1.0,
        ),
      ],
    ),
    'imageOnPageLoadAnimation7': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, 200.0),
          end: const Offset(0.0, -200.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 1000.ms,
          begin: 0.765,
          end: 1.0,
        ),
      ],
    ),
    'imageOnPageLoadAnimation8': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(0.0, 200.0),
          end: const Offset(0.0, -200.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 1000.ms,
          begin: 0.765,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestshimmerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: MediaQuery.sizeOf(context).height * 0.05,
              decoration: BoxDecoration(
                color: const Color(0xFFEDE8E8),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 6.0,
                    sigmaY: 6.0,
                  ),
                  child: Transform.rotate(
                    angle: 1.9199,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://img.freepik.com/free-photo/abstract-background-with-bokeh-lights_53876-120103.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1696464000&semt=ais',
                        width: double.infinity,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation1']!),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: MediaQuery.sizeOf(context).height * 0.03,
              decoration: BoxDecoration(
                color: const Color(0xFFEDE8E8),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 6.0,
                    sigmaY: 6.0,
                  ),
                  child: Transform.rotate(
                    angle: 1.9199,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://img.freepik.com/free-photo/abstract-background-with-bokeh-lights_53876-120103.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1696464000&semt=ais',
                        width: double.infinity,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: MediaQuery.sizeOf(context).height * 0.2,
              decoration: BoxDecoration(
                color: const Color(0xFFEDE8E8),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 6.0,
                    sigmaY: 6.0,
                  ),
                  child: Transform.rotate(
                    angle: 1.9199,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://img.freepik.com/free-photo/abstract-background-with-bokeh-lights_53876-120103.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1696464000&semt=ais',
                        width: double.infinity,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation3']!),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: MediaQuery.sizeOf(context).height * 0.1,
              decoration: BoxDecoration(
                color: const Color(0xFFEDE8E8),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 6.0,
                    sigmaY: 6.0,
                  ),
                  child: Transform.rotate(
                    angle: 1.9199,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://img.freepik.com/free-photo/abstract-background-with-bokeh-lights_53876-120103.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1696464000&semt=ais',
                        width: double.infinity,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation4']!),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: MediaQuery.sizeOf(context).height * 0.2,
              decoration: BoxDecoration(
                color: const Color(0xFFEDE8E8),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 6.0,
                    sigmaY: 6.0,
                  ),
                  child: Transform.rotate(
                    angle: 1.9199,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://img.freepik.com/free-photo/abstract-background-with-bokeh-lights_53876-120103.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1696464000&semt=ais',
                        width: double.infinity,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation5']!),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: MediaQuery.sizeOf(context).height * 0.06,
              decoration: BoxDecoration(
                color: const Color(0xFFEDE8E8),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 6.0,
                    sigmaY: 6.0,
                  ),
                  child: Transform.rotate(
                    angle: 1.9199,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://img.freepik.com/free-photo/abstract-background-with-bokeh-lights_53876-120103.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1696464000&semt=ais',
                        width: double.infinity,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation6']!),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: MediaQuery.sizeOf(context).height * 0.06,
              decoration: BoxDecoration(
                color: const Color(0xFFEDE8E8),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRect(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 6.0,
                    sigmaY: 6.0,
                  ),
                  child: Transform.rotate(
                    angle: 1.9199,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://img.freepik.com/free-photo/abstract-background-with-bokeh-lights_53876-120103.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1696464000&semt=ais',
                        width: double.infinity,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation7']!),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDE8E8),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ClipRect(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 6.0,
                        sigmaY: 6.0,
                      ),
                      child: Transform.rotate(
                        angle: 1.9199,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://img.freepik.com/free-photo/abstract-background-with-bokeh-lights_53876-120103.jpg?size=626&ext=jpg&ga=GA1.1.1413502914.1696464000&semt=ais',
                            width: double.infinity,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ).animateOnPageLoad(
                            animationsMap['imageOnPageLoadAnimation8']!),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
