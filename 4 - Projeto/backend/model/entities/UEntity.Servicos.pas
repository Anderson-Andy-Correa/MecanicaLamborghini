unit UEntity.Servicos;

interface

uses
  System.JSON;

type
  TServico = class
  private
    FId: Integer;
    FDescricao: String;
    FValorUnAtual: Double;
    FUnMedida: Double;
    FJSON: TJSONObject;

    function GetId: Integer;
    function GetDescricao: String;
    function GetValorUnAtual: Double;
    function GetUnMedida: Double;
    function GetJSON: TJSONObject;

    procedure SetId(const Value: Integer);
    procedure SetDescricao(const Value: String);
    procedure SetValorUnAtual(const Value: Double);
    procedure SetUnMedida(const Value: Double);

  public
    constructor Create; overload;
    constructor Create(const aId: Integer); overload;

    destructor Destroy; override;

    property Id: Integer read GetId write SetId;
    property Descricao: String read GetDescricao write SetDescricao;
    property ValorUnAtual: Double read GetValorUnAtual write SetValorUnAtual;
    property UnMedida: Double read GetUnMedida write SetUnMedida;
    property JSON: TJSONObject read GetJSON;
  end;

implementation

uses
  System.SysUtils;

{ TServico }

constructor TServico.Create;
begin
  FJSON := TJSONObject.Create;
end;

constructor TServico.Create(const aId: Integer);
begin
  FId := aId;
  Self.Create;
end;

destructor TServico.Destroy;
begin
  FreeAndNil(FJSON);
  inherited;
end;

function TServico.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TServico.GetId: Integer;
begin
  Result := FId;
end;

function TServico.GetJSON: TJSONObject;
begin
  FJSON.AddPair('descricao', FDescricao);
  FJSON.AddPair('valorUnAtual', FValorUnAtual.ToString);
  FJSON.AddPair('descricao', FUnMedida.ToString);
  Result := FJSON;
end;

function TServico.GetUnMedida: Double;
begin
  Result := FUnMedida;
end;

function TServico.GetValorUnAtual: Double;
begin
  Result := FValorUnAtual;
end;

procedure TServico.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TServico.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TServico.SetUnMedida(const Value: Double);
begin
  FUnMedida := Value;
end;

procedure TServico.SetValorUnAtual(const Value: Double);
begin
  FValorUnAtual := Value;
end;

end.
