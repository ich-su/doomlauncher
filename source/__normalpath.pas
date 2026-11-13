unit __normalpath;

interface

uses System.SysUtils, System.Classes, System.Generics.Collections, Vcl.Graphics;

function NormalPath(APath: string): string;


implementation

function NormalPath;
begin
  Result := APath;
  if (length(Result) > 0) and (Result[length(Result)] <> '\') then Result:=Result + '\';
end;

end.

