object frmView: TfrmView
  Left = 0
  Top = 0
  Caption = 'Enter and View item'
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
  object pgcViewing: TPageControl
    Left = 0
    Top = 0
    Width = 777
    Height = 553
    ActivePage = tbsEnter
    TabOrder = 0
    object tbsEnter: TTabSheet
      Caption = 'Enter'
      object lblEnter: TLabel
        Left = 0
        Top = 57
        Width = 514
        Height = 89
        Alignment = taCenter
        Caption = 'Enter your item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -67
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblEnterInfo: TLabel
        Left = 0
        Top = 149
        Width = 679
        Height = 28
        Alignment = taCenter
        Caption = 
          'Please complete the following fields to enter for the item you s' +
          'elect:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblItem: TLabel
        Left = 48
        Top = 200
        Width = 165
        Height = 28
        Caption = 'Select your item:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblItemName: TLabel
        Left = 48
        Top = 250
        Width = 205
        Height = 28
        Caption = 'Enter the item name:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblApprozTime: TLabel
        Left = 48
        Top = 306
        Width = 230
        Height = 28
        Caption = 'Approximate Duration:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 399
        Top = 311
        Width = 61
        Height = 23
        Caption = 'minutes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblOne: TLabel
        Left = 0
        Top = 453
        Width = 256
        Height = 17
        Alignment = taCenter
        Caption = 'Note: Only one item per participant allowed'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInfoText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object pnlTitleEnter: TPanel
        Left = -4
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
        Left = 336
        Top = 202
        Width = 177
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
      object edtItemName: TEdit
        Left = 336
        Top = 252
        Width = 273
        Height = 31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TextHint = 'The road not taken'
      end
      object spnApproxT: TSpinEdit
        Left = 336
        Top = 308
        Width = 57
        Height = 33
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxValue = 15
        MinValue = 5
        ParentFont = False
        TabOrder = 3
        Value = 5
      end
      object pnlbtnEnter: TPanel
        Left = 276
        Top = 390
        Width = 184
        Height = 41
        BevelOuter = bvNone
        Caption = 'Enter item'
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -24
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
        OnClick = pnlbtnEnterClick
      end
      object pnlbtnHelpEnter: TPanel
        Left = 641
        Top = 467
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
        OnClick = pnlbtnHelpEnterClick
      end
    end
    object tbsView: TTabSheet
      Caption = 'View'
      ImageIndex = 1
      object lblView: TLabel
        Left = 0
        Top = 56
        Width = 527
        Height = 89
        Alignment = taCenter
        Caption = 'View your entry'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -67
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblViewInfo: TLabel
        Left = 0
        Top = 149
        Width = 358
        Height = 28
        Alignment = taCenter
        Caption = 'See your entry'#39's information below:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblCode: TLabel
        Left = 56
        Top = 208
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
      object lblFillItemCode: TLabel
        Left = 246
        Top = 208
        Width = 102
        Height = 28
        Caption = '[Item Code]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblViewName: TLabel
        Left = 56
        Top = 242
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
        Left = 246
        Top = 242
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
      object lblScore: TLabel
        Left = 56
        Top = 276
        Width = 184
        Height = 28
        Caption = 'Most recent score:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblFillScore: TLabel
        Left = 246
        Top = 276
        Width = 121
        Height = 28
        Caption = '[Recent score]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblUsername: TLabel
        Left = 56
        Top = 174
        Width = 105
        Height = 28
        Caption = 'Username:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblFillUsername: TLabel
        Left = 246
        Top = 174
        Width = 99
        Height = 28
        Caption = '[Username]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblLastPart: TLabel
        Left = 56
        Top = 310
        Width = 244
        Height = 28
        Caption = 'Last round participated: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblFillLastPart: TLabel
        Left = 306
        Top = 310
        Width = 178
        Height = 28
        Caption = '[Round Participated]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblStillPart: TLabel
        Left = 56
        Top = 344
        Width = 178
        Height = 28
        Caption = 'Still Participating?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblFillStillPart: TLabel
        Left = 246
        Top = 344
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
      object lblOwed: TLabel
        Left = 56
        Top = 378
        Width = 147
        Height = 28
        Caption = 'Amount owed:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object lblFillOwed: TLabel
        Left = 246
        Top = 378
        Width = 159
        Height = 28
        Caption = '[R-Amount Owed]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblComment: TLabel
        Left = 56
        Top = 412
        Width = 174
        Height = 28
        Caption = 'Latest comments:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Segoe UI Black'
        Font.Style = []
        ParentFont = False
      end
      object pnTitleView: TPanel
        Left = -3
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
      object redComments: TRichEdit
        Left = 246
        Top = 412
        Width = 507
        Height = 102
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        Lines.Strings = (
          '[Comments]')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object pnlbtnHelpView: TPanel
        Left = 3
        Top = 475
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
        OnClick = pnlbtnHelpViewClick
      end
    end
  end
end
