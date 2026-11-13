unit __formmain;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes, System.StrUtils, System.Hash, System.UITypes, System.Generics.Defaults,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Clipbrd,
  VirtualTrees.BaseAncestorVCL, VirtualTrees.BaseTree, VirtualTrees.AncestorVCL, VirtualTrees, VirtualTrees.Types,
  __quickini, __quickdir, __quickdirini, __quickiniext, Vcl.Menus,
  Vcl.Imaging.pngimage;

const
  WM_USER_SHOW_ = WM_USER + 700;

type
  TFormMain = class(TForm)
    PopupMenuHistory: TPopupMenu;
    MIHRun: TMenuItem;
    MIHLine: TMenuItem;
    MIHDelete: TMenuItem;
    PopupMenuGames: TPopupMenu;
    MIGNext: TMenuItem;
    PopupMenuPresets: TPopupMenu;
    MIPRun: TMenuItem;
    MIPRunPort: TMenuItem;
    PanelHint: TPanel;
    PageControl: TPageControl;
    TabSheetHistory: TTabSheet;
    TreeHistory: TVirtualStringTree;
    TabSheetGames: TTabSheet;
    TreeGames: TVirtualStringTree;
    TabSheetPresets: TTabSheet;
    TreePresets: TVirtualStringTree;
    TabSheetMods: TTabSheet;
    TabSheetRun: TTabSheet;
    PanelRunTop: TPanel;
    TreeRun: TVirtualStringTree;
    PanelRunButtons: TPanel;
    ButtonDown: TSpeedButton;
    ButtonUp: TSpeedButton;
    ButtonCreatePreset: TSpeedButton;
    ButtonClipboard: TSpeedButton;
    PanelRunDown: TPanel;
    ButtonRun: TSpeedButton;
    MIHRunQuick: TMenuItem;
    MIPLine: TMenuItem;
    MIPRunQuick: TMenuItem;
    MIPRunQuickPort: TMenuItem;
    MIPLine2: TMenuItem;
    MIPBack: TMenuItem;
    PopupMenuRun: TPopupMenu;
    MIRRun: TMenuItem;
    MIRLine: TMenuItem;
    MIRBack: TMenuItem;
    TabSheetAbout: TTabSheet;
    Image: TImage;
    PopupMenuAbout: TPopupMenu;
    MIPLIne3: TMenuItem;
    MIPNotepad: TMenuItem;
    MIRClipboard: TMenuItem;
    MIRLine3: TMenuItem;
    MIRMoveUp: TMenuItem;
    MIRMoveDown: TMenuItem;
    MIRLine2: TMenuItem;
    PopupMenuMods: TPopupMenu;
    MIMRun: TMenuItem;
    MIMClear: TMenuItem;
    MIMLine: TMenuItem;
    MIMLine2: TMenuItem;
    MIMBack: TMenuItem;
    PanelModsTop: TPanel;
    PanelModsButtons: TPanel;
    ButtonModsReset: TSpeedButton;
    TreeMods: TVirtualStringTree;
    PanelModsDown: TPanel;
    ButtonModsRun: TSpeedButton;
    MIMRunPort: TMenuItem;
    MIMLine3: TMenuItem;
    MIMRunQuick: TMenuItem;
    MIMRunQuickPort: TMenuItem;
    ButtonModsExpandAll: TSpeedButton;
    ButtonModsCollapseAll: TSpeedButton;
    MIMCollapseAll: TMenuItem;
    MIMExpandAll: TMenuItem;
    PanelPresetsDown: TPanel;
    ButtonPresetsRun: TSpeedButton;
    MIHLine2: TMenuItem;
    MIHNotepad: TMenuItem;
    PanelGamesDown: TPanel;
    ButtonGamesRun: TSpeedButton;
    PanelHistoryDown: TPanel;
    ButtonHistoryRun: TSpeedButton;
    ButtonAboutHistory: TSpeedButton;
    ButtonAboutGames: TSpeedButton;
    MIAHistory: TMenuItem;
    MIAGames: TMenuItem;
    MIALine: TMenuItem;
    MIAViewLog: TMenuItem;
    MIADeleteLog: TMenuItem;
    MIConfigFile: TMenuItem;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure TreeGamesContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure TreeGamesChange(Sender: TBaseVirtualTree; Node: PVirtualNode);

    procedure TreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);

    procedure TreeGamesBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);
    procedure TreeDrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; const Text: string; const CellRect: TRect; var DefaultDraw: Boolean);
    procedure TreePresetsDrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; const Text: string; const CellRect: TRect;var DefaultDraw: Boolean);
    procedure TreeHistoryResize(Sender: TObject);
    procedure TreeHistoryGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure TreeHistoryDrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; const Text: string; const CellRect: TRect; var DefaultDraw: Boolean);
    procedure TreeRunGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);

    procedure CtrlEnterClick(Sender: TObject);
    procedure CtrlEnterDblClick(Sender: TBaseVirtualTree; const HitInfo: THitInfo);
    procedure TreeRunNodeDblClick(Sender: TBaseVirtualTree; const HitInfo: THitInfo);

    procedure MIHDeleteClick(Sender: TObject);
    procedure MIPRunClick(Sender: TObject);
    procedure ButtonClipboardClick(Sender: TObject);
    procedure ButtonUpClick(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure MIPNotepadClick(Sender: TObject);
    procedure MIMClearClick(Sender: TObject);
    procedure ButtonModsCollapseAllClick(Sender: TObject);
    procedure ButtonModsExpandAllClick(Sender: TObject);

    procedure SiteClick(Sender: TObject);
    procedure EmailClick(Sender: TObject);
    procedure ViewLogClick(Sender: TObject);
    procedure DeleteLogClick(Sender: TObject);
    procedure ConfigFileClick(Sender: TObject);
    procedure MIAHistoryClick(Sender: TObject);

  protected const
    CFormMinX = 800;
    CFormMinY = 600;
    CDirData = 'data\';
    CVar = '%';
    CBranch = '+';
    CHistoryName = '%historyname%';

  protected type
    TNodeType = (ntNil, ntString, ntSection, ntDir, ntUnknow);
    TDirType = (dtMap, dtDemo, dtMod, dtUnknow);

    TQDirDemo = class(TQDirIni)
      protected
        function GetName2: string;
      public
        property Name2: string read GetName2;
    end;

    TCurrentGame = record
      Game: TQISection;
      Map: TQDirIni;
      Demo: TQDirDemo;
    end;

    TRun = class(TQIFileExt)
      protected
        FConfig: string;
        FCopyConfig: boolean;
        FCustom: boolean;
        FPresetExe: boolean;

      public
        procedure Clear; override;
        procedure Assign(ASource: TQIFile); override;
        function FromHistory: boolean;
        function FromMods: boolean;
        function Exe: string;
        function CmdParam: string;
    end;

    TThreadHint = class(TThread)
    protected
      FPanel: TPanel;
      FTime: integer;

      procedure Execute; override;
    public
      constructor Create(APanel: TPanel; AControl: TControl; ACaption: string; ATime: integer = 1000);
    end;

  protected
    FIniParams: TQIFileExt;
    FIniConfig,
    FIniRoot,
    FIniGames,
    FIniPorts,
    FIniCompatibility: TQIFile;
    FDirHistory,
    FDirMaps,
    FDirDemos,
    FDirMods,
    FDirPresets,
    FDirPresetsMap: TQDirIni;
    FRun: TRun;
    FCustomPreset,
    FExePreset: TQDirIni;
    FDirPorts: TQDirIni;

    procedure WMGetMinMaxInfo(var M: tWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    procedure WM_USER_SHOW(var AMessage: tMessage); message WM_USER_SHOW_;

    function IsShiftDown: boolean;
    function IsCtrlDown: boolean;
    function IsAltDown: boolean;

    procedure DrawMultiLine(ANode: PVirtualNode; ACanvas: TCanvas; ARect: TRect; AStrs, AInfos: TArray<string>; AFirstPaint: boolean = false);
    procedure DrawInfo(AInfo: string; ACanvas: TCanvas; ARect: TRect; ATree: TVirtualStringTree; ANode: PVirtualNode; AColumn: integer = 0);

    function DirType(ADir: TQDir): TDirType;
    function NodeType(ATree: TBaseVirtualTree; ANode: PVirtualNode): TNodeType;
    function NodeSection(ATree: TBaseVirtualTree; ANode: PVirtualNode): TQISection;
    function NodeDir(ATree: TBaseVirtualTree; ANode: PVirtualNode): TQDirIni;
    function NodeString(ATree: TBaseVirtualTree; ANode: PVirtualNode): string;
    function NodeInfo(ATree: TBaseVirtualTree; ANode: PVirtualNode): string;
    function NodeMark(ATree: TBaseVirtualTree; ANode: PVirtualNode): boolean;
    function NodeMark2(ATree: TBaseVirtualTree; ANode: PVirtualNode): boolean;
    function MapWithCompatibility(AShortPreset: string; AMap: TQDir; var AResFile: string): boolean;

    procedure TreeExpand(ATree: TVirtualStringTree; ADef: PVirtualNode; AForce: boolean = false);
    procedure TreeCollapse(ATree: TVirtualStringTree; ALevel: cardinal);
    function RowHeight(AHeight, ACount: integer): integer;
    procedure TreeRowsHeightDef(ATree: TVirtualStringTree; ACount: integer = 1);
    function TreeDisplayedHeight(ATree: TVirtualStringTree): integer;

    procedure DrawMarkText(ATree: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; const CellRect: TRect; AText: TArray<string> = []);

    function IsBranch(AName: string): boolean;
    function BranchName(AName: string): string;
    function MapDemos(ADir: TQDir): TArray<TQDir>;
    procedure AddDemos(ADir: TQDir; AFileName: string; AAttr: integer; var ACanAdd: boolean);
    function CutLauncherPath(AFileName, ANameDir: string): string;
    procedure ShowTreeLines;
    function IniFileName: string;
    function LogFileName: string;
    procedure OpenNotePad(AFileName: string);

    function TreeFocusedDir(ATree: TVirtualStringTree): TQDirIni;
    function CurrentGame: TCurrentGame;
    function CurrentHistory: TQDirIni;
    function CurrentPresets: TArray<TQDirIni>;
    function CurrentPresetR: TQDirIni;
    function GetCustomPreset: TQDirIni;
    function GetBuildPresets(AExtension: boolean; APreset: TQDirIni): TArray<TQDir>;

    procedure BuildAbout;
    procedure BuildBranchMaps(ATree: TBaseVirtualTree; AParent: PVirtualNode; ADir: TQDirIni; ACheckType: TCheckType = ctNone);
    procedure BuildGames;
    procedure BuildPresets;
    procedure BuildPresetExtensions;
    procedure BuildMods;
    procedure BuildHistory;
    procedure BuildRun;
    function CmdLine: string;

    procedure SortDir(ADir: TQDir);
    procedure ScanHistory;
    procedure ScanPorts;
    function FindPort(APort: string): TQISection;
    function VrfFileName(AFileName: string): string;
    function FirstFilter(AGame: TQISection): string;
    function VrfFilter(AFilter, AValue: string): boolean;
    function MapFilter(AFilter: string; AMap: TQDirIni): string;
    function FilterNormal(APart: string): string;
    function DirNameSpec(AName: string; AShort: boolean): string;

    procedure ApplyConfig;
    function ToLog(AFileName, AString: string): boolean;

    procedure CtrlEnter(AQuick: boolean = false; APort: string = '');
    procedure Back;

    procedure RunPresets(AQuick: boolean; AGame: TCurrentGame; APresets: TArray<TQDirIni>; APort: string);
    procedure RunHistory(AQuick: boolean; AHistory: TQDirIni);
    procedure Run0(AQuick: boolean);
    procedure Run;
    procedure Exec(ACommand, AParams, ADirectory: string);

    procedure GoPage(AGo: integer);
    procedure Enableds;
  end;

var
  FormMain: TFormMain;

function ProjectName: string;
function VerifyRun: boolean;

implementation

{$R *.dfm}

uses __strs, __normalpath, __arr, __expandlongfilename, Math;

function ProjectName;
begin
  Result := 'DOOM Launcher 2';
end;

function VerifyRun;
begin
  var h := FindWindowW(nil, PWideChar(ProjectName));
  Result := h = 0;
  if not Result then begin
    AllowSetForegroundWindow(DWORD(-1));
    PostMessage(h, WM_USER_SHOW_, 0, 0);
  end;
end;



function TFormMain.TQDirDemo.GetName2;
begin
  Result := ExtractFileName(FileName);
end;



procedure TFormMain.TRun.Clear;
begin
  FConfig := '';
  FCopyConfig := false;
  FCustom := false;
  FPresetExe := false;

  inherited Clear;
end;

procedure TFormMain.TRun.Assign;
begin
  if ASource is TRun then begin
    FConfig := TRun(ASource).FConfig;
    FCopyConfig := TRun(ASource).FCopyConfig;
  end;

  inherited Assign(ASource);
end;

function TFormMain.TRun.FromHistory;
begin
  Result := FConfig.IsEmpty and not FPresetExe;
end;

function TFormMain.TRun.FromMods;
begin
  Result := FCustom;
end;

function TFormMain.TRun.Exe;
begin
  if Strings.Count > 0 then Result := ExpandLongFileName(Strings[0].Trim)
  else Result := '';
end;

function TFormMain.TRun.CmdParam;
begin
  if Strings.Count > 1 then Result := DelimitedText(Strings, ' ', 1)
  else Result := '';
end;



constructor TFormMain.TThreadHint.Create;
begin
  FreeOnTerminate := true;
  FTime := ATime;
  FPanel := APanel;

  var form := TForm(APanel.Owner);
  with APanel do begin
    Caption := ACaption;
    Width := form.Canvas.TextWidth(ACaption + 'WW');
    Height := round(1.75 * form.Canvas.TextHeight(ACaption));
    Left := AControl.ClientOrigin.X - form.ClientOrigin.X;
    Top := AControl.ClientOrigin.Y - form.ClientOrigin.Y + AControl.Height + 1;
    Visible := true;
  end;

  inherited Create(false);
end;

procedure TFormMain.TThreadHint.Execute;
begin
  Sleep(FTime);
  FPanel.Visible := false;
  if Assigned(FPanel.OnExit) then FPanel.OnExit(FPanel);
end;




procedure TFormMain.WM_USER_SHOW;
begin
  SetForegroundWindow(Handle);
end;

procedure TFormMain.WMGetMinMaxInfo;
begin
  inherited;

  var r: TRect;
  SystemParametersInfo(SPI_GETWORKAREA, 0, @r, 0);

  with M.MinMaxInfo^ do begin
    ptMinTrackSize.X := CFormMinX;
    ptMinTrackSize.Y := CFormMinY;
    ptMaxTrackSize.X := r.Width; // Screen.Width;
    ptMaxTrackSize.Y := r.Height; // Screen.Height;
  end
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  inherited;

  Caption := ProjectName;

  FIniParams := TQIFileExt.Create(IniFileName);
  FIniConfig := TQIFile.Create(CDirData + 'launcher.ini');
  FIniRoot := TQIFile.Create(CDirData + 'root.ini');
  FIniGames := TQIFile.Create(CDirData + 'games.ini');
  FIniPorts := TQIFile.Create(CDirData + 'ports.ini');
  FIniCompatibility := TQIFile.Create(CDirData + 'compatibility.ini');

  FDirDemos := TQDirIni.Create;
  FDirMods := TQDirIni.Create(FIniConfig['launcher', 'mods']);
  FDirMaps := TQDirIni.Create(FIniConfig['launcher', 'maps'], nil, '*.*', faAnyFile, AddDemos);
  FDirPresets := TQDirIni.Create(CDirData + 'presets');
  SortDir(FDirPresets);
  FDirPresetsMap := TQDirIni.Create;
  FDirHistory := TQDirIni.Create;
  FDirPorts := TQDirIni.Create(FIniConfig['launcher', 'ports']);

  FExePreset := TQDirIni.Create;
  FCustomPreset := TQDirIni.Create;

  FRun := TRun.Create;

  ApplyConfig;
  ShowTreeLines;

  ScanPorts;
  ScanHistory;
//  Application.ProcessMessages;
  TreeHistoryResize(TreeHistory);

  BuildAbout;
  BuildGames;

  if CurrentHistory <> nil then PageControl.ActivePage := TabSheetHistory
  else PageControl.ActivePage := TabSheetGames;

  Enableds;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FIniParams.Strings.Clear;
  FIniParams.Strings.Add('Close ' + ProjectName + '. Then change the settings in this file. Save the changes. Launch ' + ProjectName + '.');
  FIniParams.SaveToFile;

  FRun.Free;

  FCustomPreset.Free;
  FExePreset.Free;

  FDirPresetsMap.Free;
  FDirPresets.Free;
  FDirHistory.Free;
  FDirMaps.Free;
  FDirDemos.Free;
  FDirMods.Free;
  FDirPorts.Free;

  FIniParams.Free;
  FIniConfig.Free;
  FIniRoot.Free;
  FIniGames.Free;
  FIniPorts.Free;
  FIniCompatibility.Free;

  inherited;
end;

function TFormMain.IniFileName;
begin
  Result := ChangeFileExt(ExtractFileName(Application.ExeName), '.ini');
end;

function TFormMain.LogFileName;
begin
  Result := ChangeFileExt(ExtractFileName(Application.ExeName), '.log');
end;

procedure TFormMain.ShowTreeLines;

  procedure _(ATree: TVirtualStringTree);
  begin
    with ATree.TreeOptions do begin
      if IsTrue(FIniParams['cfg', 'showtreelines']) then PaintOptions := PaintOptions + [toShowTreeLines]
      else PaintOptions := PaintOptions - [toShowTreeLines];

      if IsTrue(FIniParams['cfg', 'useexplorertheme']) then PaintOptions := PaintOptions + [toUseExplorerTheme]
      else PaintOptions := PaintOptions - [toUseExplorerTheme];
    end;
  end;

begin
//  _(TreeHistory);
  _(TreeGames);
  _(TreePresets);
  _(TreeMods);
//  _(TreeRun);
end;

procedure TFormMain.BuildAbout;

  function _(ATop: integer; ACaption: string; AOnClick: TNotifyEvent = nil): TLabel;
  begin
    Result := TLabel.Create(self);
    with Result do begin
      Parent := TabSheetAbout;
      Top := ATop;
      Left := 3 * Image.Left + Image.Width;
      Caption := ACaption;
      if Assigned(AOnClick) then begin
        Font.Color := clBlue;
        Font.Style := [fsUnderline];
        Cursor := crHandPoint;
        OnClick := AOnClick;
      end;
    end;
  end;

begin
  var L := _(Image.Top, ProjectName);
  L.Font.Style := [fsBold];

  _(L.Top + round(1.25 * L.Height), 'v 0.9');
  _(L.Top + 3 * L.Height, '© ich, 2025 - 2026');
  _(L.Top + round(4.75 * L.Height), 'ich.su/doomlauncher', SiteClick);
  _(L.Top + 6 * L.Height, 'ich@ich.su', EmailClick);

  var L2 := _(L.Top + round(8.5 * L.Height),
              'Mini help:'#13#10 +
              'Use:'#13#10 +
              '1. Double-click'#13#10 +
              '2. Hotkey Enter'#13#10 +
              '3. Pop-up menu (Right mouse button)'#13#10 +
              '4. Control + Double-click, Control + Enter, Control + Menu item → Quick Run (skips the final "Run" tab).'#13#10 +
              '5. Escape and Backspace hotkeys → return back'
            );

  L := _(L2.Top + L2.Height + round(1.5 * L.Height), 'view log', ViewLogClick);
  L2 := _(L.Top, 'delete log', DeleteLogClick);
  L2.Left := L2.Left + L.Width + L.Height;
  L2 := _(L.Top + round(1.25 * L.Height), 'config file', ConfigFileClick);

  ButtonAboutHistory.Top := L2.Top + round(3 * L.Height);
  ButtonAboutHistory.Left := L2.Left;
  ButtonAboutGames.Top := ButtonAboutHistory.Top;
  ButtonAboutGames.Left := ButtonAboutHistory.Left + ButtonAboutHistory.Width + 4;
end;

procedure TFormMain.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE: Back;
    VK_LEFT: if (Shift = [ssAlt]) then GoPage(-1);
    VK_RIGHT: if (Shift = [ssAlt]) then GoPage(1);
  end;
end;

function TFormMain.IsShiftDown;
begin
  Result := GetKeyState(VK_SHIFT) < 0;
end;

function TFormMain.IsCtrlDown;
begin
  Result := GetKeyState(VK_CONTROL) < 0;
end;

function TFormMain.IsAltDown;
begin
  Result := GetKeyState(VK_MENU) < 0;
end;

procedure TFormMain.FormResize(Sender: TObject);
begin
  if Visible then begin
    var s := 'normal';
    if WindowState = TWindowState.wsMaximized then s := 'maximized'
    else begin
      FIniParams['cfg', 'width'] := Width.ToString;
      FIniParams['cfg', 'height'] := Height.ToString;
    end;
    FIniParams['cfg', 'winstate'] := s;
  end;

  Enableds;
end;

procedure TFormMain.AddDemos;
begin
  ACanAdd := true;
  if AAttr and faDirectory = 0 then
    if ExtractFileExt(AFileName).ToLower = '.lmp' then begin
      var d := TQDirDemo.Create(AFileName, ADir);
      FDirDemos.Add(d);
    end;
end;

function TFormMain.MapDemos;
begin
  Result := [];
  for var i := 0 to FDirDemos.Count - 1 do
    if FDirDemos[i].Parent = ADir then TArr<TQDir>.Push(Result, FDirDemos[i]);
end;

function TFormMain.CutLauncherPath;
begin
  Result := Copy(AFileName, length(NormalPath(FIniConfig['launcher', ANameDir])) + 1, MaxInt);
end;

function TFormMain.DirType;
begin
  Result := dtUnknow;
  if ADir is TQDirDemo then Result := dtDemo
  else begin
    var r := ADir.Root;
    if r = FDirMods then Result := dtMod
    else if r = FDirMaps then Result := dtMap
  end;
end;

function TFormMain.NodeType;
begin
  Result := ntUnknow;

  if ANode = nil then Result := ntNil
  else begin
    var obj := TObject(ATree.GetNodeData(ANode)^);

    if obj is TQISection then Result := ntSection
    else if obj is TQDir then Result := ntDir
    else if obj is TQILine then Result := ntString
  end;
end;

function TFormMain.NodeSection;
begin
  if ANode <> nil then Result := TQISection(ATree.GetNodeData(ANode)^)
  else Result := nil;
end;

function TFormMain.NodeDir;
begin
  if ANode <> nil then Result := TQDirIni(ATree.GetNodeData(ANode)^)
  else Result := nil;
end;

function TFormMain.NodeString;
begin
  if ANode <> nil then Result := TQILine(ATree.GetNodeData(ANode)^).Value
  else Result := '';
end;

function TFormMain.NodeInfo;
begin
  Result := '';
  case NodeType(ATree, ANode) of
    ntSection: Result := NodeSection(ATree, ANode)['info'];
    ntDir: begin
      var dir := NodeDir(ATree, ANode);
      Result := dir.Ini['.', 'info'];
      if length(MapDemos(dir)) > 0 then MergeStr(Result, 'demo', ', ');
      if dir is TQDirDemo then MergeStr(Result, RemoveUnderscores(dir.Ini['.', 'port']), ', ');
    end;
  end;
end;

function TFormMain.NodeMark;
begin
  Result := false;
  case NodeType(ATree, ANode) of
    ntSection: Result := IsTrue(NodeSection(ATree, ANode)['mark']);
    ntDir: begin
      var dir := NodeDir(ATree, ANode);
      Result := IsTrue(dir.Ini['.', 'mark']);
    end;
  end;
end;

function TFormMain.MapWithCompatibility;
begin
  if AMap = nil then Result := false
  else begin
    AShortPreset := AShortPreset + '.maps';
    AResFile := FIniCompatibility[AShortPreset, AMap.Name];
    if AResFile.IsEmpty then AResFile := FIniCompatibility[AShortPreset, ChangeFileExt(AMap.Name, '')];
    Result := not AResFile.IsEmpty;
  end;

  if not Result then AResFile := '';
end;

function TFormMain.NodeMark2;
begin
  Result := false;

  if (ATree = TreePresets) and (ATree.GetNodeLevel(ANode) = 0) then begin
    var preset := NodeDir(ATree, ANode);
    Result := FDirPresetsMap.IndexOf(preset) <> -1;

    if not Result then begin
      var m := CurrentGame.Map;
      if m <> nil then begin
        var res: string;
        Result := MapWithCompatibility(DirNameSpec(preset.Name, true), CurrentGame.Map, res) or
                  VrfFilter(preset.Name, m.Ini['.', 'preset']) or
                  VrfFilter(preset.Name, m.Ini['.', 'presets']);
      end;
    end;
  end;
end;

procedure TFormMain.TreeExpand;
begin
  ATree.FullExpand;
  if (ATree.FocusedNode = nil) or AForce then
    if ATree.RootNodeCount > 0 then begin
      if ADef = nil then ADef := ATree.GetFirst;
      ATree.Selected[ADef] := true;
      ATree.FocusedNode := ADef;
    end;
end;

procedure TFormMain.TreeCollapse;
begin
  var n := ATree.GetFirst; // ATree.RootNode.FirstChild;
  while n <> nil do begin
    if ATree.GetNodeLevel(n) >= ALevel then ATree.Expanded[n] := false;
    n := ATree.GetNext(n);
  end;
end;

function TFormMain.RowHeight;
begin
  Result := round((ACount + 0.5) * AHeight) + 2 * ACount;
end;

procedure TFormMain.TreeRowsHeightDef;
begin
  var h := ATree.Canvas.TextHeight('W');
  h := RowHeight(h, ACount);
  for var node in ATree.Nodes do ATree.NodeHeight[node] := h;
  ATree.Tag := h;
end;

procedure TFormMain.TreeGetText;
begin
  var tree := TVirtualStringTree(Sender);
  case NodeType(tree, Node) of
    ntSection: begin
      var s := NodeSection(tree, Node);
      if s <> nil then
        if not s['name'].IsEmpty then CellText := s['name']
        else CellText := s.Name;
    end;
    ntDir: begin
      var d := NodeDir(tree, Node);
      if d <> nil then begin
        CellText := BranchName(d.IName);
        if DirType(d) = dtDemo then CellText := 'demo ' + CellText;
      end;
    end;
    ntString:
      CellText := NodeString(tree, Node);
  end;
end;

procedure TFormMain.TreeGamesBeforeCellPaint(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; CellPaintMode: TVTCellPaintMode; CellRect: TRect; var ContentRect: TRect);

  procedure _;
  begin
    with TargetCanvas do begin
      var cl := Brush.Color;
      Brush.Color := $f3f3f3; // $f7f7f7;
      FillRect(CellRect);
      Brush.Color := cl;
    end;
  end;

begin
  if Assigned(Node) then begin
    if IsTrue(FIniParams['cfg', 'markbackground']) and
       ((Sender = TreeGames) or (Sender = TreeMods)) and (Sender.GetNodeLevel(Node) = 0) then _;

    if (Sender = TreePresets) and (Sender.GetNodeLevel(Node) = 0) and (Node <> Sender.FocusedNode) and
       (NodeDir(Sender, Node) = CurrentPresets[0]) then _;
  end;
end;

procedure TFormMain.DrawMarkText;
begin
  if IsTrue(FIniParams['cfg', 'markfont']) then begin
    var m1 := NodeMark(ATree, Node);
    var m2 := NodeMark2(ATree, Node);

    if (length(AText) > 0) or m1 or m2 then begin
      var s: string;
      if length(AText) = 0 then begin
        TreeGetText(ATree, Node, Column, ttNormal, s);
        AText := [s];
      end;

      var r := CellRect;

      var cl := TargetCanvas.Font.Color;
      if m2 then begin
        TargetCanvas.Font.Color := clBlue;
        DrawMultiLine(Node, TargetCanvas, r, AText, [], false);
      end;

      r.Left := r.Left + 1;
      DrawMultiLine(Node, TargetCanvas, r, AText, [], false);

      TargetCanvas.Font.Color := cl;
    end;
  end;
end;

procedure TFormMain.TreeDrawText;
begin
  var tree := TVirtualStringTree(Sender);
  DrawInfo(NodeInfo(tree, Node), TargetCanvas, CellRect, tree, Node, Column);
  DrawMarkText(tree, TargetCanvas, Node, Column, CellRect);
end;

procedure TFormMain.TreeHistoryDrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; const Text: string; const CellRect: TRect; var DefaultDraw: Boolean);
begin
  if Node.Index < FDirHistory.Count then begin
    var bmark := IsTrue(FIniParams['cfg', 'markhistory']);
    with FDirHistory[Node.Index] do
      case Column of
        0: DrawMultiLine(Node, TargetCanvas, CellRect, [Ini['.', 'port_name'], ''], ['', FormatDateTime('dd.mm.yy hh:mm:ss', Time)]);
        1: begin
          var gn := Ini['.', 'game_name'];
          var mn := Ini['.', 'map_name'];
          DrawMultiLine(Node, TargetCanvas, CellRect, [gn, mn], ['', Ini['.', 'demo_name']]);
          if bmark then begin
            if length(mn) > 0 then gn :='';
            DrawMarkText(Sender, TargetCanvas, Node, Column, CellRect, [gn, mn]);
          end;
        end;
        2: begin
          var pn := Ini['.', 'preset_name'];
          DrawMultiLine(Node, TargetCanvas, CellRect, [pn, ''], ['', Ini['.', 'mods']]);
          if bmark then begin
            var p1 := Split(pn, ',', 1);
            DrawMarkText(Sender, TargetCanvas, Node, Column, CellRect, [p1[0]]);
          end;
        end;
      end;
  end;
end;

procedure TFormMain.TreeHistoryGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
begin
  CellText := ' ' + #13#10 + ' ';
end;

procedure TFormMain.TreeHistoryResize(Sender: TObject);
begin
  var tree := TreeHistory;
  tree.Header.Columns[0].Width := Max(round(TabSheetHistory.ClientWidth * 0.175), tree.Canvas.TextWidth('XX:XX:XX XX:XX:XX XX:XX'));
  tree.Header.Columns[1].Width := (TabSheetHistory.ClientWidth - tree.Header.Columns[0].Width) div 3;
  tree.Header.Columns[2].Width := tree.ClientWidth - tree.Header.Columns[0].Width - tree.Header.Columns[1].Width;
end;

procedure TFormMain.TreePresetsDrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; const Text: string; const CellRect: TRect; var DefaultDraw: Boolean);
begin
  var tree := TVirtualStringTree(Sender);
  var d := NodeDir(tree, Node);
  var s := RemoveUnderscores(d.Ini['.', 'port']);
  var game := CurrentGame;
  if (game.Demo <> nil) and not game.Demo.ini['.', 'port'].IsEmpty then s := RemoveUnderscores(game.Demo.ini['.', 'port']);
  MergeStr(s, d.Ini['.', 'info'], '; ');
  DrawInfo(s, TargetCanvas, CellRect, tree, Node, Column);

  DrawMarkText(tree, TargetCanvas, Node, Column, CellRect);
end;

procedure TFormMain.TreeRunGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
begin
  if Node.Index < FRun.Strings.Count then CellText := FRun.Strings[Node.Index]
  else CellText := '';
end;

procedure TFormMain.DrawMultiLine;
begin
  with ACanvas do begin
    var r := ARect;
    var h := TextHeight('W');
    var h2 := -1;
    var f := TFont.Create;
    f.Assign(Font);
    if not (vsMultiline in ANode.States) then r.Top := r.Top + round(h / 4)
    else r.Top := r.Top - 1;
    if AFirstPaint then Font.Style := Font.Style + [fsUnderline]; // [fsBold]

    for var i := 0 to length(AStrs) - 1 do begin
      var s1 := Trim(AStrs[i]);
      var s2 := '';
      if i < length(AInfos) then s2 := Trim(AInfos[i]);

      var s1_ := StringReplace(s1, '&', '&&', [rfReplaceAll]);
      var s2_ := StringReplace(s2, '&', '&&', [rfReplaceAll]);

      TextRect(r, s1_);

      if IsTrue(FIniParams['cfg', 'drawinfo']) then begin
        var r2 := r;
        r2.Left := r2.Left + TextWidth(s1 + 'W');
        Font.Color := clGray;
        Font.Size := f.Size - 2;
        if h2 = -1 then h2 := TextHeight('W');
        r2.Top := r2.Top + h - h2 - 1;

        TextRect(r2, s2_);
      end;

      Font.Assign(f);
      r.Top := r.Top + h + 2;
    end;

    f.Free;
  end;
end;

procedure TFormMain.DrawInfo;
begin
  if not AInfo.IsEmpty then begin
    var s: string;
    var r := ARect;
    ATree.OnGetText(ATree, ANode, AColumn, TVSTTextType.ttNormal, s);
    r.Left := r.Left + ACanvas.TextWidth(s);
    DrawMultiLine(ANode, ACanvas, r, [''], [AInfo], false);
  end;
end;

procedure TFormMain.SortDir;
begin
  ADir.Sort(TDelegatedComparer<TQDir>.Create(
    function(const AItem1, AItem2: TQDir): integer
    begin
      var n1 := BranchName(TQDirIni(AItem1).IName);
      var n2 := BranchName(TQDirIni(AItem2).IName);
      var s1 := TQDirIni(AItem1).Ini['.', 'sortindex'];
      var s2 := TQDirIni(AItem2).Ini['.', 'sortindex'];
      var si1 := MaxInt;
      var si2 := MaxInt;
      try if not s1.IsEmpty then si1 := s1.ToInteger; except end;
      try if not s2.IsEmpty then si2 := s2.ToInteger; except end;

      if si1 < si2 then Result := -1
      else if si1 > si2 then Result := 1
      else if n1 < n2 then Result := -1
      else if n1 > n2 then Result := 1
      else Result := 0;
    end
  ));
end;

procedure TFormMain.BuildGames;
begin
  var tree := TreeGames;
  var root := FIniRoot.Items['root'];
  var ndef: PVirtualNode := nil;

  if root <> nil then begin
    for var i := 0 to root.Count - 1 do begin
      var n := tree.AddChild(nil, root.Items[i]);
      for var j := 0 to FIniGames.Count - 1 do begin
        if TQISection.Compare(FIniGames[j, 'group'], root.Items[i].Key) then begin
          var n2 := tree.AddChild(n, FIniGames.Items[j]);
          if (ndef = nil) and IsTrue(FIniGames[j, 'default']) then ndef := n2;

          var d := TQDirIni(FDirMaps.QItem([FIniGames[j, TQISection.KName]]));
          if (d <> nil) and (d.Count > 0) then BuildBranchMaps(tree, n2, d);
        end;
      end;
    end;

    TreeRowsHeightDef(tree);
    TreeExpand(tree, ndef);
    TreeCollapse(tree, 1);
  end;
end;

procedure TFormMain.BuildMods;
begin
  var tree := TreeMods;
  tree.Clear;

  var game := CurrentGame;
  if game.Game <> nil then begin
    var d := FDirMods.QItem(['all']);
    if d <> nil then begin
      var p := tree.AddChild(nil, d);
      BuildBranchMaps(tree, p, TQDirIni(d), ctCheckBox);
    end;

    var ff := FirstFilter(game.Game);
    BuildBranchMaps(tree, nil, TQDirIni(FDirMods.QItem([ff])), ctCheckBox);
{
    var p := TreeMods.RootNode.FirstChild;
    while p <> nil do begin
      var i := TArray.IndexOf<TQDir>(save, NodeDir(TreeMods, p));
      if i <> -1 then p.CheckState := csCheckedNormal;
      p := TreeMods.GetNext(p);
    end;
 }
  end;

  TreeRowsHeightDef(tree);
  TreeExpand(tree, nil);
  TreeCollapse(tree, 1);
end;

function TFormMain.GetBuildPresets;
begin
  Result := [];
  var g := CurrentGame;
  var extensions: TArray<string>;
  if APreset <> nil then extensions := Split(APreset.Ini['.', 'extension'], ',', 0);

  for var i := 0 to FDirPresets.Count - 1 do
    if APreset <> FDirPresets[i] then begin
      var ini := FDirPresets[i].Ini;

      var f := ini['.', 'filter'];
      var af := ini['.', 'antifilter'];
      var e := ini['.', 'extensionname'];
      var gf := MapFilter(g.Game['filter'], g.Map);

      var preset := ini['.', 'preset'];
      var antipreset := ini['.', 'antipreset'];

      if (ExtractFileExt(FDirPresets[i].FileName).ToLower = '.ini') and
         (f.IsEmpty or VrfFilter(gf, f)) and
         (af.IsEmpty or not VrfFilter(gf, af)) and

         // пресет работает только для одного родителя, а надо сделать для всех.
         // для этого надо накапливать в стеке (тут же рекурсия) имена всех пресетов.
         // перед вызовом добавлять, после удалять. и формировать из них name1.name2.name3... (вместо APreset.Name)
         // и еще из name удалять .ini

         (preset.IsEmpty or ((APreset <> nil) and VrfFilter(APreset.Name, preset))) and
         (antipreset.IsEmpty or ((APreset <> nil) and not VrfFilter(APreset.Name, antipreset))) and

         ((not AExtension and e.IsEmpty) or (AExtension and not e.IsEmpty and (IndexOfStr(extensions, e) <> -1)))
      then TArr<TQDir>.Push(Result, FDirPresets[i]);
    end;

  if not AExtension and (g.Map <> nil) and g.Map.IsDir then begin
    FDirPresetsMap.Scan(NormalPath(g.Map.FileName) + '.presets');
    for var i := FDirPresetsMap.Count - 1 downto 0 do
      Result := Concat([FDirPresetsMap[i]], Result);
  end;
end;

procedure TFormMain.BuildPresets;
begin
  var tree := TreePresets;
  tree.Clear;

  var g := CurrentGame;
  var a: TArray<TQDir>;
  if g.Game['exe'].IsEmpty then a := GetBuildPresets(false, nil)
  else begin
    FExePreset.Clear;
    FExePreset.SetIName(g.Game['Name']);
    FExePreset.Ini['.', 'Info'] := g.Game['Exe'];
    FExePreset.Ini['.', 'Mark'] := 'true';
    a := [FExePreset];
  end;
  for var i := 0 to length(a) - 1 do tree.AddChild(nil, a[i]);

  TreeRowsHeightDef(tree);
  TreeExpand(tree, nil);
  TreeCollapse(tree, 1);
end;

procedure TFormMain.BuildPresetExtensions;
var
  tree: TVirtualStringTree;
  game: TCurrentGame;

  procedure BuildExts(APreset: TQDirIni; ANode: PVirtualNode);
  begin
    var a := GetBuildPresets(true, APreset);

    for var i := 0 to length(a) - 1 do begin
      var p := tree.AddChild(ANode, a[i]);
      var ini := TQDirIni(a[i]).Ini;

      var radio := IsTrue(ini['.', 'radio']);
      if radio then p.CheckType := ctRadioButton
      else p.CheckType := ctCheckBox;
      if ((game.Map = nil) or radio) and (IsTrue(ini['.', 'Checked'])) then p.CheckState := csCheckedNormal;

      BuildExts(TQDirIni(a[i]), p);
    end;
  end;

const prevPreset0: TQDirIni = nil;
begin
  tree := TreePresets;
  game := CurrentGame;
  var preset := CurrentPresetR;
  var presets := CurrentPresets;
  var fn := tree.FocusedNode;

  if (preset = nil) or
     (length(presets) = 0) or
     (tree.GetNodeLevel(fn) > 0) or
     ((prevPreset0 = presets[0]) and tree.Expanded[fn]) then exit;

  prevPreset0 := presets[0];

  var n := tree.GetFirst;
  while n <> nil do
    if (tree.GetNodeLevel(n) = 0) and (tree.ChildCount[n] > 0) then begin
      tree.DeleteChildren(n, true);
      n := tree.GetFirst;
    end
    else n := tree.GetNext(n);

  BuildExts(preset, fn);

  tree.Expanded[fn] := true;
  TreeRowsHeightDef(tree);
end;

procedure TFormMain.BuildHistory;
begin
  var tree := TreeHistory;
  tree.Clear;
  for var i := 0 to FDirHistory.Count - 1 do begin
    var n := tree.AddChild(nil, FDirHistory[i]);
    n.States := n.States + [vsMultiline];
  end;
  TreeRowsHeightDef(tree, 2);
  TreeExpand(tree, nil);
end;

procedure TFormMain.BuildRun;
begin
  var tree := TreeRun;
  tree.RootNodeCount := FRun.Strings.Count;
  TreeRowsHeightDef(tree);
  TreeExpand(tree, nil);

  PageControl.ActivePage := TabSheetRun;
end;

function TFormMain.TreeDisplayedHeight;
begin
  Result := 0;
  var n := ATree.GetFirstVisible;
  while Assigned(n) do begin
    inc(Result, ATree.NodeHeight[n]); // + ATree.ExtraLineSpacing;
    n := ATree.GetNextVisible(n);
  end;
end;

procedure TFormMain.ButtonClipboardClick(Sender: TObject);
begin
  var s := CmdLine;
  ClipBoard.SetTextBuf(pChar(s));
  TThreadHint.Create(PanelHint, ButtonClipboard, 'Copied to clipboard');
end;

procedure TFormMain.ButtonUpClick(Sender: TObject);
begin
  var tree := TreeRun;
  if (tree.FocusedNode <> nil) then begin
    var i := tree.FocusedNode.Index;

    if i >= 0 then begin
      var j := i + TWinControl(Sender).Tag;
      var s := FRun.FStrings[i];
      FRun.FStrings[i] := FRun.FStrings[j];
      FRun.FStrings[j] := s;

      var n: PVirtualNode;
      if TWinControl(Sender).Tag = 1 then n := tree.GetNext(tree.FocusedNode)
      else n := tree.GetPrevious(tree.FocusedNode);

      tree.Selected[n] := true;
      tree.FocusedNode := n;
      tree.Invalidate;
    end;
  end;
end;

function TFormMain.CmdLine;
begin
  Result := Quotes(FRun.Exe) + ' ' + FRun.CmdParam;
end;

function TFormMain.IsBranch;
begin
  Result := Copy(AName, 1, length(CBranch)) = CBranch;
end;

function TFormMain.BranchName;
begin
  if IsBranch(AName) then Result := EStr(AName, CBranch)
  else Result := AName;
end;

procedure TFormMain.ScanHistory;
begin
  FDirHistory.Scan('history', nil, '*.ini', faNormal);
  FDirHistory.Sort(TDelegatedComparer<TQDir>.Create(
    function(const AItem1, AItem2: TQDir): integer
    begin
      if AItem1.Time > AItem2.Time then Result := -1
      else if AItem1.Time = AItem2.Time then Result := 0
      else Result := 1;
    end
  ));

  try
    var max := FIniParams['cfg', 'maxhistory'].ToInteger;
    if max > 0 then
      while FDirHistory.Count > max do begin
        DeleteFile(ExpandLongFileName(FDirHistory[FDirHistory.Count - 1].FileName));
        FDirHistory.Delete(FDirHistory.Count - 1);
      end;
  except
  end;

  BuildHistory;
end;

function TFormMain.TreeFocusedDir;
begin
  if ATree.FocusedNode <> nil then Result := NodeDir(ATree, ATree.FocusedNode)
  else Result := nil;
end;

function TFormMain.CurrentGame;
begin
  with Result do begin
    Game := nil;
    Map := nil;
    Demo := nil;
  end;

  var tree := TreeGames;
  var p := tree.FocusedNode;
  if (p <> nil) and (tree.GetNodeLevel(p) > 0) then begin

    case NodeType(tree, p) of
      ntSection: Result.Game := NodeSection(tree, p);
      ntDir: begin
        var dir := NodeDir(tree, p);
        case DirType(dir) of
          dtMap: begin
            var d := NodeDir(tree, p);
            { if not IsBranch(d.Name) then } Result.Map:=d;
          end;
          dtDemo: begin
            Result.Demo := TQDirDemo(NodeDir(tree, p));
            Result.Map := TQDirIni(Result.Demo.Parent);
          end;
        end;

        if Result.Map <> nil then
          Result.Game := FIniGames.Items[Result.Map.Root(1).Name];
      end;
    end;
  end;
end;

function TFormMain.CurrentHistory;
begin
  Result := TreeFocusedDir(TreeHistory);
end;

function TFormMain.CurrentPresetR;
begin
  Result := TreeFocusedDir(TreePresets);
end;

function TFormMain.CurrentPresets;
var tree: TVirtualStringTree;

  function ParentsChecked(ANode: PVirtualNode): boolean;
  begin
    Result := tree.GetNodeLevel(ANode) > 0;
    if Result then begin
      ANode := tree.NodeParent[ANode];
      while Result and (tree.GetNodeLevel(ANode) > 0) do begin
        Result := tree.CheckState[ANode] = csCheckedNormal;
        ANode := tree.NodeParent[ANode];
      end;
    end;
  end;

begin
  Result := [];
  tree := TreePresets;
  var n := tree.FocusedNode;

  if n <> nil then begin
    while tree.GetNodeLevel(n) > 0 do n := n.Parent;
    var d := NodeDir(tree, n);
    if d <> nil then begin
      TArr<TQDirIni>.Push(Result, d);

      n := tree.GetFirstChecked;
      while n <> nil do begin
        if ParentsChecked(n) then TArr<TQDirIni>.Push(Result, NodeDir(tree, n));
        n := tree.GetNextChecked(n);
      end;
    end;
  end;
end;

procedure TFormMain.BuildBranchMaps;
begin
  if ADir <> nil then begin
    SortDir(ADir);

    for var i := 0 to ADir.Count - 1 do
      if not ADir[i].IsDir or (ADir[i].Count > 0) then begin
        var n := ATree.AddChild(AParent, ADir[i]);

        var demos := MapDemos(ADir[i]);
        for var z := 0 to length(demos) - 1 do ATree.AddChild(n, demos[z]);

        if IsBranch(ADir[i].Name) then BuildBranchMaps(ATree, n, ADir[i], ACheckType)
        else n.CheckType := ACheckType;
      end;
  end;
end;

function TFormMain.GetCustomPreset;
begin
  FCustomPreset.Clear;
  FCustomPreset.Scan('Custom');
  FCustomPreset.Ini['.', 'name'] := 'Custom';

  var tree := TreeMods;
  var p: PVirtualNode := tree.GetFirstChecked;
  while p <> nil do begin
    FCustomPreset.Ini.Strings.Add(CutLauncherPath(NodeDir(TreeMods, p).FileName, 'mods'));
    p := TreeMods.GetNextChecked(p);
  end;

  Result := FCustomPreset;
end;

procedure TFormMain.ApplyConfig;

  procedure __s(key, def: string);
  begin
    if FIniParams['cfg', key].IsEmpty then FIniParams['cfg', key] := def;
  end;

  procedure __b(key: string; def: boolean);
  begin
    var s := FIniParams['cfg', key];
    if not s.IsEmpty then def := IsTrue(s);
    FIniParams['cfg', key] := BoolToStr(def);
  end;

  procedure __i(key: string; min, max, def: integer);
  begin
    var b := false;
    try
      var i := FIniParams['cfg', key].ToInteger;
      b := (i >= min) and (i <= max);
    except
    end;
    if not b then FIniParams['cfg', key] := def.ToString;
  end;

begin
  var r: TRect;
  SystemParametersInfo(SPI_GETWORKAREA, 0, @r, 0);

  if Screen.Fonts.IndexOf(FIniParams['cfg', 'fontname']) = -1 then FIniParams['cfg', 'fontname'] := '';

  __b('log', true);
  __b('closeafterlaunch', true);
//  __b('createsavedir', false);
  __b('copydefaultconfig', true);
  __b('drawinfo', true);
  __b('markfont', true);
  __b('markbackground', true);
  __b('markhistory', true);
  __b('shortpresetsforfolders', true);
  __b('showtreelines', true);
  __b('useexplorertheme', true);
  __i('maxhistory', 1, 500, 50);

  __s('fontname', Application.DefaultFont.Name);
  __s('fontstyle', FontStylesToStr(Application.DefaultFont.Style));
  __i('fontsize', 7, 14, Application.DefaultFont.Size);
  __i('width', CFormMinX, r.Width, CFormMinX);
  __i('height', CFormMinY, r.Height, CFormMinY);
  __s('winstate', 'normal');
  __s('notepad', 'notepad.exe');

  Font.Name := FIniParams['cfg', 'fontname'];
  Font.Style := StrToFontStyles(FIniParams['cfg', 'fontstyle']);
  Font.Size := FIniParams['cfg', 'fontsize'].ToInteger;

  var v := Visible;
  Visible := false;
  Width := FIniParams['cfg', 'width'].ToInteger;
  Height := FIniParams['cfg', 'height'].ToInteger;
  if FIniParams['cfg', 'winstate'].ToLower = 'maximized' then WindowState := TWindowState.wsMaximized
  else WindowState := TWindowState.wsNormal;
  Visible := v;
end;

procedure TFormMain.Exec;
begin
{  ShellExecute(0, nil,
    PWideChar(UTF8ToString(ACommand)), PWideChar(UTF8ToString(AParams)), PWideChar(UTF8ToString(ADirectory)),
    SW_SHOWNORMAL);}

  ShellExecute(0, nil,
    PWideChar(ACommand), PWideChar(AParams), PWideChar(ADirectory),
    SW_SHOWNORMAL);
end;

function TFormMain.ToLog;
var f: TextFile;
begin
  AFileName := ExpandLongFileName(AFileName);
  AssignFile(f, AFileName);
  try
    if FileExists(AFileName) then Append(f)
    else Rewrite(f);
    WriteLn(f, FormatDateTime('dd.mm.yyyy hh:mm:ss  ', Now), AString);
    CloseFile(f);
    Result := true;
  except
    Result := false;
  end
end;

procedure TFormMain.OpenNotePad;
begin
  ShellExecute(Handle, 'open',
    PWideChar(FIniParams['cfg', 'notepad']), PWideChar(AFileName), nil,
    SW_SHOWNORMAL);
end;

procedure TFormMain.ScanPorts;

  function MenuItemCreate(AIndex: integer; ACaption: string): TMenuItem;
  begin
    Result := TMenuItem.Create(self);
    Result.Caption := ACaption;
    Result.Tag := AIndex;
    Result.OnClick := MIPRun.OnClick;

    if (AIndex > 0) and (AIndex <= 10) then begin
      if AIndex = 10 then AIndex := 0;
      Result.ShortCut :=  TextToShortCut('Alt+' + AIndex.ToString);
    end
    else if (AIndex >= -10) and (AIndex < 0) then begin
      if AIndex = -10 then AIndex := 0;
      Result.ShortCut := TextToShortCut('Alt+Ctrl+' + (-AIndex).ToString);
    end;
  end;

  procedure MakeSortNames(APorts: TQDirIni);
  begin
    for var i := 0 to APorts.Count - 1 do begin
      var s := APorts.Items[i].Name;
      var parts := s.Split(['-']);

      case length(parts) of
        2: if length(parts[1]) = 1 then s := parts[0] + '-0' + parts[1];
        3: try
          var num2 := StrToInt(parts[1]);
          if (num2 >= 0) and (num2 <= 9) then parts[1] := Format('%.2d', [num2]);
          s := parts[0];
          for var j := 1 to High(parts) do s := s + '-' + parts[j];
        except end;
      end;

      APorts.Items[i].Ini['.', 'sortname'] := s;
    end;
  end;

begin
  var ports := FDirPorts;

  MakeSortNames(ports);
  ports.Sort(TDelegatedComparer<TQDir>.Create(
    function(const AItem1, AItem2: TQDir): integer
    begin
      var s1 := TQDirIni(AItem1).Ini['.', 'sortname'];
      var s2 := TQDirIni(AItem2).Ini['.', 'sortname'];
      if s1 < s2 then Result := -1
      else if s1 > s2 then Result := 1
      else Result := 0;
    end
  ));

  var fcount := FIniPorts.Count;

  for var i := 0 to fcount - 1 do begin
    var name := FIniPorts.Items[i].Name.ToLower;
    var def := FIniPorts[i, 'default'].ToLower;

    FIniPorts.Items[i]['port'] := name;
    FIniPorts.Items[i].Name := def;

    var p := TQDirIni(ports.QItem([def]));
    if p <> nil then begin
      FIniPorts.Items[i]['info'] := p.Ini['.', 'info'];
      FIniPorts.Items[i]['iname'] := p.IName;
    end;

    for var j := ports.Count - 1 downto 0 do begin
      var pn := ports[j].Name.ToLower;
      if (name + '_' = Copy(pn, 1, length(name) + 1)) and (pn <> def) then begin
        var s := TQISection.Create;
        s.Assign(FIniPorts.Items[i]);
        s.name := pn;
        s['info'] := ports[j].Ini['.', 'info'];
        s['save'] := ports[j].Ini['.', 'save'];
        s['iname'] := ports[j].IName;
        if not ports[j].Ini['.', 'name'].IsEmpty then s['iname_flag'] := 'true';
        if not ports[j].Ini['.', 'exe'].IsEmpty then s['exe'] := ports[j].Ini['.', 'exe'];

        FIniPorts.Add(s);
      end;
    end;
  end;

  for var i := 0 to FIniPorts.Count - 1 do begin
    var n1 := '';
    if IsTrue(FIniPorts.Items[i]['iname_flag']) then n1 := FIniPorts.Items[i]['iname']
    else begin
      n1 := FIniPorts.Items[i]['name'];
      var n2 := FIniPorts.Items[i].name;
      n2 := Copy(n2, length(n1) + 2, MaxInt);
      MergeStr(n1, n2, ' ');
      n1 := TQDirIni.MakeIName(n1);
    end;

    // ??? нафига ???
    FIniPorts.Items[i]['name'] := n1;

    // меню Run with port
    var idx := i + 1;
    MIPRunPort.Add(MenuItemCreate(idx, n1));
    MIPRunQuickPort.Add(MenuItemCreate(-idx, n1));
    MIMRunPort.Add(MenuItemCreate(idx, n1));
    MIMRunQuickPort.Add(MenuItemCreate(-idx, n1));
  end;
end;

function TFormMain.FindPort;
begin
  Result := nil;

  var i := 0;
  while (Result = nil) and (i < FIniPorts.Count) do begin
    if FIniPorts.items[i].Name = APort then Result := FIniPorts.Items[i];
    inc(i);
  end;

  i := 0;
  while (Result = nil) and (i < FIniPorts.Count) do begin
    if Copy(FIniPorts.items[i].Name, 1, length(APort)) = APort then Result := FIniPorts.Items[i];
    inc(i);
  end;

  if (Result = nil) and (FIniPorts.Count > 0) then Result := FIniPorts.Items[0];
end;

function TFormMain.VrfFileName;
begin
  Result := AFileName;
  if not DirectoryExists(Result) and not FileExists(Result) then begin
    var fn := ChangeFileExt(Result, '.pk3');
    if FileExists(fn) then Result := fn
    else begin
      fn := ChangeFileExt(Result, '.wad');
      if FileExists(fn) then Result := fn;
    end;
  end;
end;

function TFormMain.FirstFilter;
begin
  Result := Split(AGame['filter'], '.', 1)[0];
end;

function TFormMain.VrfFilter;
begin
  Result := false;

  AFilter := AFilter.ToLower;
  AValue := AValue.ToLower;

  AFilter := FilterNormal(AFilter);
  var a := Split(AValue, ',', 0);

  // пока так, но желательно сравнить два массива
  var i := 0;
  while not Result and (i < length(a)) do begin
    Result := Pos(FilterNormal(a[i]), AFilter) > 0;
    inc(i);
  end;
end;

function TFormMain.FilterNormal;
begin
  Result := StringReplace('.' + APart + '.', '..', '.', [rfReplaceAll]);
end;

function TFormMain.MapFilter;
begin
  Result := AFilter;
  if AMap <> nil then Result := Result + '.map';
end;

function TFormMain.DirNameSpec;
begin
  Result := ChangeFileExt(AName, '').ToLower;
  if AShort then begin
    var a := Split(Result, '.', 1);
    Result := a[length(a) - 1];
  end;
end;

procedure TFormMain.RunHistory;
begin
  if AHistory <> nil then begin
    var h := TQIFileExt.Create(AHistory.FileName);
    FRun.Clear;
    FRun.Assign(h);
    h.Free;
    Run0(AQuick);
  end;
end;

procedure TFormMain.RunPresets;
var
  game: TCurrentGame;
  presets: TArray<TQDirIni>;
  preset: TQDirIni;
  port: TQISection;

  function Filter(ADir: TQDirIni): boolean;
  begin
    var _group := FIniGames[game.Game.Name, 'group'];
    var _group_ := ADir.Ini['.', 'group'].ToLower;
    var _game := game.Game.Name.ToLower;
    var _game_ := ADir.Ini['.', 'game'].ToLower;
    var _port1 := port['port'];
    var _port2 := port.name;
    var _port_ := Split(ADir.Ini['.', 'port'].ToLower, ',', 0);
    var _antiport_ := Split(ADir.Ini['.', 'antiport'].ToLower, ',', 0);
    var _preset := preset.Name; // ??? preset.Ini['.', 'preset'].ToLower;
    var _preset_ := ADir.Ini['.', 'preset'].ToLower;
    var _antipreset_ := ADir.Ini['.', 'antipreset'].ToLower;
    var _filter := MapFilter(FIniGames[game.Game.Name, 'filter'], game.Map);
    var _filter_ := ADir.Ini['.', 'filter'].ToLower;
    var _antifilter_ := ADir.Ini['.', 'antifilter'].ToLower;
    var _map_ := ADir.Ini['.', 'map'].ToLower;
    var _antimap_ := ADir.Ini['.', 'antimap'].ToLower;

    Result := false;

    if not _group_.IsEmpty and (_group <> _group_) then exit;
    if not _game_.IsEmpty and (_game <> _game_) then exit;
    if not _preset_.IsEmpty and not VrfFilter(_preset, _preset_) then exit;
    if not _antipreset_.IsEmpty and VrfFilter(_preset, _antipreset_) then exit;
    if not _filter_.IsEmpty and not VrfFilter(_filter, _filter_) then exit;
    if not _antifilter_.IsEmpty and VrfFilter(_filter, _antifilter_) then exit;
    if (length(_port_) > 0) and (IndexOfStr(_port_, _port1) = -1) and (IndexOfStr(_port_, _port2) = -1) then exit;
    if (length(_antiport_) > 0) and ((IndexOfStr(_antiport_, _port1) <> -1) or (IndexOfStr(_antiport_, _port2) <> -1)) then exit;

    if not _map_.IsEmpty and (game.Map <> nil) and not VrfFilter(game.Map.Name, _map_) then exit;
    if not _antimap_.IsEmpty and (game.Map <> nil) and VrfFilter(game.Map.Name, _antimap_) then exit;

    Result := true;
  end;

  // раньше была функция, но не теперь...
  function DirFiles(ADir: TQDirIni; ARootName, ACmd: string): string;
  var compatibility: TArray<string>;

    procedure VrfCompatibility(AFile: string);

      function VrfCompatibilityFileName(AName: string): string;
      begin
        Result := VrfFileName(NormalPath(FIniConfig['launcher', 'compatibility']) + AName);
        Result := ChangeFileExt(AName, ExtractFileExt(Result)); // гы
      end;

    begin
      var c := FIniCompatibility['files', AFile];
      if c.IsEmpty then c := FIniCompatibility['files', ChangeFileExt(AFile, '')];

      if not c.IsEmpty then begin
        var cpath := FIniCompatibility[c, 'path'];
        if not cpath.IsEmpty then cpath := NormalPath(cpath);

        var d := FIniCompatibility[c + '.games', game.Game.Name];
        if not d.IsEmpty then TArr<string>.Push(compatibility, VrfCompatibilityFileName(cpath + d));

        if MapWithCompatibility(c, game.Map, d) then
          TArr<string>.Push(compatibility, VrfCompatibilityFileName(cpath + d));
      end;
    end;

    function item(s: string): string;
    begin
      Result := CutLauncherPath(s, ARootName);

      // compatibility
      VrfCompatibility(NormalPath(ARootName) + Result);

      Result := Format(Quotes(NormalPath(FIniConfig['ports', ARootName]) + '%s'), [Result]);
    end;

  begin
    Result := '';
    if ADir <> nil then
      if not ADir.IsDir then begin
        if Filter(ADir) then Result := item(ADir.FileName)
      end
      else
        if Filter(ADir) then
          for var i := 0 to ADir.Count - 1 do
            if Filter(ADir[i]) then MergeStr(Result, item(ADir[i].FileName), ' ');

    if not Result.IsEmpty then FRun.Strings.Add(ACmd + ' ' + Result);

    // compatibility
    for var i := 0 to length(compatibility) - 1 do
      FRun.Strings.Add('-file ' + Quotes(NormalPath(FIniConfig['ports', 'compatibility']) + compatibility[i]));
  end;

  function DirNameFiles(ADirName, ARootName, ACmd: string): string;
  begin
    var d := TQDirIni.Create(VrfFileName(NormalPath(FIniConfig['launcher', ARootName]) + ADirName));
    Result := DirFiles(d, ARootName, ACmd);
    d.Free;
  end;

  function PresetsNames: string;
  begin
    var short := IsTrue(FIniParams['cfg', 'shortpresetsforfolders']);
    Result := DirNameSpec(preset.Name, short);

    if FRun.FCustom then Result := NormalPath(Result) + CHistoryName
    else
      for var i := 1 to length(presets) - 1 do
        if not IsTrue(presets[i].Ini['.', 'safe']) then MergeStr(Result, DirNameSpec(presets[i].Name, short), '_');

    Result := StringReplace(Result, '__', '_', [rfReplaceAll]);
  end;

  procedure RunExe(AExe, ACmd, AGameName, APresetName: string);
  begin
    FRun.Strings.Add(NormalPath(FIniConfig['launcher', 'games']) + AExe);
    if not ACmd.IsEmpty then FRun.Strings.add(ACmd);

    FRun['.', 'port_name'] := ExtractFileName(AExe);
    FRun['.', 'game_name'] := AGameName;
    FRun['.', 'preset_name'] := APresetName;
  end;

  procedure DeleteDublicates;
  begin
    for var i := FRun.Strings.Count - 1 downto 1 do // 1 патамучта в 0 exe`шка
      for var j := 1 to i - 1 do
        if FRun.Strings[i].Trim.ToLower = FRun.Strings[j].Trim.ToLower then begin
          FRun.Strings.Delete(i);
          break;
        end;
  end;

begin
  game := AGame;
  presets := APresets;
  port := nil;
  if length(presets) > 0 then preset := presets[0]
  else preset := nil;

  FRun.Clear;
  FRun.FCustom := preset = FCustomPreset;
  FRun.FPresetExe := preset =  FExePreset;

  if (game.Game = nil) or (preset = nil) then exit;

  if not preset.Ini['.', 'exe'].IsEmpty then // игры из ..\games через preset
    RunExe(preset.Ini['.', 'exe'], preset.Ini['.', 'cmd'], game.Game['name'], preset.IName)

  else if not game.Game['exe'].IsEmpty then // игры из ..\games через games.ini
    RunExe(game.Game['exe'], game.Game['cmd'], game.Game['name'], '')

  else begin // запуск порта через пресет
    if APort.IsEmpty then
      if game.Demo <> nil then APort := game.Demo.Ini['.', 'port'];
    if APort.IsEmpty then APort := preset.Ini['.', 'port'];
    if APort.IsEmpty then APort := game.Game['port'];
    port := FindPort(APort);

    FRun['.', 'port'] := port.Name;
    FRun['.', 'port_group'] := port['port'];
    FRun['.', 'game'] := game.Game.Name;
    if game.Map <> nil then FRun['.', 'map'] := game.Map.FileName;
    if game.Demo <> nil then FRun['.', 'demo'] := game.Demo.FileName;
    FRun['.', 'preset'] := preset.Name;

    FRun['.', 'port_name'] := port['name'];
    FRun['.', 'game_name'] := game.Game['name'];
    if game.Map <> nil then FRun['.', 'map_name'] := game.Map.IName;
    if game.Demo <> nil then FRun['.', 'demo_name'] := game.Demo.Name2;
    var s := preset.IName;
    for var i := 1 to length(presets) - 1 do MergeStr(s, presets[i].IName, ', ');
    FRun['.', 'preset_name'] := s;

    // exe
    FRun.Strings.Add(NormalPath(FIniConfig['launcher', 'ports']) + NormalPath(port.Name) + port['exe']);

    // cmd
    FRun.FConfig := port.Name;
    if not game.Game['config'].IsEmpty then FRun.FConfig := FRun.FConfig + '_' + game.Game['config'];
    if not preset.Ini['.', 'config'].IsEmpty then FRun.FConfig := FRun.FConfig + '_' + preset.Ini['.', 'config'];
    if (game.Map <> nil) and not game.Map.Ini['.', 'config'].IsEmpty then FRun.FConfig := FRun.FConfig + '_' + game.Map.Ini['.', 'config'];
    FRun.FConfig := FRun.FConfig + '.ini';

    var map := 'default';
    if game.Map <> nil then map := DirNameSpec(game.Map.Name, false);

    var cmd := StringReplace(port['cmd'], '%config%', Quotes(NormalPath(FIniConfig['ports', 'configs']) + FRun.FConfig), []);
    FRun.FCopyConfig := cmd <> port['cmd'];
    var portsavedir := port.Name;
    if not port['save'].IsEmpty then portsavedir := port['save'];
    cmd := StringReplace(cmd, '%savedir%', Quotes(NormalPath(FIniConfig['ports', 'save']) + portsavedir + '\' + game.Game.Name + '\' + map + '\' + PresetsNames), []);
    cmd := StringReplace(cmd, '%shotdir%', Quotes(FIniConfig['ports', 'screenshots']), []);
    if not cmd.IsEmpty then FRun.Strings.add(cmd);

    // iwad
    FRun.Strings.Add('-iwad ' + Quotes(NormalPath(FIniConfig['ports', 'iwads']) + game.Game['iwad']));
    var a := game.Game.ValueArray['file'];
    for var i := 0 to length(a) - 1 do
      FRun.Strings.Add('-file ' + Quotes(NormalPath(FIniConfig['ports', 'iwads']) + a[i])); // нет проверки на фильтры

    // map
    if game.Map <> nil then DirFiles(game.Map, 'maps', '-file');

    // demo
    if game.Demo <> nil then DirFiles(game.Demo, 'maps', '-playdemo');

    // mods
    var mods:= TQIFileExt.Create;
    var mods_txt := '';

    for var b := true downto false do
      for var j := 0 to length(presets) - 1 do begin

        var before := IsTrue(presets[j].Ini['.', 'before']); // Before
        if (b and before) or (not b and not before) then begin

          if (j = 0) and FRun.FCustom then mods.Strings.Assign(preset.Ini.Strings) // костыль
          else mods.LoadFromFile(presets[j].FileName);

          for var i := 0 to mods.Strings.Count - 1 do begin
            DirNameFiles(mods.Strings[i], 'mods', '-file');

            var m := Split(mods.Strings[i], '\', 1);
            MergeStr(mods_txt, m[length(m) - 1], ', ');
          end;
        end;
      end;

    FRun['.', 'mods'] := mods_txt;
    mods.Free;

    DeleteDublicates;
  end;

  Run0(AQuick);
end;

procedure TFormMain.Run0;
begin
  if AQuick then Run
  else begin
    BuildRun;
    Enableds;
  end;
end;

procedure TFormMain.Run;
begin
  if FRun.Strings.Count > 0 then begin
    var exe := FRun.Exe;
    var exedir := ExtractFilePath(exe);
    var cmd := FRun.CmdParam;
    var config := FRun.FConfig;
    var hash := THashSHA1.GetHashString(exe + cmd);
    cmd := StringReplace(cmd, CHistoryName, hash, [rfReplaceAll]);;

    // copy config
    var pthconfig := ExpandLongFileName(NormalPath(FIniConfig['launcher', 'configs']));
    if not DirectoryExists(pthConfig) then
      try ForceDirectories(pthConfig); except end;

    if IsTrue(FIniParams['cfg', 'copydefaultconfig']) and FRun.FCopyConfig and not config.IsEmpty then begin
      config := pthconfig + config;
      var gr := FRun['.', 'port_group'];
      var defconfig := pthconfig + 'default_' + gr + '.ini';
      if not FileExists(defconfig)  then defconfig := pthconfig + gr + '_default.ini';
      if not FileExists(defconfig) then defconfig := pthconfig + 'default.ini';
      if FileExists(defconfig) and not FileExists(config) then
        try CopyFile(PWideChar(defconfig), PWideChar(config), true); except end;
    end;

    // history
    var pth := NormalPath(ExpandLongFileName('history'));
    if not DirectoryExists(pth) then
      try ForceDirectories(pth); except end;

    try FRun.SaveToFile(pth + hash + '.ini'); except end;
    ScanHistory;
    PageControl.ActivePage := TabSheetHistory;

    // log
    if IsTrue(FIniParams['cfg', 'log']) then ToLog(LogFileName, Quotes(exe) + ' ' + cmd);

    // run
    Exec(exe, cmd, exedir);

    // close after launch
    if IsTrue(FIniParams['cfg', 'closeafterlaunch']) then Close;
  end;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  Enableds;
end;

procedure TFormMain.PageControlChange(Sender: TObject);
begin
  Enableds;
end;

procedure TFormMain.TreeGamesChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  if Sender = TreePresets then BuildPresetExtensions;
  Enableds;
end;

procedure TFormMain.TreeGamesContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin
  if Sender is TVirtualStringTree then begin
    var Tree := TVirtualStringTree(Sender);
    var pt := Tree.ClientToScreen(MousePos);
    var tn := Tree.GetNodeAt(MousePos.X, MousePos.Y - 1);
    if tn <> nil then begin
      Tree.SetFocus;
      Tree.Selected[tn] := true;
      Tree.FocusedNode := tn;
      if Assigned(Tree.PopupMenu) then Tree.PopupMenu.Popup(pt.X, pt.Y);
      Handled := true;
    end;
  end;
end;

procedure TFormMain.MIAHistoryClick(Sender: TObject);
begin
  if (Sender = MIAHistory) or (Sender = ButtonAboutHistory) then
    PageControl.ActivePage := TabSheetHistory
  else
    PageControl.ActivePage := TabSheetGames;

  Enableds;
end;

procedure TFormMain.MIHDeleteClick(Sender: TObject);
begin
  if MessageDlg('Delete this record?', mtConfirmation, [mbYes, mbNo], -1) = mrYes then begin
    DeleteFile(ExpandLongFileName(FDirHistory[TreeHistory.FocusedNode.Index].FileName));
    ScanHistory;
    Enableds;
  end;
end;

procedure TFormMain.MIPNotepadClick(Sender: TObject);
begin
  var fn: string;
  if Sender = MIPNotepad then fn := CurrentPresetR.FileName
  else fn := FDirHistory[TreeHistory.FocusedNode.Index].FileName;
  OpenNotePad(fn);
end;

procedure TFormMain.MIMClearClick(Sender: TObject);
begin
  while true do begin
    var p := TreeMods.GetFirstChecked(csCheckedNormal);
    if p <> nil then p.CheckState := csUncheckedNormal
    else break;
  end;
  TreeMods.Invalidate;
end;

procedure TFormMain.ButtonModsCollapseAllClick(Sender: TObject);
begin
  TreeMods.FullCollapse(nil);
end;

procedure TFormMain.ButtonModsExpandAllClick(Sender: TObject);
begin
  TreeMods.FullExpand(nil);
end;

procedure TFormMain.SiteClick;
begin
  ShellExecute(Handle, 'open', PChar('https://' + TLabel(Sender).Caption), nil, nil, SW_SHOWNORMAL);
end;

procedure TFormMain.EmailClick;
begin
  ShellExecute(Handle, 'open', PChar('mailto:' + TLabel(Sender).Caption), nil, nil, SW_SHOWNORMAL);
end;

procedure TFormMain.ViewLogClick;
begin
  OpenNotePad(LogFileName);
end;

procedure TFormMain.DeleteLogClick;
begin
  if MessageDlg('Delete log file?', mtConfirmation, [mbYes, mbNo], -1) = mrYes then
    DeleteFile(ExpandLongFileName(LogFileName));
end;

procedure TFormMain.ConfigFileClick;
begin
  OpenNotePad(IniFileName);
end;

procedure TFormMain.CtrlEnterClick;
begin
  CtrlEnter((tWinControl(Sender).Tag < 0) or IsCtrlDown);
end;

procedure TFormMain.CtrlEnterDblClick;
begin
  CtrlEnterClick(Sender);
end;

procedure TFormMain.TreeRunNodeDblClick(Sender: TBaseVirtualTree; const HitInfo: THitInfo);
begin
  if (Sender.FocusedNode <> nil) and
     (Sender.GetFirst() <> nil) and
     (Sender.FocusedNode = Sender.GetFirst()) then CtrlEnterClick(Sender);
end;

procedure TFormMain.BackClick;
begin
  Back;
end;

procedure TFormMain.MIPRunClick(Sender: TObject);
begin
  var t := TWinControl(Sender).Tag;
  var quick := t < 0;
  var idx := Abs(t) - 1;
  var s := '';
  if (t <> 0) and (idx >= 0) and (idx < FIniPorts.Count) then s := FIniPorts.Items[idx].Name;
  CtrlEnter(quick, s);
end;

procedure TFormMain.CtrlEnter;
begin
  if PageControl.ActivePage = TabSheetHistory then begin
    if MIHRun.Enabled then
      RunHistory(AQuick, CurrentHistory);
  end

  else if PageControl.ActivePage = TabSheetGames then begin
    if MIGNext.Enabled then begin
      var game := CurrentGame;
      if game.Game <> nil then begin
        PageControl.ActivePage := TabSheetPresets; // !!!

        var s := FIniGames[game.Game.Name, 'name'];
        if game.Map <> nil then s := s + ' - ' + game.Map.IName;
        if game.Demo <> nil then s := s + ' - ' + game.Demo.Name2;
        TabSheetPresets.Caption := '  ' + s + '  ';
      end;

      BuildPresets;
      BuildMods;
    end;
  end

  else if PageControl.ActivePage = TabSheetPresets then begin
    if MIPRun.Enabled then
      RunPresets(AQuick, CurrentGame, CurrentPresets, APort)
  end

  else if PageControl.ActivePage = TabSheetMods then begin
    if MIMRun.Enabled then
      RunPresets(AQuick, CurrentGame, [GetCustomPreset], APort)
  end

  else if PageControl.ActivePage = TabSheetRun then begin
    if MIRRun.Enabled then
      Run;
  end;

  Enableds;
  Abort;
end;

procedure TFormMain.Back;
begin
  if (PageControl.ActivePage = TabSheetPresets) or (PageControl.ActivePage = TabSheetMods) then
    PageControl.ActivePage := TabSheetGames

  else if PageControl.ActivePage = TabSheetRun then begin
    if FRun.FromHistory then
      PageControl.ActivePage := TabSheetHistory

    else if FRun.FromMods then
      PageControl.ActivePage := TabSheetMods

    else
      PageControl.ActivePage := TabSheetPresets;
  end;

  Enableds;
end;

procedure TFormMain.GoPage;
begin
  var i := PageControl.ActivePageIndex;
  var j := -1;

  while true do begin
    i := i + AGo;
    if (i < 0) or (i >= PageControl.PageCount) then break;
    if PageControl.Pages[i].TabVisible then begin
      j := i;
      break;
    end;
  end;

  if j <> -1 then begin
    PageControl.ActivePageIndex := j;
    Enableds;
  end;
end;

procedure TFormMain.Enableds;

  procedure MoveButton(ATabSheet: TTabSheet; ATree: TVirtualStringTree; ATopControl: TWinControl; AVControl, AButton: TSpeedButton); begin
    if ATabSheet.TabVisible and (ATree.Tag > 0) then begin
      var v := 0;
      if AVControl <> nil then v := AVControl.Top + AVControl.Height;
      var h := PanelRunButtons.Top * 2 + v;
      ATopControl.Height := Min(Max(TreeDisplayedHeight(ATree), h),
                                ATabSheet.ClientHeight - round(AButton.Top * 5 / 3) - AButton.Height);
    end;
  end;

begin
  var game := CurrentGame;

  var h := PageControl.ActivePage = TabSheetHistory;
  var g := PageControl.ActivePage = TabSheetGames;
  var p := PageControl.ActivePage = TabSheetPresets;
  var m := PageControl.ActivePage = TabSheetMods;
  var r := PageControl.ActivePage = TabSheetRun;

  TabSheetPresets.TabVisible := p or m or (r and not FRun.FromHistory);
  TabSheetMods.TabVisible := TabSheetPresets.TabVisible and (game.Game <> nil) and game.Game['exe'].IsEmpty;
  TabSheetRun.TabVisible := r;

  if Visible then begin
    if h then TreeHistory.SetFocus;
    if g then TreeGames.SetFocus;
    if p then TreePresets.SetFocus;
    if m then TreeMods.SetFocus;
    if r then TreeRun.SetFocus;
  end;

  MIHRun.Enabled := h and (TreeHistory.FocusedNode <> nil);
  MIHRunQuick.Enabled := MIHRun.Enabled;
  MIHDelete.Enabled := MIHRun.Enabled;
  MIHNotepad.Enabled := MIHRun.Enabled;
  ButtonHistoryRun.Enabled := MIHRun.Enabled;
  MoveButton(TabSheetHistory, TreeHistory, TreeHistory, nil, ButtonHistoryRun);

  MIGNext.Enabled := g and (game.Game <> nil) and ((game.Map = nil) or not IsBranch(game.Map.Name));
  ButtonGamesRun.Enabled := MIGNext.Enabled;
  MoveButton(TabSheetGames, TreeGames, TreeGames, nil, ButtonGamesRun);

  var tpfn := TreePresets.FocusedNode;
  if (tpfn <> nil) and (TreePresets.GetNodeLevel(tpfn) = 0) then TreePresets.OnNodeDblClick := CtrlEnterDblClick
  else TreePresets.OnNodeDblClick := nil;

  MIPRun.Enabled := p and (tpfn <> nil);
  MIPRunQuick.Enabled := MIPRun.Enabled;
  MIPRunPort.Enabled := MIPRun.Enabled and not game.Game['iwad'].IsEmpty and (game.Demo = nil);
  MIPRunQuickPort.Enabled := MIPRunPort.Enabled;
  MIPNotepad.Enabled := MIPRun.Enabled;
  MIPBack.Enabled := p;
  ButtonPresetsRun.Enabled := MIPRun.Enabled;
  MoveButton(TabSheetPresets, TreePresets, TreePresets, nil, ButtonPresetsRun);

  ButtonModsReset.Enabled := m and (TreeMods.RootNodeCount > 0);
  ButtonModsCollapseAll.Enabled := ButtonModsReset.Enabled;
  ButtonModsExpandAll.Enabled := ButtonModsReset.Enabled;
  MIMClear.Enabled := ButtonModsReset.Enabled;
  MIMCollapseAll.Enabled := ButtonModsCollapseAll.Enabled;
  MIMExpandAll.Enabled := ButtonModsExpandAll.Enabled;
  MIMRun.Enabled := m;
  MIMRunPort.Enabled := MIMRun.Enabled;
  MIMRunQuick.Enabled := MIMRun.Enabled;
  MIMRunQuickPort.Enabled := MIMRun.Enabled;
  MIMBack.Enabled := m;
  MoveButton(TabSheetMods, TreeMods, PanelModsTop, ButtonModsExpandAll, ButtonModsRun);

  with TreeRun do begin
    ButtonClipboard.Enabled := r;
    ButtonUp.Enabled := r and (FocusedNode <> nil) and (FocusedNode.Index > 1);
    ButtonDown.Enabled := r and (FocusedNode <> nil) and (FocusedNode.Index > 0) and (FocusedNode.Index < RootNodeCount - 1);
    ButtonCreatePreset.Enabled := false;
    ButtonCreatePreset.Visible := false;

    MIRRun.Enabled := r;
    MIRMoveUp.Enabled := ButtonUp.Enabled;
    MIRMoveDown.Enabled := ButtonDown.Enabled;
    MIRClipboard.Enabled := ButtonClipboard.Enabled;
    MIRBack.Enabled := r;
  end;
  MoveButton(TabSheetRun, TreeRun, PanelRunTop, ButtonDown, ButtonRun);
end;

end.

