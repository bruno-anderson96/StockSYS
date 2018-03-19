unit uConfigSat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ACBrPosPrinter, ACBrSATExtratoClass,
  ACBrSATExtratoESCPOS, ACBrSAT, ACBrBase,  TypInfo, ACBrSATClass,
   ACBrIntegrador, pcnConversao;

type
  TtelaConfigSat = class(TForm)
    ACBrIntegrador1: TACBrIntegrador;
    ACBrSAT1: TACBrSAT;
    ACBrSATExtratoESCPOS1: TACBrSATExtratoESCPOS;
    ACBrPosPrinter1: TACBrPosPrinter;
    Memo1: TMemo;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure At(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
    procedure GetsignAC(var Chave: AnsiString);
    procedure GetcodigoDeAtivacao(var Chave: AnsiString);
    procedure GetNumeroSessao(var Chave: Integer);
  public
    { Public declarations }
  end;

var
  telaConfigSat: TtelaConfigSat;

implementation

{$R *.dfm}

procedure TtelaConfigSat.GetsignAC(var Chave: AnsiString);
begin
  Chave := AnsiString( 'AvKLv0zW5pywUQi/myFzzoJhSLsbx3g0ro5VwZvngLuzVDVJbLng/pZb4Upstr872qb59DlkAKg54Riv+AoCYSQj7mli8rVPbeiAKrnoekm4XVKZKiAZN/4Fve2n4S/b/N8M0kltwhlwWsAUURPESJ3LKSTk5RgrUPb8UXRWG7QGZHunmndLl42vxKf7Wz/74bRzfA36g'+'1AL3/ojB+QwrPx0wqSbTLlCmizml4o7X9vmP9m+VS0qk3GUBdLll/j2dt6ni9nDYYxofDbpclsK6Y6ZO2E3YgNPSP4DHUwNo3hs0ij3+ROWlYZF2FqAOdFo5pUxL7fmn+/oHV0dHUoCw=='  );

end;

procedure TtelaConfigSat.GetcodigoDeAtivacao(var Chave: AnsiString);
begin
  Chave := AnsiString( '123456789' );
end;

procedure TtelaConfigSat.GetNumeroSessao(var Chave: Integer);
begin
  Chave := 900000102
end; 

procedure TtelaConfigSat.At(Sender: TObject);
begin
memo1.Text := acbrSat1.AtivarSAT(1,'11.111.111/1111-11',23);
end;

procedure TtelaConfigSat.SpeedButton6Click(Sender: TObject);
begin
Memo1.Text := ACBrSAT1.ConsultarSAT;
end;

procedure TtelaConfigSat.FormCreate(Sender: TObject);
begin
 with ACBrSAT1 do
 begin


  Modelo := satDinamico_stdcall;
  Config.ide_CNPJ := '11111111111111';
  {
  Config.ide_CNPJ := '08490295000133';
  Config.ide_CNPJ := '11.111.111/1111-11'; }
  config.ide_numeroCaixa := 1;
  Config.ide_tpAmb := taHomologacao;
  Config.emit_IE := '1234567890';
  Config.emit_IM := '';
  Config.emit_cRegTrib := RTSimplesNacional;
  Config.emit_cRegTribISSQN := RTISSMicroempresaMunicipal;
  Config.emit_indRatISSQN := irNao;    {
  Config.emit_CNPJ := '14200166000166'; }
  Config.emit_CNPJ := '11111111111111';


  {ACBrSAT1.OnGetNumeroSessao := GetNumeroSessao;}

  end;

  ACBrSAT1.Inicializar;
  
ACBrSAT1.OnGetcodigoDeAtivacao := GetcodigoDeAtivacao;
ACBrSAT1.OnGetsignAC := GetsignAC;

{'12373349000158'}
end;

procedure TtelaConfigSat.SpeedButton5Click(Sender: TObject);
begin
  Memo1.Text := ACBrSAT1.AssociarAssinatura( '11111111111111','MD2Nof/O0tQMPKiYeeAydSjYt7YV9kU0nWKZGXHVdYIzR2W9Z6tgXni/Y5bnjmUAk8MkqlBJIiOOIskKCjJ086k7vAP0EU5cBRYj/nzHUiRdu9AVD7WRfVs00BDyb5fsnnKg7gAXXH6SBgCxG9yjAkxJ0l2E2idsWBAJ5peQEBZqtHytRUC+FLaSfd3+'+'66QNxIBlDwQIRzUGPaU6fvErVDSfMUf8WpkwnPz36fCQnyLypqe/5mbox9pt3RCbbXcYqnR/4poYGr9M9Kymj4/PyX9xGeiXwbgzOOHNIU5M/aAs0rulXz948bZla0eXABgEcp6mDkTzweLPZTbmOhX+eA==');
end;

end.
