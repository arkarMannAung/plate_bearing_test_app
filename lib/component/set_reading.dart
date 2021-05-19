import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:select_form_field/select_form_field.dart';

class SetReading extends StatefulWidget {
  // const SetReading({Key key}) : super(key: key);
  var data = [
    {'ton': 0.0,'d1' : 0.0,'d2' : 0.0,'d3' : 0.0,'avg': 0.0},
    {'ton': 0.0,'d1' : 0.0,'d2' : 0.0,'d3' : 0.0,'avg': 0.0},
    {'ton': 0.0,'d1' : 0.0,'d2' : 0.0,'d3' : 0.0,'avg': 0.0},
    {'ton': 0.0,'d1' : 0.0,'d2' : 0.0,'d3' : 0.0,'avg': 0.0},
    {'ton': 0.0,'d1' : 0.0,'d2' : 0.0,'d3' : 0.0,'avg': 0.0},
    {'ton': 0.0,'d1' : 0.0,'d2' : 0.0,'d3' : 0.0,'avg': 0.0},
    {'ton': 0.0,'d1' : 0.0,'d2' : 0.0,'d3' : 0.0,'avg': 0.0}
  ];
  int _plateDiameter = 18;
  double _plateFactor = 0.71428; // 100/140
  get plateDia => _plateDiameter;
  get plateFactor => _plateFactor;
  @override
  _SetReadingState createState() => _SetReadingState();
}

class _SetReadingState extends State<SetReading> {
  double cover = 5.0;
  double mm_width=60.0;

  // choose plate diameter
  TextEditingController _controller;
  String _initialPlateDia;
  String _ChangedPlateDia = '';

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'k30',
      'label': '30"dia plate',
      'icon': Icon(Icons.fiber_manual_record,color: Colors.blueGrey,),
    },
    {
      'value': 'k18',
      'label': '18"dia plate (Default)',
      'icon': Icon(Icons.fiber_manual_record,color: Colors.blueGrey,),
      // 'textStyle': TextStyle(color: Colors.red),
    },
    {
      'value': 'k16',
      'label': '16"dia plate',
      // 'enable': false,
      'icon': Icon(Icons.fiber_manual_record,color: Colors.blueGrey,),
    },
    {
      'value': 'k12',
      'label': '12"dia plate',
      // 'enable': false,
      'icon': Icon(Icons.fiber_manual_record,color: Colors.blueGrey,),
    },
  ];

  // hit visible
  bool hit0=false;
  bool hit1=false;
  bool hit2=false;
  bool hit3=false;
  bool hit4=false;
  bool hit5=false;
  bool hit6=false;

  // visible
  bool row_two=false;
  bool row_three=false;
  bool row_four=false;
  bool row_five=false;
  bool row_six=false;
  bool row_seven=false;

  // bool row_two=true;
  // bool row_three=true;
  // bool row_four=true;
  // bool row_five=true;
  // bool row_six=true;
  // bool row_seven=true;

  TextEditingController ton = TextEditingController();
  TextEditingController d1 = TextEditingController();
  TextEditingController d2 = TextEditingController();
  TextEditingController d3 = TextEditingController();
  TextEditingController avg = TextEditingController();

  TextEditingController r1ton = TextEditingController();
  TextEditingController r1c1 = TextEditingController();
  TextEditingController r1c2 = TextEditingController();
  TextEditingController r1c3 = TextEditingController();
  TextEditingController r1avg = TextEditingController();

  TextEditingController r2ton = TextEditingController();
  TextEditingController r2c1 = TextEditingController();
  TextEditingController r2c2 = TextEditingController();
  TextEditingController r2c3 = TextEditingController();
  TextEditingController r2avg = TextEditingController();

  TextEditingController r3ton = TextEditingController();
  TextEditingController r3c1 = TextEditingController();
  TextEditingController r3c2 = TextEditingController();
  TextEditingController r3c3 = TextEditingController();
  TextEditingController r3avg = TextEditingController();

  TextEditingController r4ton = TextEditingController();
  TextEditingController r4c1 = TextEditingController();
  TextEditingController r4c2 = TextEditingController();
  TextEditingController r4c3 = TextEditingController();
  TextEditingController r4avg = TextEditingController();

  TextEditingController r5ton = TextEditingController();
  TextEditingController r5c1 = TextEditingController();
  TextEditingController r5c2 = TextEditingController();
  TextEditingController r5c3 = TextEditingController();
  TextEditingController r5avg = TextEditingController();

  TextEditingController r6ton = TextEditingController();
  TextEditingController r6c1 = TextEditingController();
  TextEditingController r6c2 = TextEditingController();
  TextEditingController r6c3 = TextEditingController();
  TextEditingController r6avg = TextEditingController();

  TextEditingController r7ton = TextEditingController();
  TextEditingController r7c1 = TextEditingController();
  TextEditingController r7c2 = TextEditingController();
  TextEditingController r7c3 = TextEditingController();
  TextEditingController r7avg = TextEditingController();


  // 0.05 in = 1.27 mm

  Widget indecator = Column(
      children: [
        SizedBox(height: 5),
        Container(
          height: 2,
          width: 300,
          // padding: EdgeInsets.all(2.0),
          color: Colors.red,
        )
      ],
  );
  void _calcAvg(int row,String key,double value) {
    widget.data[row][key]=value;
    int divider = (widget.data[row]['d1']>0?1:0) +
        (widget.data[row]['d2']>0?1:0) +
        (widget.data[row]['d3']>0?1:0);
    double sum =  (widget.data[row]['d1']!=null?widget.data[row]['d1']:0) +
        (widget.data[row]['d2']!=null?widget.data[row]['d2']:0) +
        (widget.data[row]['d3']!=null?widget.data[row]['d3']:0);
    if (divider!=0){
      setState(() {
        double average = sum/divider;
        average = double.parse(average.toStringAsFixed(3));
        widget.data[row]['avg']=average;
        if (row==0) {
          row_two=true;
          r1avg = TextEditingController(text: average.toString());
        } else if (row==1) {
          row_three=true;
          r2avg = TextEditingController(text: average.toString());
        } else if (row==2) {
          row_four=true;
          r3avg = TextEditingController(text: average.toString());
        } else if (row==3) {
          row_five=true;
          r4avg = TextEditingController(text: average.toString());
        } else if (row==4) {
          row_six=true;
          r5avg = TextEditingController(text: average.toString());
        } else if (row==5) {
          row_seven=true;
          r6avg = TextEditingController(text: average.toString());
        } else if (row==6) {
          r7avg = TextEditingController(text: average.toString());
        }
        var hit;
        for (var i=0;i<widget.data.length;i++) {
          if (widget.data[i]["avg"]>1.27) {
            hit=i;
            break;
          }
          if (i==(widget.data.length-1)) {
            hit0=false;
            hit1=false;
            hit2=false;
            hit3=false;
            hit4=false;
            hit5=false;
            hit6=false;
          }
        }
        if (hit!=null) {
          if (hit==0) {
            hit0=true;
            hit1=false;
            hit2=false;
            hit3=false;
            hit4=false;
            hit5=false;
            hit6=false;
          } else if (hit==1) {
            hit0=false;
            hit1=true;
            hit2=false;
            hit3=false;
            hit4=false;
            hit5=false;
            hit6=false;
          } else if (hit==2) {
            hit0=false;
            hit1=false;
            hit2=true;
            hit3=false;
            hit4=false;
            hit5=false;
            hit6=false;
          } else if (hit==3) {
            hit0=false;
            hit1=false;
            hit2=false;
            hit3=true;
            hit4=false;
            hit5=false;
            hit6=false;
          } else if (hit==4) {
            hit0=false;
            hit1=false;
            hit2=false;
            hit3=false;
            hit4=true;
            hit5=false;
            hit6=false;
          } else if (hit==5) {
            hit0=false;
            hit1=false;
            hit2=false;
            hit3=false;
            hit4=false;
            hit5=true;
            hit6=false;
          } else if (hit==6) {
            hit0=false;
            hit1=false;
            hit2=false;
            hit3=false;
            hit4=false;
            hit5=false;
            hit6=true;
          }
        }
        // 0.05 in = 1.27 mm
       });
    }

    // print(average+1);
    // print("${data[row]['d1']>0?1:0} | ${data[row]['d2']>0?1:0} | ${data[row]['d3']>0?1:0} divider is = $divider");
    // print(widget.data);
  }

  @override
  void initState() {
    ton = TextEditingController(text: 'Ton');
    d1 = TextEditingController(text: 'D1');
    d2 = TextEditingController(text: 'D2');
    d3 = TextEditingController(text: 'D3');
    avg = TextEditingController(text: 'Avg');

    _initialPlateDia = 'k18';
    _ChangedPlateDia = _initialPlateDia;
    _controller?.text = '18"dia plate (Default)';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // choose plate diameter
        Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 10.0),
          child: SelectFormField(
            // type: SelectFormFieldType.dialog,
            controller: _controller,
            initialValue: _initialPlateDia,
            icon: Icon(Icons.circle,color: Colors.blueGrey,),
            cursorColor: Colors.blueGrey,
            style: TextStyle(color: Colors.blueGrey,fontSize: 18),
            // labelText: 'Shape',
            // changeIcon: true,
            // dialogTitle: 'Pick a item',
            // dialogCancelBtn: 'CANCEL',
            // enableSearch: true,
            // dialogSearchHint: 'Search item',
            items: _items,
            onChanged: (val) => setState(() {
              _ChangedPlateDia = val;
              if (val=='k30') {
                widget._plateDiameter=30;
                widget._plateFactor=1;
              } else if (val=='k18') {
                widget._plateDiameter=18;
                widget._plateFactor=0.71428; // 100/140
              } else if (val=='k16') {
                widget._plateDiameter=16;
                widget._plateFactor=0.64516; // 100/155
              } else if (val=='k12') {
                widget._plateDiameter=12;
                widget._plateFactor=0.46512; // 100/215
              }
            }),
          ),
        ),
        SizedBox(height: 10,),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: cover,),
                    Container(padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0),width: 12,height: 50,child: Text('',textAlign: TextAlign.right,),),
                    SizedBox(
                      height: 50,
                      width: 60,
                      child: TextField(
                        enabled: false,
                        controller: ton,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        textAlignVertical: TextAlignVertical.bottom,
                        autofocus: false,
                        maxLength: 3,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black,
                            hintText: 'ton',
                            counterText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 50.0),
                            )
                        ),
                      ),
                    ),// ton
                    SizedBox(width: cover,),
                    SizedBox(
                      height: 50,
                      width: mm_width,
                      child: TextField(
                        enabled: false,
                        controller: d1,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        textAlignVertical: TextAlignVertical.bottom,
                        autofocus: false,
                        maxLength: 6,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black,
                            hintText: 'mm',
                            counterText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 50.0),
                            )
                        ),
                      ),
                    ),// D1
                    SizedBox(width: cover,),
                    SizedBox(
                      height: 50,
                      width: mm_width,
                      child: TextField(
                        enabled: false,
                        controller: d2,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        textAlignVertical: TextAlignVertical.bottom,
                        autofocus: false,
                        maxLength: 6,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black,
                            hintText: 'mm',
                            counterText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 50.0),
                            )
                        ),
                      ),
                    ),// D2
                    SizedBox(width: cover,),
                    SizedBox(
                      height: 50,
                      width: mm_width,
                      child: TextField(
                        enabled: false,
                        controller: d3,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        textAlignVertical: TextAlignVertical.bottom,
                        autofocus: false,
                        maxLength: 6,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black,
                            hintText: 'mm',
                            counterText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 50.0),
                            )
                        ),
                      ),
                    ),// D3
                    SizedBox(width: cover,),
                    SizedBox(
                      height: 50,
                      width: 70,
                      child: TextField(
                        enabled: false,
                        controller: avg,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                        textAlignVertical: TextAlignVertical.bottom,
                        autofocus: false,
                        maxLength: 6,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black,
                            hintText: 'Avg',
                            counterText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 50.0),
                            )
                        ),
                      ),
                    ),// Avg mm
                    SizedBox(width: cover,),
                  ],
                ), // Title
                SizedBox(height: cover),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: cover,),
                    Container(padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0),width: 10,height: 50,child: Text('1',textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold),),),
                    SizedBox(width: cover,),
                    SizedBox(
                      height: 50,
                      width: 60,
                      child: TextField(
                        onChanged: (text) {
                          _calcAvg(0, 'ton', double.parse(text));
                        },
                        controller: r1ton,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                        textAlign: TextAlign.end,
                        textAlignVertical: TextAlignVertical.bottom,
                        autofocus: false,
                        maxLength: 3,
                        decoration: InputDecoration(
                            hintText: 'ton',
                            counterText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 50.0),
                            )
                        ),
                      ),
                    ),// ton
                    SizedBox(width: cover,),
                    SizedBox(
                      height: 50,
                      width: mm_width,
                      child: TextField(
                        onChanged: (text) {
                          _calcAvg(0, 'd1', double.parse(text));
                        },
                        controller: r1c1,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                        textAlign: TextAlign.end,
                        textAlignVertical: TextAlignVertical.bottom,
                        autofocus: false,
                        maxLength: 4,
                        decoration: InputDecoration(
                            hintText: 'mm',
                            counterText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 50.0),
                            )
                        ),
                      ),
                    ),// D1
                    SizedBox(width: cover,),
                    SizedBox(
                      height: 50,
                      width: mm_width,
                      child: TextField(
                        onChanged: (text) {
                          _calcAvg(0, 'd2', double.parse(text));
                        },
                        controller: r1c2,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                        textAlign: TextAlign.end,
                        textAlignVertical: TextAlignVertical.bottom,
                        autofocus: false,
                        maxLength: 4,
                        decoration: InputDecoration(
                            hintText: 'mm',
                            counterText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 50.0),
                            )
                        ),
                      ),
                    ),// D2
                    SizedBox(width: cover,),
                    SizedBox(
                      height: 50,
                      width: mm_width,
                      child: TextField(
                        onChanged: (text) {
                          _calcAvg(0, 'd3', double.parse(text));
                        },
                        controller: r1c3,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                        textAlign: TextAlign.end,
                        textAlignVertical: TextAlignVertical.bottom,
                        autofocus: false,
                        maxLength: 4,
                        decoration: InputDecoration(
                            hintText: 'mm',
                            counterText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 50.0),
                            )
                        ),
                      ),
                    ),// D3
                    SizedBox(width: cover,),
                    SizedBox(
                      height: 50,
                      width: 70,
                      child: TextField(
                        enabled: false,
                        controller: r1avg,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                        textAlign: TextAlign.end,
                        textAlignVertical: TextAlignVertical.bottom,
                        autofocus: false,
                        maxLength: 5,
                        decoration: InputDecoration(
                            hintText: 'Avg',
                            counterText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 50.0),
                            )
                        ),
                      ),
                    ),// Avg mm
                    SizedBox(width: cover,),
                  ],
                ), // Row1
                Visibility(visible: hit1,child: indecator,),
                SizedBox(height: cover),
                Visibility(
                    visible: row_two,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: cover,),
                        Container(padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0),width: 10,height: 50,child: Text('2',textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold),),),
                        SizedBox(width: cover,),
                        SizedBox(
                          height: 50,
                          width: 60,
                          child: TextField(
                            onChanged: (text) {
                              _calcAvg(1, 'ton', double.parse(text));
                            },
                            controller: r2ton,
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                              signed: false,
                            ),
                            textAlign: TextAlign.end,
                            textAlignVertical: TextAlignVertical.bottom,
                            autofocus: false,
                            maxLength: 3,
                            decoration: InputDecoration(
                                hintText: 'ton',
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 50.0),
                                )
                            ),
                          ),
                        ),// ton
                        SizedBox(width: cover,),
                        SizedBox(
                          height: 50,
                          width: mm_width,
                          child: TextField(
                            onChanged: (text) {
                              _calcAvg(1, 'd1', double.parse(text));
                            },
                            controller: r2c1,
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                              signed: false,
                            ),
                            textAlign: TextAlign.end,
                            textAlignVertical: TextAlignVertical.bottom,
                            autofocus: false,
                            maxLength: 4,
                            decoration: InputDecoration(
                                hintText: 'mm',
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 50.0),
                                )
                            ),
                          ),
                        ),// D1
                        SizedBox(width: cover,),
                        SizedBox(
                          height: 50,
                          width: mm_width,
                          child: TextField(
                            onChanged: (text) {
                              _calcAvg(1, 'd2', double.parse(text));
                            },
                            controller: r2c2,
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                              signed: false,
                            ),
                            textAlign: TextAlign.end,
                            textAlignVertical: TextAlignVertical.bottom,
                            autofocus: false,
                            maxLength: 4,
                            decoration: InputDecoration(
                                hintText: 'mm',
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 50.0),
                                )
                            ),
                          ),
                        ),// D2
                        SizedBox(width: cover,),
                        SizedBox(
                          height: 50,
                          width: mm_width,
                          child: TextField(
                            onChanged: (text) {
                              _calcAvg(1, 'd3', double.parse(text));
                            },
                            controller: r2c3,
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                              signed: false,
                            ),
                            textAlign: TextAlign.end,
                            textAlignVertical: TextAlignVertical.bottom,
                            autofocus: false,
                            maxLength: 4,
                            decoration: InputDecoration(
                                hintText: 'mm',
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 50.0),
                                )
                            ),
                          ),
                        ),// D3
                        SizedBox(width: cover,),
                        SizedBox(
                          height: 50,
                          width: 70,
                          child: TextField(
                            enabled: false,
                            controller: r2avg,
                            keyboardType: TextInputType.numberWithOptions(
                              decimal: true,
                              signed: false,
                            ),
                            textAlign: TextAlign.end,
                            textAlignVertical: TextAlignVertical.bottom,
                            autofocus: false,
                            maxLength: 5,
                            decoration: InputDecoration(
                                hintText: 'Avg',
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 50.0),
                                )
                            ),
                          ),
                        ),// Avg mm
                        SizedBox(width: cover,),
                      ],
                    )
                ), // Row2
                Visibility(visible: hit2,child: indecator,),
                Visibility(
                  visible: row_two,
                  child: SizedBox(height: cover),
                ),
                Visibility(
                  visible: row_three,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: cover,),
                      Container(padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0),width: 10,height: 50,child: Text('3',textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold),),),
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: 60,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(2, 'ton', double.parse(text));
                          },
                          controller: r3ton,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 3,
                          decoration: InputDecoration(
                              hintText: 'ton',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// ton
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: mm_width,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(2, 'd1', double.parse(text));
                          },
                          controller: r3c1,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 4,
                          decoration: InputDecoration(
                              hintText: 'mm',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// D1
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: mm_width,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(2, 'd2', double.parse(text));
                          },
                          controller: r3c2,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 4,
                          decoration: InputDecoration(
                              hintText: 'mm',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// D2
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: mm_width,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(2, 'd3', double.parse(text));
                          },
                          controller: r3c3,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 4,
                          decoration: InputDecoration(
                              hintText: 'mm',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// D3
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: 70,
                        child: TextField(
                          enabled: false,
                          controller: r3avg,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 5,
                          decoration: InputDecoration(
                              hintText: 'Avg',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// Avg mm
                      SizedBox(width: cover,),
                    ],
                  ),
                ), // Row3
                Visibility(visible: hit3,child: indecator,),
                Visibility(
                  visible: row_three,
                  child: SizedBox(height: cover,),
                ),
                Visibility(
                  visible: row_four,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: cover,),
                      Container(padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0),width: 10,height: 50,child: Text('4',textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold),),),
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: 60,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(3, 'ton', double.parse(text));
                          },
                          controller: r4ton,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 3,
                          decoration: InputDecoration(
                              hintText: 'ton',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// ton
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: mm_width,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(3, 'd1', double.parse(text));
                          },
                          controller: r4c1,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 4,
                          decoration: InputDecoration(
                              hintText: 'mm',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// D1
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: mm_width,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(3, 'd2', double.parse(text));
                          },
                          controller: r4c2,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 4,
                          decoration: InputDecoration(
                              hintText: 'mm',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// D2
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: mm_width,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(3, 'd3', double.parse(text));
                          },
                          controller: r4c3,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 4,
                          decoration: InputDecoration(
                              hintText: 'mm',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// D3
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: 70,
                        child: TextField(
                          enabled: false,
                          controller: r4avg,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 5,
                          decoration: InputDecoration(
                              hintText: 'Avg',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// Avg mm
                      SizedBox(width: cover,),
                    ],
                  ),
                ), // Row4
                Visibility(visible: hit4,child: indecator,),
                Visibility(
                  visible: row_four,
                  child: SizedBox(height: cover,),
                ),
                Visibility(
                  visible: row_five,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: cover,),
                      Container(padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0),width: 10,height: 50,child: Text('5',textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold),),),
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: 60,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(4, 'ton', double.parse(text));
                          },
                          controller: r5ton,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 3,
                          decoration: InputDecoration(
                              hintText: 'ton',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// ton
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: mm_width,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(4, 'd1', double.parse(text));
                          },
                          controller: r5c1,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 4,
                          decoration: InputDecoration(
                              hintText: 'mm',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// D1
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: mm_width,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(4, 'd2', double.parse(text));
                          },
                          controller: r5c2,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 4,
                          decoration: InputDecoration(
                              hintText: 'mm',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// D2
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: mm_width,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(4, 'd3', double.parse(text));
                          },
                          controller: r5c3,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 4,
                          decoration: InputDecoration(
                              hintText: 'mm',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// D3
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: 70,
                        child: TextField(
                          enabled: false,
                          controller: r5avg,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 5,
                          decoration: InputDecoration(
                              hintText: 'Avg',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// Avg mm
                      SizedBox(width: cover,),
                    ],
                  ),
                ), // Row5
                Visibility(visible: hit5,child: indecator,),
                Visibility(
                  visible: row_five,
                  child: SizedBox(height: cover,),
                ),
                Visibility(
                  visible: row_six,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: cover,),
                      Container(padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0),width: 10,height: 50,child: Text('6',textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold),),),
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: 60,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(5, 'ton', double.parse(text));
                          },
                          controller: r6ton,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 3,
                          decoration: InputDecoration(
                              hintText: 'ton',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// ton
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: mm_width,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(5, 'd1', double.parse(text));
                          },
                          controller: r6c1,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 4,
                          decoration: InputDecoration(
                              hintText: 'mm',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// D1
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: mm_width,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(5, 'd2', double.parse(text));
                          },
                          controller: r6c2,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 4,
                          decoration: InputDecoration(
                              hintText: 'mm',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// D2
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: mm_width,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(5, 'd3', double.parse(text));
                          },
                          controller: r6c3,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 4,
                          decoration: InputDecoration(
                              hintText: 'mm',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// D3
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: 70,
                        child: TextField(
                          enabled: false,
                          controller: r6avg,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 5,
                          decoration: InputDecoration(
                              hintText: 'Avg',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// Avg mm
                      SizedBox(width: cover,),
                    ],
                  ),
                ), // Row6
                Visibility(visible: hit6,child: indecator,),
                Visibility(
                  visible: row_six,
                  child: SizedBox(height: cover,),
                ),
                Visibility(
                  visible: row_seven,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: cover,),
                      Container(padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0),width: 10,height: 50,child: Text('7',textAlign: TextAlign.right,style: TextStyle(fontWeight: FontWeight.bold),),),
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: 60,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(6, 'ton', double.parse(text));
                          },
                          controller: r7ton,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 3,
                          decoration: InputDecoration(
                              hintText: 'ton',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// ton
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: mm_width,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(6, 'd1', double.parse(text));
                          },
                          controller: r7c1,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 4,
                          decoration: InputDecoration(
                              hintText: 'mm',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// D1
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: mm_width,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(6, 'd2', double.parse(text));
                          },
                          controller: r7c2,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 4,
                          decoration: InputDecoration(
                              hintText: 'mm',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// D2
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: mm_width,
                        child: TextField(
                          onChanged: (text) {
                            _calcAvg(6, 'd3', double.parse(text));
                          },
                          controller: r7c3,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 4,
                          decoration: InputDecoration(
                              hintText: 'mm',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// D3
                      SizedBox(width: cover,),
                      SizedBox(
                        height: 50,
                        width: 70,
                        child: TextField(
                          enabled: false,
                          controller: r7avg,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                            signed: false,
                          ),
                          textAlign: TextAlign.end,
                          textAlignVertical: TextAlignVertical.bottom,
                          autofocus: false,
                          maxLength: 5,
                          decoration: InputDecoration(
                              hintText: 'Avg',
                              counterText: '',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 50.0),
                              )
                          ),
                        ),
                      ),// Avg mm
                      SizedBox(width: cover,),
                    ],
                  ),
                ), // Row7
                // Visibility(visible: hit7,child: indecator,),
                Visibility(
                  visible: row_seven,
                  child: SizedBox(height: cover,),
                ),
              ],
            )
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
