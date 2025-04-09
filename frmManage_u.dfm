object frmManage: TfrmManage
  Left = 0
  Top = 0
  Caption = 'Manage tournament'
  ClientHeight = 546
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcManage: TPageControl
    Left = 0
    Top = 0
    Width = 777
    Height = 553
    ActivePage = tbsSchedule
    TabOrder = 0
    object tbsSchedule: TTabSheet
      Caption = 'Schedule creator'
      object lblCreate: TLabel
        Left = 0
        Top = 57
        Width = 577
        Height = 89
        Alignment = taCenter
        Caption = 'Create a schedule'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -67
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblCreateInfo: TLabel
        Left = 0
        Top = 149
        Width = 742
        Height = 28
        Alignment = taCenter
        Caption = 
          'Enter information in all the fields to create a schedule for the' +
          ' selected item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblItem: TLabel
        Left = 48
        Top = 176
        Width = 150
        Height = 28
        Caption = 'Select the item:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblScCreated: TLabel
        Left = 282
        Top = 333
        Width = 174
        Height = 28
        Caption = 'Created schedule:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblTime: TLabel
        Left = 536
        Top = 176
        Width = 234
        Height = 28
        Caption = 'Select start time + date:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblLunch: TLabel
        Left = 330
        Top = 176
        Width = 117
        Height = 28
        Caption = 'Break times'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblEnter: TLabel
        Left = 536
        Top = 279
        Width = 145
        Height = 28
        Caption = 'Can still enter?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblYesNo: TLabel
        Left = 687
        Top = 279
        Width = 74
        Height = 28
        Caption = '[Yes/No]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object pnlTitleCreate: TPanel
        Left = -8
        Top = 0
        Width = 777
        Height = 73
        Caption = 'Tournament Planner/Viewer'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -40
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object cmbItem: TComboBox
        Left = 48
        Top = 210
        Width = 184
        Height = 31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'Select item'
      end
      object pnlbtnCreate: TPanel
        Left = 282
        Top = 279
        Width = 184
        Height = 41
        BevelOuter = bvNone
        Caption = 'Create'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -24
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        OnClick = pnlbtnCreateClick
      end
      object redCreated: TRichEdit
        Left = 24
        Top = 367
        Width = 729
        Height = 147
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 3
      end
      object cbxTea: TCheckBox
        Left = 330
        Top = 210
        Width = 97
        Height = 17
        Caption = 'Add tea'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 4
      end
      object dtpTime: TDateTimePicker
        Left = 536
        Top = 242
        Width = 184
        Height = 31
        Date = -36522.333333333340000000
        Time = -36522.333333333340000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        Kind = dtkTime
        ParentFont = False
        TabOrder = 5
      end
      object dtpDate: TDateTimePicker
        Left = 536
        Top = 210
        Width = 184
        Height = 31
        Date = 44761.740635335650000000
        Time = 44761.740635335650000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object cbxLunch: TCheckBox
        Left = 330
        Top = 233
        Width = 97
        Height = 17
        Caption = 'Add lunch'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 7
      end
      object cbxCoffee: TCheckBox
        Left = 330
        Top = 256
        Width = 111
        Height = 17
        Caption = 'Add coffee'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 8
      end
      object pnlbtnHelpShcedule: TPanel
        Left = 24
        Top = 320
        Width = 112
        Height = 41
        BevelOuter = bvNone
        Caption = 'Help'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 9
        OnClick = pnlbtnHelpShceduleClick
      end
      object pnlbtnYes: TPanel
        Left = 552
        Top = 304
        Width = 81
        Height = 33
        BevelOuter = bvNone
        Caption = 'Yes'
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 10
        OnClick = pnlbtnYesClick
      end
      object pnlbtnNo: TPanel
        Left = 661
        Top = 304
        Width = 81
        Height = 33
        BevelOuter = bvNone
        Caption = 'No'
        Color = clMaroon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 11
        OnClick = pnlbtnNoClick
      end
    end
    object tbsScore: TTabSheet
      Caption = 'Score participants'
      ImageIndex = 1
      object lblScore: TLabel
        Left = 0
        Top = 57
        Width = 595
        Height = 89
        Alignment = taCenter
        Caption = 'Score participants'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -67
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblInfoScore: TLabel
        Left = 0
        Top = 149
        Width = 734
        Height = 28
        Alignment = taCenter
        Caption = 
          'Score participants by filling in the following fields and clicki' +
          'ng the button'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblItemCode: TLabel
        Left = 19
        Top = 190
        Width = 107
        Height = 28
        Caption = 'Item Code:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblParticipant: TLabel
        Left = 19
        Top = 343
        Width = 114
        Height = 28
        Caption = 'Participant:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblFillParticipant: TLabel
        Left = 158
        Top = 343
        Width = 105
        Height = 28
        Caption = '[Participant]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblRound: TLabel
        Left = 215
        Top = 190
        Width = 72
        Height = 28
        Caption = 'Round:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblItemName: TLabel
        Left = 19
        Top = 377
        Width = 114
        Height = 28
        Caption = 'Item Name:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblFillItemName: TLabel
        Left = 158
        Top = 377
        Width = 108
        Height = 28
        Caption = '[Item Name]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblStart: TLabel
        Left = 481
        Top = 343
        Width = 108
        Height = 28
        Caption = 'Start Time:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblEndTime: TLabel
        Left = 481
        Top = 377
        Width = 98
        Height = 28
        Caption = 'End Time:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblFillStart: TLabel
        Left = 595
        Top = 343
        Width = 97
        Height = 28
        Caption = '[Start time]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblFillEnd: TLabel
        Left = 595
        Top = 377
        Width = 89
        Height = 28
        Caption = '[End time]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblScoreing: TLabel
        Left = 19
        Top = 402
        Width = 285
        Height = 31
        Caption = 'Enter information below:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblScoreR: TLabel
        Left = 19
        Top = 423
        Width = 149
        Height = 28
        Caption = 'Score received:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblCommentR: TLabel
        Left = 195
        Top = 423
        Width = 201
        Height = 28
        Caption = 'Comments received:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblPaidT: TLabel
        Left = 487
        Top = 411
        Width = 198
        Height = 28
        Caption = 'Amount paid today:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblRand: TLabel
        Left = 532
        Top = 443
        Width = 12
        Height = 28
        Caption = 'R'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object pnlTitleScore: TPanel
        Left = -8
        Top = 0
        Width = 777
        Height = 73
        Caption = 'Tournament Planner/Viewer'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -40
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object dbScore: TDBGrid
        Left = 11
        Top = 224
        Width = 755
        Height = 113
        Color = clBtnFace
        DataSource = dmTournamentData.dscScore
        FixedColor = clBtnShadow
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ItemCode'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Username'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ItemName'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Score'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Participating'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PartTime'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TimeRound'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NextTime'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LastRoundPart'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Comments'
            Visible = True
          end>
      end
      object edtItemCode: TEdit
        Left = 140
        Top = 187
        Width = 69
        Height = 31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object spnRound: TSpinEdit
        Left = 293
        Top = 185
        Width = 57
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxValue = 20
        MinValue = 1
        ParentFont = False
        TabOrder = 3
        Value = 1
      end
      object pnlbtnStart: TPanel
        Left = 550
        Top = 183
        Width = 184
        Height = 35
        BevelOuter = bvNone
        Caption = 'Start scoring'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -24
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
        OnClick = pnlbtnStartClick
      end
      object pnlbtnNext: TPanel
        Left = 356
        Top = 183
        Width = 150
        Height = 35
        BevelOuter = bvNone
        Caption = 'Next'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -24
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 5
        OnClick = pnlbtnNextClick
      end
      object spnScore: TSpinEdit
        Left = 60
        Top = 457
        Width = 73
        Height = 38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxValue = 100
        MinValue = 1
        ParentFont = False
        TabOrder = 6
        Value = 1
      end
      object redComments: TRichEdit
        Left = 195
        Top = 455
        Width = 286
        Height = 67
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 7
      end
      object pnlbtnSubmit: TPanel
        Left = 550
        Top = 481
        Width = 184
        Height = 41
        BevelOuter = bvNone
        Caption = 'Submit'
        Color = clTeal
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -24
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 8
        OnClick = pnlbtnSubmitClick
      end
      object edtPaid: TEdit
        Left = 550
        Top = 445
        Width = 92
        Height = 31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        Text = '0.00'
      end
      object pnlbtnHelpScore: TPanel
        Left = 657
        Top = 3
        Width = 112
        Height = 62
        BevelOuter = bvNone
        Caption = 'Help'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 10
        OnClick = pnlbtnHelpScoreClick
      end
    end
    object tbsResult: TTabSheet
      Caption = 'Retrieve results'
      ImageIndex = 3
      object lblResultTtile: TLabel
        Left = 0
        Top = 57
        Width = 239
        Height = 89
        Alignment = taCenter
        Caption = 'Results'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -67
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblResultInfo: TLabel
        Left = 0
        Top = 149
        Width = 546
        Height = 28
        Alignment = taCenter
        Caption = 'Select the item and round, and then retrieve the results'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblResultItem: TLabel
        Left = 72
        Top = 183
        Width = 150
        Height = 28
        Caption = 'Select the item:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblResultRound: TLabel
        Left = 150
        Top = 217
        Width = 72
        Height = 28
        Caption = 'Round:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object pnlResultTitle: TPanel
        Left = -8
        Top = 0
        Width = 777
        Height = 73
        Caption = 'Tournament Planner/Viewer'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -40
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object cmbResultItem: TComboBox
        Left = 276
        Top = 183
        Width = 184
        Height = 31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'Select item'
      end
      object spnResultRound: TSpinEdit
        Left = 276
        Top = 219
        Width = 57
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxValue = 20
        MinValue = 1
        ParentFont = False
        TabOrder = 2
        Value = 1
      end
      object pnlbtnResults: TPanel
        Left = 284
        Top = 258
        Width = 198
        Height = 41
        BevelOuter = bvNone
        Caption = 'Retrieve results'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -24
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        OnClick = pnlbtnResultsClick
      end
      object redResults: TRichEdit
        Left = 16
        Top = 305
        Width = 729
        Height = 208
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 4
      end
      object pnlbtnHelpResults: TPanel
        Left = 16
        Top = 259
        Width = 112
        Height = 41
        BevelOuter = bvNone
        Caption = 'Help'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 5
        OnClick = pnlbtnHelpResultsClick
      end
    end
    object tbsEliminate: TTabSheet
      Caption = 'Eliminate participants'
      ImageIndex = 2
      object lblEliminate: TLabel
        Left = 0
        Top = 57
        Width = 377
        Height = 89
        Alignment = taCenter
        Caption = 'Elimination'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -67
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblElimInfo: TLabel
        Left = 0
        Top = 152
        Width = 484
        Height = 28
        Alignment = taCenter
        Caption = 'Select the criteria and then eliminate participants'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblElimItem: TLabel
        Left = 72
        Top = 200
        Width = 150
        Height = 28
        Caption = 'Select the item:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblElimCriteria: TLabel
        Left = 72
        Top = 248
        Width = 514
        Height = 28
        Caption = 'Select the amount going through to the next round:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblElimRound: TLabel
        Left = 514
        Top = 200
        Width = 72
        Height = 28
        Caption = 'Round:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblComplete: TLabel
        Left = 0
        Top = 321
        Width = 479
        Height = 89
        Alignment = taCenter
        Caption = 'Item complete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -67
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblCompleteInfo: TLabel
        Left = 0
        Top = 397
        Width = 651
        Height = 28
        Alignment = taCenter
        Caption = 
          'Select the item, and click delete. This will delete ALL of that ' +
          'items.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblDeleteItem: TLabel
        Left = 56
        Top = 431
        Width = 243
        Height = 28
        Caption = 'Select the item to delete:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object pnlTitleElim: TPanel
        Left = -8
        Top = 0
        Width = 777
        Height = 73
        Caption = 'Tournament Planner/Viewer'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -40
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object cmbElimItem: TComboBox
        Left = 300
        Top = 202
        Width = 184
        Height = 31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = 'Select item'
      end
      object pnlbtnHelpEliminate: TPanel
        Left = 641
        Top = 469
        Width = 112
        Height = 41
        BevelOuter = bvNone
        Caption = 'Help'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        OnClick = pnlbtnHelpEliminateClick
      end
      object spnElimRound: TSpinEdit
        Left = 592
        Top = 202
        Width = 57
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxValue = 20
        MinValue = 1
        ParentFont = False
        TabOrder = 3
        Value = 1
      end
      object pnlbtnEliminate: TPanel
        Left = 260
        Top = 296
        Width = 245
        Height = 41
        BevelOuter = bvNone
        Caption = 'Eliminate the rest'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -24
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
        OnClick = pnlbtnEliminateClick
      end
      object spnTop: TSpinEdit
        Left = 592
        Top = 250
        Width = 57
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxValue = 1000
        MinValue = 1
        ParentFont = False
        TabOrder = 5
        Value = 1
      end
      object cmbDeleteItem: TComboBox
        Left = 305
        Top = 431
        Width = 184
        Height = 31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        Text = 'Select item'
      end
      object pnlbtnDelete: TPanel
        Left = 305
        Top = 468
        Width = 179
        Height = 41
        BevelOuter = bvNone
        Caption = 'Delete'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -24
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 7
        OnClick = pnlbtnDeleteClick
      end
    end
  end
end
