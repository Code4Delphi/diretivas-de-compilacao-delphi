program C4D.DiretivasCompilacao;

uses
  Vcl.Forms,
  View.Main in 'Src\View.Main.pas' {ViewMain},
  Utils in 'Src\Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewMain, ViewMain);
  Application.Run;
end.
