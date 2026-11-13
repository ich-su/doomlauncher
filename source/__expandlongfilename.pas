unit __expandlongfilename;

interface

uses System.SysUtils;

function ExpandLongFileName(AFileName: string): string;

implementation

function ExpandLongFileName;
begin
  Result:=ExpandFileName(AFileName);

  const L = '\\?\';
  var p := Pos(L, AFileName);
  if p < 1 then Result:=L + Result;
end;

end.

