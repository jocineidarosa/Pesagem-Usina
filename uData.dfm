object data: Tdata
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 269
  Top = 175
  Height = 529
  Width = 763
  object conection: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = True
    Catalog = 'pesagem'
    Properties.Strings = (
      'AutoEncodeStrings=True'
      'controls_cp=GET_ACP')
    AutoCommit = False
    SQLHourGlass = True
    HostName = 'localhost'
    Port = 3306
    Database = 'pesagem'
    User = 'root'
    Protocol = 'MariaDB-10'
    LibraryLocation = 
      'C:\Users\User\Documents\Jocinei\programa'#231#227'o\dephi\Pesagem-Usina\' +
      'data\libMaria\libmariadb.dll'
    Left = 32
    Top = 24
  end
  object qExpedicao: TZQuery
    Connection = conection
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'placa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo_veiculo'
        ParamType = ptUnknown
      end>
    Left = 96
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'placa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo_veiculo'
        ParamType = ptUnknown
      end>
  end
  object dsExpedicao: TDataSource
    DataSet = qExpedicao
    Left = 96
    Top = 88
  end
  object qCadastro: TZQuery
    Connection = conection
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'placa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo_veiculo'
        ParamType = ptUnknown
      end>
    Left = 168
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'placa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'tipo_veiculo'
        ParamType = ptUnknown
      end>
  end
  object dscadastro: TDataSource
    DataSet = qCadastro
    Left = 168
    Top = 88
  end
  object tTipoVeiculo: TZTable
    Connection = conection
    TableName = 'tipo_veiculo'
    Left = 96
    Top = 216
  end
  object dsTipoVeiculo: TDataSource
    DataSet = tTipoVeiculo
    Left = 96
    Top = 280
  end
end