program doom_launcher2;

uses
  Vcl.Forms,
  __formmain in '__formmain.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  if VerifyRun then begin
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TFormMain, FormMain);
    Application.Run;
  end;
end.
