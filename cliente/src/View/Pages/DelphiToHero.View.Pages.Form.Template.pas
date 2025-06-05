unit DelphiToHero.View.Pages.Form.Template;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Router4D.Interfaces,
  Vcl.StdCtrls,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Buttons,
  Data.DB,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Grids,
  Vcl.DBGrids,
  Bind4D,
  DelphiToHero.View.Styles.Colors,
  RESTRequest4D, Vcl.WinXPanels;

type
  TFormTemplate = class(TForm, iRouter4DComponent)

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlPrincipal: TPanel;

    [ComponentBindStyle(COLOR_C1, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlTop: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlMain: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlMainBody: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlMainBodyData: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlMainBodyTop: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlMainBodyDataForm: TPanel;

    [ComponentBindStyle(COLOR_C2, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlMainBodyTopLine: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlMainTopBodyMenu: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlMainTopBodySearch: TPanel;

    [ComponentBindStyle(COLOR_BACKGROUND_TOP, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlMainTopBodySearchLine: TPanel;

    [ComponentBindStyle(COLOR_C1, FONT_H5, FONT_COLOR3, FONT_NAME)]
    pnlTopBody: TPanel;

    [ComponentBindStyle(clBtnFace, FONT_H5, FONT_COLOR3, FONT_NAME)]
    lblTitle: TLabel;

    [ComponentBindStyle(clBtnFace, FONT_H6, COLOR_BACKGROUND_TOP, FONT_NAME)]
    lblSearch: TLabel;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, COLOR_BACKGROUND_TOP, FONT_NAME)]
    edtSearch: TEdit;

    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, FONT_COLOR4, FONT_NAME)]
    DBGrid1: TDBGrid;

    [ComponentBindStyle(clBtnFace, FONT_H7, FONT_COLOR3, FONT_NAME)]
    SpeedButton1: TSpeedButton;

    [ComponentBindStyle(clBtnFace, FONT_H7, FONT_COLOR3, FONT_NAME)]
    SpeedButton2: TSpeedButton;

    [ComponentBindStyle(clBtnFace, FONT_H7, FONT_COLOR3, FONT_NAME)]
    SpeedButton3: TSpeedButton;

    [ComponentBindStyle(clBtnFace, FONT_H7, FONT_COLOR3, FONT_NAME)]
    SpeedButton4: TSpeedButton;

    [ComponentBindStyle(clBtnFace, FONT_H7, FONT_COLOR3, FONT_NAME)]
    SpeedButton5: TSpeedButton;
    ImageList1: TImageList;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    pnlMainCadastroBotton: TPanel;
    btnFechar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnExcluir: TSpeedButton;
    pnlMainCadastroBottonLine: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
    FEndPoint : String;
    FPK : String;
    FTitle : String;
    FSort, FOrder : String;
    procedure ApplyStyle;
    procedure GetEndPoint;
    procedure alterListForm;
    procedure formatList;
  public
    { Public declarations }
    function Render : TForm;
    procedure UnRender;
  end;

var
  FormTemplate: TFormTemplate;

implementation

uses
  System.JSON;

{$R *.dfm}

{ TFormTemplate }

procedure TFormTemplate.ApplyStyle;
begin
  lblTitle.Caption := FTitle;
  pnlMainBodyDataForm.Visible := False;
  pnlMainBodyDataForm.Align := TAlign.alClient;

  DBGrid1.TitleFont.Size := FONT_H5;
  DBGrid1.TitleFont.Name := 'Segoe UI';
  DBGrid1.TitleFont.Color := FONT_COLOR4;
end;

procedure TFormTemplate.btnFecharClick(Sender: TObject);
begin
  alterListForm;
end;

procedure TFormTemplate.DBGrid1DblClick(Sender: TObject);
begin
  TBind4D.New.Form(Self).BindDataSetToForm(FDMemTable1);
  alterListForm;
end;

procedure TFormTemplate.FormCreate(Sender: TObject);
begin
  TBind4D
    .New
      .Form(Self)
      .BindFormDefault(FTitle)
      .BindFormRest(FEndPoint, FPK, FSort, FOrder)
      .SetStyleComponents;
  ApplyStyle;
end;

procedure TFormTemplate.FormResize(Sender: TObject);
begin
  GetEndPoint;
end;

procedure TFormTemplate.GetEndPoint;
begin
  TRequest.New.BaseURL('http://localhost:9000/' + FEndPoint)
    .Accept('application/json')
    .DataSetAdapter(FDMemTable1)
    .Get;
end;

function TFormTemplate.Render: TForm;
begin
  Result := Self;
end;

procedure TFormTemplate.SpeedButton5Click(Sender: TObject);
begin
  alterListForm;
  TBind4D.New.Form(Self).ClearFieldForm;
end;

procedure TFormTemplate.UnRender;
begin
  //
end;

procedure TFormTemplate.formatList;
begin
  TBind4D.New.Form(Self).BindFormatListDataSet(FDMemTable1, DBGrid1);
end;

procedure TFormTemplate.alterListForm;
begin
  pnlMainBodyDataForm.Visible := not pnlMainBodyDataForm.Visible;
  DBGrid1.Visible := not DBGrid1.Visible;
end;

end.
