program backend;

{$APPTYPE CONSOLE}

uses
  Horse,
  System.SysUtils,
  UDAO.Pecas in 'model\dao\UDAO.Pecas.pas',
  UEntity.Servicos in 'model\entities\UEntity.Servicos.pas',
  UEntity.Usuarios in 'model\entities\UEntity.Usuarios.pas',
  UEntity.Logins in 'model\entities\UEntity.Logins.pas',
  UEntity.Carros in 'model\entities\UEntity.Carros.pas';

begin

  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('pong');
    end);

  THorse.Listen(9000,
    procedure(Horse: THorse)
    begin
      Writeln('Server is runing on port ' + IntToStr(Horse.Port));
    end);
end.