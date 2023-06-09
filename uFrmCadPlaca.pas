unit uFrmCadPlaca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons;

type
  TfrmCadPlaca = class(TForm)
    GroupBox1: TGroupBox;
    btnOk: TBitBtn;
    btnExcluir: TBitBtn;
    btFechar: TBitBtn;
    btnAlterar: TBitBtn;
    btnFiltro: TBitBtn;
    btnRelatorio: TBitBtn;
    gbConsulta: TGroupBox;
    Label10: TLabel;
    lbPlaca: TLabel;
    dbcTipoVeiculo: TDBLookupComboBox;
    edPlaca: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure cadastrar;
    procedure limpar;
  public
    { Public declarations }
  end;

var
  frmCadPlaca: TfrmCadPlaca;

implementation

uses uData;



{$R *.dfm}


procedure TfrmCadPlaca.cadastrar;
begin
  data.qCadastro.Close;
  data.qCadastro.SQL.Text:='';
  data.qCadastro.SQL.Text:=('INSERT INTO placas (id, placa, tipo_veiculo) VALUES(:id, :placa, :tipo_veiculo)');
  data.qCadastro.ParamByName('id').AsString:='null';
  data.qCadastro.ParamByName('placa').AsString:=edPlaca.Text;
  data.qCadastro.ParamByName('tipo_veiculo').AsInteger:=StrToInt(dbcTipoVeiculo.KeyValue);
  data.qCadastro.ExecSQL;
  data.conection.Commit;
  if data.qCadastro.RowsAffected > 0 then
    begin
      showmessage('cadastro realizado com sucesso');
      data.tPlaca.Refresh;
      limpar;
    end;
end;

procedure TfrmCadPlaca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := CaFree;
Release;
frmCadPlaca:= Nil;
end;

procedure TfrmCadPlaca.btnOkClick(Sender: TObject);
begin
  cadastrar;
end;

procedure TfrmCadPlaca.FormShow(Sender: TObject);
begin
  data.tTipoVeiculo.Open;
end;

procedure TfrmCadPlaca.limpar;
begin
  edPlaca.Clear;
  dbcTipoVeiculo.KeyValue:=0;
  edPlaca.SetFocus;
end;

end.
