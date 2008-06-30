inherited dlgSndBroadcast: TdlgSndBroadcast
  Caption = 'Broadcast Message'
  ClientHeight = 471
  ClientWidth = 653
  Color = clBtnFace
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  ExplicitWidth = 661
  ExplicitHeight = 499
  PixelsPerInch = 96
  TextHeight = 13
  object splitter: TTntSplitter
    AlignWithMargins = True
    Left = 4
    Top = 192
    Width = 645
    Height = 3
    Cursor = crVSplit
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 4
    Margins.Bottom = 0
    Align = alBottom
    Beveled = True
    OnMoved = splitterMoved
    ExplicitLeft = 0
    ExplicitTop = 167
    ExplicitWidth = 285
  end
  object pnlHeader: TTntPanel
    AlignWithMargins = True
    Left = 4
    Top = 6
    Width = 645
    Height = 180
    Margins.Left = 4
    Margins.Top = 6
    Margins.Right = 4
    Margins.Bottom = 6
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object pnlRecipients: TTntPanel
      AlignWithMargins = True
      Left = 0
      Top = 29
      Width = 645
      Height = 148
      Margins.Left = 0
      Margins.Right = 0
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 74
        Height = 148
        Align = alLeft
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object TntLabel1: TTntLabel
          Left = 0
          Top = 0
          Width = 53
          Height = 13
          Caption = '&Recipients:'
          FocusControl = lstJIDS
        end
        object btnAddRecipients: TTntBitBtn
          Left = 0
          Top = 19
          Width = 68
          Height = 28
          Hint = 'Add recipients to the broadcast'
          Caption = '&Add...'
          TabOrder = 0
          OnClick = btnAddClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FFD49F72
            D49F72DA9454F2BE8BF9CD9FDE9058DB8853D87F4CD37644CF6B3CC15C30AF4C
            25BD6D56FF00FFFF00FFD49F72D59856DE9F54E2A35DECB378FED7ACE6A26BE0
            955DDD8955D77E4CD37243BE5E32A84B25B84E25CA8F7EFF00FFC28840D3994B
            E2AA5DE7AE65EDB677FFD9AEF1BA85E69F66E1945EDB8753D57948C7673ABC58
            2EC1552AC57963FF00FFC7913FD19C4CE3AF60E9B56BF0BE7DFFD9AEFCD2A4EA
            A86FE49962DD8C56D77D4BD17140CB6436C6592BCC9987FF00FFD5A649DBAA53
            E3B361E9B86BF6C88EFFD9AEFFD9AEF7C694E59C64DD8F56D77F4CD17240CB66
            36C77B5FFF00FFFF00FFD7A94ADDAF53E2B35EE7B668FAD29FFFD9AEFFD9AEFF
            D9AEF5C493DF935BD67F49D17244CC8C70FF00FFFF00FFFF00FFFF00FFD7AF62
            DFB157E2B461E7C28F8D9287597681587178998A76DB966AD19371FF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1AC88667E8B54829856859A4E
            7B913C677C74818697A200858B007F8400FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF86979D6492A66F9BB06A98AC618EA2507C90396278A8B21C949D007F84
            00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5D84997DA9BC83AEC07DA7BA70
            9CAE608B9F466F85A4AF1298A300818700FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF638FA48EB7C894BAC98DB5C58D95008D95008D95009BA70098A3008A91
            008187007F84007F8400FF00FFFF00FFFF00FF6F9AAC9ABFCFA0C4D299BECCBF
            C758AAB523AAB523A4AF139DA90098A30098A300949D00858B00FF00FFFF00FF
            FF00FF5A7D949BBFCD86A8BB5B7992BFC758BFC758BFC758B7C044A4AF139BA7
            00A4AF12A8B21C97A200FF00FFFF00FFFF00FF48647F597A934566853C5D8038
            597B3353752E4D6FBFC758A4AF13919A00FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FF7B8792315173314F6C3B597A3E6083395A7B335174C1C85DAAB5238D95
            00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6E80913854763955793D
            5E814B6780A6A4A2C6CD6BB6BF4197A200FF00FFFF00FFFF00FF}
          Margin = 3
        end
        object btnRemoveRecipient: TTntBitBtn
          Left = 0
          Top = 53
          Width = 68
          Height = 28
          Hint = 'Remove selected recipients'
          Caption = 'Remo&ve'
          TabOrder = 1
          OnClick = btnRemoveClick
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FFFF00FF
            D49F72D49F72DA9454F2BE8BF9CD9FDE9058DB8853D87F4CD37644CF6B3CC15C
            30AF4C25BD6D56FF00FFFF00FFD49F72D59856DE9F54E2A35DECB378FED7ACE6
            A26BE0955DDD8955D77E4CD37243BE5E32A84B25B84E25CA8F7ED49F72C28840
            D3994BE2AA5DE7AE65EDB677FFD9AEF1BA85E69F66E1945EDB8753D57948C767
            3ABC582EC1552AC57963C79E6BC7913FD3994BE3AF60E9B56BF0BE7DFFD9AEFC
            D2A4EAA86FE49962DD8C56D77D4BD17140CB6436C6592BCC9987D0AA70C79E6B
            D3994B2309BBE9B86BF6C88EFFD9AEFFD9AEF7C694E59C64DD8F56D77F4C0000
            FFCB6636C77B5FFF00FFFF00FFD7A94A0000FF0000FF2309BBFAD29FFFD9AEFF
            D9AEFFD9AEF5C493DF935B0000FF0000FF0000FFFF00FFFF00FFFF00FFFF00FF
            D7AF620000FF0000FF2309BB8D9287597681587178998A760000FF0000FF0000
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF0000FF2309BB56
            859A4E7B910000FF0000FF0000FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF86979D0000FF0000FF2309BB0000FF0000FF0000FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF5D84997DA9BC0000FF00
            00FF0000FF0000FF466F853B536AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF638FA48EB7C80000FF0000FF0000FF2309BB4E778C4E778CFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6F9AAC0000FF0000FF00
            00FF0000FF0000FF2309BB4E778CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF0000FF0000FF0000FF5B79924A69820000FF0000FF2309BBFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FF0000FF0000FF4566853C
            5D8038597B3353750000FF0000FF2309BBFF00FFFF00FFFF00FFFF00FFFF00FF
            0000FF0000FF0000FF315173314F6C3B597A3E6083395A7B3351740000FF0000
            FF0000FFFF00FFFF00FFFF00FFFF00FFFF00FF0000FFFF00FF6E809138547639
            55793D5E814B6780A6A4A2FF00FF0000FFFF00FFFF00FFFF00FF}
          Margin = 3
        end
      end
      object pnlRecipList: TTntPanel
        Left = 74
        Top = 0
        Width = 571
        Height = 148
        Align = alClient
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        object lstJIDS: TTntListView
          Left = 0
          Top = 0
          Width = 571
          Height = 124
          Margins.Left = 4
          Margins.Right = 4
          Margins.Bottom = 0
          Align = alClient
          Anchors = [akLeft, akTop, akRight]
          Columns = <
            item
              AutoSize = True
              Caption = 'Recipients'
            end
            item
              Caption = 'Problems'
            end>
          IconOptions.Arrangement = iaLeft
          IconOptions.WrapText = False
          MultiSelect = True
          ReadOnly = True
          RowSelect = True
          ParentShowHint = False
          PopupMenu = popTo
          ShowColumnHeaders = False
          ShowHint = True
          SortType = stText
          TabOrder = 0
          ViewStyle = vsReport
          OnCustomDrawItem = lstJIDSCustomDrawItem
          OnEnter = lstJIDSEnter
          OnInfoTip = lstJIDSInfoTip
          OnKeyDown = lstJIDSKeyDown
        end
        object pnlRecipientWarning: TTntPanel
          AlignWithMargins = True
          Left = 0
          Top = 127
          Width = 571
          Height = 18
          Margins.Left = 0
          Margins.Right = 0
          Align = alBottom
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 1
          OnClick = pnlRecipientWarningClick
          DesignSize = (
            571
            18)
          object Image1: TImage
            Left = 0
            Top = 1
            Width = 16
            Height = 16
            Center = True
            Picture.Data = {
              07544269746D617036040000424D360400000000000036000000280000001000
              0000100000000100200000000000000400000000000000000000000000000000
              0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00FF00FF00
              FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00
              FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
              FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000
              FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000
              FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF000000FF00FF00
              FF00FF00FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF000000FF000000FF000000FF000000FF00FF00FF00FF00
              FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00
              FF00FF00FF000000FF000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF000000FF000000FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00}
            Transparent = True
          end
          object TntLabel3: TTntLabel
            Left = 24
            Top = 2
            Width = 207
            Height = 13
            Caption = 'items can not receive Broadcast Messages.'
          end
          object btnRemoveInvalid: TTntButton
            Left = 461
            Top = 2
            Width = 110
            Height = 16
            Anchors = [akTop, akRight]
            Caption = 'Remove &Invalid'
            TabOrder = 0
            OnClick = btnRemoveInvalidClick
          end
        end
      end
    end
    object pnlSubject: TPanel
      Left = 0
      Top = 0
      Width = 645
      Height = 26
      Margins.Left = 4
      Margins.Right = 4
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object lblSubject: TTntLabel
        Left = 0
        Top = 0
        Width = 74
        Height = 26
        Margins.Left = 4
        Align = alLeft
        AutoSize = False
        Caption = '&Subject: '
        FocusControl = txtSendSubject
        Layout = tlCenter
      end
      object txtSendSubject: TTntMemo
        AlignWithMargins = True
        Left = 74
        Top = 3
        Width = 571
        Height = 20
        Margins.Left = 0
        Margins.Right = 0
        Align = alClient
        TabOrder = 0
        WantReturns = False
        WordWrap = False
      end
    end
  end
  object pnlSender: TTntPanel
    AlignWithMargins = True
    Left = 4
    Top = 195
    Width = 645
    Height = 276
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 4
    Margins.Bottom = 0
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object pnlButtons: TTntPanel
      Left = 0
      Top = 238
      Width = 645
      Height = 38
      Align = alBottom
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      DesignSize = (
        645
        38)
      object btnSend: TTntButton
        Left = 503
        Top = 6
        Width = 68
        Height = 28
        Anchors = [akTop, akRight]
        Caption = 'Send'
        Default = True
        TabOrder = 0
        OnClick = btnSendClick
      end
      object btnCancel: TTntButton
        Left = 577
        Top = 6
        Width = 68
        Height = 28
        Anchors = [akTop, akRight]
        Cancel = True
        Caption = 'Cancel'
        TabOrder = 1
        OnClick = btnCancelClick
      end
    end
    object pnlComposer: TTntPanel
      Left = 0
      Top = 0
      Width = 645
      Height = 238
      Align = alClient
      AutoSize = True
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object tbMsgOutToolbar: TTntToolBar
        Left = 0
        Top = 0
        Width = 645
        Height = 22
        Margins.Left = 0
        Margins.Top = 1
        Margins.Right = 0
        Margins.Bottom = 1
        AutoSize = True
        ButtonWidth = 25
        Images = frmExodus.ImageList1
        TabOrder = 0
        Transparent = True
        Visible = False
        object ChatToolbarButtonBold: TTntToolButton
          Left = 0
          Top = 0
          Hint = 'Bold'
          AllowAllUp = True
          ImageIndex = 70
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
        end
        object ChatToolbarButtonUnderline: TTntToolButton
          Left = 25
          Top = 0
          Hint = 'Underline'
          AllowAllUp = True
          Caption = 'Underline'
          ImageIndex = 71
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
        end
        object ChatToolbarButtonItalics: TTntToolButton
          Left = 50
          Top = 0
          Hint = 'Italics'
          AllowAllUp = True
          Caption = 'Color'
          ImageIndex = 72
          ParentShowHint = False
          ShowHint = True
          Style = tbsCheck
          Visible = False
        end
        object ChatToolbarButtonColors: TTntToolButton
          Left = 75
          Top = 0
          Hint = 'Colors'
          AllowAllUp = True
          Caption = 'Color'
          ImageIndex = 84
          ParentShowHint = False
          ShowHint = True
        end
        object ChatToolbarButtonCut: TTntToolButton
          Left = 100
          Top = 0
          Hint = 'Cut'
          Caption = 'Cut'
          ImageIndex = 73
          ParentShowHint = False
          ShowHint = True
        end
        object ChatToolbarButtonSeparator1: TTntToolButton
          Left = 125
          Top = 0
          Width = 8
          Style = tbsSeparator
        end
        object ChatToolbarButtonCopy: TTntToolButton
          Left = 133
          Top = 0
          Hint = 'Copy'
          Caption = 'Copy'
          ImageIndex = 74
          ParentShowHint = False
          ShowHint = True
        end
        object ChatToolbarButtonPaste: TTntToolButton
          Left = 158
          Top = 0
          Hint = 'Paste'
          Caption = 'Paste'
          ImageIndex = 75
          ParentShowHint = False
          ShowHint = True
        end
        object ChatToolbarButtonSeparator2: TTntToolButton
          Left = 183
          Top = 0
          Width = 8
          Style = tbsSeparator
        end
        object ChatToolbarButtonEmoticons: TTntToolButton
          Left = 191
          Top = 0
          Hint = 'Emoticons'
          Caption = 'Emoticons'
          ImageIndex = 76
          ParentShowHint = False
          ShowHint = True
        end
        object ChatToolbarButtonHotkeys: TTntToolButton
          Left = 216
          Top = 0
          Hint = 'Hotkeys'
          Caption = 'Hotkeys'
          ImageIndex = 77
          ParentShowHint = False
          ShowHint = True
        end
        object TntToolButton1: TTntToolButton
          Left = 241
          Top = 0
          Width = 8
          Caption = 'TntToolButton1'
          Style = tbsSeparator
        end
        object cmbPriority: TTntComboBox
          Left = 249
          Top = 0
          Width = 72
          Height = 21
          Hint = 'Hotkeys'
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TabStop = False
        end
      end
      object RTComposer: TExRichEdit
        Left = 0
        Top = 22
        Width = 645
        Height = 216
        Align = alClient
        AutoURLDetect = adNone
        Ctl3D = True
        CustomURLs = <
          item
            Name = 'e-mail'
            Color = clWindowText
            Cursor = crDefault
            Underline = True
          end
          item
            Name = 'http'
            Color = clWindowText
            Cursor = crDefault
            Underline = True
          end
          item
            Name = 'file'
            Color = clWindowText
            Cursor = crDefault
            Underline = True
          end
          item
            Name = 'mailto'
            Color = clWindowText
            Cursor = crDefault
            Underline = True
          end
          item
            Name = 'ftp'
            Color = clWindowText
            Cursor = crDefault
            Underline = True
          end
          item
            Name = 'https'
            Color = clWindowText
            Cursor = crDefault
            Underline = True
          end
          item
            Name = 'gopher'
            Color = clWindowText
            Cursor = crDefault
            Underline = True
          end
          item
            Name = 'nntp'
            Color = clWindowText
            Cursor = crDefault
            Underline = True
          end
          item
            Name = 'prospero'
            Color = clWindowText
            Cursor = crDefault
            Underline = True
          end
          item
            Name = 'telnet'
            Color = clWindowText
            Cursor = crDefault
            Underline = True
          end
          item
            Name = 'news'
            Color = clWindowText
            Cursor = crDefault
            Underline = True
          end
          item
            Name = 'wais'
            Color = clWindowText
            Cursor = crDefault
            Underline = True
          end>
        LangOptions = [loAutoFont]
        Language = 1033
        ParentCtl3D = False
        ScrollBars = ssVertical
        ShowSelectionBar = False
        TabOrder = 1
        URLColor = clBlue
        URLCursor = crHandPoint
        WordWrap = False
        AutoVerbMenu = False
        InputFormat = ifUnicode
        OutputFormat = ofUnicode
        SelectedInOut = False
        PlainRTF = False
        UndoLimit = 0
        AllowInPlace = False
      end
    end
  end
  object imgState: TImageList
    Left = 8
    Top = 440
    Bitmap = {
      494C010101000300040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF0000000000000000000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF00000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFB000000000000
      EFFF000000000000C7F7000000000000C7EF000000000000E3CF000000000000
      F19F000000000000F83F000000000000FC7F000000000000F83F000000000000
      F1BF000000000000C3CF00000000000087E70000000000009FF3000000000000
      FFFF000000000000FFFF000000000000}
  end
  object popTo: TTntPopupMenu
    Left = 48
    Top = 440
    object Add1: TTntMenuItem
      Caption = '&Add Recipients...'
      OnClick = btnAddClick
    end
    object Remove1: TTntMenuItem
      Caption = 'Remo&ve Selected Recipients'
      ShortCut = 46
      OnClick = btnRemoveClick
    end
  end
end
