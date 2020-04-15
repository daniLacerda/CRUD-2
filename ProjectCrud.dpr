program ProjectCrud;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Limpar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLimpar, Limpar);
  Application.Run;
end.
