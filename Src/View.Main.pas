unit View.Main;

//INCLUI UM ARQUIVO .inc ONDE PODEM SER INSERIDAS DIVERSAS DIRETIVAS DE COMPILACAO
//{$I arquivo.inc} OU {$INCLUDE arquivo.inc};
{$I C4D.inc}
{$INCLUDE Includes\arquivo_inc_teste.inc}

//"DEFINE" CRIA/DEFINI UMA DIRETIVA COM NOME "ACBR_C4D"
{$DEFINE ACBR_C4D}

//"UNDEF" DESATIVA/INDEFINI A DIRETIVA COM NOME ACBR_C4D
{$UNDEF ACBR_C4D}

//"UNDEF" DESATIVA/INDEFINI A DIRETIVA COM NOME ACBR_NAS_OPCOES_DO_PROJETO
{$UNDEF ACBR_NAS_OPCOES_DO_PROJETO}

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellAPI,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  {$IFDEF ACBR_C4D}
  ACBrBase,
  ACBrExtenso,
  {$ENDIF}
  Utils,
  Vcl.Imaging.pngimage;

type
  //NO ESTADO {$SCOPEDENUMS ON}, AS ENUMERA��ES T�M ESCOPO E OS VALORES DE ENUM N�O S�O ADICIONADOS AO ESCOPO GLOBAL
  {$SCOPEDENUMS ON}
  TAssinado = (Sim, Nao);
  TEnviado = (Sim, Nao);
  {$SCOPEDENUMS OFF}

  TViewMain = class(TForm)
    Memo1: TMemo;
    Panel6: TPanel;
    btnLimparLog: TButton;
    pnBackLogoELinks: TPanel;
    GroupBox1: TGroupBox;
    pnBackLinks01: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pnBackLinks02: TPanel;
    lbYoutube: TLabel;
    lbTelegram: TLabel;
    lbGitHub: TLabel;
    pnBackLogo: TPanel;
    Image1: TImage;
    pnTop: TPanel;
    Panel3: TPanel;
    btnIFeELSE: TButton;
    btnIFeELSEIFeELSE: TButton;
    btnComContantes: TButton;
    btnComContantesInteger: TButton;
    Panel4: TPanel;
    btnAlterarValorConstantes: TButton;
    btnAoDefinirValorDeConstantes: TButton;
    btnVersaoDelphiVERXX: TButton;
    btnVersaoDelphiRTLVersion: TButton;
    btnVersaoDelphiCompilerVersion: TButton;
    Panel5: TPanel;
    btnDefine: TButton;
    btnUNDef: TButton;
    btnHabilitarDesabilitarHints: TButton;
    btnHabilitarDesabilitarWarnings: TButton;
    Button1: TButton;
    Panel8: TPanel;
    btnSO: TButton;
    btnPlataformas: TButton;
    btnVclOuFmx: TButton;
    Panel1: TPanel;
    edtValor: TEdit;
    btnNumeroPorExtenso: TButton;
    btnMessages: TButton;
    btnIfComNot: TButton;
    btnIdeEmDebugOuRelease: TButton;
    procedure btnNumeroPorExtensoClick(Sender: TObject);
    procedure btnIFeELSEClick(Sender: TObject);
    procedure btnIFeELSEIFeELSEClick(Sender: TObject);
    procedure btnComContantesClick(Sender: TObject);
    procedure btnComContantesIntegerClick(Sender: TObject);
    procedure btnMessagesClick(Sender: TObject);
    procedure btnAlterarValorConstantesClick(Sender: TObject);
    procedure btnAoDefinirValorDeConstantesClick(Sender: TObject);
    procedure btnVersaoDelphiVERXXClick(Sender: TObject);
    procedure btnVersaoDelphiCompilerVersionClick(Sender: TObject);
    procedure btnVersaoDelphiRTLVersionClick(Sender: TObject);
    procedure btnLimparLogClick(Sender: TObject);
    procedure lbYoutubeClick(Sender: TObject);
    procedure btnDefineClick(Sender: TObject);
    procedure btnUNDefClick(Sender: TObject);
    procedure btnHabilitarDesabilitarHintsClick(Sender: TObject);
    procedure btnHabilitarDesabilitarWarningsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnSOClick(Sender: TObject);
    procedure btnPlataformasClick(Sender: TObject);
    procedure btnVclOuFmxClick(Sender: TObject);
    procedure btnIfComNotClick(Sender: TObject);
    procedure btnIdeEmDebugOuReleaseClick(Sender: TObject);
  private
    {$IFDEF ACBR_C4D}
    function NumeroExtensoACBr(AValor: Double): string;
    {$ENDIF}
  public

  end;

var
  ViewMain: TViewMain;

implementation

{$R *.dfm}

//CONTROLA A EXIBICAO DE REGIOES RECOLHIVEIS
{$REGION 'Minha regi�o'}
procedure ExibirMsgTeste;
begin
  ShowMessage('Minha mensagem de teste');
end;
{$ENDREGION}

{$IFDEF ACBR_C4D}

function TViewMain.NumeroExtensoACBr(AValor: Double): string;
var
  LACBrExtenso: TACBrExtenso;
begin
  LACBrExtenso := TACBrExtenso.Create(nil);
  try
    LACBrExtenso.Formato := extPadrao;
    LACBrExtenso.Idioma := idiCustom;
    LACBrExtenso.Valor := AValor;
    Result := Trim(LACBrExtenso.Texto);
  finally
    LACBrExtenso.Free;
  end;
end;
{$ENDIF}

procedure TViewMain.btnNumeroPorExtensoClick(Sender: TObject);
var
  LValor: Integer;
begin
  LValor := StrToIntDef(edtValor.Text, 0);

  {$IFDEF ACBR_C4D}
    Memo1.Lines.Add('Do ACBr: ' + NumeroExtensoACBr(LValor));
  {$ELSE}
    Memo1.Lines.Add('Da fun��o: ' + NumeroExtensoFuncao(LValor));
  {$ENDIF}
end;

procedure TViewMain.btnLimparLogClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TViewMain.btnDefineClick(Sender: TObject);
begin
  //CRIAR/DEFINIR UMA DIRETIVA
  {$DEFINE NAME_DIRECTIVE_TEST_01}

  //TESTAR SE A DIRETIVA ESTA DEFINIDA
  {$IFDEF NAME_DIRECTIVE_TEST_01}
    Memo1.Lines.Add('Diretiva NAME_DIRECTIVE_TEST_01 est� definida');
  {$ELSE}
    Memo1.Lines.Add('Diretiva NAME_DIRECTIVE_TEST_01 N�O est� definida');
  {$ENDIF}
end;

procedure TViewMain.btnUNDefClick(Sender: TObject);
begin
  //DESATIVAR/INDEFINIR UMA DIRETIVA
  {$UNDEF NAME_DIRECTIVE_TEST_02}

  //TESTAR SE A DIRETIVA ESTA DEFINIDA
  {$IFDEF NAME_DIRECTIVE_TEST_02}
    Memo1.Lines.Add('Diretiva NAME_DIRECTIVE_TEST_02 est� definida');
  {$ELSE}
    Memo1.Lines.Add('Diretiva NAME_DIRECTIVE_TEST_02 N�O est� definida');
  {$ENDIF}
end;

procedure TViewMain.btnHabilitarDesabilitarHintsClick(Sender: TObject);
begin
  //DESABILITA OS HINTS AO COMPILAR,
  //OU SEJA NAO SERA EXIBIDO NENHUM HINTS A PARTIR DO PONTO QUE A DIRETIVA ESTIVER,
  //A N�O SER QUE EXISTA A DIRETIVA {$HINTS ON} NO MESMO ESCOPO
  {$HINTS OFF}

  //HABILITA OS HINTS AO COMPILAR
  {$HINTS ON}
end;

procedure TViewMain.btnHabilitarDesabilitarWarningsClick(Sender: TObject);
begin
  //DESABILITA OS WARNINGS AO COMPILAR,
  //OU SEJA NAO SERA EXIBIDO NENHUM WARNING A PARTIR DO PONTO QUE A DIRETIVA ESTIVER
  {$WARNINGS OFF}

  //HABILITA OS WARNINGS AO COMPILAR
  {$WARNINGS ON}
end;

procedure TViewMain.Button1Click(Sender: TObject);
var
  I: Integer;
begin
  //ESTA DIRETIVA DA UM CONTROLE SOBRE MENSAGENS DE AVISOS (WARNINGS) INDIVIDUAIS

  (*SINTAXE
   {$WARN identifier ON | OFF | ERROR | DEFAULT}
   {$WARN identifier ON}	Permite que o compilador exiba o aviso especificado pelo identificador
   {$WARN identifier OFF} O aviso especificado n�o � exibido
   {$WARN identifier ERROR} O aviso especificado � tratado como erro
   {$WARN identifier DEFAULT} Usa as configura��es padr�o da caixa de di�logo Op��es do Projeto
  *)

  //EXEMPLOS
  //HABILITA OS WARNINGS DO TIPO SYMBOL_EXPERIMENTAL
  {$WARN SYMBOL_EXPERIMENTAL ON}

  //DESABILITA OS WARNINGS DO TIPO SYMBOL_EXPERIMENTAL
  {$WARN SYMBOL_EXPERIMENTAL OFF}

  //TRANSFORMA OS WARINGS TIPO SYMBOL_EXPERIMENTAL EM ERROS
  {$WARN SYMBOL_EXPERIMENTAL ERROR}
  //LISTA COMPLETA: https://docwiki.embarcadero.com/RADStudio/Athens/en/Warning_messages_(Delphi)
end;

procedure TViewMain.btnIFeELSEClick(Sender: TObject);
begin
  //CRIAR/DEFINIR A DIRETIVA "MINHA_DIRETIVA"
  (*$DEFINE MINHA_DIRETIVA*)
  {$IFDEF MINHA_DIRETIVA}
    Memo1.Lines.Add('Diretiva MINHA_DIRETIVA definida');
  {$ELSE}
    Memo1.Lines.Add('Diretiva MINHA_DIRETIVA n�o definida');
  {$ENDIF}

  //DESATIVAR/INDEFINIR A DIRETIVA "MINHA_DIRETIVA"
  {$UNDEF MINHA_DIRETIVA}
  {$IFDEF MINHA_DIRETIVA}
    Memo1.Lines.Add('Diretiva MINHA_DIRETIVA definida');
  {$ELSE}
    Memo1.Lines.Add('Diretiva MINHA_DIRETIVA n�o definida');
  {$ENDIF}
end;

procedure TViewMain.btnIFeELSEIFeELSEClick(Sender: TObject);
begin
  {$DEFINE VALOR_02}
  {$IFDEF VALOR_01}
    Memo1.Lines.Add('Diretiva VALOR_01 definida');
  {$ELSEIF DEFINED(VALOR_02)}
    Memo1.Lines.Add('Diretiva VALOR_02 definida');
  {$ELSEIF DEFINED(VALOR_03)}
    Memo1.Lines.Add('Diretiva VALOR_03 definida');
  {$ELSE}
    Memo1.Lines.Add('Diretivas VALOR_01, VALOR_02 E VALOR_03 n�o est�o definidas');
  {$ENDIF}
end;

procedure TViewMain.btnIfComNotClick(Sender: TObject);
begin
  {$IF NOT DEFINED(DIRETIVA_NOT)}
    Memo1.Lines.Add('Diretiva DIRETIVA_NOT n�o definida');
  {$ELSE}
    Memo1.Lines.Add('Diretiva DIRETIVA_NOT definida');
  {$ENDIF}
end;

procedure TViewMain.btnComContantesClick(Sender: TObject);
const
  VERSAO = 6.8;
begin
  {$IF VERSAO <= 5}
    Memo1.Lines.Add('Valor da constante VERSAO � menor ou igual 5');
  {$ELSEIF (VERSAO > 5) AND (VERSAO <= 10)}
    Memo1.Lines.Add('Valor da constante VERSAO � maior que 5 e menor que 10');
  {$ELSE}
    Memo1.Lines.Add('Valor da constante VERSAO � maior que 10');
  {$IFEND}
end;

procedure TViewMain.btnComContantesIntegerClick(Sender: TObject);
const
  TEST_INTEGER: Integer = 3;
begin
  {$IF SizeOf(TEST_INTEGER) <= 5}
  Memo1.Lines.Add('Valor da constante TEST_INTEGER � menor ou igual 5');
  {$ELSE}
  Memo1.Lines.Add('Valor da constante TEST_INTEGER � maior que 5');
  {$IFEND}
end;

procedure TViewMain.btnIdeEmDebugOuReleaseClick(Sender: TObject);
begin
  {$IFDEF DEBUG}
    Memo1.Lines.Add('Modo de Debug');
  {$ELSEIF DEFINED(RELEASE)}
    Memo1.Lines.Add('Modo de Release');
  {$ELSE}
    Memo1.Lines.Add('Modo diferente de Debug e Release');
  {$ENDIF}
end;

procedure TViewMain.btnMessagesClick(Sender: TObject);
begin
  //Gerando Messages ao compilar ou dar build no projeto (as mensagens geradas sao exibidas nas abas "Build" e "Output")

  //EMITS A HINT
  {$MESSAGE 'Meu Hint teste ao compilar'}

  //EMITS A HINT
  {$MESSAGE Hint 'Mais um Hint ao compilar'}

  //EMITS A WARNING
  {$MESSAGE Warn 'Meu Warning teste ao compilar.'}

  //EMITS AN ERROR, CONTINUES COMPILING
  //{$Message Error 'Exibe uma mensagem de erro, e n�o permite a continua��o da compila��o'}

  //EMITS AN ERROR, TERMINATES COMPILER
  //{$Message Fatal 'Exibe uma mensagem de terminate, e n�o permite a continua��o da compila��o'}
end;

procedure TViewMain.btnSOClick(Sender: TObject);
var
  LSO: string;
begin
  {$IF LINUX}
    LSO := 'LINUX';
  {$ELSEIF DEFINED(MSWINDOWS)}
    LSO := 'MSWINDOWS';
  {$ELSEIF DEFINED(ANDROID)}
    LSO := 'ANDROID';
  {$ELSEIF DEFINED(IOS)}
    LSO := 'IOS';
  {$ELSEIF DEFINED(MACOS)}
    LSO := 'MACOS';
  {$ELSEIF DEFINED(POSIX)}
    LSO := 'POSIX';
  {$ELSE}
    LSO := 'N�o encontrada';
  {$ENDIF}

  Memo1.Lines.Add('Sistema operacional selecionado: ' + LSO);
end;

procedure TViewMain.btnPlataformasClick(Sender: TObject);
var
  LPlataforma: string;
begin
  {$IFDEF CONSOLE}
    LPlataforma := 'CONSOLE';
  {$ELSEIF DEFINED(WIN32)}
    LPlataforma := 'WIN32';
  {$ELSEIF DEFINED(WIN64)}
    LPlataforma := 'WIN64';
  {$ELSEIF DEFINED(LINUX32)}
    LPlataforma := 'LINUX32';
  {$ELSEIF DEFINED(LINUX64)}
    LPlataforma := 'LINUX64';
  {$ELSEIF DEFINED(ANDROID32)}
    LPlataforma := 'ANDROID32';
  {$ELSEIF DEFINED(ANDROID64)}
    LPlataforma := 'ANDROID64';
  {$ELSEIF DEFINED(IOS64)}
    LPlataforma := 'IOS64';
  {$ELSEIF DEFINED(MACOS32)}
    LPlataforma := 'MACOS32';
  {$ELSEIF DEFINED(MACOS64)}
    LPlataforma := 'MACOS64';
  {$ELSE}
    LPlataforma := 'N�o encontrada';
  {$ENDIF}

  Memo1.Lines.Add('Plataforma atual: ' + LPlataforma);
end;

procedure TViewMain.btnVclOuFmxClick(Sender: TObject);
var
  LFramework: string;
begin
  //AS SEGUINTES CONDICIONAIS EST�O DISPON�VEIS A PARTIR DO RAD STUDIO 11.1 Alexandria, Release 1
  //FRAMEWORK_VCL : Definido se o projeto usa o framework VCL
  //FRAMEWORK_FMX : Definido se o projeto usa o framework FMX

  //PARA VERSOES ANTERIORES AO 11.1 Alexandria, PODE SER DEFIDA MANUALMENTE. EXEMPLO:
  {$IF CompilerVersion < 35.0)}
    {$DEFINE FRAMEWORK_VCL}
  {$ENDIF}

  {$IFDEF FRAMEWORK_VCL}
    LFramework := 'VCL';
  {$ELSEIF DEFINED(FRAMEWORK_FMX)}
    LFramework := 'FMX';
  {$ELSE}
    LFramework := 'N�o encontrado';
  {$ENDIF}

  Memo1.Lines.Add('Plataforma atual: ' + LFramework);
end;

procedure TViewMain.btnAlterarValorConstantesClick(Sender: TObject);
//NAO PERMITE ALTERAR CONSTANTES (E O PADRAO DA IDE) : {$J-} OU {$WRITEABLECONST OFF}
{$J-}

//PERMITE ALTERAR CONSTANTES : {$J+} OU {$WRITEABLECONST ON}
{$WRITEABLECONST ON}
const
  MINHA_CONST: Integer = 2023;
begin
  Memo1.Lines.Add('Valor da constante �: ' + MINHA_CONST.ToString);
  MINHA_CONST := 2024;
  Memo1.Lines.Add('Valor constante ap�s altera��o �: ' + MINHA_CONST.ToString);
end;

procedure TViewMain.btnAoDefinirValorDeConstantesClick(Sender: TObject);
const
  {$IFDEF DEBUG}
    DEBUG_OR_RELEASE = 'Debug';
  {$ELSE}
    DEBUG_OR_RELEASE = 'Release';
  {$ENDIF}
begin
  Memo1.Lines.Add('A IDE esta em modo: ' + DEBUG_OR_RELEASE);
end;

procedure TViewMain.btnVersaoDelphiVERXXClick(Sender: TObject);
var
  LNomeVersao: string;
begin
  {$IFDEF VER300}
    LNomeVersao := 'Delphi 10 Seattle (VER300)';
  {$ELSEIF DEFINED(VER310)}
    LNomeVersao := 'Delphi 10.1 Berlin (VER310)';
  {$ELSEIF DEFINED(VER320)}
    LNomeVersao := 'Delphi 10.2 Tokyo (VER320)';
  {$ELSEIF DEFINED(VER330)}
    LNomeVersao := 'Delphi 10.3 Rio (VER330)';
  {$ELSEIF DEFINED(VER340)}
    LNomeVersao := 'Delphi 10.4 Sydney (VER340)';
  {$ELSEIF DEFINED(VER350)}
    LNomeVersao := 'Delphi 11.0 Alexandria (VER350)';
  {$ELSEIF DEFINED(VER360)}
    LNomeVersao := 'Delphi 12.0 Athens (VER360)';
  {$ELSE}
    LNomeVersao := 'Vers�o ANTERIOR a Delphi 10 Seattle ' + sLineBreak + 'Sua vers�o � a: ' + CompilerVersion.ToString;
  {$ENDIF}

  Memo1.Lines.Add('A vers�o do seu Delphi � a: ' + LNomeVersao);
end;

procedure TViewMain.btnVersaoDelphiCompilerVersionClick(Sender: TObject);
var
  LNomeVersao: string;
begin
  {$IF CompilerVersion = 30.0}
    LNomeVersao := 'Delphi 10 Seattle';
  {$ELSEIF CompilerVersion = 31.0)}
    LNomeVersao := 'Delphi 10.1 Berlin';
  {$ELSEIF CompilerVersion = 32.0)}
    LNomeVersao := 'Delphi 10.2 Tokyo';
  {$ELSEIF CompilerVersion = 33.0)}
    LNomeVersao := 'Delphi 10.3 Rio';
  {$ELSEIF CompilerVersion = 34.0)}
    LNomeVersao := 'Delphi 10.4 Sydney';
  {$ELSEIF CompilerVersion = 35.0)}
    LNomeVersao := 'Delphi 11.0 Alexandria';
  {$ELSEIF CompilerVersion = 36.0)}
    LNomeVersao := 'Delphi 12.0 Athens';
  {$ELSEIF CompilerVersion >= 37.0)}
    LNomeVersao := 'Delphi maior ou igual a 37.0';
  {$ELSE}
    LNomeVersao := 'Vers�o ANTERIOR a Delphi 10 Seattle';
  {$ENDIF}
  Memo1.Lines.Add('A vers�o do seu Delphi � a: ' + LNomeVersao + ' - N�mero da CompilerVersion: ' + CompilerVersion.ToString);

  if(CompilerVersion = 33)then
    Memo1.Lines.Add('Function CompilerVersion = 33. Vers�o do seu delphi � 10.3 Rio')
  else
    Memo1.Lines.Add('Function CompilerVersion = ' + CompilerVersion.ToString);
end;

procedure TViewMain.btnVersaoDelphiRTLVersionClick(Sender: TObject);
var
  LNomeVersao: string;
begin
  {$IF RTLVersion = 30.0}
    LNomeVersao := 'Delphi 10 Seattle';
  {$ELSEIF RTLVersion = 31.0)}
    LNomeVersao := 'Delphi 10.1 Berlin';
  {$ELSEIF RTLVersion = 32.0)}
    LNomeVersao := 'Delphi 10.2 Tokyo';
  {$ELSEIF RTLVersion = 33.0)}
    LNomeVersao := 'Delphi 10.3 Rio';
  {$ELSEIF RTLVersion = 34.0)}
    LNomeVersao := 'Delphi 10.4 Sydney';
  {$ELSEIF RTLVersion = 35.0)}
    LNomeVersao := 'Delphi 11.0 Alexandria';
  {$ELSEIF RTLVersion = 36.0)}
    LNomeVersao := 'Delphi 12.0 Athens';
  {$ELSEIF RTLVersion >= 37.0)}
    LNomeVersao := 'Delphi maior ou igual a 37.0';
  {$ELSE}
    LNomeVersao := 'Vers�o ANTERIOR a Delphi 10 Seattle';
  {$ENDIF}

  Memo1.Lines.Add('A vers�o do seu Delphi � a: ' + LNomeVersao + ' - N�mero da RTLVersion: ' + FloatToStr(RTLVersion));
end;

procedure TViewMain.lbYoutubeClick(Sender: TObject);
begin
  ShellExecute(0, nil, PChar(TLabel(Sender).Hint), '', '', SW_ShowNormal);
end;

end.
