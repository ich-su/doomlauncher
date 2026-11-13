unit __arr;

interface

const
  SIndexOutOfRange = 'Index out of range';

type
  TArr<T> = class
  public
    class procedure Push(var AArray: TArray<T>; AValue: T);
    class function Pop(var AArray: TArray<T>): T;
    class function Last(var AArray: TArray<T>): T;
//    class function IndexOf(const AArray: TArray<T>; const AValue: T): integer;
  end;

implementation

uses System.SysUtils, System.Rtti;

class procedure TArr<T>.Push;
begin
  SetLength(AArray, length(AArray) + 1);
  AArray[High(AArray)] := AValue;
end;

class function TArr<T>.Pop;
begin
  if length(AArray) > 0 then begin
    Result := Last(AArray);
    SetLength(AArray, length(AArray) - 1);
  end
  else raise ERangeError.Create(SIndexOutOfRange);
end;

class function TArr<T>.Last;
begin
  if length(AArray) > 0 then Result := AArray[High(AArray)]
  else raise ERangeError.Create(SIndexOutOfRange);
end;

{ почему-то не работает на строковом массиве. в дебаге все ок, а результ = -1.  ???
class function TArr<T>.IndexOf;
begin
  Result := -1;
  var i := 0;
  while (Result = -1) and (i < length(AArray)) do
    if AArray[i] = AValue then Result := i
    else inc(i);
end;


class function TArr<T>.IndexOf;
begin
  for var i := 0 to High(AArray) do
    if TValue.From<T>(AArray[i]).Equals(TValue.From<T>(AValue)) then begin
      Result := i;
      Exit;
  end;
  Result := -1;
end;
}
end.

