unit DelphiToHero.View.Pages.Usuarios;

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
  DelphiToHero.View.Pages.Form.Template,
  Vcl.ExtCtrls,
  Bind4D,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Buttons,
  Vcl.StdCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,Bind4D.Attributes,Bind4D.Types,
  Vcl.WinXPanels,
  DelphiToHero.View.Styles.Colors;

type
  [FormRest('/users', 'guuid', 'name', 'asc')]
  [FormDefault('Cadastro de Usuários')]
  TPageUsuarios = class(TFormTemplate)
    StackPanel1: TStackPanel;
  [ComponentBindStyle(clBtnFace, FONT_H5, FONT_COLOR3, FONT_NAME)]
    Label1: TLabel;

  [FieldJsonBind('guuid'),FbIgnorePut, FbIgnorePost]
  [FieldDataSetBind('guuid', ftString, False, 0, 'Código')]
  [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, COLOR_BACKGROUND_TOP, FONT_NAME)]
    edtCodigo: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PageUsuarios: TPageUsuarios;

implementation

{$R *.dfm}

end.
