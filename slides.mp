verbatimtex
%&latex
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}

\begin{document}
etex

input TEX;

filenametemplate "%j%c.mps";

u := 30;

color blue; blue := (0, 176/255, 240/255);
color darkblue; darkblue := (0, 112/255, 192/255);

color red; red := (240/255, 0, 44/255);
color darkred; darkred := (192/255, 0, 28/255);

color green; green := (44/255, 240/255, 0);
color darkgreen; darkgreen := (28/255, 192/255, 0);

color gray; gray := (192/255, 192/255, 192/255);
color darkgray; darkgray := (86/255, 86/255, 86/255);

color orange; orange := (240/255, 176/255, 0);
color darkorange; darkorange := (192/255, 112/255, 0);

color abs; abs := blue;
color darkabs; darkabs := darkblue;

color con; con := orange;
color darkcon; darkcon := darkorange;

color coa; coa := gray;
color darkcoa; darkcoa := darkgray;

def node(expr o, l, ci, cii) =
  begingroup
    picture r;

    r := image(
      fill fullcircle scaled u shifted o withcolor cii;
      draw fullcircle scaled u shifted o withpen pencircle scaled 1.5 withcolor ci;
      label(l, o) withcolor white;
    );

    r
  endgroup
enddef;

def edge(expr o, d, l, c) =
  begingroup
    path p;
    picture r;
    pair a;

    a := (d - o) rotated -90;
    a := point 1 of (((0,0)--a) cutafter fullcircle scaled 0.5u);

    p := ((o--d) cutbefore (fullcircle scaled (u + 1.5) shifted o) cutafter (fullcircle scaled (u + 1.5) shifted d));

    r := image(
      drawarrow p withpen pencircle scaled 1.5 withcolor c;
      label(l, (point 0.5 of p) + a) withcolor c;
    );

    r
  endgroup
enddef;

def nonedge(expr o, d, l, c) =
  begingroup
    path p;
    picture r;
    pair a;

    a := (d - o) rotated -90;
    a := point 1 of (((0,0)--a) cutafter fullcircle scaled 0.5u);

    p := ((o--d) cutbefore (fullcircle scaled (u + 1.5) shifted o) cutafter (fullcircle scaled (u + 1.5) shifted d));

    r := image(
      drawarrow p withpen pencircle scaled 1.5 withcolor c dashed evenly;
      label(l, (point 0.5 of p) + a) withcolor c;
    );

    r
  endgroup
enddef;

picture ctrav, atrav;

ctrav := image(
  draw edge((0, 0), (1.5u,  u), btex etex, darkcon);
  draw edge((0, 0), (1.5u, -u), btex etex, darkcoa);

  draw edge((1.5u, u), (1.5u, -u), btex etex, darkcoa);
  draw edge((1.5u, u), (  3u, 2u), btex etex, darkcoa);
  draw edge((1.5u, u), (  3u,  0), btex etex, darkcon);

  draw edge((1.5u, -u), (3u, -2u), btex etex, darkcoa);

  draw edge((3u, 2u), (  3u,  0), btex etex, darkcoa);
  draw edge((3u, 2u), (4.5u, 3u), btex etex, darkcoa);
  draw edge((3u, 2u), (4.5u,  u), btex etex, darkcoa);

  draw edge((3u, 0), (4.5u,  u), btex etex, darkcon);
  draw edge((3u, 0), (4.5u, -u), btex etex, darkcoa);

  draw edge((3u, -2u), (4.5u,  -u), btex etex, darkcoa);
  draw edge((3u, -2u), (4.5u, -3u), btex etex, darkcoa);

  draw edge((4.5u, -3u), (4.5u, -u), btex etex, darkcoa);

  draw node((0, 0), btex etex, darkcon, con);

  draw node((1.5u,  u), btex etex, darkcon, con);
  draw node((1.5u, -u), btex etex, darkcoa, coa);

  draw node((3u,  2u), btex etex, darkcoa, coa);
  draw node((3u,   0), btex etex, darkcon, con);
  draw node((3u, -2u), btex etex, darkcoa, coa);

  draw node((4.5u,  3u), btex etex, darkcoa, coa);
  draw node((4.5u,   u), btex etex, darkcon, con);
  draw node((4.5u,  -u), btex etex, darkcoa, coa);
  draw node((4.5u, -3u), btex etex, darkcoa, coa);
);

atrav := image(
  numeric alpha, beta;
  pair a, b, c, d, e, f, g, h, i, j, xi, yi, xii, yii;

  alpha := angle(1.5, 1);
  beta := alpha - 10;

  a := (4.5u, -2u);
  b := (   0,   u) rotated -alpha shifted (1.5u, -u);
  c := (   0,   u) rotated  beta  shifted (1.5u, -u);
  d := (   0,  -u) rotated  beta  shifted (   0,  0);
  e := (   0,   u) rotated  alpha shifted (   0,  0);
  f := (   0,   u) rotated  alpha shifted (1.5u,  u);
  g := (   0,   u) rotated -beta  shifted (1.5u,  u);
  h := (   0,  -u) rotated -beta  shifted (  3u, 2u);
  i := (   0,  -u) rotated  alpha shifted (  3u, 2u);
  j := (4.5u,  2u);

  xi := a shifted (0.75u, -0.5u);
  xii := xi shifted (0.2u, 0);

  yi := j shifted (0.75u,  0.5u);
  yii := yi shifted (0.2u, 0);

%  path absshape;
%
%  absshape :=
%    a                                                                            ..
%    (         (fullcircle scaled 2u shifted (1.5u, -u) ) cutbefore b cutafter c) ..
%    ((reverse (fullcircle scaled 2u shifted (   0,  0))) cutbefore d cutafter e) ..
%    ((reverse (fullcircle scaled 2u shifted (1.5u, 1u))) cutbefore f cutafter g) ..
%    (         (fullcircle scaled 2u shifted (  3u, 2u) ) cutbefore h cutafter i) ..
%    j;
%
%  numeric enter, leave;
%
%  enter := angle direction 0                of absshape;
%  leave := angle direction length(absshape) of absshape;
%
%  fill xi .. {dir enter}absshape{dir leave} .. yi -- cycle withcolor 0.5 abs + 0.5 white;
%  draw absshape withpen pencircle scaled 1.5 withcolor darkabs;
%  drawarrow a{dir (180 + enter)} .. xi -- xii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
%  drawarrow j{dir (      leave)} .. yi -- yii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;

  pair xi, xii, xiii, yi, yii, yiii;
  path envelope, envelopei, envelopeii, envelopeiii, envelopeiv, envelopev;

  envelopei   := (fullcircle scaled 2u);
  xi := point length(envelopei) / 4 of envelopei;
  yi := point length(envelopei) - length(envelopei) / 4 of envelopei;

  envelopei   := envelopei cutbefore xi cutafter yi;

  envelopeii  := (fullcircle scaled 2u);
  xi :=  point length(envelopeii) / 4 of envelopeii;
  yi := (point length(envelopeii) / 2 of envelopeii) rotated -angle (1.5u, u);

  envelopeii  := envelopeii cutbefore xi cutafter yi;

  envelopei   :=  envelopei   rotated  angle (1.5u, u);
  envelopeii  := (envelopeii  rotated -angle (1.5u, u)) shifted (1.5u,  u);
  envelopeiii := (1.5u, -0.25u) rotatedaround ((1.5u, u), 0.125 angle (1.5u, -u));
  envelopeiv  := (0.5[(3u, 2u), (4.5u, u)] rotatedaround ((3u, 2u), -angle (1.5u, u)) + (1.5u, u)) -- 0.5[(3u, 2u), (4.5u, u)] rotatedaround ((3u, 2u), -angle (1.5u, u));
  envelopev   := (3u, -u) .. (3u, -u) + (1.5u, -u);

  envelope := envelopeiv {dir 210} .. envelopeii .. envelopei .. envelopeiii .. {dir angle (1.5u, -u)}envelopev;

  xi := point 0 of envelope;
  yi := point length(envelope) of envelope;

  xii  := xi + 0.25(1.5u, u);
  xiii := xii + 0.125(1.5u, u);

  yii  := yi + 0.25(1.5u, -u);
  yiii := yii + 0.125(1.5u, -u);

  numeric enter, leave;

  enter := angle direction 0 of envelope;
  leave := angle direction length(envelope) of envelope;

  path arc;

  arc := yii {dir 60} .. {dir 110} xii;

  fill (xii {dir (180 + angle (1.5u, u))} .. envelope .. yii) -- arc -- cycle withcolor 0.5abs + 0.5white;
  drawarrow xi{dir (180 + enter)} .. {dir angle (1.5u, u)} xii -- xiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
  drawarrow yi{dir        leave } .. yii -- yiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
  draw envelope withpen pencircle scaled 1.5 withcolor darkabs;

  draw edge((0, 0), (1.5u,  u), btex etex, darkcon);
  draw edge((0, 0), (1.5u, -u), btex etex, darkcoa);

  draw edge((1.5u, u), (1.5u, -u), btex etex, darkcoa);
  draw edge((1.5u, u), (  3u, 2u), btex etex, darkcoa);
  draw edge((1.5u, u), (  3u,  0), btex etex, darkcon);

  draw edge((1.5u, -u), (3u, -2u), btex etex, darkcoa);

  draw edge((3u, 2u), (  3u,  0), btex etex, darkcoa);
  draw edge((3u, 2u), (4.5u, 3u), btex etex, darkcoa);
  draw edge((3u, 2u), (4.5u,  u), btex etex, darkcoa);

  draw edge((3u, 0), (4.5u,  u), btex etex, darkcon);
  draw edge((3u, 0), (4.5u, -u), btex etex, darkabs);

  draw edge((3u, -2u), (4.5u,  -u), btex etex, darkcoa);
  draw edge((3u, -2u), (4.5u, -3u), btex etex, darkcoa);

  draw edge((4.5u, -3u), (4.5u, -u), btex etex, darkcoa);

  draw node((0, 0), btex etex, darkcon, con);

  draw node((1.5u,  u), btex etex, darkcon, con);
  draw node((1.5u, -u), btex etex, darkcoa, coa);

  draw node((3u,  2u), btex etex, darkcoa, coa);
  draw node((3u,   0), btex etex, darkcon, con);
  draw node((3u, -2u), btex etex, darkcoa, coa);

  draw node((4.5u,  3u), btex etex, darkcoa, coa);
  draw node((4.5u,   u), btex etex, darkcon, con);
  draw node((4.5u,  -u), btex etex, darkabs, abs);
  draw node((4.5u, -3u), btex etex, darkcoa, coa);
);

beginfig(1)
  draw ctrav;

  setbounds currentpicture to bbox(image(draw ctrav; draw atrav;));
endfig;

beginfig(2)
  draw atrav;

  setbounds currentpicture to bbox(image(draw ctrav; draw atrav;));
endfig;

beginfig(3)
  draw node((0, 0), btex etex, darkabs, abs);
endfig;

beginfig(4)
  draw node((0, 0), btex etex, darkcoa, coa);
endfig;

beginfig(5)
  %draw edge((0, 0), (0.5u, 0.5u), btex etex, darkcon);
  draw node((0, 0), btex etex, darkcon, con);
endfig;

picture s, si, sii, siii, siv, tv, tvi, tvii;
picture t, ti, tii, tiii, tiv, sv, svi, svii;

si := image(
  draw node((0, 0), btex etex, darkcon, con);
);

sii := image(
  draw edge((0, 0), (1.5u, u), btex etex, darkcon);
  draw node((1.5u, u), btex etex, darkcon, con);
  draw si;
);

siii := image(
  draw edge((1.5u, u), (3u, 0), btex etex, darkcon);
  draw node((3u, 0), btex etex, darkcon, con);
  draw sii;
);

siv := image(
  draw edge((3u, 0), (4.5u, u), btex etex, darkcon);
  draw node((4.5u, u), btex etex, darkcon, con);
  draw siii;
);

sv := image(
  draw edge((1.5u, u), (3u, 0), btex etex, 0.5darkcon + 0.5white);
  draw edge((3u, 0), (4.5u, u), btex etex, 0.5darkcon + 0.5white);
  draw node((3u, 0), btex etex, 0.5darkcon + 0.5white, 0.5con + 0.5white);
  draw node((4.5u, u), btex etex, 0.5darkcon + 0.5white, 0.5con + 0.5white);
  draw sii;
);

svi := image(
  draw edge((3u, 0), (4.5u, u), btex etex, 0.5darkcon + 0.5white);
  draw node((4.5u, u), btex etex, 0.5darkcon + 0.5white, 0.5con + 0.5white);
  draw siii;
);

svii := image(
  draw svi;
);

ti := image(
  picture envelope;

  envelope := image(
    pair xi, xii, xiii, yi, yii, yiii;
    path a;

    a := (fullcircle scaled 2u);

    xi := point length(a) / 5 of a;
    yi := point length(a) - length(a) / 5 of a;

    xii := xi scaled 1.125 rotated -30;
    yii := yi scaled 1.125 rotated  30;

    xiii := xii shifted (0.25u, 0);
    yiii := yii shifted (0.25u, 0);

    a := a cutbefore xi cutafter yi;

    numeric enter, leave;

    enter := angle direction 0 of a;
    leave := angle direction length(a) of a;

    fill (xii .. a .. yii) -- cycle withcolor 0.5abs + 0.5white;
    drawarrow xi{dir (180 + enter)} .. xii -- xiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
    drawarrow yi{dir        leave } .. yii -- yiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
    draw a withpen pencircle scaled 1.5 withcolor darkabs;
  );

  draw envelope rotated angle (1.5u, u);
  draw edge((0, 0), (1.5u, u), btex etex, darkcon);
  draw edge((0, 0), (1.5u, -u), btex etex, darkcoa);
  draw node((1.5u,  u), btex etex, darkcoa, coa);
  draw node((1.5u, -u), btex etex, darkcoa, coa);
  draw si;

  label(btex \tt\large $\text{s}_\text{1}$ etex, (   0,  0)) withcolor 0.5darkcon;
  label(btex \tt\large $\text{u}_\text{1}$ etex, (1.5u, -u)) withcolor 0.5darkcoa;
  label(btex \tt\large $\text{s}_\text{2}$ etex, (1.5u,  u)) withcolor 0.5darkcoa;
);

tii := image(
  pair xi, xii, xiii, yi, yii, yiii;
  path envelope, envelopei, envelopeii, envelopeiii;

  envelopei   := (fullcircle scaled 2u);
  xi := point length(envelopei) / 4 of envelopei;
  yi := point length(envelopei) - length(envelopei) / 4 of envelopei;

  envelopei   := envelopei cutbefore xi cutafter yi;

  envelopeii  := (fullcircle scaled 2u);
  xi :=  point length(envelopeii) / 5 of envelopeii;
  yi := (point length(envelopeii) / 2 of envelopeii) rotated -angle (1.5u, u);

  envelopeii  := envelopeii cutbefore xi cutafter yi;

  envelopei   :=  envelopei   rotated  angle (1.5u, u);
  envelopeii  := (envelopeii  rotated -angle (1.5u, u)) shifted (1.5u,  u);
  envelopeiii := (1.5u, 0) rotatedaround ((1.5u, u), 0.125 angle (1.5u, -u));

  envelope := envelopeii .. envelopei .. {right}envelopeiii;

  xi := point 0 of envelope;
  yi := point length(envelope) of envelope;

  xii  := xi rotatedaround ((1.5u, u), angle (1.5u, -u));
  xiii := xii shifted ((0.25u, 0) rotated angle (1.5u, -u));

  yii  := xii  reflectedabout ((1.5u, u), (3u, 0));
  yiii := xiii reflectedabout ((1.5u, u), (3u, 0));

  numeric enter, leave;

  enter := angle direction 0 of envelope;
  leave := angle direction length(envelope) of envelope;

  fill (xii .. envelope .. yii) -- cycle withcolor 0.5abs + 0.5white;
  drawarrow xi{dir (180 + enter)} .. xii -- xiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
  drawarrow yi{dir        leave } .. yii -- yiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
  draw envelope withpen pencircle scaled 1.5 withcolor darkabs;

  draw edge((0, 0), (1.5u, -u), btex etex, 0.5darkcoa + 0.5white);
  draw edge((1.5u, u), (3u, 2u), btex etex, darkcoa);
  draw edge((1.5u, u), (3u,  0), btex etex, darkcon);

  draw node((1.5u, -u), btex etex, 0.5darkcoa + 0.5white, 0.5coa + 0.5white);
  draw node((3u, 2u), btex etex, darkcoa, coa);
  draw node((3u,  0), btex etex, darkcoa, coa);

  draw sii;

  label(btex \tt\large $\text{s}_\text{2}$ etex, (1.5u,  u)) withcolor 0.5darkcon;
  label(btex \tt\large $\text{u}_\text{2}$ etex, (  3u, 2u)) withcolor 0.5darkcoa;
  label(btex \tt\large $\text{s}_\text{3}$ etex, (  3u,  0)) withcolor 0.5darkcoa;
);

tiii := image(
  pair xi, xii, xiii, yi, yii, yiii;
  path envelope, envelopei, envelopeii, envelopeiii, envelopeiv, envelopev;

  envelopei   := (fullcircle scaled 2u);
  xi := point length(envelopei) / 4 of envelopei;
  yi := point length(envelopei) - length(envelopei) / 4 of envelopei;

  envelopei   := envelopei cutbefore xi cutafter yi;

  envelopeii  := (fullcircle scaled 2u);
  xi :=  point length(envelopeii) / 4 of envelopeii;
  yi := (point length(envelopeii) / 2 of envelopeii) rotated -angle (1.5u, u);

  envelopeii  := envelopeii cutbefore xi cutafter yi;

  envelopei   :=  envelopei   rotated  angle (1.5u, u);
  envelopeii  := (envelopeii  rotated -angle (1.5u, u)) shifted (1.5u,  u);
  envelopeiii := (1.5u, -0.25u) rotatedaround ((1.5u, u), 0.125 angle (1.5u, -u));
  envelopeiv  := 0.5[(3u, 2u), (4.5u, u)] rotatedaround ((3u, 2u), -angle (1.5u, u));
  envelopev   := (3u, -u) .. (3u, -u) + 0.125(1.5u, -u);

  envelope := envelopeiv {dir 210} .. envelopeii .. envelopei .. envelopeiii .. {dir angle (1.5u, -u)}envelopev;

  xi := point 0 of envelope;
  yi := point length(envelope) of envelope;

  xii  := xi + 0.25(1.5u, u);
  xiii := xii + 0.125(1.5u, u);

  yii  := yi + 0.25(1.5u, -u);
  yiii := yii + 0.125(1.5u, -u);

  numeric enter, leave;

  enter := angle direction 0 of envelope;
  leave := angle direction length(envelope) of envelope;

  fill (xii {dir (180 + angle (1.5u, u))} .. envelope .. yii) -- cycle withcolor 0.5abs + 0.5white;
  drawarrow xi{dir (180 + enter)} .. {dir angle (1.5u, u)} xii -- xiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
  drawarrow yi{dir        leave } .. yii -- yiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
  draw envelope withpen pencircle scaled 1.5 withcolor darkabs;

  draw edge((0, 0), (1.5u, -u), btex etex, 0.5darkcoa + 0.5white);
  draw edge((1.5u, u), (3u, 2u), btex etex, 0.5darkcoa + 0.5white);
  draw edge((3u, 0), (4.5u,  u), btex etex, darkcon);
  draw edge((3u, 0), (4.5u, -u), btex etex, darkabs);

  draw node((1.5u, -u), btex etex, 0.5darkcoa + 0.5white, 0.5coa + 0.5white);
  draw node((3u, 2u), btex etex, 0.5darkcoa + 0.5white, 0.5coa + 0.5white);
  draw node((4.5u,  u), btex etex, darkcoa, coa);
  draw node((4.5u, -u), btex etex, darkcoa, coa);

  draw siii;

  label(btex \tt\large $\text{s}_\text{3}$ etex, (  3u,  0)) withcolor 0.5darkcon;
  label(btex \tt\large $\text{s}_\text{4}$ etex, (4.5u,  u)) withcolor 0.5darkcoa;
  label(btex \tt\large $\text{s}_\text{5}$ etex, (4.5u, -u)) withcolor 0.5darkcoa;
);

tiv := image(
  pair xi, xii, xiii, yi, yii, yiii;
  path envelope, envelopei, envelopeii, envelopeiii, envelopeiv, envelopev;

  envelopei   := (fullcircle scaled 2u);
  xi := point length(envelopei) / 4 of envelopei;
  yi := point length(envelopei) - length(envelopei) / 4 of envelopei;

  envelopei   := envelopei cutbefore xi cutafter yi;

  envelopeii  := (fullcircle scaled 2u);
  xi :=  point length(envelopeii) / 4 of envelopeii;
  yi := (point length(envelopeii) / 2 of envelopeii) rotated -angle (1.5u, u);

  envelopeii  := envelopeii cutbefore xi cutafter yi;

  envelopei   :=  envelopei   rotated  angle (1.5u, u);
  envelopeii  := (envelopeii  rotated -angle (1.5u, u)) shifted (1.5u,  u);
  envelopeiii := (1.5u, -0.25u) rotatedaround ((1.5u, u), 0.125 angle (1.5u, -u));
  envelopeiv  := (0.5[(3u, 2u), (4.5u, u)] rotatedaround ((3u, 2u), -angle (1.5u, u)) + (1.5u, u)) -- 0.5[(3u, 2u), (4.5u, u)] rotatedaround ((3u, 2u), -angle (1.5u, u));
  envelopev   := (3u, -u) .. (3u, -u) + 0.125(1.5u, -u);

  envelope := envelopeiv {dir 210} .. envelopeii .. envelopei .. envelopeiii .. {dir angle (1.5u, -u)}envelopev;

  xi := point 0 of envelope;
  yi := point length(envelope) of envelope;

  xii  := xi + 0.25(1.5u, u);
  xiii := xii + 0.125(1.5u, u);

  yii  := yi + 0.25(1.5u, -u);
  yiii := yii + 0.125(1.5u, -u);

  numeric enter, leave;

  enter := angle direction 0 of envelope;
  leave := angle direction length(envelope) of envelope;

  path arc;

  arc := yii {dir angle (1.5u, u)} .. {right}(4.5u, 0.25u){right}..{up}(4.5u + 0.75u, u){up} .. xii;

  fill (xii {dir (180 + angle (1.5u, u))} .. envelope .. yii) -- arc -- cycle withcolor 0.5abs + 0.5white;
  drawarrow xi{dir (180 + enter)} .. {dir angle (1.5u, u)} xii -- xiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
  drawarrow yi{dir        leave } .. yii -- yiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
  draw envelope withpen pencircle scaled 1.5 withcolor darkabs;

  draw edge((0, 0), (1.5u, -u), btex etex, 0.5darkcoa + 0.5white);
  draw edge((1.5u, u), (3u, 2u), btex etex, 0.5darkcoa + 0.5white);
  draw edge((3u, 0), (4.5u, -u), btex etex, darkabs);

  draw node((1.5u, -u), btex etex, 0.5darkcoa + 0.5white, 0.5coa + 0.5white);
  draw node((3u, 2u), btex etex, 0.5darkcoa + 0.5white, 0.5coa + 0.5white);
  draw node((4.5u, -u), btex etex, darkcoa, coa);

  draw siv;

  label(btex \tt\large $\text{s}_\text{4}$ etex, (4.5u, u)) withcolor 0.5darkcon;
);

tv := image(
  pair xi, xii, xiii, yi, yii, yiii;
  path envelope, envelopei, envelopeii, envelopeiii, envelopeiv, envelopev;

  envelopei   := (fullcircle scaled 2u);
  xi := point length(envelopei) / 4 of envelopei;
  yi := point length(envelopei) - length(envelopei) / 4 of envelopei;

  envelopei   := envelopei cutbefore xi cutafter yi;

  envelopeii  := (fullcircle scaled 2u);
  xi :=  point length(envelopeii) / 4 of envelopeii;
  yi := (point length(envelopeii) / 2 of envelopeii) rotated -angle (1.5u, u);

  envelopeii  := envelopeii cutbefore xi cutafter yi;

  envelopei   :=  envelopei   rotated  angle (1.5u, u);
  envelopeii  := (envelopeii  rotated -angle (1.5u, u)) shifted (1.5u,  u);
  envelopeiii := (1.5u, -0.25u) rotatedaround ((1.5u, u), 0.125 angle (1.5u, -u));
  envelopeiv  := (0.5[(3u, 2u), (4.5u, u)] rotatedaround ((3u, 2u), -angle (1.5u, u)) + (1.5u, u)) -- 0.5[(3u, 2u), (4.5u, u)] rotatedaround ((3u, 2u), -angle (1.5u, u));
  envelopev   := (3u, -u) .. (3u, -u) + 0.125(1.5u, -u);

  envelope := envelopeiv {dir 210} .. envelopeii .. envelopei .. envelopeiii .. {dir angle (1.5u, -u)}envelopev;

  xi := point 0 of envelope;
  yi := point length(envelope) of envelope;

  xii  := xi + 0.25(1.5u, u);
  xiii := xii + 0.125(1.5u, u);

  yii  := yi + 0.25(1.5u, -u);
  yiii := yii + 0.125(1.5u, -u);

  numeric enter, leave;

  enter := angle direction 0 of envelope;
  leave := angle direction length(envelope) of envelope;

  path arc;

  arc := yii {dir angle (1.5u, u)} .. {right}(4.5u, 0.25u){right}..{up}(4.5u + 0.75u, u){up} .. xii;

  fill (xii {dir (180 + angle (1.5u, u))} .. envelope .. yii) -- arc -- cycle withcolor 0.5abs + 0.5white;
  drawarrow xi{dir (180 + enter)} .. {dir angle (1.5u, u)} xii -- xiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
  drawarrow yi{dir        leave } .. yii -- yiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
  draw envelope withpen pencircle scaled 1.5 withcolor darkabs;

  draw edge((0, 0), (1.5u, -u), btex etex, 0.5darkcoa + 0.5white);
  draw edge((1.5u, u), (3u, 2u), btex etex, 0.5darkcoa + 0.5white);
  draw edge((3u, 0), (4.5u, -u), btex etex, darkabs);

  draw node((1.5u, -u), btex etex, 0.5darkcoa + 0.5white, 0.5coa + 0.5white);
  draw node((3u, 2u), btex etex, 0.5darkcoa + 0.5white, 0.5coa + 0.5white);
  draw node((4.5u, -u), btex etex, darkcoa, coa);

  draw sv;

  label(btex \tt\large $\text{s}_\text{2}$ etex, (1.5u, u)) withcolor 0.5darkcon;
  label(btex \tt\large $\text{s}_\text{3}'$ etex, (3u, 0)) withcolor 0.25darkcon + 0.5white;
);

tvi := image(
  pair xi, xii, xiii, yi, yii, yiii;
  path envelope, envelopei, envelopeii, envelopeiii, envelopeiv, envelopev;

  envelopei   := (fullcircle scaled 2u);
  xi := point length(envelopei) / 4 of envelopei;
  yi := point length(envelopei) - length(envelopei) / 4 of envelopei;

  envelopei   := envelopei cutbefore xi cutafter yi;

  envelopeii  := (fullcircle scaled 2u);
  xi :=  point length(envelopeii) / 4 of envelopeii;
  yi := (point length(envelopeii) / 2 of envelopeii) rotated -angle (1.5u, u);

  envelopeii  := envelopeii cutbefore xi cutafter yi;

  envelopei   :=  envelopei   rotated  angle (1.5u, u);
  envelopeii  := (envelopeii  rotated -angle (1.5u, u)) shifted (1.5u,  u);
  envelopeiii := (1.5u, -0.25u) rotatedaround ((1.5u, u), 0.125 angle (1.5u, -u));
  envelopeiv  := (0.5[(3u, 2u), (4.5u, u)] rotatedaround ((3u, 2u), -angle (1.5u, u)) + (1.5u, u)) -- 0.5[(3u, 2u), (4.5u, u)] rotatedaround ((3u, 2u), -angle (1.5u, u));
  envelopev   := (3u, -u) .. (3u, -u) + 0.125(1.5u, -u);

  envelope := envelopeiv {dir 210} .. envelopeii .. envelopei .. envelopeiii .. {dir angle (1.5u, -u)}envelopev;

  xi := point 0 of envelope;
  yi := point length(envelope) of envelope;

  xii  := xi + 0.25(1.5u, u);
  xiii := xii + 0.125(1.5u, u);

  yii  := yi + 0.25(1.5u, -u);
  yiii := yii + 0.125(1.5u, -u);

  numeric enter, leave;

  enter := angle direction 0 of envelope;
  leave := angle direction length(envelope) of envelope;

  path arc;

  arc := yii {dir angle (1.5u, u)} .. {right}(4.5u, 0.25u){right}..{up}(4.5u + 0.75u, u){up} .. xii;

  fill (xii {dir (180 + angle (1.5u, u))} .. envelope .. yii) -- arc -- cycle withcolor 0.5abs + 0.5white;
  drawarrow xi{dir (180 + enter)} .. {dir angle (1.5u, u)} xii -- xiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
  drawarrow yi{dir        leave } .. yii -- yiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
  draw envelope withpen pencircle scaled 1.5 withcolor darkabs;

  draw edge((0, 0), (1.5u, -u), btex etex, 0.5darkcoa + 0.5white);
  draw edge((1.5u, u), (3u, 2u), btex etex, 0.5darkcoa + 0.5white);
  draw edge((3u, 0), (4.5u, -u), btex etex, darkcon);

  draw node((1.5u, -u), btex etex, 0.5darkcoa + 0.5white, 0.5coa + 0.5white);
  draw node((3u, 2u), btex etex, 0.5darkcoa + 0.5white, 0.5coa + 0.5white);
  draw node((4.5u, -u), btex etex, darkcoa, coa);

  draw svi;

  label(btex \tt\large $\text{s}_\text{3}'$ etex, (3u, 0)) withcolor 0.5darkcon;
  label(btex \tt\large $\text{s}_\text{5}$ etex, (4.5u, -u)) withcolor 0.5darkcoa;
);

tvii := image(
  pair xi, xii, xiii, yi, yii, yiii;
  path envelope, envelopei, envelopeii, envelopeiii, envelopeiv, envelopev;

  envelopei   := (fullcircle scaled 2u);
  xi := point length(envelopei) / 4 of envelopei;
  yi := point length(envelopei) - length(envelopei) / 4 of envelopei;

  envelopei   := envelopei cutbefore xi cutafter yi;

  envelopeii  := (fullcircle scaled 2u);
  xi :=  point length(envelopeii) / 4 of envelopeii;
  yi := (point length(envelopeii) / 2 of envelopeii) rotated -angle (1.5u, u);

  envelopeii  := envelopeii cutbefore xi cutafter yi;

  envelopei   :=  envelopei   rotated  angle (1.5u, u);
  envelopeii  := (envelopeii  rotated -angle (1.5u, u)) shifted (1.5u,  u);
  envelopeiii := (1.5u, -0.25u) rotatedaround ((1.5u, u), 0.125 angle (1.5u, -u));
  envelopeiv  := (0.5[(3u, 2u), (4.5u, u)] rotatedaround ((3u, 2u), -angle (1.5u, u)) + (1.5u, u)) -- 0.5[(3u, 2u), (4.5u, u)] rotatedaround ((3u, 2u), -angle (1.5u, u));
  envelopev   := (3u, -u) .. (3u, -u) + (1.5u, -u);

  envelope := envelopeiv {dir 210} .. envelopeii .. envelopei .. envelopeiii .. {dir angle (1.5u, -u)}envelopev;

  xi := point 0 of envelope;
  yi := point length(envelope) of envelope;

  xii  := xi + 0.25(1.5u, u);
  xiii := xii + 0.125(1.5u, u);

  yii  := yi + 0.25(1.5u, -u);
  yiii := yii + 0.125(1.5u, -u);

  numeric enter, leave;

  enter := angle direction 0 of envelope;
  leave := angle direction length(envelope) of envelope;

  path arc;

  arc := yii {dir 60} .. {dir 110} xii;

  fill (xii {dir (180 + angle (1.5u, u))} .. envelope .. yii) -- arc -- cycle withcolor 0.5abs + 0.5white;
  drawarrow xi{dir (180 + enter)} .. {dir angle (1.5u, u)} xii -- xiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
  drawarrow yi{dir        leave } .. yii -- yiii withpen pencircle scaled 1.5 withcolor darkabs dashed evenly;
  draw envelope withpen pencircle scaled 1.5 withcolor darkabs;

  draw edge((0, 0), (1.5u, -u), btex etex, 0.5darkcoa + 0.5white);
  draw edge((1.5u, u), (3u, 2u), btex etex, 0.5darkcoa + 0.5white);
  draw edge((3u, 0), (4.5u, -u), btex etex, darkcon);

  draw node((1.5u, -u), btex etex, 0.5darkcoa + 0.5white, 0.5coa + 0.5white);
  draw node((3u, 2u), btex etex, 0.5darkcoa + 0.5white, 0.5coa + 0.5white);
  draw node((4.5u, -u), btex etex, darkcon, con);

  draw svii;

  label(btex \tt\large $\text{s}_\text{5}$ etex, (4.5u, -u)) withcolor 0.5darkcon;
);

t := image(
  draw ti;
  draw tii;
  draw tiii;
  draw tiv;
  draw tv;
  draw tvi;
  draw tvii;
);

beginfig(6)
  draw ti;

  setbounds currentpicture to bbox(t);
endfig;

beginfig(7)
  draw tii;

  setbounds currentpicture to bbox(t);
endfig;

beginfig(8)
  draw tiii;

  setbounds currentpicture to bbox(t);
endfig;

beginfig(9)
  draw tiv;

  setbounds currentpicture to bbox(t);
endfig;

beginfig(10)
  draw tv;

  setbounds currentpicture to bbox(t);
endfig;

beginfig(11)
  draw tvi;

  setbounds currentpicture to bbox(t);
endfig;

beginfig(12)
  draw tvii;

  setbounds currentpicture to bbox(t);
endfig;

end

verbatimtex
\end{document}
etex

.
