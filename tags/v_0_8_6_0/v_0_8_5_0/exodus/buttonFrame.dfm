object frameButtons: TframeButtons
  Left = 0
  Top = 0
  Width = 376
  Height = 37
  AutoScroll = False
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 376
    Height = 37
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel1: TBevel
      Left = 0
      Top = 0
      Width = 376
      Height = 5
      Align = alTop
      Shape = bsTopLine
    end
    object Panel1: TPanel
      Left = 216
      Top = 5
      Width = 160
      Height = 32
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnOK: TButton
        Left = 4
        Top = 0
        Width = 75
        Height = 25
        Caption = 'OK'
        Default = True
        ModalResult = 1
        TabOrder = 0
      end
      object btnCancel: TButton
        Left = 82
        Top = 0
        Width = 75
        Height = 25
        Cancel = True
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
end