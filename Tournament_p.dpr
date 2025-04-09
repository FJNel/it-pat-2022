program Tournament_p;

uses
  Forms,
  Tournament_u in 'Tournament_u.pas' {frmLogin},
  TournamentData_u in 'TournamentData_u.pas' {dmTournamentData: TDataModule},
  frmView_u in 'frmView_u.pas' {frmView},
  frmManage_u in 'frmManage_u.pas' {frmManage};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.HelpFile := 'Application documentation.docx';
  Application.Title := 'Tournament Planner';
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TdmTournamentData, dmTournamentData);
  Application.CreateForm(TfrmView, frmView);
  Application.CreateForm(TfrmManage, frmManage);
  Application.Run;
end.
