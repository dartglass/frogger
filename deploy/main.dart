import "dart:html" as h;class OF{static const  PF="Chrome";static const  QF="Safari";final  uE;final  minimumVersion;const OF(this.uE,[this.minimumVersion]);}class RF{const RF();}class SF{final  name;const SF(this.name);}class TF{const TF();}class UF{const UF();}class JC{var k;var backgroundImage;JC(this.k){backgroundImage=new h.Element.tag('img');backgroundImage.src="images/game-field.jpg";}v(){k.m.drawImage(backgroundImage,0,0);}}class RB{var k;var x;var y;var rB;var XF=0;var YF;var speed;var direction;var o;RB( g, j, i, s){this.k=g;this.rB=j;this.x=j*g.QB;this.y=i;speed=1;o=new h.Element.tag('img');switch (s){case 0:o.src="images/car1-down.png";direction=1;break;case 1:o.src="images/car1a-down.png";direction=1;break;case 2:o.src="images/car1-up.png";direction=-1;break;case 3:o.src="images/car1a-up.png";direction=-1;break;case 4:o.src="images/truck2-up.png";direction=-1;break;case 5:o.src="images/truck2-down.png";direction=1;break;case 6:o.src="images/log2.png";direction=1;break;case 7:o.src="images/log3.png";direction=-1;break;case 8:o.src="images/log4.png";direction=1;break;}YF=(g.FB*i)-o.height;}v(){var g=k.QB;var i=k.FB;k.m.drawImage(o,x,YF);}update( g){XF++ ;YF=YF+(speed*direction);if(direction>0){if(YF>k.height+o.height){YF=0-o.height;}}else{if(YF<(o.height*-1)){YF=k.height+o.height;}}var ZF=(YF/k.FB);if(k.BB.x==rB){print(k.BB.x);if(ZF>1.0&&ZF<2.0){print("Dead!");k.BB.zE();}}}}class IC{var k;var x;var y;var XF=0;var splat;var zB;var HF;var PB;var ZB;var aB;var yB;IC(this.k){x=0;y=2*k.FB;splat=false;PB=0;ZB=new h.Element.tag('img');ZB.src="images/frogger.png";aB=new h.Element.tag('img');aB.src="images/frogger-splat.png";yB=h.query("#audioJump");}v(){var g=k.QB;var i=k.FB;k.m.drawImage(ZB,x*g,i*2);if(splat){k.m.drawImage(aB,zB*g,i*2);}}xB(){x++ ;if(x>=k.JB){x=0;k.tE(1);}yB.play();}zE(){zB=x;HF=y;x=0;splat=true;}update( g){if(splat){PB++ ;if(PB>100){PB=0;splat=false;}}}}class DB{var canvas;var height;var width;var FB;var QB;var JB=9;var rows=5;var xE=0;var m;var background;var BB;var t;var AC;DB(this.canvas){m=canvas.getContext('2d');height=canvas.height;width=canvas.width;QB=width~/JB;FB=height~/rows;print("canvas.height = ${height}");print("cavnas.width = ${width}");AC=new HC(this,width,height);background=new JC(this);BB=new IC(this);t=new List<RB>();t.add(new RB(this,3,0,0));t.add(new RB(this,4,2,2));t.add(new RB(this,4,4,3));t.add(new RB(this,1,0,4));t.add(new RB(this,6,1,6));t.add(new RB(this,6,3,6));t.add(new RB(this,6,5,6));t.add(new RB(this,7,2,7));t.add(new RB(this,7,2,7));}yE(){}v(){KC(m,width,height);AC.v();background.v();BB.v();t.forEach(( g)=>g.v());}update( g){BB.update(g);t.forEach(( i)=>i.update(g));}tE( g){xE+= g;}}class HC{var k;var m;var JB=9;var rows=5;var height;var width;var fB;var bB;HC(this.k,this.width,this.height){fB=(width/JB).toInt();bB=(height/rows).toInt();print("heightSpacing = ${bB}");print("widthSpacing = ${fB}");m=k.m;}v(){for(int g=0;g<rows;g++ ){tB(0,g*bB,width,0);}for(int i=0;i<JB;i++ ){tB(i*fB,0,0,height);}} tB(i,g,j,s){m.lineWidth=1;m.lineCap="round";m.strokeStyle="white";m.beginPath();m.moveTo(i,g);m.lineTo(i+j,g+s);m.stroke();m.closePath();}}var SB;KC( i, g, j)=>i.clearRect(0,0,g,j); main(){SB=h.query("#canvas");var i=new DB(SB);var s=false;var j=false;var GB=0.0;h.document.onKeyDown.listen((CB){CB.preventDefault();if(CB.keyCode==32){i.BB.xB();}});var g=new WB(SB);g.eB=(( g){if(s==false){var LB=g.OB-GB;if(LB>1.0){s=true;}}i.update(g);});g.dB=((g){i.v();});i.yE();g.start();h.window.onDeviceMotion.listen(( MB){var HB=MB.accelerationIncludingGravity.z;if(HB>=3.0&&j==false&&s==true){j=true;GB=g.OB;i.BB.xB();}else if(HB<0.0&&j==true){j=false;}});}typedef  LC( event, repeat);abstract class jB{ get x; get y; get dx; get dy; get time; get n;}typedef  MC( gameLoop);abstract class q{var KB=0.015;var cB=0.03; get n; get OB; get vE=>KB;static  UB(g)=>g/1000.0; get time=>UB(new DateTime.now().millisecondsSinceEpoch);q(){} EF(){var aF=bF.length;for(int g=0;g<aF;g++ ){bF[g].cF(vE);}for(int g=bF.length-1;g>=0;g-- ){var i=bF.length-1;if(bF[g].dF){if(g!=i){bF[g]=bF[i];}bF.removeLast();}}} start();final  bF=new List<NC>();var eB;}class NC{}class kB{final  IB;var uB=0;var vB=0;var IF=0.0;var JF=0.0;kB(this.IB); get EB=>uB>vB;}class OC{}class TB{final  EB;final  n;final  IB;final  time;TB(this.IB,this.EB,this.n,this.time); toString()=>'Button: ${IB} DOWN: ${EB} [${n}@${time}]';}class VB{final  l;final  buttons=new Map<int,kB>();var wB;VB(this.l, i){for(int g in i){buttons[g]=new kB(g);}} sB( i){var g=buttons[i.IB];if(g==null){return;}if(wB!=null){if(wB(i,g.EB)==false){return;}}if(i.EB){if(g.EB==false){g.uB=i.n;g.IF=i.time;}}else{g.vB=i.n;g.JF=i.time;}}}class QC{final  x;final  y;final  dx;final  dy;final  XB;final  YB;final  time;final  gB;final  n;QC(this.x,this.y,this.dx,this.dy,this.XB,this.YB,this.gB,this.time,this.n);}class PC{final  l;PC(this.l){l.element.onClick.listen(eF);h.document.onPointerLockChange.listen(fF);} FF(){l.element.requestPointerLock();} eF( g){if(AF){FF();}}var AF=true; get BF=>h.document.VF==l.element; fF( g){if(l.onPointerLockChange!=null){l.onPointerLockChange(l);}}}class AB{static const lB=0x1;static const mB=0x2;static const nB=0x3;final  event;final  type;AB(this.event,this.type);}class RC{final  l;var buttons;var WF;RC(this.l){}}typedef  SC( gameLoop);class TC extends VB{static const VC=h.KeyCode.A;static const WC=h.KeyCode.B;static const YC=h.KeyCode.C;static const ZC=h.KeyCode.D;static const aC=h.KeyCode.E;static const bC=h.KeyCode.F;static const dC=h.KeyCode.G;static const eC=h.KeyCode.H;static const gC=h.KeyCode.I;static const iC=h.KeyCode.J;static const kC=h.KeyCode.K;static const mC=h.KeyCode.L;static const oC=h.KeyCode.M;static const pC=h.KeyCode.N;static const qC=h.KeyCode.O;static const rC=h.KeyCode.P;static const sC=h.KeyCode.Q;static const tC=h.KeyCode.R;static const uC=h.KeyCode.S;static const vC=h.KeyCode.T;static const wC=h.KeyCode.U;static const xC=h.KeyCode.V;static const yC=h.KeyCode.W;static const zC=h.KeyCode.X;static const AD=h.KeyCode.Y;static const BD=h.KeyCode.Z;static const CD=h.KeyCode.SHIFT;static const DD=h.KeyCode.CTRL;static const ED=h.KeyCode.ALT;static const FD=h.KeyCode.SPACE;static const GD=h.KeyCode.ZERO;static const HD=h.KeyCode.ONE;static const ID=h.KeyCode.TWO;static const JD=h.KeyCode.THREE;static const KD=h.KeyCode.FOUR;static const LD=h.KeyCode.FIVE;static const MD=h.KeyCode.SIX;static const ND=h.KeyCode.SEVEN;static const OD=h.KeyCode.EIGHT;static const PD=h.KeyCode.NINE;static const QD=h.KeyCode.ENTER;static const RD=h.KeyCode.UP;static const SD=h.KeyCode.DOWN;static const fC=h.KeyCode.LEFT;static const jC=h.KeyCode.RIGHT;static const TD=h.KeyCode.ESC;static const UD=h.KeyCode.APOSTROPHE;static const VD=h.KeyCode.BACKSLASH;static const WD=h.KeyCode.BACKSPACE;static const XD=h.KeyCode.CAPS_LOCK;static const YD=h.KeyCode.CLOSE_SQUARE_BRACKET;static const ZD=h.KeyCode.COMMA;static const aD=h.KeyCode.CONTEXT_MENU;static const bD=h.KeyCode.DASH;static const cD=h.KeyCode.DELETE;static const dD=h.KeyCode.END;static const eD=h.KeyCode.EQUALS;static const fD=h.KeyCode.F1;static const gD=h.KeyCode.F2;static const hD=h.KeyCode.F3;static const iD=h.KeyCode.F4;static const jD=h.KeyCode.F5;static const kD=h.KeyCode.F6;static const lD=h.KeyCode.F7;static const mD=h.KeyCode.F8;static const nD=h.KeyCode.F9;static const oD=h.KeyCode.F10;static const pD=h.KeyCode.F11;static const qD=h.KeyCode.F12;static const rD=h.KeyCode.FF_EQUALS;static const sD=h.KeyCode.FF_SEMICOLON;static const tD=h.KeyCode.FIRST_MEDIA_KEY;static const uD=h.KeyCode.HOME;static const vD=h.KeyCode.INSERT;static const wD=h.KeyCode.LAST_MEDIA_KEY;static const xD=h.KeyCode.MAC_ENTER;static const yD=h.KeyCode.MAC_FF_META;static const zD=h.KeyCode.META;static const AE=h.KeyCode.NUM_CENTER;static const BE=h.KeyCode.NUM_DELETE;static const CE=h.KeyCode.NUM_DIVISION;static const DE=h.KeyCode.NUM_EAST;static const EE=h.KeyCode.NUM_EIGHT;static const FE=h.KeyCode.NUM_FIVE;static const GE=h.KeyCode.NUM_FOUR;static const HE=h.KeyCode.NUM_INSERT;static const IE=h.KeyCode.NUM_MINUS;static const JE=h.KeyCode.NUM_MULTIPLY;static const KE=h.KeyCode.NUM_NINE;static const LE=h.KeyCode.NUM_NORTH;static const ME=h.KeyCode.NUM_NORTH_EAST;static const NE=h.KeyCode.NUM_NORTH_WEST;static const OE=h.KeyCode.NUM_ONE;static const PE=h.KeyCode.NUM_PERIOD;static const QE=h.KeyCode.NUM_PLUS;static const RE=h.KeyCode.NUM_SEVEN;static const SE=h.KeyCode.NUM_SIX;static const TE=h.KeyCode.NUM_SOUTH;static const UE=h.KeyCode.NUM_SOUTH_EAST;static const VE=h.KeyCode.NUM_SOUTH_WEST;static const WE=h.KeyCode.NUM_THREE;static const XE=h.KeyCode.NUM_TWO;static const YE=h.KeyCode.NUM_WEST;static const ZE=h.KeyCode.NUM_ZERO;static const aE=h.KeyCode.NUMLOCK;static const bE=h.KeyCode.OPEN_SQUARE_BRACKET;static const cE=h.KeyCode.PAGE_UP;static const dE=h.KeyCode.PAGE_DOWN;static const eE=h.KeyCode.PAUSE;static const fE=h.KeyCode.PERIOD;static const gE=h.KeyCode.PRINT_SCREEN;static const hE=h.KeyCode.QUESTION_MARK;static const iE=h.KeyCode.SCROLL_LOCK;static const jE=h.KeyCode.SEMICOLON;static const kE=h.KeyCode.SINGLE_QUOTE;static const lE=h.KeyCode.SLASH;static const mE=h.KeyCode.TAB;static const nE=h.KeyCode.TILDE;static const oE=h.KeyCode.WIN_IME;static const pE=h.KeyCode.WIN_KEY;static const qE=h.KeyCode.WIN_KEY_FF_LINUX;static const rE=h.KeyCode.WIN_KEY_LEFT;static const sE=h.KeyCode.WIN_KEY_RIGHT;static final  lC=[VC,WC,YC,ZC,aC,bC,dC,eC,gC,iC,kC,mC,oC,pC,qC,rC,sC,tC,uC,vC,wC,xC,yC,zC,AD,BD,CD,DD,ED,FD,GD,HD,ID,JD,KD,LD,MD,ND,OD,PD,QD,RD,SD,fC,jC,TD,UD,VD,WD,XD,YD,ZD,aD,bD,cD,dD,eD,fD,gD,hD,iD,jD,kD,lD,mD,nD,oD,pD,qD,rD,sD,tD,uD,vD,wD,xD,yD,zD,AE,BE,CE,DE,EE,FE,GE,HE,IE,JE,KE,LE,ME,NE,OE,PE,QE,RE,SE,TE,UE,VE,WE,XE,YE,ZE,aE,bE,cE,dE,eE,fE,gE,hE,iE,jE,kE,lE,mE,nE,oE,pE,qE,rE,sE];TC(g):super(g,lC);}typedef  UC( gameLoop);class oB implements jB{final  x;final  y;final  dx;final  dy;final  time;final  n;oB(this.x,this.y,this.dx,this.dy,this.time,this.n);}typedef  XC( gameLoop);typedef  cC( gameLoop);class pB extends VB implements jB{static const fC=0;static const hC=1;static const jC=2;static final  lC=[fC,hC,jC];var iF=0; get dx=>iF;var mF=0; get dy=>mF;var qF=0; get x=>qF;var rF=0; get y=>rF;var sF=0; get XB=>sF;var vF=0; get YB=>vF;var wF=0;var zF=0;var AG=false; get gB=>AG;var CG=0.0; get time=>CG;var GG=0; get n=>GG;pB(g):super(g,lC); wE( g){qF=g.x;rF=g.y;CG=g.time;GG=g.n;iF+= g.dx;mF+= g.dy;sF=g.XB;vF=g.YB;AG=g.gB;} MG( i, g){wF+= i;zF+= g;} NG(){wF=0;zF=0;iF=0;mF=0;}}typedef  qB( gameLoop, touch);class NB{final  id;final  DF=new List<oB>();NB(this.id);}class WB extends q{final  element;var gF=0;var hF=false;var jF=false;var kF;var lF=0.0;var nF=false;var oF=0.0; get n=>gF;var cB=0.03;var tF=0.0; get width=>element.client.width; get height=>element.client.height;var xF=0.0; get OB=>xF;var yF=0.0;var GF=0.05;var BG;var EG;var HG; get CF=>HG;var IG;var JG=new h.Point(0,0);var KG;WB(this.element):super(){EG=new TC(this);HG=new pB(this);IG=new RC(this);BG=new PC(this);KG=new nC(this);} OG(){PG();RG();SG();} PG(){for(h.KeyboardEvent g in TG){var i;var CB=g.type=="keydown";var s=q.UB(g.timeStamp);var j=g.keyCode;i=new TB(j,CB,n,s);EG.sB(i);}TG.clear();} RG(){CF.NG();final BC=h.document.documentElement;final CC=element.getBoundingClientRect();var CB=(CC.left+h.window.pageXOffset-BC.clientLeft).floor();var HB=(CC.top+h.window.pageYOffset-BC.clientTop).floor();for(h.MouseEvent g in UG){var KF=g.type=='mousemove';var LF=g.type=='mousewheel';var MF=g.type=='mousedown';var DC=q.UB(g.timeStamp);if(KF){var hB=g.page.x;var GB=g.page.y;var EC=hB-CB;var FC=GB-HB;var s=0;var i=0;var j=false;if(hB<CB){s=0;}else if(hB>CB+width){s=width;}else{s=EC;j=true;}if(GB<HB){i=0;j=false;}else if(GB>HB+height){i=height;j=false;}else{i=FC;}var MB,LB;if(BG.BF){MB=g.movement.x;LB=g.movement.y;}else{MB=g.client.x-JG.x;LB=g.client.y-JG.y;JG=g.client;}JG=g.client;var iB=new QC(EC,FC,MB,LB,s,i,j,DC,n);HG.wE(iB);}else if(LF){var GC=g as h.WheelEvent;HG.MG(GC.deltaX,GC.deltaY);}else{var NF=g.button;var iB=new TB(NF,MF,n,DC);HG.sB(iB);}}UG.clear();} SG(){for(AB g in VG){switch (g.type){case AB.nB:KG.uF(g.event);break;case AB.mB:KG.FG(g.event);break;case AB.lB:KG.LG(g.event);break;default:throw new StateError('Invalid _GameLoopTouchEven type.');}}VG.clear();}var WG; XG( YG){if(kF==null){lF=time;kF=lF;OG();WG=h.window.requestAnimationFrame(XG);return;}if(jF==true){WG=null;return;}WG=h.window.requestAnimationFrame(XG);gF++ ;kF=lF;lF=time;var g=lF-kF;tF+= g;if(tF>cB){tF=cB;}OG();while (tF>=KB){EF();xF+= KB;if(eB!=null){eB(this);}tF-= KB;}if(nF==true&&onResize!=null&&oF<=lF){onResize(this);oF=lF+GF;nF=false;}if(dB!=null){yF=tF/KB;dB(this);}} ZG( YG){if(onFullscreenChange==null){return;}onFullscreenChange(this);} aG( YG){if(onFullscreenChange==null){return;}onFullscreenChange(this);}final  VG=new List<AB>(); bG( g){VG.add(new AB(g,AB.nB));g.preventDefault();} cG( g){VG.add(new AB(g,AB.lB));g.preventDefault();} dG( g){VG.add(new AB(g,AB.mB));g.preventDefault();}final  TG=new List<h.KeyboardEvent>(); eG( g){TG.add(g);} fG( g){TG.add(g);}final  UG=new List<h.MouseEvent>(); gG( g){UG.add(g);} hG( g){UG.add(g);} iG( g){UG.add(g);} jG( g){UG.add(g);g.preventDefault();} kG( YG){if(nF==false){nF=true;}} start(){if(hF==false){h.document.onFullscreenError.listen(aG);h.document.onFullscreenChange.listen(ZG);element.onTouchStart.listen(bG);element.onTouchEnd.listen(dG);element.onTouchCancel.listen(dG);element.onTouchMove.listen(cG);h.window.onKeyDown.listen(eG);h.window.onKeyUp.listen(fG);h.window.onResize.listen(kG);element.onMouseMove.listen(iG);element.onMouseDown.listen(gG);element.onMouseUp.listen(hG);element.onMouseWheel.listen(jG);hF=true;}jF=false;WG=h.window.requestAnimationFrame(XG);}var dB;var onResize;var onFullscreenChange;var onPointerLockChange;var onTouchStart;var onTouchEnd;}class nC{final  u=new Map<int,NB>();final  l;nC(this.l); pF( j, g){var i=new oB(g.page.x,g.page.y,0,0,l.OB,l.n);j.DF.add(i);} uF( j){j.changedTouches.forEach(( g){var i=new NB(g.identifier);if(u[g.identifier]!=null){return;}assert(u[g.identifier]==null);u[g.identifier]=i;pF(i,g);if(l.onTouchStart!=null){l.onTouchStart(l,i);}});DG(j.touches);} FG( j){j.changedTouches.forEach(( i){var g=u[i.identifier];if(g==null){return;}assert(g!=null);u.remove(i.identifier);pF(g,i);if(l.onTouchEnd!=null){l.onTouchEnd(l,g);}});DG(j.touches);} LG( i){i.changedTouches.forEach(( g){var j=u[g.identifier];pF(j,g);});DG(i.touches);} QG( i,j){for(int g=0;g<i.length;g++ ){if(i[g].identifier==j){return true;}}return false;}DG( g){if(g.length!=u.length){print('${g.length} ${u.length}');}u.forEach((i,j){if(!QG(g,i)){print('Did not find ${i}');}});}}