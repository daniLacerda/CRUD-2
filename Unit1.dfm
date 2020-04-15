object Limpar: TLimpar
  Left = 390
  Top = 0
  Caption = 'Limpar'
  ClientHeight = 400
  ClientWidth = 843
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object sbtnAbrirConsulta: TSpeedButton
    Left = 8
    Top = 37
    Width = 823
    Height = 25
    Caption = 'Abrir Consulta'
    OnClick = sbtnAbrirConsultaClick
  end
  object pnlLivros: TPanel
    Left = 383
    Top = 68
    Width = 448
    Height = 324
    TabOrder = 7
    object edtId_livro: TEdit
      Left = 9
      Top = 45
      Width = 40
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtNome_livro: TEdit
      Left = 55
      Top = 45
      Width = 194
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object edtAutor_livro: TEdit
      Left = 252
      Top = 45
      Width = 40
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object pnlConfirmarLivros: TPanel
      Left = 243
      Top = 292
      Width = 198
      Height = 27
      TabOrder = 3
      object btnCancelarLivro: TSpeedButton
        Left = 5
        Top = 4
        Width = 89
        Height = 21
        Caption = 'Cancelar'
        OnClick = btnCancelarLivroClick
      end
      object btnSalvarLivro: TButton
        Left = 100
        Top = 4
        Width = 89
        Height = 21
        Caption = 'Salvar'
        TabOrder = 0
        OnClick = btnSalvarLivroClick
      end
    end
    object pnlOpeLivros: TPanel
      Left = 271
      Top = 4
      Width = 167
      Height = 37
      TabOrder = 4
    end
    object btnExcluirLivro: TButton
      Left = 378
      Top = 11
      Width = 48
      Height = 25
      Caption = 'Excluir'
      TabOrder = 5
      OnClick = btnExcluirLivroClick
    end
    object btnIncluirLivro: TButton
      Left = 331
      Top = 11
      Width = 47
      Height = 25
      Caption = 'Incluir'
      TabOrder = 6
      OnClick = btnIncluirLivroClick
    end
    object btnAnteriorLivro: TButton
      Left = 298
      Top = 43
      Width = 56
      Height = 25
      Caption = 'Anterior'
      TabOrder = 7
      OnClick = btnAnteriorLivroClick
    end
    object btnProximoLivro: TButton
      Left = 355
      Top = 43
      Width = 55
      Height = 25
      Caption = 'Proximo'
      TabOrder = 8
      OnClick = btnProximoLivroClick
    end
    object btnAlterarLivro: TButton
      Left = 283
      Top = 11
      Width = 48
      Height = 25
      Caption = 'Alterar'
      TabOrder = 9
      OnClick = btnAlterarLivroClick
    end
  end
  object edtId_autores: TEdit
    Left = 8
    Top = 113
    Width = 38
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object edtNome_autores: TEdit
    Left = 52
    Top = 113
    Width = 189
    Height = 21
    TabOrder = 1
  end
  object pnlOperacoes: TPanel
    Left = 8
    Top = 68
    Width = 369
    Height = 39
    TabOrder = 2
    object sbtnAnterior: TSpeedButton
      Left = 8
      Top = 6
      Width = 52
      Height = 26
      Caption = 'Anterior'
      OnClick = sbtnAnteriorClick
    end
    object btnAlterar: TSpeedButton
      Left = 212
      Top = 6
      Width = 47
      Height = 26
      Caption = 'Alterar'
      OnClick = btnAlterarClick
    end
    object btnExcluir: TSpeedButton
      Left = 306
      Top = 6
      Width = 47
      Height = 26
      Caption = 'Excluir'
      OnClick = btnExcluirClick
    end
    object btnIncluir: TSpeedButton
      Left = 259
      Top = 6
      Width = 47
      Height = 26
      Caption = 'Incluir'
      OnClick = btnIncluirClick
    end
    object btnProximo: TButton
      Left = 61
      Top = 6
      Width = 49
      Height = 26
      Caption = 'Proximo'
      TabOrder = 0
      OnClick = btnProximoClick
    end
  end
  object pnlConfirmar: TPanel
    Left = 8
    Top = 356
    Width = 369
    Height = 36
    TabOrder = 3
    object btnSalvar: TSpeedButton
      Left = 268
      Top = 8
      Width = 89
      Height = 21
      Caption = 'Salvar'
      OnClick = btnSalvarClick
    end
    object btnCancelar: TSpeedButton
      Left = 176
      Top = 8
      Width = 89
      Height = 21
      Caption = 'Cancelar'
      OnClick = btnCancelarClick
    end
  end
  object btnVerLivros: TButton
    Left = 247
    Top = 113
    Width = 130
    Height = 21
    Caption = 'Ver Livros Deste Autor'
    TabOrder = 4
    OnClick = btnVerLivrosClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 140
    Width = 369
    Height = 210
    Ctl3D = True
    DataSource = DataSource1
    ParentCtl3D = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 393
    Top = 139
    Width = 428
    Height = 210
    DataSource = DataSource2
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=estiladmin'
      'Password=e1s4t7i2l8'
      'Database=dblivraria'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 132
    Top = 357
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM autores')
    Left = 73
    Top = 11
    object FDQuery1id_autor: TFDAutoIncField
      FieldName = 'id_autor'
      Origin = 'id_autor'
      ReadOnly = True
    end
    object FDQuery1nome_autor: TStringField
      FieldName = 'nome_autor'
      Origin = 'nome_autor'
      Required = True
      Size = 30
    end
    object FDQuery1hora_log: TTimeField
      FieldName = 'hora_log'
      Origin = 'hora_log'
    end
    object FDQuery1data_log: TDateField
      FieldName = 'data_log'
      Origin = 'data_log'
    end
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 78
    Top = 351
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 21
    Top = 353
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 133
    Top = 13
  end
  object FDQuery2: TFDQuery
    Active = True
    Indexes = <
      item
        Name = 'nome_livro'
      end>
    IndexFieldNames = 'nome_livro'
    MasterSource = DataSource1
    Connection = FDConnection1
    SQL.Strings = (
      'select * from livros')
    Left = 648
    Top = 8
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 592
    Top = 16
  end
end
