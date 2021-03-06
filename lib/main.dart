import 'package:fandy_timer/appDrawer.dart';
import 'package:fandy_timer/egg_timer.dart';
import 'package:fandy_timer/egg_timer_controls.dart';
import 'package:fandy_timer/egg_timer_dial.dart';
import 'package:fandy_timer/egg_timer_time_display.dart';
import 'package:flutter/material.dart';

final Color GRADIENT_TOP = const Color(0xFFF5F5F5);
final Color GRADIENT_BOTTOM = const Color(0xFFE8E8E8);

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  EggTimer eggTimer;

  _MyAppState(){
    eggTimer = new EggTimer(
    maxTime: const Duration(minutes: 35),
    onTimerUpdate: _onTimerUpdate,
    );
    }


  _onTimeSelected(Duration newTime) {
    setState(() {
      eggTimer.currentTime = newTime;
    });
  }

  _onDialStopTurning(Duration newTime){
    setState((){
      eggTimer.currentTime = newTime;
      eggTimer.resume();
    });
  }

  _onTimerUpdate(){
    setState(() { });
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kevin\'s Timer',
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Bebas'
      ),
      home: new Scaffold(
        drawer: new AppDrawer(),
        appBar: new AppBar(
          title: new Text("Kevin's Timer",
          style: new TextStyle(
            letterSpacing: 3.0
          ),),
          backgroundColor: Colors.red,
        ),
        body: new Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [GRADIENT_TOP, GRADIENT_BOTTOM],
            ),
          ),
          child: new Center(
              child: new Column(
                children: <Widget>[
                  new EggTimerTimeDisplay(
                    eggTimerState: eggTimer.state,
                    selectionTime: eggTimer.lastStartTime,
                    countdownTime: eggTimer.currentTime,

                  ),
                  new EggTimerDial(
                    eggTimerState: eggTimer.state,
                    currentTime: eggTimer.currentTime,
                    maxTime: eggTimer.maxTime,
                    ticksPerSection: 5,
                    onTimeSelected: _onTimeSelected,
                    onDialStopTurning: _onDialStopTurning,
                  ),
                  new Expanded(child: new Container()),
                  new EggTimerControls(
                    eggTimerState: eggTimer.state,
                    onPause: (){
                      setState(() => eggTimer.pause());
                    },
                    onResume: (){
                      setState(() => eggTimer.resume());
                    },
                    onRestart: (){
                      setState(() => eggTimer.restart());
                    },
                    onReset: (){
                      setState(() => eggTimer.reset());
                    },
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}

