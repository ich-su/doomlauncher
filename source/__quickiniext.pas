unit __quickiniext;

interface

uses System.SysUtils, System.Classes, __quickini;

type
  TQIFileExt = class(TQIFile)
  protected
    FStrings: TStringList;

  public
    constructor Create(AFileName: string = ''); reintroduce;
    destructor Destroy; override;

    procedure Clear; override;
    procedure Assign(ASource: TQIFile); override;
    function LoadFromFile(AFileName: string): boolean; override;
    function SaveToFile(AFileName: string = ''): boolean; override;

    property Strings: TStringList read FStrings;
  end;

implementation

uses __expandlongfilename, __normalpath;

constructor TQIFileExt.Create;
begin
  FStrings := TStringList.Create;
  inherited Create(AFileName);
end;

destructor TQIFileExt.Destroy;
begin
  FStrings.Free;
  inherited;
end;

procedure TQIFileExt.Clear;
begin
  inherited Clear;
  FStrings.Clear;
end;

procedure TQIFileExt.Assign;
begin
  inherited Assign(ASource);
  if ASource is TQIFileExt then
    FStrings.Assign(TQIFileExt(ASource).FStrings);
end;

function TQIFileExt.LoadFromFile;
begin
  Result := inherited LoadFromFile(AFileName);
  if Result then begin
    var sl := TStringList.Create;
    try
      sl.LoadFromFile(ExpandLongFileName(AFileName));
    except
      Result := false;
    end;

    if Result then begin
      for var i := 0 to sl.Count - 1 do sl[i] := sl[i].Trim;
      var s := '[]'; 
      if Count > 0 then s := '[' + Items[0].Name + ']';
      var i: integer := 0;
      while (i < sl.Count) and (sl[i] <> s) do inc(i);
      while (i < sl.Count) do sl.Delete(i);
      while (sl.Count > 0) and sl[sl.Count - 1].IsEmpty do sl.Delete(sl.Count - 1);

      for i := 0 to sl.Count - 1 do
        if not sl[i].IsEmpty then begin
          var ch := Copy(sl[i], 1, 1);

          if ch <> '#' then begin // # - комментарий
            if ch <> '&' then FStrings.Add(sl[i])
            else begin
              // & - вставляет из другого ini аналогичную секцию
              // & - путь считается от текущего файла
              // && - путь считается от рабочей папки exe

              var fn := Copy(sl[i], 2, MaxInt);
              if not fn.IsEmpty then begin
                if Copy(fn, 1, 1) = '&' then fn := Copy(fn, 2, MaxInt)
                else fn := NormalPath(ExtractFilePath(AFileName)) + fn;

                if not FileExists(fn) then fn := fn + '.ini';
                if FileExists(fn) then begin
                  var ini := TQIFileExt.Create(fn);
                  for var j := 0 to ini.FStrings.Count - 1 do FStrings.Add(ini.FStrings[j]);
                  ini.Free;
                end;
              end;
            end;
          end;
        end;
    end;

    sl.Free;
  end;
end;

function TQIFileExt.SaveToFile;
begin
  Result := inherited SaveToFile(AFileName);

  if Result then begin
    if AFileName.IsEmpty then AFileName:=FFileName;
    AFileName := ExpandLongFileName(AFileName);

    var sl := TStringList.Create;
    try
      sl.LoadFromFile(AFileName);
      sl.Insert(0, FStrings.Text);
      sl.SaveToFile(AFileName);
    except
      Result := false;
    end;
    sl.Free;
  end;
end;

end.

