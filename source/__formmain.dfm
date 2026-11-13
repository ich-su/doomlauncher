object FormMain: TFormMain
  Left = 0
  Top = 0
  ClientHeight = 461
  ClientWidth = 644
  Color = clBtnFace
  ParentFont = True
  KeyPreview = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 15
  object PageControl: TPageControl
    AlignWithMargins = True
    Left = 0
    Top = 8
    Width = 644
    Height = 453
    Margins.Left = 0
    Margins.Top = 8
    Margins.Right = 0
    Margins.Bottom = 0
    ActivePage = TabSheetPresets
    Align = alClient
    TabOrder = 1
    OnChange = PageControlChange
    object TabSheetAbout: TTabSheet
      Caption = '  i  '
      ImageIndex = 5
      PopupMenu = PopupMenuAbout
      object Image: TImage
        Left = 24
        Top = 16
        Width = 79
        Height = 96
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D494844520000004F0000
          006008030000006B10DF5700000300504C5445FFFFFF000000533F1F8743079B
          5B13AF7B1FD7BB43EBDB57C39B2FFFE74B732B006B4727836B57FFFF73FFBF9B
          AF977FFFC7A7F7AB7B775F4B67533FFF9F43574333A78F779F8363DF93637F53
          2F836B4B9B633B9F876F533F2FFFB383FFBB93473323E79B6BAB6F436753334F
          3B2BEFA3738757332B230FD78B5B0B0B0B6F57435F43238F5F37CF83533F2F17
          775F3F5F4B371313134B371B8F77538B735B372313332B13B373471B1B1B170F
          077B634F1F170B43331BCB7F4FA36B3F774F2BBF7B4B4F3B2300000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000011D6000D075307530
          150000000000000100000000000784A1EE80770000A500000000003000000000
          00000000000784F8000077000000000000000000000000740000753016000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000C8094D600770007CE018700000000
          000000000000000000000000000000000000000000000064000000D00000078B
          160000020000001C0000000200CED4F0D60007C007CE078B16870000000001BC
          000000A5EE083D66AF0977007709000000000000000000000000000000000000
          DBCA009E6C1D752108A5EF6008F9000075210000000000000000006EC0007521
          090000600005008000000000001000800000C0C4000000000500000000020000
          0000000000640062D600007807CE00A5EF00000000000000000007CED6000000
          00000000018700000000000000000000000000000000001800000000000000A5
          EF00004000000050000000A5EF0000000185003B099D5C0000000174524E5300
          40E6D86600000001624B47448BF26F47E0000000097048597300000EC400000E
          C401952B0E1B000007844944415478DAADD8FB53DBD81500E0731F9225F911CB
          8F180C26210F68030BDBD96EBAED30D3D9FFBC6DBAED6CDADDEC3619922C7421
          608A8D8D1FD8926D4957B7478210F3F04BC43F2496E2FBCD39E79E732D87C0D0
          8BFA70D717F908517C2BEECC7DF448F0467E360F1821C4F7E1B3E54B0991D2BB
          83C3C4278FFA9C50493DFF2EE171AC16A2617C9411A01E44F682E03826082048
          B819940BBCF2204ACB8418789A0F41C5C2F838274202F2324ACB18363025D84A
          09AA15D68F522628523EC63C7BCE2C66831634B02FFD205F8C9632AC9D8CD281
          0C049740628248C13D2909F5B159388820FD28FDC78004A34018F1D0F3487883
          837431D368F3CB303B0C8C0B2AC27C19E1A8F6E55D40E24945502FDCDF603B82
          5E91D1FB0F41C1B0E5A44682E9404F441A8FB875FE37C71A32E9C9F3F9C02B06
          32D2B861202C20703B50F0C2F965E1BC09DF8B503D46CE2722403D5FB320C837
          38AC984FA01FA1741C57524C1303F5A5885B173AEE3096B07F79EC4C5BBF3EC6
          C724F6309CA71B46CBB0060A4E890B5E842390872D87A3E50BB83C9F39A30A1E
          30CEECC741DC0AC6957B61F53E7994A94440DF8D121FE7B819AE1776CFB9C73D
          4EA5C6C4C0F766AB204687C1E11AD73D5FF7F1FB88E24823D89FF54B844B1539
          973852B7863CDC0D49A9CA6DFF5AC68A1BFEA18C2A04E70A9E9D164E170CC717
          340A0BC178E31A082EE741D05E70AADFC205F3DAC223F5AA1790A060F036B9DA
          340A4B10C1DB9084AEB81124C71A49AA76A0EFDFF4025095E0483A3428DCCB41
          C794D4C633A37BA33D99C1449CB6EC4F77AE788229580D149DE118E2D44F743C
          A54B6E64BBD86682ABA7C3F7C9D54F94AAB1A0619CC1504AF347C074D713D73D
          851035D3D2AE70D73D78E884239D3AB85CA519F5B933C3E9B9D71A53A12A98BE
          5BBD7AF7BA07500C403FBB777199A4045B2BEF0D627E79F8636A0C908BB54E27
          79E720C8A4ABEF033C39A144146AF76BF875D8BCCA39053F5EBFC6DDE6C10AA6
          D6CAB66C5D6A2EEFB3F469B639679FA59A0BEF2E3FA229E0C4F40CD98629BC35
          32E840522BDB2A5E38EA20E6E8AADE16C14362AA730A8B96203EB094A276EDD3
          693CD8F0EB790AE5E259450DAF1DD0FD019CBF0747F73547987EAE671CDCE06E
          F73042622581FDC2D297E205E7E8F7CE54A369E2010C6217A6F460EDED43D3E3
          4712940E4D35F134F7CD36A43A39AF6758A5C381E91485545EC2D41E76B6108A
          5E835E1896A3F16E584C23DD7BF0AF7BE9DCBE36FFF2D665233D2835D389AA60
          C1A638C66ADBC6CC9D42AB505F693934D3F8EF8855A33D28DD775CA55F2DD405
          4BF4C1ACE1130583341E4EEAE23F472E1AE3C163C368548D64DD5FEBFD2FF7F6
          4925DBD35B8B07679B83B710C95B55485FEB8AD8F1D38A6DA4E2E57E3651334E
          4A99EF209A1704F8416D1712EF93B6D1D968A81F0C6370BCF90AA27A5F1F69B6
          BC97B084DF4DA4A5BD934F5995A7EF21B207253DD9BAF76AD96ECE554CA393D9
          59DB5BD1BFBB83B775DC9BB320267ADD84CE0610AFB0A5F1DC040FB6CA1FC843
          551CCC559698A36F3FE2E3B39DE805FFFE3B8016D60F2CA0BD7DB89397ED38CF
          C16BC5FBF59C66A539BC9CC44DF0388301A0E89CDCDF5B7B09096FE223E7582F
          63BBF3B57B4D3A5F5BDEE3FD2FDE4831F1E966ACF7C53BBF78B4AC369AFAEAFB
          95D60178ABDB77F27E132F274427D754C9D9D34E5B3DDA38EE76EFE0291BB0AB
          79D27AF6737E61C7609659571EFF3BBAF7B0D0FE15CC166CEC970E4B7B9ECE72
          B5C1FA8BE8DE1F902360B49FB6FA9A9B1B34B861DB6625B2B7BEEB0359D2EA8B
          07EEB36DA570E8815921865A8DEAE14FEE074C3177168501363F4E7FC09FCD7D
          525CFA6B34EFD92E64D20A863410F91FE1B9D47FC647C6CC99D87C11CDD37CFA
          50B10605A82107F0FC38DDC6E7179E64F137513C0CEF916258D9CE3987DEF249
          AF0119DA1ABFC5A33C85D0A746F9C9472E0CB0EB3780C7F4B1151CE1C50584DC
          61E9C78FB74A7E72209AA6515DF97E764F61C899DB59F8E46180AEA87B7CBDF5
          7A764F83CD5823BB3DC421B8BB504BD6C56F4FF4ED59BDB808B817D9610E03B4
          16BABC5A1CDCFF7E566F9D988DD3EA55EE026CE5DAB432ABB7B018DB597971DD
          BB8850EB8E09F0562FBE9CB991ED0528B2B57C2DFF7A36EFCF38AAC3AD32041E
          161D3821A38FD55BBDF5E6E3EEAD1C82DD3E036F74C2B7795FBE03D3BB9D43D0
          CE9D7613AF67F1329D3FFE60D446ADC0629C28B379EBF0437E7FD48A355E7F5C
          FE75066F93EF43DA391CB5029E0DD2070B3F4DEF15E7F79BCB63BC92DA4B14EB
          6FA6F6BEDA5DFECF46E2EFE3BCD4FE37AF4FA7F4362B32D65F18E37D7BB0C7A9
          FFA7BF4CE915A9AB664D77B4B7753C5FED346069773AEFAB438FAD8FE100F2AB
          EE2BEA7FF3B729BD6A8FAE8EE3600B94F2E188846F7A85D287F11C6C296E7DBF
          6857A6F3B447B5091E7CEBF68E8CD3F6749EAAEA3598F0DAFAC77DC3294FE569
          BE9ADB9FE4C1D6CE62751AEFCB77BEDC14AF267B7B73E5EA446FB3D2F6A99932
          76263D8562CF14BB83F238AFE02AD92391761F377B604E06F3A9C4F1C938EF99
          6DC4AD83A5EA03595E6EFFB2F9D324F0EB037A3CB97ED3BFE266A177CBF77A64
          6FFD2CD69137B724AAF7FB4139079D74F3BA18CDCB3F18985635D64D74ADEEE7
          F0F097222445F89FA6D78ED5FF039D7F729CB3B5730C0000000049454E44AE42
          6082}
        Stretch = True
      end
      object ButtonAboutHistory: TSpeedButton
        Left = 360
        Top = 16
        Width = 113
        Height = 32
        Caption = 'History...'
        ParentShowHint = False
        ShowHint = True
        OnClick = MIAHistoryClick
      end
      object ButtonAboutGames: TSpeedButton
        Left = 360
        Top = 54
        Width = 113
        Height = 32
        Caption = 'Games...'
        ParentShowHint = False
        ShowHint = True
        OnClick = MIAHistoryClick
      end
    end
    object TabSheetHistory: TTabSheet
      Caption = '  History  '
      object TreeHistory: TVirtualStringTree
        Left = 0
        Top = 0
        Width = 636
        Height = 321
        Align = alTop
        BorderStyle = bsNone
        ChangeDelay = 100
        DefaultNodeHeight = 19
        Header.AutoSizeIndex = 0
        HintMode = hmTooltip
        PopupMenu = PopupMenuHistory
        ScrollBarOptions.ScrollBars = ssVertical
        TabOrder = 0
        TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoSpanColumns, toAutoTristateTracking, toAutoHideButtons, toAutoDeleteMovedNodes, toAutoChangeScale]
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
        TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toThemeAware, toUseBlendedImages, toFullVertGridLines, toUseExplorerTheme]
        TreeOptions.SelectionOptions = [toFullRowSelect, toSelectNextNodeOnRemoval]
        OnChange = TreeGamesChange
        OnContextPopup = TreeGamesContextPopup
        OnDrawText = TreeHistoryDrawText
        OnGetText = TreeHistoryGetText
        OnNodeDblClick = CtrlEnterDblClick
        OnResize = TreeHistoryResize
        Touch.InteractiveGestures = [igPan, igPressAndTap]
        Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
        Columns = <
          item
            Position = 0
          end
          item
            Position = 1
          end
          item
            Position = 2
          end>
      end
      object PanelHistoryDown: TPanel
        Left = 0
        Top = 321
        Width = 636
        Height = 102
        Align = alClient
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        PopupMenu = PopupMenuHistory
        TabOrder = 1
        object ButtonHistoryRun: TSpeedButton
          Left = 16
          Top = 6
          Width = 113
          Height = 32
          Caption = 'Run...'
          ParentShowHint = False
          ShowHint = True
          OnClick = CtrlEnterClick
        end
      end
    end
    object TabSheetGames: TTabSheet
      Caption = '  Games  '
      ImageIndex = 1
      object TreeGames: TVirtualStringTree
        Left = 0
        Top = 0
        Width = 636
        Height = 313
        Align = alTop
        BorderStyle = bsNone
        ChangeDelay = 100
        DefaultNodeHeight = 19
        Header.AutoSizeIndex = 0
        Header.Height = 15
        Header.MainColumn = -1
        HintMode = hmTooltip
        PopupMenu = PopupMenuGames
        ScrollBarOptions.ScrollBars = ssVertical
        TabOrder = 0
        TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoSpanColumns, toAutoTristateTracking, toAutoHideButtons, toAutoDeleteMovedNodes, toAutoChangeScale]
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
        TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toThemeAware, toUseBlendedImages, toFullVertGridLines, toUseExplorerTheme]
        TreeOptions.SelectionOptions = [toFullRowSelect, toRestoreSelection, toSelectNextNodeOnRemoval]
        OnBeforeCellPaint = TreeGamesBeforeCellPaint
        OnChange = TreeGamesChange
        OnCollapsed = TreeGamesChange
        OnContextPopup = TreeGamesContextPopup
        OnDrawText = TreeDrawText
        OnExpanded = TreeGamesChange
        OnGetText = TreeGetText
        OnNodeDblClick = CtrlEnterDblClick
        Touch.InteractiveGestures = [igPan, igPressAndTap]
        Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
        Columns = <>
      end
      object PanelGamesDown: TPanel
        Left = 0
        Top = 313
        Width = 636
        Height = 110
        Align = alClient
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        PopupMenu = PopupMenuGames
        TabOrder = 1
        object ButtonGamesRun: TSpeedButton
          Left = 16
          Top = 12
          Width = 113
          Height = 32
          Caption = 'Next...'
          ParentShowHint = False
          ShowHint = True
          OnClick = CtrlEnterClick
        end
      end
    end
    object TabSheetPresets: TTabSheet
      Caption = '  Presets  '
      ImageIndex = 2
      object TreePresets: TVirtualStringTree
        Left = 0
        Top = 0
        Width = 636
        Height = 313
        Margins.Left = 40
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BorderStyle = bsNone
        ChangeDelay = 100
        DefaultNodeHeight = 19
        Header.AutoSizeIndex = 0
        Header.Height = 15
        Header.MainColumn = -1
        HintMode = hmTooltip
        PopupMenu = PopupMenuPresets
        ScrollBarOptions.ScrollBars = ssVertical
        TabOrder = 0
        TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoSpanColumns, toAutoTristateTracking, toAutoHideButtons, toAutoDeleteMovedNodes, toAutoChangeScale]
        TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
        TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toThemeAware, toUseBlendedImages, toFullVertGridLines, toUseExplorerTheme]
        TreeOptions.SelectionOptions = [toFullRowSelect, toRestoreSelection, toSelectNextNodeOnRemoval]
        OnBeforeCellPaint = TreeGamesBeforeCellPaint
        OnChange = TreeGamesChange
        OnCollapsed = TreeGamesChange
        OnContextPopup = TreeGamesContextPopup
        OnDrawText = TreePresetsDrawText
        OnExpanded = TreeGamesChange
        OnGetText = TreeGetText
        OnNodeDblClick = CtrlEnterDblClick
        Touch.InteractiveGestures = [igPan, igPressAndTap]
        Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
        Columns = <>
      end
      object PanelPresetsDown: TPanel
        Left = 0
        Top = 313
        Width = 636
        Height = 110
        Align = alClient
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        PopupMenu = PopupMenuPresets
        TabOrder = 1
        ExplicitLeft = -16
        ExplicitTop = 329
        object ButtonPresetsRun: TSpeedButton
          Left = 16
          Top = 12
          Width = 113
          Height = 32
          Caption = 'Run...'
          ParentShowHint = False
          ShowHint = True
          OnClick = CtrlEnterClick
        end
      end
    end
    object TabSheetMods: TTabSheet
      Caption = '  Mods  '
      ImageIndex = 3
      object PanelModsTop: TPanel
        Left = 0
        Top = 0
        Width = 636
        Height = 265
        Align = alTop
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 0
        object PanelModsButtons: TPanel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 32
          Height = 257
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          BevelOuter = bvNone
          Color = clWindow
          ParentBackground = False
          TabOrder = 0
          object ButtonModsReset: TSpeedButton
            Tag = 1
            Left = 0
            Top = 0
            Width = 32
            Height = 32
            Hint = 'Reset checkboxes'
            Align = alTop
            Caption = #10007
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = MIMClearClick
            ExplicitLeft = -2
            ExplicitTop = -6
          end
          object ButtonModsExpandAll: TSpeedButton
            Tag = 1
            Left = 0
            Top = 64
            Width = 32
            Height = 32
            Hint = 'Expand All'
            Align = alTop
            Caption = '[+]'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = ButtonModsExpandAllClick
            ExplicitTop = 16
          end
          object ButtonModsCollapseAll: TSpeedButton
            Tag = 1
            Left = 0
            Top = 32
            Width = 32
            Height = 32
            Hint = 'Collapse All'
            Align = alTop
            Caption = '['#8211']'
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = ButtonModsCollapseAllClick
            ExplicitLeft = -2
          end
        end
        object TreeMods: TVirtualStringTree
          Left = 40
          Top = 0
          Width = 596
          Height = 265
          Align = alClient
          BorderStyle = bsNone
          ChangeDelay = 100
          DefaultNodeHeight = 19
          Header.AutoSizeIndex = 0
          Header.Height = 15
          Header.MainColumn = -1
          HintMode = hmTooltip
          PopupMenu = PopupMenuMods
          ScrollBarOptions.ScrollBars = ssVertical
          TabOrder = 1
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoSpanColumns, toAutoTristateTracking, toAutoHideButtons, toAutoDeleteMovedNodes, toAutoChangeScale]
          TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
          TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toThemeAware, toUseBlendedImages, toFullVertGridLines, toUseExplorerTheme]
          TreeOptions.SelectionOptions = [toFullRowSelect, toRestoreSelection, toSelectNextNodeOnRemoval]
          OnBeforeCellPaint = TreeGamesBeforeCellPaint
          OnChange = TreeGamesChange
          OnCollapsed = TreeGamesChange
          OnContextPopup = TreeGamesContextPopup
          OnDrawText = TreeDrawText
          OnExpanded = TreeGamesChange
          OnGetText = TreeGetText
          Touch.InteractiveGestures = [igPan, igPressAndTap]
          Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
          Columns = <>
        end
      end
      object PanelModsDown: TPanel
        Left = 0
        Top = 265
        Width = 636
        Height = 158
        Align = alClient
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        PopupMenu = PopupMenuMods
        TabOrder = 1
        object ButtonModsRun: TSpeedButton
          Left = 32
          Top = 12
          Width = 113
          Height = 32
          Caption = 'Run...'
          ParentShowHint = False
          ShowHint = True
          OnClick = CtrlEnterClick
        end
      end
    end
    object TabSheetRun: TTabSheet
      Caption = '  Run  '
      ImageIndex = 4
      object PanelRunTop: TPanel
        Left = 0
        Top = 0
        Width = 636
        Height = 265
        Align = alTop
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 0
        object TreeRun: TVirtualStringTree
          Left = 40
          Top = 0
          Width = 596
          Height = 265
          Align = alClient
          BorderStyle = bsNone
          ChangeDelay = 100
          DefaultNodeHeight = 19
          Header.AutoSizeIndex = 0
          Header.Height = 15
          Header.MainColumn = -1
          HintMode = hmTooltip
          PopupMenu = PopupMenuRun
          ScrollBarOptions.ScrollBars = ssVertical
          TabOrder = 0
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoSort, toAutoSpanColumns, toAutoTristateTracking, toAutoHideButtons, toAutoDeleteMovedNodes, toAutoChangeScale]
          TreeOptions.MiscOptions = [toAcceptOLEDrop, toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
          TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toThemeAware, toUseBlendedImages, toFullVertGridLines, toUseExplorerTheme]
          TreeOptions.SelectionOptions = [toFullRowSelect, toRestoreSelection, toSelectNextNodeOnRemoval]
          OnChange = TreeGamesChange
          OnContextPopup = TreeGamesContextPopup
          OnDrawText = TreeDrawText
          OnGetText = TreeRunGetText
          OnNodeDblClick = TreeRunNodeDblClick
          Touch.InteractiveGestures = [igPan, igPressAndTap]
          Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
          Columns = <>
        end
        object PanelRunButtons: TPanel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 32
          Height = 257
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Align = alLeft
          BevelOuter = bvNone
          Color = clWindow
          ParentBackground = False
          TabOrder = 1
          object ButtonDown: TSpeedButton
            Tag = 1
            Left = 0
            Top = 64
            Width = 32
            Height = 32
            Hint = 'Move the line down'
            Align = alTop
            Caption = #9660
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = ButtonUpClick
            ExplicitTop = 30
          end
          object ButtonUp: TSpeedButton
            Tag = -1
            Left = 0
            Top = 32
            Width = 32
            Height = 32
            Hint = 'Move the line up'
            Align = alTop
            Caption = #9650
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = ButtonUpClick
            ExplicitTop = 0
          end
          object ButtonCreatePreset: TSpeedButton
            Tag = 1
            Left = 0
            Top = 96
            Width = 32
            Height = 32
            Hint = 'Create a new custom preset'
            Align = alTop
            Caption = #9998
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            ExplicitTop = 60
          end
          object ButtonClipboard: TSpeedButton
            Tag = -1
            Left = 0
            Top = 0
            Width = 32
            Height = 32
            Hint = 'Copy the entire command line to the clipboard'
            Align = alTop
            Caption = #55357#56784
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            OnClick = ButtonClipboardClick
            ExplicitLeft = -2
            ExplicitTop = -6
          end
        end
      end
      object PanelRunDown: TPanel
        Left = 0
        Top = 265
        Width = 636
        Height = 158
        Align = alClient
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        PopupMenu = PopupMenuRun
        TabOrder = 1
        object ButtonRun: TSpeedButton
          Left = 32
          Top = 12
          Width = 113
          Height = 32
          Caption = 'Run'
          ParentShowHint = False
          ShowHint = True
          OnClick = CtrlEnterClick
        end
      end
    end
  end
  object PanelHint: TPanel
    Left = 8
    Top = 260
    Width = 73
    Height = 33
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'PanelHint'
    Color = clInfoBk
    ParentBackground = False
    TabOrder = 0
    Visible = False
  end
  object PopupMenuHistory: TPopupMenu
    Left = 188
    Top = 98
    object MIHRun: TMenuItem
      Caption = 'Run...'
      ShortCut = 13
      OnClick = CtrlEnterClick
    end
    object MIHRunQuick: TMenuItem
      Tag = -1
      Caption = 'Quick Run'
      ShortCut = 16397
      OnClick = CtrlEnterClick
    end
    object MIHLine: TMenuItem
      Caption = '-'
    end
    object MIHNotepad: TMenuItem
      Caption = 'Open in Notepad'
      ShortCut = 115
      OnClick = MIPNotepadClick
    end
    object MIHLine2: TMenuItem
      Caption = '-'
    end
    object MIHDelete: TMenuItem
      Caption = 'Delete'
      ShortCut = 16430
      OnClick = MIHDeleteClick
    end
  end
  object PopupMenuGames: TPopupMenu
    Left = 188
    Top = 146
    object MIGNext: TMenuItem
      Caption = 'Next...'
      ShortCut = 13
      OnClick = CtrlEnterClick
    end
  end
  object PopupMenuPresets: TPopupMenu
    Left = 188
    Top = 194
    object MIPRun: TMenuItem
      Caption = 'Run...'
      ShortCut = 13
      OnClick = MIPRunClick
    end
    object MIPRunPort: TMenuItem
      Caption = 'Run with Port...'
    end
    object MIPLine: TMenuItem
      Caption = '-'
    end
    object MIPRunQuick: TMenuItem
      Tag = -1
      Caption = 'Quick Run'
      ShortCut = 16397
      OnClick = CtrlEnterClick
    end
    object MIPRunQuickPort: TMenuItem
      Caption = 'Quick Run with Port'
    end
    object MIPLine2: TMenuItem
      Caption = '-'
    end
    object MIPNotepad: TMenuItem
      Caption = 'Open in Notepad'
      ShortCut = 115
      OnClick = MIPNotepadClick
    end
    object MIPLIne3: TMenuItem
      Caption = '-'
    end
    object MIPBack: TMenuItem
      Caption = 'Back'
      ShortCut = 8
      OnClick = BackClick
    end
  end
  object PopupMenuRun: TPopupMenu
    Left = 188
    Top = 290
    object MIRRun: TMenuItem
      Caption = 'Run'
      ShortCut = 13
      OnClick = CtrlEnterClick
    end
    object MIRLine: TMenuItem
      Caption = '-'
    end
    object MIRMoveUp: TMenuItem
      Tag = -1
      Caption = 'Move Up'
      ShortCut = 16422
      OnClick = ButtonUpClick
    end
    object MIRMoveDown: TMenuItem
      Tag = 1
      Caption = 'Move Down'
      ShortCut = 16424
      OnClick = ButtonUpClick
    end
    object MIRLine2: TMenuItem
      Caption = '-'
    end
    object MIRClipboard: TMenuItem
      Caption = 'Copy CmdLine to Clipboard'
      ShortCut = 16451
      OnClick = ButtonClipboardClick
    end
    object MIRLine3: TMenuItem
      Caption = '-'
    end
    object MIRBack: TMenuItem
      Caption = 'Back'
      ShortCut = 8
      OnClick = BackClick
    end
  end
  object PopupMenuAbout: TPopupMenu
    Left = 188
    Top = 50
    object MIAHistory: TMenuItem
      Caption = 'History...'
      OnClick = MIAHistoryClick
    end
    object MIAGames: TMenuItem
      Caption = 'Games...'
      OnClick = MIAHistoryClick
    end
    object MIALine: TMenuItem
      Caption = '-'
    end
    object MIAViewLog: TMenuItem
      Caption = 'View Log'
      OnClick = ViewLogClick
    end
    object MIADeleteLog: TMenuItem
      Caption = 'Delete Log'
      OnClick = DeleteLogClick
    end
    object MIConfigFile: TMenuItem
      Caption = 'Config File'
      OnClick = ConfigFileClick
    end
  end
  object PopupMenuMods: TPopupMenu
    Left = 188
    Top = 242
    object MIMClear: TMenuItem
      Caption = 'Reset Checkboxes'
      ShortCut = 16430
      OnClick = MIMClearClick
    end
    object MIMCollapseAll: TMenuItem
      Caption = 'Collapse All'
      ShortCut = 16421
      OnClick = ButtonModsCollapseAllClick
    end
    object MIMExpandAll: TMenuItem
      Caption = 'Expand All'
      ShortCut = 16423
      OnClick = ButtonModsExpandAllClick
    end
    object MIMLine: TMenuItem
      Caption = '-'
    end
    object MIMRun: TMenuItem
      Caption = 'Run...'
      ShortCut = 13
      OnClick = CtrlEnterClick
    end
    object MIMRunPort: TMenuItem
      Caption = 'Run with Port...'
    end
    object MIMLine3: TMenuItem
      Caption = '-'
    end
    object MIMRunQuick: TMenuItem
      Tag = -1
      Caption = 'Quick Run'
      ShortCut = 16397
      OnClick = CtrlEnterClick
    end
    object MIMRunQuickPort: TMenuItem
      Caption = 'Quick Run with Port'
    end
    object MIMLine2: TMenuItem
      Caption = '-'
    end
    object MIMBack: TMenuItem
      Caption = 'Back'
      ShortCut = 8
      OnClick = BackClick
    end
  end
end
