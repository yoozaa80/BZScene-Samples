unit BaseTestCase;

{$mode objfpc}{$H+}
{$CODEALIGN LOCALMIN=16}
{$CODEALIGN CONSTMIN=16}

interface

uses
  Classes, SysUtils, fpcunit, testregistry,
  native, BZVectorMath, BZVectorMathEx;

type

  { TVectorNumericsTestCase }
  TBaseTestCase = class(TTestCase)
  public
     Ir1, Ir2: integer;
     Fs1,Fs2 : Single;
     nb, vb, ab: boolean;
  end;


  TVectorBaseTestCase = class(TBaseTestCase)
  protected
    procedure Setup; override;
    public
     {$CODEALIGN RECORDMIN=16}
     vtt1,vtt2, vtt3, vtt4: TBZVector2f;
     vttd1,vttd2, vttd3, vttd4: TBZVector2d;
     vt1,vt2, vt3, vt4 : TBZVector4f;
     at1, at2, at3, at4, vorg: TBZVector4f;
     ntt1,ntt2, ntt3 : TNativeBZVector2f;
     nttd1,nttd2, nttd3 : TNativeBZVector2d;
     vt2i  : TBZVector2i;
     vt4i  : TBZVector4i;
     nt2i  : TNativeBZVector2i;
     nt4i  : TNativeBZVector4i;
     nt1,nt2, nt3 : TNativeBZVector4f;
     ant1,ant2, ant3, ant4, norg : TNativeBZVector4f;
     {$CODEALIGN RECORDMIN=4}
     r1, rs : Single;
     rd1, rds : Double;
     Res: boolean;
    published
  end;

  { TByteVectorBaseTestCase }

  TByteVectorBaseTestCase = class(TBaseTestCase)
    protected
      procedure Setup; override;
    public
     {$CODEALIGN RECORDMIN=4}
     nbt1, nbt2, nbt3, nbt4: TNativeBZVector3b;
     nbf1, nbf2, nbf3, nbf4: TNativeBZVector4b;
     abt1, abt2, abt3, abt4: TBZVector3b;
     abf1, abf2, abf3, abf4: TBZVector4b;
     {$CODEALIGN RECORDMIN=1}
     b1, b2, b3, b4, b5, b6, b7, b8: byte;
     {$CODEALIGN RECORDMIN=4}

  end;

  { TIntVectorBaseTestCase }

  TIntVectorBaseTestCase = class(TBaseTestCase)
    protected
      procedure Setup; override;
    public
     {$CODEALIGN RECORDMIN=16}
     n3it1, n3it2, n3it3, n3it4: TNativeBZVector3i;
     n4it1, n4it2, n4it3, n4it4: TNativeBZVector4i;
     a3it1, a3it2, a3it3, a3it4: TBZVector3i;
     a4it1, a4it2, a4it3, a4it4: TBZVector4i;
     {$CODEALIGN RECORDMIN=4}
     b1, b2, b3, b4, b5, b6, b7, b8: integer;
  end;

  { TBBoxBaseTestCase }

  TBBoxBaseTestCase = class(TVectorBaseTestCase)
    protected
      procedure Setup; override;
    public
     {$CODEALIGN RECORDMIN=16}
      nbb1,nbb2,nbb3: TNativeBZBoundingBox;
      abb1,abb2,abb3: TBZBoundingBox;
      nbs1,nbs2,nbs3: TNativeBZBoundingSphere;
      abs1,abs2,abs3: TBZBoundingSphere;
      naabb1,naabb2,naabb3: TNativeBZAxisAlignedBoundingBox;
      aaabb1,aaabb2,aaabb3: TBZAxisAlignedBoundingBox;
      {$CODEALIGN RECORDMIN=4}
  end;


  TReportGroup = (rgBaseMath, rgVector2f,rgVector2d, rgVector2i, rgVector3b, rgVector4b, rgVector4i,
                   rgVector4f, rgMatrix4f, rgQuaterion, rgBBox, rgBSphere,
                   rgAABB, rgPlaneHelper);

const
  REPORT_GROUP_BASE = 'Base Math';
  REPORT_GROUP_VECTOR2F = 'Vector2f';
  REPORT_GROUP_VECTOR2D = 'Vector2d';
  REPORT_GROUP_VECTOR2I = 'Vector2i';
  REPORT_GROUP_VECTOR3B = 'Vector3b';
  REPORT_GROUP_VECTOR4B = 'Vector4b';
  REPORT_GROUP_VECTOR4I = 'Vector4i';
  REPORT_GROUP_VECTOR4F = 'Vector4f';
  REPORT_GROUP_MATRIX4F = 'Matrix4f' ;
  REPORT_GROUP_QUATERION = 'Quaternion' ;
  REPORT_GROUP_BBOX = 'BoundingBox' ;
  REPORT_GROUP_BSPHERE = 'BoundingSphere';
  REPORT_GROUP_AABB = 'AABoundingBox';
  REPORT_GROUP_PLANE_HELP = 'HmgPlane';

  rgArray: Array[TReportGroup] of string = (
              REPORT_GROUP_BASE,
              REPORT_GROUP_VECTOR2F,
              REPORT_GROUP_VECTOR2D,
              REPORT_GROUP_VECTOR2I,
              REPORT_GROUP_VECTOR3B,
              REPORT_GROUP_VECTOR4B,
              REPORT_GROUP_VECTOR4I,
              REPORT_GROUP_VECTOR4F,
              REPORT_GROUP_MATRIX4F,
              REPORT_GROUP_QUATERION,
              REPORT_GROUP_BBOX,
              REPORT_GROUP_BSPHERE,
              REPORT_GROUP_AABB,
              REPORT_GROUP_PLANE_HELP
              );

implementation

{ TIntVectorBaseTestCase }

procedure TIntVectorBaseTestCase.Setup;
begin
  inherited Setup;
//  n3it1.Create(12, 124, 253);  in advance of the code appearing
//  n3it2.Create(253, 124, 12);
//  a3it1.V := n3it1.V;
//  a3it2.V := n3it2.V;
  n4it1.Create(12, 124, 253, 0);
  n4it2.Create(253, 124, 12, 255);
  a4it1.V := n4it1.V;
  a4it2.V := n4it2.V;
  b1 := 3;    // three small
  b2 := 4;
  b3 := 5;
  b4 := 10;
  b5 := 2345;  // three large
  b6 := 2248;
  b7 := 2255;
  b8 := 10;
  Fs1 := 1.5;
  Fs2 := 5.5;
end;

{ TBBoxBaseTestCase }

procedure TBBoxBaseTestCase.Setup;
begin
  inherited Setup;
  nbb1.Create(nt1);
  abb1.Create(vt1);
  nbb2.Create(nt2);
  abb2.Create(vt2);
  nbs1.Create(nt1, 1.356);
  abs1.Create(vt1, 1.356);
  nbs2.Create(nt2, 8.435);
  abs2.Create(vt2, 8.435);
  naabb1.Create(nbs1);
  aaabb1.Create(abs1);
  naabb2.Create(nbs2);
  aaabb2.Create(abs2);
end;



procedure TByteVectorBaseTestCase.Setup;
begin
  inherited Setup;
  nbt1.Create(12, 124, 253);
  nbt2.Create(253, 124, 12);
  abt1.V := nbt1.V;
  abt2.V := nbt2.V;
  nbf1.Create(12, 124, 253, 0);
  nbf2.Create(253, 124, 12, 255);
  abf1.V := nbf1.V;
  abf2.V := nbf2.V;
  b1 := 3;    // three small bytes
  b2 := 4;
  b3 := 5;    // b4 can be used as a result
  b5 := 245;  // three large bytes
  b6 := 248;
  b7 := 255;  //b8 can be used as a result.
end;

procedure TVectorBaseTestCase.Setup;
begin
  vtt1.Create(5.850,4.525);
  vtt2.Create(1.558,6.512);
  ntt1.V := vtt1.V;
  ntt2.V := vtt2.V;

  vttd1.Create(5.850,4.525);
  vttd2.Create(1.558,6.512);
  nttd1.V := vttd1.V;
  nttd2.V := vttd2.V;

  vt1.Create(5.850,-15.480,8.512,1.5);
  vt2.Create(1.558,6.512,4.525,1.0);
  nt1.V := vt1.V;
  nt2.V := vt2.V;

  Fs1 := 1.5;
  Fs2 := 5.5;

  r1 := 1.5;
  rs := 5.5;
  rd1 := 1.5;
  rds := 5.5;
  res := false;

end;

end.

