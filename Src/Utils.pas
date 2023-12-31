unit Utils;

interface

uses
  System.SysUtils;

function NumeroExtensoFuncao(ANumero: Word; AFeminino: Boolean = False): string;

implementation

function NumeroExtensoFuncao(ANumero: Word; AFeminino: Boolean = False): string;
const
  cUnidades:Array[1..19] of string = ('um','dois','três','quatro','cinco','seis','sete','oito','nove','dez','onze','doze','treze','catorze','quinze','dezasseis','dezassete','dezoito','dezanove');
  cDezenas:Array[2..9] of string   = ('vinte','trinta','quarente','cinquenta','sessenta','setenta','oitenta','noventa');
  cCentenas:Array[1..9] of string  = ('cento','duzentos','trezentos','quatrocentos','quinhentos','seiscentos','setecentos','oitocentos','novecentos');
  cZero = 'zero';
  cCem  = 'cem';
  cSeparador: Array[Boolean] of string = ('', ' e ');
begin
  Result := '';
  if(ANumero > 999)then
    Exit;

  if(ANumero = 0)then
  begin
    Result := cZero;
  end
  else if(ANumero = 1)then
  begin
    Result := 'um';
    if(AFeminino)then
      Result := 'uma';
  end
  else if(ANumero = 2)then
  begin
    Result := 'dois';
    if(AFeminino)then
      Result := 'duas';
  end
  else if(ANumero = 100)then
  begin
    Result := cCem;
  end
  else
  begin
    if(ANumero Mod 10 = 0)and(ANumero <> 10)then
      Result := ''
    else if Trunc((ANumero Mod 100) div 10) = 1then
      Result := cUnidades[(ANumero Mod 100)]
    else
      Result := cUnidades[ANumero Mod 10];

    if(ANumero Mod 100 >= 20)then
      Result := cDezenas[Trunc((ANumero Mod 100) div 10)] + cSeparador[ANumero Mod 10 > 0] + Result;

    if(ANumero > 100)then
      Result := cCentenas[Trunc((ANumero Mod 1000) div 100)] + cSeparador[ANumero Mod 100 > 0] + Result;
  end;
end;

end.
