unit LoopForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.DBXDataSnap,
  Data.DBXCommon, IPPeerClient, Datasnap.DBClient, Datasnap.DSConnect,
  Data.SqlExpr, Vcl.Grids, Vcl.DBGrids;

type
  TfrmLoop = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtStartNum: TEdit;
    btnOddCount: TButton;
    edtEndNum: TEdit;
    DBGrid1: TDBGrid;
    btnCheckLoadData: TButton;
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    procedure btnOddCountClick(Sender: TObject);
    procedure btnCheckLoadDataClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function CalcOddNumSum(AStartNum, AEndNum: Integer): Integer;
    function CheckLoadData: Boolean;
  end;

var
  frmLoop: TfrmLoop;

implementation

{$R *.dfm}

uses ServerMethodClient;

{ TfrmLoop }

function TfrmLoop.CheckLoadData: Boolean;
begin
{
  TODO : DataSnap�� ���� ����� ������ DBGrid1�� ǥ���ϼ���.
    (1) LoopTestDataSnap ������Ʈ�� �ϼ��ϼ���.
    (2) �� ������Ʈ�� ���� �� �����ϼ���
     - SQLConnection1, DSProviderConnection1, ClientDataSet1 �Ӽ� ����
}
  Result := False;

  if not SQLConnection1.Connected then
    Exit;

  if DBGrid1.Columns.Count <= 1 then
    Exit;

  if not Assigned(DBGrid1.DataSource) then
    Exit;

  if not Assigned(DBGrid1.DataSource.DataSet) then
    Exit;

  if not DBGrid1.DataSource.DataSet.Active then
    Exit;

  if DBGrid1.DataSource.DataSet.RecordCount = 0 then
    Exit;

  Result := True;
end;

function TfrmLoop.CalcOddNumSum(AStartNum, AEndNum: Integer): Integer;
var
  Method: TServerMethods1Client;
begin
  if not SQLConnection1.Connected then
    Exit;
{
  TODO : �����޼ҵ带 ȣ���ϴ� �ڵ� Ŭ���̾�Ʈ �� �ڵ尡 �ϼ��Ǿ����ϴ�.
         �������� �����޼ҵ� �ڵ带 �ϼ��Ͻÿ�.

  (����) �����޼ҵ� ȣ�� ����
    (1) �������� �����޼ҵ� ����
    (2) ������ ����(TSQLConnection)
    (3) �����޼ҵ� Ŭ���̾�Ʈ ����(�ҽ�) ����(TSQLConnection > �˾��޴� > Generate Datasnap client classes
    (4) ������ ������ Ŭ������ �̿� �����޼ҵ� ȣ��
}
  Method := TServerMethods1Client.Create(SQLConnection1.DBXConnection);
  Result := Method.CalcOddNumSum(AStartNum, AEndNum);
  Method.Free;
end;

procedure TfrmLoop.btnOddCountClick(Sender: TObject);
var
  StartNum, EndNum: Integer;
  Count: Integer;
begin
  StartNum := StrToIntDef(edtStartNum.Text, 0);
  EndNum   := StrToIntDef(edtEndNum.Text, 0);

  Count := CalcOddNumSum(StartNum, EndNum);

  ShowMessage(Format('�� �� ���� Ȧ���� ���� [%d] �Դϴ�.', [Count]));
end;

procedure TfrmLoop.btnCheckLoadDataClick(Sender: TObject);
begin
  if CheckLoadData then
    ShowMessage('�����Ͱ� �ε�Ǿ����ϴ�.')
  else
    ShowMessage('�����Ͱ� �ε���� �ʾҽ��ϴ�.');
end;

end.
