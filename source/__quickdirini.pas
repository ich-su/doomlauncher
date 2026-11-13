unit __quickdirini;

interface

uses System.SysUtils, System.Classes, __quickdir, __quickiniext;

type
  TQDirIni = class(TQDir)
  protected
    FIName: string;
    FIni: TQIFileExt;

    function DirCreate: TQDir; override;

  protected const
    QDI_Section = '.';
    QDI_File = '@';
    QDI_FileSep = '=';

  protected
//    function GetIniValue(AKey: string): string;
    function GetItem(AIndex: integer): TQDirIni;
    procedure FileNameToIni;

  public
    constructor Create(AFileName: string = ''; AParent: TQDir = nil; AMask: string = '*.*'; AAttr: integer = faAnyFile; ACanAdd: TQDirOnCanAdd = nil); reintroduce;
    destructor Destroy; override;

    class function MakeIName(AStr: string): string;

    procedure SetIName(AIName: string);
    procedure Clear; override;
    procedure Scan(AFileName: string; AParent: TQDir = nil; AMask: string = '*.*'; AAttr: integer = faAnyFile; ACanAdd: TQDirOnCanAdd = nil); override;

    property IName: string read FIName;
//    property IniValue[Key: string]: string read GetIniValue;
    property Items[Index: integer]: TQDirIni read GetItem; default;
    property Ini: TQIFileExt read FIni;
  end;

implementation

uses __strs, __normalpath;


class function TQDirIni.MakeIName;
begin
  Result := BStr(
              StringReplace(
                ChangeFileExt(ExtractFileName(AStr), ''),
                '_', ' ', [rfReplaceAll, rfIgnoreCase]),
              QDI_File);
end;

function TQDirIni.DirCreate;
begin
  Result := TQDirIni.Create;
end;

constructor TQDirIni.Create;
begin
  FIni := TQIFileExt.Create;
  inherited Create(AFileName, AParent, AMask, AAttr, ACanAdd);
end;

destructor TQDirIni.Destroy;
begin
  FIni.Free;
  inherited;
end;

procedure TQDirIni.Clear;
begin
  inherited Clear;
  FIName := '';
  FIni.Clear;
end;

procedure TQDirIni.SetIName;
begin
  FIName := AIName;
end;

procedure TQDirIni.FileNameToIni;
begin
  var fn := ChangeFileExt(ExtractFileName(FFileName), '');
  var a := Split(fn, QDI_File, 0);

  for var i := 1 to length(a) - 1 do begin
    var k := BStr(a[i], QDI_FileSep);
    var v := EStr(a[i], QDI_FileSep);
    FIni[QDI_Section, k] := v;
  end;
end;

procedure TQDirIni.Scan;

  procedure DataFromIni(fn: string);
  begin
    var ini := TQIFileExt.Create(fn);

    var s := ini.Items[QDI_Section];
    if s <> nil then
      for var i := 0 to s.Count - 1 do
        FIni[QDI_Section, s.Items[i].Key] := ini[QDI_Section, s.Items[i].Key];

    ini.Free;
  end;

begin
  inherited Scan(AFileName, AParent, AMask, AAttr, ACanAdd);

  FIName := MakeIName(FName);

  // 1. сначала ищет рядом с файлом .filename.ini
  // 1а. потом ищет рядом с файлом .filename.ext.ini
  // 2. потом, если папка, внутри папки .ini
  // то, что внутри переписывает поля из того, что снаружи
  // 3. если сам файл ini, то далее берется из него
  // 4. потом берет данные из названия файла после @, они еще главнее
  // @ может быть несколько

  // 1
  var fn := NormalPath(ExtractFilePath(FFileName)) + '.' + ChangeFileExt(ExtractFileName(FFileName), '.ini');
  if FileExists(fn) then FIni.LoadFromFile(fn);

  // 1а
  fn := NormalPath(ExtractFilePath(FFileName)) + '.' + ExtractFileName(FFileName) + '.ini';
  if FileExists(fn) then FIni.LoadFromFile(fn);

  // 2
  if IsDir then begin
    fn := NormalPath(FFileName) + '.ini';
    if FileExists(fn) then DataFromIni(fn);
  end;

  // 3
  if ExtractFileExt(FFileName).ToLower = '.ini' then DataFromIni(FFileName);

  // 4
  FileNameToIni;

  var n := FIni[QDI_Section, 'name'];
  if not n.IsEmpty then FIName := n;
end;
{
function TQDirIni.GetIniValue;
begin
  if AKey.ToLower = 'name' then Result := FIName
  else Result := FIni[QDI_Section, AKey];
end;
}
function TQDirIni.GetItem;
begin
  Result := TQDirIni(inherited Items[AIndex]);
end;

end.

