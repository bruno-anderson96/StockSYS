unit uCadCep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ACBrBase, ACBrSocket, ACBrCEP, Buttons, ActnList, StdCtrls,
  Mask, DBCtrls, ExtCtrls;

type
  TtelaCadCep = class(TForm)
    SpeedButton1: TSpeedButton;
    ACBrCEP1: TACBrCEP;
    Panel1: TPanel;
    Label1: TLabel;
    edtCep: TDBEdit;
    Label2: TLabel;
    edtEnd: TDBEdit;
    Label3: TLabel;
    edtCompl: TDBEdit;
    Label4: TLabel;
    edtCidade: TDBEdit;
    Label5: TLabel;
    edtUf: TDBEdit;
    Label6: TLabel;
    edtBairro: TDBEdit;
    btnSalvar: TSpeedButton;
    btnNovo: TSpeedButton;
    ActionList1: TActionList;
    actInserir: TAction;
    actSalvar: TAction;
    actFechar: TAction;
    procedure SpeedButton1Click(Sender: TObject);
    procedure actInserirExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  telaCadCep: TtelaCadCep;

implementation

uses uDados;

{$R *.dfm}

procedure TtelaCadCep.SpeedButton1Click(Sender: TObject);
var
p : Integer;
i : Int64;
n : integer;
begin

edtCep.Text := telaDados.BuscarPorCep(edtCep.Text).cep;
edtEnd.Text := telaDados.BuscarPorCep(edtCep.Text).endereco;
edtCidade.Text := telaDados.BuscarPorCep(edtCep.Text).cidade;
edtBairro.Text := telaDados.BuscarPorCep(edtCep.Text).bairro;

{
  i:=60000000;
  while i<63999999 do begin
       ACBrCEP1.BuscarPorCEP(IntToStr(i));
       if ACBrCEP1.BuscarPorCEP(IntToStr(i)) = 0 then begin 

        i:= i+1;
      ACBrCEP1.TimeOut := ACBrCEP1.TimeOut +2;


       end else begin
       for n := 0 to ACBrCEP1.Enderecos.Count -1 do
       begin

        telaDados.tblCep.Insert;
        telaDados.tblCepCEP.AsString        := UpperCase(ACBrCEP1.Enderecos[n].CEP);
        telaDados.tblCepENDERECO.AsString   := UpperCase(ACBrCEP1.Enderecos[n].Logradouro);
        telaDados.tblCepCOMPLEMENTO.AsString:= UpperCase(ACBrCEP1.Enderecos[n].Complemento);
        telaDados.tblCepCIDADE_END.AsString := UpperCase(ACBrCEP1.Enderecos[n].Municipio);
        telaDados.tblCepUF_END.AsString     := UpperCase(ACBrCEP1.Enderecos[n].UF);
        telaDados.tblCepBAIRRO_END.AsString := UpperCase(ACBrCEP1.Enderecos[n].Bairro);
    telaDados.tblCep.Post;
    i:=i+1;
    end;
  end;
end; }
end;


procedure TtelaCadCep.actInserirExecute(Sender: TObject);
begin
edtCep.Enabled := true;
edtCidade.Enabled := true;
edtBairro.Enabled := true;
edtEnd.Enabled := true;
edtCompl.Enabled := true;
edtUf.Enabled := true;
btnSalvar.Enabled := true;
btnNovo.Enabled := false;

edtCep.SetFocus;

{telaDados.tbl.Insert;}
end;

procedure TtelaCadCep.actSalvarExecute(Sender: TObject);
begin
edtCep.Enabled := false;
edtCidade.Enabled := false;
edtBairro.Enabled := false;
edtEnd.Enabled := false;
edtCompl.Enabled := false;
edtUf.Enabled := false;
btnSalvar.Enabled := false;
btnNovo.Enabled := true;

{telaDados.tblCep.Post;}
end;

end.
