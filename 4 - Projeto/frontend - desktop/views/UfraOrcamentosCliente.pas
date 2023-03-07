unit UfraOrcamentosCliente;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.Controls.Presentation, FMX.Layouts;

type
  TfraOrcamentoCliente = class(TFrame)
    rectFundo: TRectangle;
    logoLamborhini: TImage;
    lytPrincipal: TLayout;
    lytBotoes: TLayout;
    rectVisualizarOrcamento: TRoundRect;
    Label1: TLabel;
    lstListaOrcamentos: TLayout;
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lstOrcamentos: TListView;
    lytTitulo: TLayout;
    lblTitulo: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure rectVisualizarOrcamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fraOrcamentoCliente: TfraOrcamentoCliente;

implementation

uses
  UfraOrcamentoCompletoCliente;

{$R *.fmx}

procedure TfraOrcamentoCliente.Button1Click(Sender: TObject);
var
  xItem: TListViewItem;
begin
  xItem := lstOrcamentos.Items.Add;

  TListItemText(xItem.Objects.FindDrawable('txtNumero')).Text := '12344321';
  TListItemText(xItem.Objects.FindDrawable('txtCliente')).Text := 'M�ller';
  TListItemText(xItem.Objects.FindDrawable('txtValorTotal')).Text := '600';
  TListItemText(xItem.Objects.FindDrawable('txtStatus')).Text :=
    'Aguardando aprova��o';
end;

procedure TfraOrcamentoCliente.rectVisualizarOrcamentoClick(Sender: TObject);
begin

  if lstOrcamentos.ItemIndex = -1 then
    Exit;

  if not Assigned(fraOrcamentoCompletoCliente) then
    fraOrcamentoCompletoCliente := TfraOrcamentoCompletoCliente.Create(Application);

  fraOrcamentoCompletoCliente.Align := TAlignLayout.Center;
  Self.Parent.AddObject(fraOrcamentoCompletoCliente);


end;

end.
