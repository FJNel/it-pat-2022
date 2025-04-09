unit TournamentData_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmTournamentData = class(TDataModule)
    conData: TADOConnection;
    tblUsers: TADOTable;
    dscUsers: TDataSource;
    tblScore: TADOTable;
    dscScore: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTournamentData: TdmTournamentData;

implementation

{$R *.dfm}

end.
