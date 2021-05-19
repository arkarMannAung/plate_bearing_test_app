class cbr_result {
  final data;
  final plateDia;
  final plateFactor;
  double pi = 3.1415926535897932;
  double load=0.0;
  cbr_result({this.data,this.plateDia,this.plateFactor});
  get getload=> load;
  double calc() {
    double y2,y1,x2,x1;
    double a=0.0,b,c,d;
    bool hit=false;
    for (int i=0;i<data.length;i++){

      if (data[i]["avg"]>1.27){
        x2=data[i]["avg"];
        x1=data[i-1]["avg"];
        y2=data[i]["ton"];
        y1=data[i-1]["ton"];
        b=y2-y1;
        d=x2-x1;
        c=1.27-x1;
        hit=true;
        break;
      }
    }
    if (hit){
      a=((c*b)/d)+y1;
      double area=pi*((plateDia*plateDia)/4); // unit sqin
      double load=a*2240; // unit lb
      double k_value=load/(area*0.05); // with 0.05 penetration
      double k30value=k_value*plateFactor;
      this.load=k30value;
      return k30_graph(k30value);
    }else{
      load=0;
      return 0.0;
    }

  }
  double k30_graph(double kvalue) {
    List<double> x=[	81.59,	90.44,	100,	  111.13,	135.04,
            155.12,	170.76,	182.11,	189.76,	195.48,
            200,	  200.71,	205.78,	210.53,	215.01,
            219.61,	223.93,	229.9,	236.48,	245.35,
            250.58,	257.57,	321.01,	400,	  500,
            573.02,	702.89,	800];
    List<double> y=[	0,		1,		2,		3,		4,      5,
            6,		7,		8,		9,    10,		  11,
            13,		14,		15,   16,		17,		  18,
            19,		20,   21,		22,		30,		  40,
            50,   60,		80,		100];
    double k=kvalue;
    double x1;
    double x2;
    double y1;
    double y2;
    bool hit=false;
    for(int n=0; n<x.length && n<y.length;n++){
      if (k<x[n]) {
        x1=x[n-1];
        x2=x[n];
        y1=y[n-1];
        y2=y[n];
        hit=true;
        break;
      }
    }
    if (hit) {
      double d=x2-x1;
      double c=k-x1;
      double b=y2-y1;
      double a=(c*b)/d;
      return a+y1;
    }else{
      return 0.0;
    }
  }
}
