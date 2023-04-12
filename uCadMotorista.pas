unit uCadMotorista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Grids, DBGrids;

type
  TfrmCadMotorista = class(TForm)
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
    edNome: TEdit;
    edSobrenome: TEdit;
    Label1: TLabel;
    edEndereco: TEdit;
    Label2: TLabel;
    edTelefone: TEdit;
    Label3: TLabel;
    edCpf: TEdit;
    Label4: TLabel;
    edRg: TEdit;
    dbgData: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btFecharClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    procedure cadastrar;
    procedure limpar;
  public
    { Public declarations }
  end;

var
  frmCadMotorista: TfrmCadMotorista;

implementation
  uses
    uData;

{$R *.dfm}

procedure TfrmCadMotorista.FormClose(Sender: TObject;
var
  Action: TCloseAction);
begin
action := CaFree;
Release;
frmCadMotorista:= Nil;
end;

procedure TfrmCadMotorista.btFecharClick(Sender: TObject);
begin
close;
end;

procedure TfrmCadMotorista.cadastrar;
var
  cod, nome, sobrenome, endereco, telefone, cpf, rg:string;

begin
  data.qCadastro.SQL.Text:='';
  data.qCadastro.SQL.Text:=('INSERT INTO motoristas (id, nome, sobrenome, endereco, telefone, cpf, rg)'+
  ' VALUES(:id, :nome, :sobrenome, :endereco, :telefone, :cpf, :rg )');
  data.qCadastro.ParamByName('id').AsString:='null';
  data.qCadastro.ParamByName('nome').AsString:=edNome.Text;
  data.qCadastro.ParamByName('sobrenome').AsString:=edSobreNome.Text;
  data.qCadastro.ParamByName('endereco').AsString:=edEndereco.Text;
  data.qCadastro.ParamByName('telefone').AsString:=edTelefone.Text;
  data.qCadastro.ParamByName('cpf').AsString:=edCpf.Text;
  data.qCadastro.ParamByName('rg').AsString:=edRg.Text;
  data.qCadastro.ExecSQL;
  data.conection.Commit;
  if data.qCadastro.RowsAffected >0 then
    begin
      showmessage('Cadastro realizado com sucesso!');
      data.tMotorista.Refresh;
      limpar;
    end;
  data.qCadastro.Close;

end;

procedure TfrmCadMotorista.btnOkClick(Sender: TObject);
begin
cadastrar;
end;

procedure TfrmCadMotorista.limpar;
begin
  edNome.Clear;
  edSobrenome.Clear;
  edEndereco.Clear;
  edTelefone.Clear;
  edCpf.Clear;
  edRg.Clear;
  edNome.SetFocus;
end;

end.
