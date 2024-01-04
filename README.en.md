### Change the language
[![Static Badge](https://img.shields.io/badge/Portugu%C3%AAs-(ptBR)-green)](https://github.com/Code4Delphi/diretivas-de-compilacao-delphi)
[![Static Badge](https://img.shields.io/badge/English-(en)-red)](https://github.com/Code4Delphi/diretivas-de-compilacao-delphi/blob/master/README.en.md)

# Compilation directives in **Delphi**

<p align="center">
   <a href="https://github.com/Code4Delphi/Code4D-Wizard/blob/master/Images/C4D-Logo.png">
     <img alt="Code4Delphi" height="100" src="https://github.com/Code4Delphi/Code4D-Wizard/blob/master/Images/c4d-logo-100x100.png">
   </a>
</p>

In this directory you will find several examples of using compilation directives with Delphi.

Below we describe several examples of use, and in the project you will find complete and practical examples of use of the directives.



## 📞 Contacts

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
> ## ⭐ Don't forget to leave your star to help propagate the directory.


## Summary
- [WHAT ARE COMPILATION DIRECTIVES](#what-are-compilation-directives)
- [SET/UNDEFINE DIRECTIVES](#defineindefine)
- [IF, ELSEIF AND ELSE CONDITIONS](#if-elseif-and-else-conditions)
- [CONSTANTS](#constants)
- [MESSAGES](#messages)
- [OPERATING SYSTEMS](#operating-systems)
- [PLATFORMS](#platforms)
- [FRAMEWORK](#framework)
- [DELPHI VERSION](#delphi-version)
- [SCOPEDENUMS](#scopedenums)
- [HINTS](#hints)
- [WARNINGS](#warnings)
- [WARNING MESSAGES](#warning-messages)
- [REGION](#region)
- [.inc FILES](#inc-files)
- [USING THE IDE](#using-the-ide)
- [USEFUL LINKS](#links-%C3%BAteis)
- [CONTRIBUTIONS / IDEAS / BUG FIXES](#contributions--ideas--bug-fixes)


## 🚀 DIRECTIVES

## WHAT ARE COMPILATION DIRECTIVES
A compiler directive is a comment with a special syntax. The compiler directive starts with a $ (dollar-sign) as the first character after the opening comment delimiter, immediately followed by a name (one or more letters) that designates the particular directive. You can include comments after the directive and any necessary parameters.
  
Compiler directives can be placed wherever comments are allowed. 
Examples of directives:
```
{$hints off}  
(*$hints off*)
```

## DEFINE/UNDEFINE
* CREATE/SET A POLICY
```
   {$DEFINE NAME_DIRECTIVE_TEST}
```

* DISABLE/UNDEFINE A POLICY
```
   {$UNDEF NAME_DIRECTIVE_TEST}
```

## IF, ELSEIF AND ELSE CONDITIONS
* IF and ELSE TO TEST IF THE DIRECTIVE IS DEFINED
~~~delphi
   {$IFDEF NAME_DIRECTIVE_TEST}
     Memo1.Lines.Add('NAME_DIRECTIVE_TEST directive is defined');
   {$ELSE}
     Memo1.Lines.Add('NAME_DIRECTIVE_TEST directive is NOT defined');
   {$ENDIF}
~~~

* IF, ELSEIF and ELSE
~~~delphi
   {$DEFINE VALUE_02}
   {$IFDEF VALUE_01}
     Memo1.Lines.Add('Directive VALUE_01 set to TRUE');
   {$ELSEIF DEFINED(VALUE_02)}
     Memo1.Lines.Add('Directive VALUE_02 set to TRUE');
   {$ELSEIF DEFINED(VALUE_03)}
     Memo1.Lines.Add('Directive VALUE_03 set to TRUE');
   {$ELSE}
     Memo1.Lines.Add('Directive VALUE_01, VALUE_02 AND VALUE_03 do not exist or are set to FALSE');
   {$ENDIF}
~~~

## CONSTANTS
* Check the value of a constant
~~~delphi
procedure TViewMain.btnComContantesClick(Sender: TObject);
const
   VERSION = 6.8;
begin
   {$IF VERSION <= 5}
     Memo1.Lines.Add('Value of the VERSION constant is less than or equal to 5');
   {$ELSEIF (VERSION > 5) AND (VERSION <= 10)}
     Memo1.Lines.Add('Value of the VERSION constant is greater than 5 and less than 10');
   {$ELSE}
     Memo1.Lines.Add('Value of the VERSION constant is greater than 10');
   {$IFEND}
end;
~~~

* Check the value of an Integer constant
~~~delphi
procedure TViewMain.btnComContantesIntegerClick(Sender: TObject);
const
   TEST_INTEGER: Integer = 3;
begin
   {$IF SizeOf(TEST_INTEGER) <= 5}
   Memo1.Lines.Add('Value of the TEST_INTEGER constant is less than or equal to 5');
   {$ELSE}
   Memo1.Lines.Add('Value of constant TEST_INTEGER is greater than 5');
   {$IFEND}
end;
~~~

* Allow **changing the value of constants**
~~~delphi
procedure TViewMain.btnChangeConstantValueClick(Sender: TObject);
// DOES NOT ALLOW YOU TO CHANGE CONSTANTS (IT IS THE IDE DEFAULT): {$J-} OR {$WRITEABLECONST OFF}
{$J-}

// ALLOWS TO CHANGE CONSTANTS: {$J+} OR {$WRITEABLECONST ON}
{$WRITEABLECONST ON}
const
   MY_CONST: Integer = 2023;
begin
   Memo1.Lines.Add('Constant value is: ' + MY_CONST.ToString);
   MY_CONST := 2024;
   Memo1.Lines.Add('Constant value after change is: ' + MY_CONST.ToString);
end;
~~~

* When setting a constant value
~~~delphi
procedure TViewMain.btnAoDefinirValorDeConstantesClick(Sender: TObject);
const
   {$IFDEF DEBUG}
     DEBUG_OR_RELEASE = 'Debug';
   {$ELSE}
     DEBUG_OR_RELEASE = 'Release';
   {$ENDIF}
begin
   Memo1.Lines.Add('The IDE is in mode: ' + DEBUG_OR_RELEASE);
end;

~~~

## MESSAGES
* Generate Messages when compiling or building the project (the generated messages are displayed in the "Build" and "Output" tabs)
```
   //EMITS A HINT
   {$MESSAGE 'My Hint test when compiling'}

   //EMITS A HINT
   {$MESSAGE Hint 'Another Hint when compiling'}

   //EMITS A WARNING
   {$MESSAGE Warn 'My test warning when compiling.'}

   //EMITS AN ERROR, CONTINUES COMPILING
   {$Message Error 'Displays an error message, and does not allow compilation to continue'}

   //EMITS AN ERROR, TERMINATES COMPILER
   {$Message Fatal 'Displays a terminate message, and does not allow compilation to continue'}
```

## OPERATIONAL SYSTEMS
* Check the Operating System
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
     LSO := 'Not found';
   {$ENDIF}

   Memo1.Lines.Add('Selected operating system: ' + LSO);
end;
~~~

## PLATFORMS
* Check which platform
~~~delphi
procedure TViewMain.btnPlataformasClick(Sender: TObject);
var
   LPlatform: string;
begin
   {$IFDEF CONSOLE}
     LPlatform := 'CONSOLE';
   {$ELSEIF DEFINED(WIN32)}
     LPlatform := 'WIN32';
   {$ELSEIF DEFINED(WIN64)}
     LPlatform := 'WIN64';
   {$ELSEIF DEFINED(LINUX32)}
     LPlatform := 'LINUX32';
   {$ELSEIF DEFINED(LINUX64)}
     LPlatform := 'LINUX64';
   {$ELSEIF DEFINED(ANDROID32)}
     LPlatform := 'ANDROID32';
   {$ELSEIF DEFINED(ANDROID64)}
     LPlatform := 'ANDROID64';
   {$ELSEIF DEFINED(IOS64)}
     LPlatform := 'IOS64';
   {$ELSEIF DEFINED(MACOS32)}
     LPlatform := 'MACOS32';
   {$ELSEIF DEFINED(MACOS64)}
     LPlatform := 'MACOS64';
   {$ELSE}
     LPlatform := 'Not found';
   {$ENDIF}

   Memo1.Lines.Add('Current platform: ' + LPlatform);
end;
~~~

## FRAMEWORK
* Check the Framework (VCL or FMX)
~~~delphi
procedure TViewMain.btnVclOuFmxClick(Sender: TObject);
var
   LFramework: string;
begin
   //THE FOLLOWING CONDITIONALS ARE AVAILABLE FROM RAD STUDIO 11.1 Alexandria, Release 1
   //FRAMEWORK_VCL: Defined if the project uses the VCL framework
   //FRAMEWORK_FMX: Defined if the project uses the FMX framework

   //FOR VERSIONS BEFORE 11.1 Alexandria, CAN BE DEFINED MANUALLY. EXAMPLE:
   {$IF CompilerVersion < 35.0)}
     {$DEFINE FRAMEWORK_VCL}
   {$ENDIF}

   {$IFDEF FRAMEWORK_VCL}
     LFramework := 'VCL';
   {$ELSEIF DEFINED(FRAMEWORK_FMX)}
     LFramework := 'FMX';
   {$ELSE}
     LFramework := 'Not found';
   {$ENDIF}

   Memo1.Lines.Add('Current platform: ' + LFramework);
end;
~~~

## DELPHI VERSION
* Check the version of Delphi (VERXX)
~~~delphi
procedure TViewMain.btnVersaoDelphiVERXXClick(Sender: TObject);
var
   LNameVersion: string;
begin
   {$IFDEF VER300}
     LNameVersion := 'Delphi 10 Seattle (VER300)';
   {$ELSEIF DEFINED(VER310)}
     LVersionName := 'Delphi 10.1 Berlin (VER310)';
   {$ELSEIF DEFINED(VER320)}
     LNameVersion := 'Delphi 10.2 Tokyo (VER320)';
   {$ELSEIF DEFINED(VER330)}
     LVersionName := 'Delphi 10.3 Rio (VER330)';
   {$ELSEIF DEFINED(VER340)}
     LNameVersion := 'Delphi 10.4 Sydney (VER340)';
   {$ELSEIF DEFINED(VER350)}
     LNameVersion := 'Delphi 11.0 Alexandria (VER350)';
   {$ELSEIF DEFINED(VER360)}
     LNameVersion := 'Delphi 12.0 Athens (VER360)';
   {$ELSE}
     LNameVersion := 'Version PREVIOUS to Delphi 10 Seattle ' + sLineBreak + 'Your version is: ' + CompilerVersion.ToString;
   {$ENDIF}

   Memo1.Lines.Add('The version of your Delphi is: ' + LNameVersion);
end;
~~~

* Check the Delphi version (CompilerVersion)
~~~delphi
procedure TViewMain.btnVersaoDelphiCompilerVersionClick(Sender: TObject);
var
   LNameVersion: string;
begin
   {$IF CompilerVersion = 30.0}
     LNameVersion := 'Delphi 10 Seattle';
   {$ELSEIF CompilerVersion = 31.0)}
     LNameVersion := 'Delphi 10.1 Berlin';
   {$ELSEIF CompilerVersion = 32.0)}
     LNameVersion := 'Delphi 10.2 Tokyo';
   {$ELSEIF CompilerVersion = 33.0)}
     LNameVersion := 'Delphi 10.3 Rio';
   {$ELSEIF CompilerVersion = 34.0)}
     LNameVersion := 'Delphi 10.4 Sydney';
   {$ELSEIF CompilerVersion = 35.0)}
     LNameVersion := 'Delphi 11.0 Alexandria';
   {$ELSEIF CompilerVersion = 36.0)}
     LNameVersion := 'Delphi 12.0 Athens';
   {$ELSEIF CompilerVersion >= 37.0)}
     LNameVersion := 'Delphi greater than or equal to 37.0';
   {$ELSE}
     LNameVersion := 'Version PREVIOUS to Delphi 10 Seattle';
   {$ENDIF}
   Memo1.Lines.Add('The version of your Delphi is: ' + LNameVersion + ' - CompilerVersion Number: ' + CompilerVersion.ToString);

   if(CompilerVersion = 33)then
     Memo1.Lines.Add('Function CompilerVersion = 33. Your Delphi version is 10.3 Rio')
   else
     Memo1.Lines.Add('Function CompilerVersion = ' + CompilerVersion.ToString);
end;
~~~

* Check the Delphi version (RTLVersion)
~~~delphi
procedure TViewMain.btnVersaoDelphiRTLVersionClick(Sender: TObject);
var
   LNameVersion: string;
begin
   {$IF RTLVersion = 30.0}
     LNameVersion := 'Delphi 10 Seattle';
   {$ELSEIF RTLVersion = 31.0)}
     LNameVersion := 'Delphi 10.1 Berlin';
   {$ELSEIF RTLVersion = 32.0)}
     LNameVersion := 'Delphi 10.2 Tokyo';
   {$ELSEIF RTLVersion = 33.0)}
     LNameVersion := 'Delphi 10.3 Rio';
   {$ELSEIF RTLVersion = 34.0)}
     LNameVersion := 'Delphi 10.4 Sydney';
   {$ELSEIF RTLVersion = 35.0)}
     LNameVersion := 'Delphi 11.0 Alexandria';
   {$ELSEIF RTLVersion = 36.0)}
     LNameVersion := 'Delphi 12.0 Athens';
   {$ELSEIF RTLVersion >= 37.0)}
     LNameVersion := 'Delphi greater than or equal to 37.0';
   {$ELSE}
     LNameVersion := 'Version PREVIOUS to Delphi 10 Seattle';
   {$ENDIF}

   Memo1.Lines.Add('The version of your Delphi is: ' + LNameVersion + ' - RTLVersion number: ' + FloatToStr(RTLVersion));
end;
~~~

## SCOPEDENUMS
* In the {$SCOPEDENUMS ON} state, enumerations are scoped and enum values are not added to the global scope
```
   {$SCOPEDENUMS ON}
   Signed = (Yes, No);
   TEsent = (Yes, No);
   {$SCOPEDENUMS OFF}
```

## HINTS
* Disables Hints when compiling, that is, no Hints will be displayed from the point where the directive is, unless there is a {$HINTS ON} directive in the same scope
```
   {$HINTS OFF}
```
* Enable Hints when compiling
```
   {$HINTS ON}
```

## WARNINGS
* Disable Warnings when compiling, that is, no Warning will be displayed from the point the directive is
```
   {$WARNINGS OFF}
```
* Enable Warnings when compiling
```
   {$WARNINGS ON}
```

## WARNING MESSAGES
* These directives give control over individual warning messages
  
Syntax: <br/>
&nbsp;&nbsp; {$WARN identifier ON | OFF | ERROR | DEFAULT} <br/>
&nbsp;&nbsp; {$WARN identifier ON} Allows the compiler to display the warning specified by the identifier <br/>
&nbsp;&nbsp; {$WARN identifier OFF} The specified warning is not displayed <br/>
&nbsp;&nbsp; {$WARN identifier ERROR} The specified warning is treated as an error <br/>
&nbsp;&nbsp; {$WARN identifier DEFAULT} Uses the default settings from the Project Options dialog box <br/>

Examples:
```
   // ENABLES SYMBOL_EXPERIMENTAL TYPE WARNINGS
   {$WARN SYMBOL_EXPERIMENTAL ON}

   // DISABLE SYMBOL_EXPERIMENTAL TYPE WARNINGS
   {$WARN SYMBOL_EXPERIMENTAL OFF}

   //TURNS SYMBOL_EXPERIMENTAL TYPE WARINGS INTO ERRORS
   {$WARN SYMBOL_EXPERIMENTAL ERROR}
```
Full list: [https://docwiki.embarcadero.com/RADStudio/Athens/en/Warning_messages_(Delphi)](https://docwiki.embarcadero.com/RADStudio/Athens/en/Warning_messages_(Delphi))

## REGION
* Controls the display of collapsible regions
~~~delphi
{$REGION 'My region'}
procedure DisplayTestMsg;
begin
   ShowMessage('My test message');
end;
{$ENDREGION}
~~~

## .inc FILES
* I included a .inc file where various compilation directives can be inserted. (usually declared right after the unit name)
  
Syntax: <br/>
&nbsp;&nbsp; {$I file.inc} OR {$INCLUDE file.inc};

Examples:
```
{$I C4D.inc}
{$INCLUDE Includes\arquivo_inc_teste.inc}
```
> [!NOTE]
> The file named "arquivo_inc_teste.inc" is inside a directory named "Includes". And in this file you can place different compilation directives, such as:
> ```
> {$DEFINE TEST_DIRECTIVE}
>
> {$IF CompilerVersion < 35.0)}
> {$DEFINE DIRECTIVE_TESTE_35}
> {$ENDIF}
> ```

## USING THE IDE
* You can define many of the compiler directives in the IDE dialog box under **Project > Options > Delphi Compiler > Conditional defines**. These directives affect all units whenever their source code is recompiled.

* If you're working in the Code Editor and want a quick way to see the compiler directives in effect, press <kbd>**Ctrl + O + O**</kbd>. The current directive settings are entered on a horizontal line at the top of your file, along with other current settings such as compiler warnings (the $WARN directive settings). These lists are added to the beginning of your source file unless you manually undo (<kbd>__Ctrl + Z__</kbd>) or delete the list:
![image](https://github.com/Code4Delphi/diretivas-de-compilacao-delphi/assets/33873267/d077a6e6-4135-426b-bf6b-7f22ef272026)

## 🔗USEFUL LINKS
- [Delphi compilation directives](https://docwiki.embarcadero.com/RADStudio/Athens/en/Delphi_compiler_directives)
- [List of compilation directives](https://docwiki.embarcadero.com/RADStudio/Athens/en/Delphi_Compiler_Directives_(List)_Index)
- [Conditional compilation](https://docwiki.embarcadero.com/RADStudio/Athens/en/Conditional_compilation_(Delphi))
- [List of Compiler Versions](https://docwiki.embarcadero.com/RADStudio/Athens/en/Compiler_Versions)
- [List of Warning Messages](https://docwiki.embarcadero.com/RADStudio/Athens/en/Warning_messages_(Delphi))
‌
## 💬Contributions / Ideas / Bug Fixes
To submit a pull request, follow these steps:

1. Fork the project
2. Create a new branch (`git checkout -b my-new-feature`)
3. Make your changes
4. Make the commit (`git commit -am 'Functionality or adjustment message'`)
5. Push the branch (`git push origin Message about functionality or adjustment`)
6. Open a pull request


[Back to Top](#compilation-directives-in-delphi) &nbsp;&nbsp; &nbsp;&nbsp; [Return to Summary](#summary)
