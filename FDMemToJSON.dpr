program FDMemToJSON;

uses
  Vcl.Forms,
  view.Principal in 'view.Principal.pas' {viewPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TviewPrincipal, viewPrincipal);
  Application.Run;
end.
