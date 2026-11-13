unit __strs;

interface

uses System.SysUtils, System.Classes, System.Generics.Collections, Vcl.Graphics;

function IsTrue(AValue: string): boolean;
function IsFalse(AValue: string): boolean;
function NoFalse(AValue: string): boolean;
function BoolToStr(AValue: boolean): string;
function DelDblSpace(AStr: string): string;
function StrToFontStyles(AStr: string): TFontStyles;
function FontStylesToStr(AStyles: TFontStyles): string;
function BStr(AStr, ASep: string): string;
function EStr(AStr, ASep: string): string;
function Split(AStr, ASep: string; AMinLen: integer): TArray<string>;
function DelimitedText(AStrings: TStrings; ADelimiter: string; ABeginIndex: integer = 0): string;
function Quotes(AStr: string): string;
procedure MergeStr(var AStr1: string; AStr2: string; ASep: string);
function IndexOfStr(var AArray: TArray<string>; AValue: string): integer;
function RemoveUnderscores(AStr: string): string;


implementation

function IsTrue;
begin
  Result := (AValue.ToLower = 'true') or (AValue = '1');
end;

function IsFalse;
begin
  Result := (AValue.ToLower = 'false') or (AValue = '0');
end;

function NoFalse;
begin
  Result := (AValue.ToLower <> 'false') and (AValue <> '0');
end;

function BoolToStr;
begin
  if AValue then Result := 'true'
  else Result := 'false';
end;

function DelDblSpace;
begin
  Result := AStr.Trim;
  var len: integer := 0;
  while len <> length(Result) do begin
    len := length(Result);
    Result := StringReplace(Result, '  ', ' ', [rfReplaceAll]);
  end;
end;

function FontStylesToStr;
begin
  Result := '';
  if fsBold in AStyles then Result:=Result + 'bold ';
  if fsItalic in AStyles then Result:=Result + 'italic ';
  if fsUnderline in AStyles then Result:=Result + 'underline ';
  if fsStrikeOut in AStyles then Result:=Result + 'strikeOut';

  Result := Result.Trim;
end;

function StrToFontStyles;
begin
  Result := [];
  AStr := AStr.ToLower;
  if Pos('bold', AStr) > 0 then Include(Result, fsBold);
  if Pos('italic', AStr) > 0 then Include(Result, fsItalic);
  if Pos('underline', AStr) > 0 then Include(Result, fsUnderline);
  if Pos('strikeOut', AStr) > 0 then Include(Result, fsStrikeOut);
end;

function BStr;
begin
  var p:integer := Pos(ASep, AStr);
  if p > 0 then Result := System.Copy(AStr, 1, p - 1)
  else Result := AStr;
end;

function EStr;
begin
  var p: integer := Pos(ASep, AStr);
  if p > 0 then Result := System.Copy(AStr, p + length(ASep) , MaxInt)
  else Result := AStr;
end;

function Split;
begin
  Result:=AStr.Split(ASep);
  for var i := 0 to length(Result) - 1 do Result[i] := Result[i].Trim;
  if length(Result) < AMinLen then SetLength(Result, AMinLen);
end;

function DelimitedText;
begin
  Result := '';
  var i := ABeginIndex;
  while i < AStrings.Count do begin
    var s := AStrings[i].Trim;
    if not s.IsEmpty then MergeStr(Result, s, ADelimiter);
    inc(i);
  end;
end;

function Quotes;
begin
  Result:='"' + AStr.Trim + '"';
end;

procedure MergeStr;
begin
  if not AStr2.IsEmpty then begin
    if not AStr1.IsEmpty then AStr1 := AStr1 + ASep;
    AStr1 := AStr1 + AStr2;
  end;
end;

function IndexOfStr;
begin
  Result := -1;
  var i := 0;
  var s := AValue.Trim.ToLower;
  while (Result = -1) and (i < length(AArray)) do
    if AArray[i].Trim.ToLower = s then Result := i
    else inc(i);
end;

function RemoveUnderscores;
begin
  Result := StringReplace(AStr, '_', ' ', [rfReplaceAll]);
end;

end.

