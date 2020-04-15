unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Data.FMTBcd, Data.SqlExpr, Vcl.DBCGrids;

type
  TModo = (modoInclusao, modoAlteracao, modoLeitura);
  TLimpar = class(TForm)
    sbtnAbrirConsulta: TSpeedButton;
    edtId_autores: TEdit;
    edtNome_autores: TEdit;
    pnlOperacoes: TPanel;
    sbtnAnterior: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnProximo: TButton;
    pnlConfirmar: TPanel;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDQuery1id_autor: TFDAutoIncField;
    FDQuery1nome_autor: TStringField;
    FDQuery1hora_log: TTimeField;
    FDQuery1data_log: TDateField;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    DataSource1: TDataSource;
    btnVerLivros: TButton;
    DBGrid1: TDBGrid;
    FDQuery2: TFDQuery;
    DataSource2: TDataSource;
    DBGrid2: TDBGrid;
    pnlLivros: TPanel;
    edtId_livro: TEdit;
    edtNome_livro: TEdit;
    edtAutor_livro: TEdit;
    pnlConfirmarLivros: TPanel;
    btnCancelarLivro: TSpeedButton;
    btnSalvarLivro: TButton;
    pnlOpeLivros: TPanel;
    btnExcluirLivro: TButton;
    btnIncluirLivro: TButton;
    btnAnteriorLivro: TButton;
    btnProximoLivro: TButton;
    btnAlterarLivro: TButton;
    procedure sbtnAbrirConsultaClick(Sender: TObject);
    procedure sbtnAnteriorClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnVerLivrosClick(Sender: TObject);
    procedure btnProximoLivroClick(Sender: TObject);
    procedure btnAnteriorLivroClick(Sender: TObject);
    procedure btnSalvarLivroClick(Sender: TObject);
    procedure btnAlterarLivroClick(Sender: TObject);
    procedure btnIncluirLivroClick(Sender: TObject);
    procedure btnExcluirLivroClick(Sender: TObject);
    procedure btnCancelarLivroClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);

  private
    { Private declarations }
    FModo:TModo;
    procedure ConsultaLinhasAutor;
    procedure ConsultaLinhasLivro;
    procedure HabilitarTela(AHabilitado:boolean);
    procedure HabilitarTelaLivro(AHabilitadoLivro: boolean);
  public
    { Public declarations }
  end;

var
  Limpar: TLimpar;

implementation

{$R *.dfm}

procedure TLimpar.ConsultaLinhasAutor;
begin
  edtId_autores.Text := FDQuery1.FieldByName('id_autor').AsString;
  edtNome_autores.Text :=  FDQuery1.FieldByName('nome_autor').AsString;
end;
procedure TLimpar.btnProximoLivroClick(Sender: TObject);
begin
  FDQuery2.Next;
  ConsultaLinhasLivro;
end;

procedure TLimpar.btnAlterarClick(Sender: TObject);
begin
  HabilitarTela(True);
  edtId_autores.ReadOnly:=True;
  FModo := modoAlteracao;
end;

procedure TLimpar.btnAlterarLivroClick(Sender: TObject);
begin
  HabilitarTelaLivro(True);
  edtId_livro.ReadOnly:=True;
  FModo := modoAlteracao;
end;

procedure TLimpar.btnAnteriorLivroClick(Sender: TObject);
begin
  FDQuery2.Prior;
  ConsultaLinhasLivro;
end;

procedure TLimpar.btnCancelarClick(Sender: TObject);
begin
  ConsultaLinhasAutor;
  HabilitarTela(False);
  FModo:=modoLeitura;
end;
procedure TLimpar.btnCancelarLivroClick(Sender: TObject);
begin
  ConsultaLinhasLivro;
  HabilitarTelaLivro(False);
  FModo:=modoLeitura;
end;

procedure TLimpar.btnSalvarClick(Sender: TObject);
var
  _dt:TDateTime;
begin
  if FModo=modoLeitura then
    Exit;

  if FModo=modoInclusao then
  begin
    FDQuery1.Append;
    FDQuery1.FieldByName('nome_autor').Value := edtNome_autores.Text;
    //FDQuery1.FieldByName('hora_log').Value := (Time);
    //FDQuery1.FieldByName('data_log').Value := (Date);
  end
  else
  begin
    FDQuery1.Edit;
  end;
  FDQuery1.FieldByName('nome_autor').Value := edtNome_autores.Text;
  FDQuery1.FieldByName('hora_log').Value := (Time);
  FDQuery1.FieldByName('data_log').Value := (Date);
  FDQuery1.Post;

  HabilitarTela(False);
  FModo:=modoLeitura;
end;


procedure TLimpar.btnSalvarLivroClick(Sender: TObject);
var
  _dt:TDateTime;
begin
  if FModo=modoLeitura then
    Exit;

  if FModo=modoInclusao then
  begin
    FDQuery2.Append;
    FDQuery2.FieldByName('nome_livro').Value := edtNome_livro.Text;
    FDQuery2.FieldByName('autor_livro').Value := edtAutor_livro.Text;
    //FDQuery1.FieldByName('hora_log').Value := (Time);
    //FDQuery1.FieldByName('data_log').Value := (Date);
  end
  else
  begin
    FDQuery2.Edit;
  end;
  FDQuery2.FieldByName('nome_livro').Value := edtNome_livro.Text;
  FDQuery2.FieldByName('autor_livro').Value := edtAutor_livro.Text;
  FDQuery2.Post;

  HabilitarTelaLivro(False);
  FModo:=modoLeitura;
end;

//----- Botão de excluir comando sql
procedure TLimpar.btnExcluirClick(Sender: TObject);
begin
  if FDConnection1.ExecSQL('DELETE FROM autores WHERE id_autor='+QuotedStr(edtId_autores.Text))>0 then
  begin
    ShowMessage('Excluido com sucesso');
    HabilitarTela(False);
    FDQuery1.Refresh;
  end;

end;

procedure TLimpar.btnExcluirLivroClick(Sender: TObject);
begin
  if FDConnection1.ExecSQL('DELETE FROM livros WHERE id_livro='+QuotedStr(edtId_livro.Text))>0 then
  begin
    ShowMessage('Excluido com sucesso');
    HabilitarTelaLivro(False);
    FDQuery2.Refresh;
  end;

end;

procedure TLimpar.btnIncluirClick(Sender: TObject);
begin
  HabilitarTela(True);
  FModo := modoInclusao;
end;

procedure TLimpar.btnIncluirLivroClick(Sender: TObject);
begin
 HabilitarTelaLivro(True);
  FModo := modoInclusao;
end;

procedure TLimpar.ConsultaLinhasLivro;
begin
  edtId_livro.Text := FDQuery2.FieldByName('id_livro').AsString;
  edtNome_livro.Text :=  FDQuery2.FieldByName('nome_livro').AsString;
  edtAutor_livro.Text :=  FDQuery2.FieldByName('autor_livro').AsString;
end;

procedure TLimpar.btnVerLivrosClick(Sender: TObject) ;

begin

try
    FDQuery1.Open;
  except on E: Exception do
    raise Exception.Create('Falha ao abrir consulta de autores. '+E.Message);
  end;
  FDQuery2.FetchAll;
  FModo := modoLeitura;

  FDQuery2.First;

  ConsultaLinhasAutor;
  HabilitarTelaLivro(False);

  ConsultaLinhasLivro;
  DBGrid2.Visible := True;

  FDQuery2.FindKey([edtId_autores.Text]);
  FDQuery2.SQL.Text := ('SELECT id_livro, nome_livro, autor_livro FROM livros WHERE autor_livro = '+ edtId_autores.Text +'' );
  FDQuery2.Open;
end;

procedure TLimpar.btnProximoClick(Sender: TObject);
begin
  FDQuery1.Next;
  ConsultaLinhasAutor;
end;

procedure TLimpar.HabilitarTela(AHabilitado: boolean); // Para os Autores
begin
  pnlOperacoes.Enabled := not AHabilitado;
  pnlConfirmar.Enabled := AHabilitado;
  edtId_autores.ReadOnly := False;
  edtNome_autores.ReadOnly := False;
end;
procedure TLimpar.HabilitarTelaLivro(AHabilitadoLivro: boolean); // Para os Livros
begin
  //pnlOpeLivros := not AHabilitadoLivro;
  pnlConfirmarLivros.Enabled := AHabilitadoLivro;
  edtId_livro.ReadOnly := False;
  edtNome_livro.ReadOnly := False;
  edtAutor_livro.ReadOnly := False;
end;

procedure TLimpar.sbtnAnteriorClick(Sender: TObject);
begin
  FDQuery1.Prior;
  ConsultaLinhasAutor;
end;

procedure TLimpar.sbtnAbrirConsultaClick(Sender: TObject);
begin
  FDQuery1.Active:=Active;
  FDQuery1.SQL.Text :=
    'SELECT id_autor, nome_autor, hora_log, data_log FROM autores' ;


  try
    FDQuery1.Open;
  except on E: Exception do
    raise Exception.Create('Falha ao abrir consulta de autores. '+E.Message);
  end;
  FDQuery1.FetchAll;
  FModo := modoLeitura;

  FDQuery1.First;

  ConsultaLinhasAutor;
  HabilitarTela(False);
end;

end.
