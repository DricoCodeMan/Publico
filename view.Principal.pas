unit view.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin, FireDAC.Stan.StorageXML,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.StorageJSON;

type
  TviewPrincipal = class(TForm)
    FDMemTable1: TFDMemTable;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  viewPrincipal: TviewPrincipal;

implementation

{$R *.dfm}

procedure TviewPrincipal.Button1Click(Sender: TObject);
var
  str : TStringStream;
begin
  str := TStringStream.Create;
  try
    FDMemTable1.SaveToStream(str, sfJSON);
    FDMemTable1.EmptyDataSet;
    Memo1.Lines.Text := str.DataString;
  finally
    str.Free;
  end;
end;

procedure TviewPrincipal.Button2Click(Sender: TObject);
var
  str : TStringStream;
begin
  str := TStringStream.Create(Memo1.Lines.Text);
  try
    FDMemTable1.LoadFromStream(str, sfJSON);
  finally
    str.Free;
  end;
end;

end.
