### Alterar idioma
[![Static Badge](https://img.shields.io/badge/Portugu%C3%AAs-(ptBR)-green)](https://github.com/Code4Delphi/diretivas-de-compilacao-delphi)
[![Static Badge](https://img.shields.io/badge/English-(en)-red)](https://github.com/Code4Delphi/diretivas-de-compilacao-delphi/blob/master/README.en.md)


# Diretivas de compilação no **Delphi**

<p align="center">
  <a href="https://github.com/Code4Delphi/Code4D-Wizard/blob/master/Images/C4D-Logo.png">
    <img alt="Code4Delphi" height="100" src="https://github.com/Code4Delphi/Code4D-Wizard/blob/master/Images/c4d-logo-100x100.png">
  </a> 
</p>

Nesse diretório você encontrara vários exemplos do uso de diretivas de compilação com o Delphi.

Abaixo descrevemos diversos exemplo de uso, e no projeto você encontrara exemplos completos e práticos de uso das diretivas.



## 📞 Contatos

<p align="left">
  <a href="https://t.me/Code4Delphi" target="_blank">
    <img src="https://img.shields.io/badge/Telegram:-Join%20Channel-blue?logo=telegram">
  </a>
  &nbsp;
  <a href="https://www.youtube.com/@code4delphi" target="_blank">
    <img src="https://img.shields.io/badge/YouTube:-Join%20Channel-red?logo=youtube&logoColor=red">
  </a> 
  &nbsp;
  <a href="mailto:contato@code4delphi.com.br" target="_blank">
    <img src="https://img.shields.io/badge/E--mail-contato%40code4delphi.com.br-yellowgreen?logo=maildotru&logoColor=yellowgreen">
  </a>  
</p>

<br/>

> [!IMPORTANT]
> ## ⭐ Não deixe de deixar sua estrela para ajudar a propagar o diretório.


## Sumário 
- [DEFINIR/INDEFINIR DIRETIVAS](#definirindefinir)
- [CONDIÇÕES IF, ELSEIF E ELSE](#condi%C3%A7%C3%B5es-if-elseif-e-else)
- [CONSTANTES](#constantes)
- [MESSAGES](#messages)
- [SISTEMAS OPERACIONAIS](#sistemas-operacionais)
- [PLATAFORMAS](#plataformas)
- [FRAMEWORK](#framework)
- [VERSÃO DO DELPHI](#vers%C3%A3o-do-delphi)
- [SCOPEDENUMS](#scopedenums)
- [HINTS](#hints)
- [WARNINGS](#warnings)
- [WARNING MESSAGES](#warning-messages)
- [REGION](#region)
- [ARQUIVOS .inc](#arquivos-inc)
- [USANDO O IDE](#usando-o-ide)
- [LINKS ÚTEIS](#links-%C3%BAteis)
- [CONTRIBUTIONS / IDEAS / BUG FIXES](#contributions--ideas--bug-fixes)


## 🚀 DIRETIVAS

## DEFINIR/INDEFINIR
* CRIAR/DEFINIR UMA DIRETIVA  
```
  {$DEFINE NAME_DIRECTIVE_TEST}
```

* DESATIVAR/INDEFINIR UMA DIRETIVA
```
  {$UNDEF NAME_DIRECTIVE_TEST}
```

## CONDIÇÕES IF, ELSEIF E ELSE
* IF e ELSE PARA TESTAR SE A DIRETIVA ESTA DEFINIDA
~~~delphi
  {$IFDEF NAME_DIRECTIVE_TEST}
    Memo1.Lines.Add('Diretiva NAME_DIRECTIVE_TEST está definida');
  {$ELSE}
    Memo1.Lines.Add('Diretiva NAME_DIRECTIVE_TEST NÃO está definida');
  {$ENDIF}
~~~

* IF, ELSEIF e ELSE
~~~delphi
  {$DEFINE VALOR_02}
  {$IFDEF VALOR_01}
    Memo1.Lines.Add('Diretiva VALOR_01 setada como TRUE');
  {$ELSEIF DEFINED(VALOR_02)}
    Memo1.Lines.Add('Diretiva VALOR_02 setada como TRUE');
  {$ELSEIF DEFINED(VALOR_03)}
    Memo1.Lines.Add('Diretiva VALOR_03 setada como TRUE');
  {$ELSE}
    Memo1.Lines.Add('Diretiva VALOR_01, VALOR_02 E VALOR_03 não existem ou estão setada como FALSE');
  {$ENDIF}
~~~

## CONSTANTES
* Verificar o valor de uma constantes
~~~delphi
procedure TViewMain.btnComContantesClick(Sender: TObject);
const
  VERSAO = 6.8;
begin
  {$IF VERSAO <= 5}
    Memo1.Lines.Add('Valor da constante VERSAO é menor ou igual 5');
  {$ELSEIF (VERSAO > 5) AND (VERSAO <= 10)}
    Memo1.Lines.Add('Valor da constante VERSAO é maior que 5 e menor que 10');
  {$ELSE}
    Memo1.Lines.Add('Valor da constante VERSAO é maior que 10');
  {$IFEND}
end;
~~~

* Verificar o valor de uma constantes Integer
~~~delphi
procedure TViewMain.btnComContantesIntegerClick(Sender: TObject);
const
  TEST_INTEGER: Integer = 3;
begin
  {$IF SizeOf(TEST_INTEGER) <= 5}
  Memo1.Lines.Add('Valor da constante TEST_INTEGER é menor ou igual 5');
  {$ELSE}
  Memo1.Lines.Add('Valor da constante TEST_INTEGER é maior que 5');
  {$IFEND}
end;
~~~

* Permitir a **alteração do valor de constantes**
~~~delphi
procedure TViewMain.btnAlterarValorConstantesClick(Sender: TObject);
//NAO PERMITE ALTERAR CONSTANTES (E O PADRAO DA IDE) : {$J-} OU {$WRITEABLECONST OFF}
{$J-}

//PERMITE ALTERAR CONSTANTES : {$J+} OU {$WRITEABLECONST ON}
{$WRITEABLECONST ON}
const
  MINHA_CONST: Integer = 2023;
begin
  Memo1.Lines.Add('Valor da constante é: ' + MINHA_CONST.ToString);
  MINHA_CONST := 2024;
  Memo1.Lines.Add('Valor constante após alteração é: ' + MINHA_CONST.ToString);
end;
~~~

* Ao definir um valor de constante
~~~delphi
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

~~~

## MESSAGES
* Gerar Messages ao compilar ou dar build no projeto (as mensagens geradas sao exibidas nas abas "Build" e "Output")
```
  //EMITS A HINT
  {$MESSAGE 'Meu Hint teste ao compilar'}

  //EMITS A HINT
  {$MESSAGE Hint 'Mais um Hint ao compilar'}

  //EMITS A WARNING
  {$MESSAGE Warn 'Meu Warning teste ao compilar.'}

  //EMITS AN ERROR, CONTINUES COMPILING
  {$Message Error 'Exibe uma mensagem de erro, e não permite a continuação da compilação'}

  //EMITS AN ERROR, TERMINATES COMPILER
  {$Message Fatal 'Exibe uma mensagem de terminate, e não permite a continuação da compilação'}
```

## SISTEMAS OPERACIONAIS
* Verificar qual o Sistema Operacional
~~~delphi
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
    LSO := 'Não encontrada';
  {$ENDIF}

  Memo1.Lines.Add('Sistema operacional selecionado: ' + LSO);
end;
~~~

## PLATAFORMAS
* Verificar qual a Plataforma
~~~delphi
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
    LPlataforma := 'Não encontrada';
  {$ENDIF}

  Memo1.Lines.Add('Plataforma atual: ' + LPlataforma);
end;
~~~

## FRAMEWORK
* Verificar qual o Framework (VCL ou FMX)
~~~delphi
procedure TViewMain.btnVclOuFmxClick(Sender: TObject);
var
  LFramework: string;
begin
  //AS SEGUINTES CONDICIONAIS ESTÃO DISPONÍVEIS A PARTIR DO RAD STUDIO 11.1 Alexandria, Release 1
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
    LFramework := 'Não encontrado';
  {$ENDIF}

  Memo1.Lines.Add('Plataforma atual: ' + LFramework);
end;
~~~

## VERSÃO DO DELPHI
* Verificar qual a versão do Delphi (VERXX)
~~~delphi
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
    LNomeVersao := 'Versão ANTERIOR a Delphi 10 Seattle ' + sLineBreak + 'Sua versão é a: ' + CompilerVersion.ToString;
  {$ENDIF}

  Memo1.Lines.Add('A versão do seu Delphi é a: ' + LNomeVersao);
end;
~~~

* Verificar qual a versão Delphi (CompilerVersion)
~~~delphi
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
    LNomeVersao := 'Versão ANTERIOR a Delphi 10 Seattle';
  {$ENDIF}
  Memo1.Lines.Add('A versão do seu Delphi é a: ' + LNomeVersao + ' - Número da CompilerVersion: ' + CompilerVersion.ToString);

  if(CompilerVersion = 33)then
    Memo1.Lines.Add('Function CompilerVersion = 33. Versão do seu delphi é 10.3 Rio')
  else
    Memo1.Lines.Add('Function CompilerVersion = ' + CompilerVersion.ToString);
end;
~~~

* Verificar qual a versão Delphi (RTLVersion)
~~~delphi
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
    LNomeVersao := 'Versão ANTERIOR a Delphi 10 Seattle';
  {$ENDIF}

  Memo1.Lines.Add('A versão do seu Delphi é a: ' + LNomeVersao + ' - Número da RTLVersion: ' + FloatToStr(RTLVersion));
end;
~~~

## SCOPEDENUMS
* No estado {$SCOPEDENUMS ON}, as enumerações têm escopo e os valores de enum não são adicionados ao escopo global
```
  {$SCOPEDENUMS ON}
  TAssinado = (Sim, Nao);
  TEnviado = (Sim, Nao);
  {$SCOPEDENUMS OFF}
```

## HINTS
* Desabilita Hints ao compilar, ou seja, não será exibido nenhum Hints a partir do ponto que a diretiva estiver, a não ser que exista a diretiva {$HINTS ON} no mesmo escopo
```
  {$HINTS OFF}
```
* Habilitar Hints ao compilar
```
  {$HINTS ON}
```

## WARNINGS
* Desabilitar Warnings ao compilar, ou seja, não será exibido nenhum Warning a partir do ponto que a diretiva estiver
```  
  {$WARNINGS OFF}
```
* Habilitar Warnings ao compilar
```
  {$WARNINGS ON}
```

## WARNING MESSAGES
* Estas diretivas dão um controle sobre mensagens de avisos (warnings) individuais
  
Sintaxe: <br/>
&nbsp;&nbsp; {$WARN identifier ON | OFF | ERROR | DEFAULT}  <br/>
&nbsp;&nbsp; {$WARN identifier ON}	Permite que o compilador exiba o aviso especificado pelo identificador  <br/>
&nbsp;&nbsp; {$WARN identifier OFF} O aviso especificado não é exibido  <br/>
&nbsp;&nbsp; {$WARN identifier ERROR} O aviso especificado é tratado como erro  <br/>
&nbsp;&nbsp; {$WARN identifier DEFAULT} Usa as configurações padrão da caixa de diálogo Opções do Projeto  <br/>

Exemplos: 
```
  //HABILITA OS WARNINGS DO TIPO SYMBOL_EXPERIMENTAL
  {$WARN SYMBOL_EXPERIMENTAL ON}

  //DESABILITA OS WARNINGS DO TIPO SYMBOL_EXPERIMENTAL
  {$WARN SYMBOL_EXPERIMENTAL OFF}

  //TRANSFORMA OS WARINGS TIPO SYMBOL_EXPERIMENTAL EM ERROS
  {$WARN SYMBOL_EXPERIMENTAL ERROR}
```
Lista completa: [https://docwiki.embarcadero.com/RADStudio/Athens/en/Warning_messages_(Delphi)](https://docwiki.embarcadero.com/RADStudio/Athens/en/Warning_messages_(Delphi))

## REGION
* Controla a exibição de regiões recolhíveis
~~~delphi
{$REGION 'Minha região'}
procedure ExibirMsgTeste;
begin
  ShowMessage('Minha mensagem de teste');
end;
{$ENDREGION}
~~~

## ARQUIVOS .inc
* Incluí um arquivo .inc onde podem ser inseridas diversas diretivas de compilação. (normalmente declarado logo após o nome da unit)
  
Sintaxe: <br/>
&nbsp;&nbsp; {$I arquivo.inc} OU {$INCLUDE arquivo.inc};

Exemplos: 
```
{$I C4D.inc}
{$INCLUDE Includes\arquivo_inc_teste.inc}
```
> [!NOTE]
> O arquivo com nome "arquivo_inc_teste.inc" está dentro de um diretório com o nome "Includes". E nesse arquivo pode-se colocar diversar diretivas de compilação como por exemplo:
> ```
> {$DEFINE DIRETIVA_TESTE}
>
> {$IF CompilerVersion < 35.0)}
>   {$DEFINE DIRETIVA_TESTE_35}
> {$ENDIF}
> ```


## USANDO O IDE
* Você pode definir muitas das diretivas do compilador na caixa de diálogo da IDE em **Project > Options > Delphi Compiler > Conditional defines**. Essas diretivas afetam todas as unidades sempre que seu código-fonte é recompilado.

* Se você estiver trabalhando no Editor de Código e quiser uma maneira rápida de ver as diretivas do compilador em vigor, pressione <kbd>**Ctrl + O + O**</kbd>. As configurações atuais das diretivas são inseridas em uma linha horizontal no topo do seu arquivo, junto com outras configurações atuais, como avisos do compilador (as configurações da diretiva $WARN). Essas listas são adicionadas ao início do seu arquivo de origem, a menos que você desfaça (<kbd>__Ctrl + Z__</kbd>) ou exclua manualmente a lista:
![image](https://github.com/Code4Delphi/diretivas-de-compilacao-delphi/assets/33873267/d077a6e6-4135-426b-bf6b-7f22ef272026)


## 🔗LINKS ÚTEIS
- [Diretivas de compilação Delphi](https://docwiki.embarcadero.com/RADStudio/Athens/en/Delphi_compiler_directives)
- [Lista de diretivas de compilação](https://docwiki.embarcadero.com/RADStudio/Athens/en/Delphi_Compiler_Directives_(List)_Index)
- [Conditional compilation](https://docwiki.embarcadero.com/RADStudio/Athens/en/Conditional_compilation_(Delphi))
- [Lista de Compiler Versions](https://docwiki.embarcadero.com/RADStudio/Athens/en/Compiler_Versions)
- [Lista de Warning Messages](https://docwiki.embarcadero.com/RADStudio/Athens/en/Warning_messages_(Delphi))
‌
## 💬Contributions / Ideas / Bug Fixes
To submit a pull request, follow these steps:

1. Fork the project
2. Create a new branch (`git checkout -b minha-nova-funcionalidade`)
3. Make your changes
4. Make the commit (`git commit -am 'Functionality or adjustment message'`)
5. Push the branch (`git push origin Message about functionality or adjustment`)
6. Open a pull request


[Voltar para o Topo](#diretivas-de-compila%C3%A7%C3%A3o-no-delphi) &nbsp;&nbsp; &nbsp;&nbsp;  [Voltar para o Sumário](#sum%C3%A1rio)
