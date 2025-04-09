object dmTournamentData: TdmTournamentData
  OldCreateOrder = False
  Height = 225
  Width = 215
  object conData: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=TournamentDB.mdb;Mo' +
      'de=ReadWrite;Persist Security Info=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 16
    Top = 16
  end
  object tblUsers: TADOTable
    Connection = conData
    CursorType = ctStatic
    TableName = 'tblUsers'
    Left = 16
    Top = 80
  end
  object dscUsers: TDataSource
    Left = 96
    Top = 80
  end
  object tblScore: TADOTable
    Connection = conData
    CursorType = ctStatic
    TableName = 'tblScore'
    Left = 16
    Top = 152
  end
  object dscScore: TDataSource
    DataSet = tblScore
    Left = 96
    Top = 152
  end
end
