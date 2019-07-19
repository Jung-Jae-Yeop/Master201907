unit ConditionForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmCondition = class(TForm)
    edtId: TEdit;
    edtPwd: TEdit;
    btnLogin: TButton;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    btnCheckLoadDB: TButton;
    procedure btnLoginClick(Sender: TObject);
    procedure btnCheckLoadDBClick(Sender: TObject);
  private
    FIds: array of string;
    FPwds: array of string;

    function CheckEmpty(AId, APwd: string): Boolean;
    function CheckIncorrect(AId, APwd: string): Boolean;
  public
    { Public declarations }
    function LoginCheck(AId, APwd: string): Integer;
    function CheckLoadDB: Boolean;
  end;

var
  frmCondition: TfrmCondition;

const
  LOGIN_RESULT_OK           = 0;
  LOGIN_RESULT_INCORRECT    = 10;
  LOGIN_RESULT_EMPTY        = 20;

implementation

{$R *.dfm}

uses ConditionModule;

{ TForm2 }

{ TODO :
  (1) �����͸���� FDConnection���� ���� DB(DB ���丮�� TEST2DB.IB)�� �����ϼ���.
    - DRIVE ID�� �����ؼ� �����ϼ���.
  (2) ����� ����� DBGrid1�� ǥ���ϼ���.
    - qryUser(TFDQuery)�� SQL �Է�(SELECT * FROM USER_INFO)
    - DB�׸��忡 �����͸� ǥ���ϱ� ���� ������Ʈ�� �Ӽ��� ���� �����ϼ���.
}
function TfrmCondition.CheckLoadDB: Boolean;
begin
  Result := False;

  if not dmDB.FDConnection1.Connected then
    Exit;

  if not Assigned(DBGrid1.DataSource) then
    Exit;

  if not Assigned(DBGrid1.DataSource.DataSet) then
    Exit;

  try
    DBGrid1.DataSource.DataSet.Open;
  except
    Exit;
  end;

  if DBGrid1.Columns.Count <= 1 then
    Exit;

  if not DBGrid1.DataSource.DataSet.Active then
    Exit;

  if DBGrid1.DataSource.DataSet.RecordCount = 0 then
    Exit;

  Result := True;
end;

function TfrmCondition.CheckEmpty(AId, APwd: string): Boolean;
begin
  { TODO : ���̵�� ��й�ȣ�� ����(����) ��� False ��ȯ }
  Result := True;
end;

function TfrmCondition.CheckIncorrect(AId, APwd: string): Boolean;
begin
  if not dmDB.FDConnection1.Connected then
    Exit;
{ TODO :
  ���̵�� ��й�ȣ�� ���� �ʴ� ��� False ��ȯ �ϵ��� �ϼ��ϼ���.
   - �����͸���� qryLogin �̿��մϴ�.
   ------------
    SELECT * FROM USER_INFO
    WHERE USER_ID = :P_USER_ID
    AND USER_PWD = :P_USER_PWD
   ------------
   - �Ķ���� �� �Ҵ� �� ID�� ��й�ȣ�� �������� �˻��մϴ�.
}
  dmDB.qryLogin.Close;
//  dmDB.qryLogin.ParamByName('P_USER_ID')..................
//  dmDB.qryLogin.ParamByName('P_USER_PWD')..................
  dmDB.qryLogin.Open;
  Result := (dmDB.qryLogin.RecordCount > 0);
end;

function TfrmCondition.LoginCheck(AId, APwd: string): Integer;
begin
  Result := -1;

  // ���̵� �Ǵ� ��й�ȣ�� ������ ��� 20 ��ȯ
  if not CheckEmpty(AId, APwd) then
    Exit(LOGIN_RESULT_EMPTY);

  // ���̵��� ��й�ȣ�� ���� �ʴ� ��� 10 ��ȯ
  if not CheckIncorrect(AId, APwd) then
    Exit(LOGIN_RESULT_INCORRECT);

  // ���̵� ��й�ȣ�� ��ȿ�� ��� 0 ��ȯ
end;

procedure TfrmCondition.btnCheckLoadDBClick(Sender: TObject);
begin
  if CheckLoadDB then
    ShowMessage('�����Ͱ� �ε�Ǿ����ϴ�.')
  else
    ShowMessage('�����Ͱ� �ε���� �ʾҽ��ϴ�.');
end;

procedure TfrmCondition.btnLoginClick(Sender: TObject);
var
  LoginResult: Integer;
begin
  LoginResult := LoginCheck(edtId.Text, edtPwd.Text);

  if LoginResult > 0 then
  begin
    case LoginResult of
    LOGIN_RESULT_INCORRECT:   ShowMessage('���̵� �Ǵ� ��й�ȣ�� ���� �ʽ��ϴ�.');
    LOGIN_RESULT_EMPTY:       ShowMessage('���̵�� ��й�ȣ�� �Է��ϼ���.');
    end;
    Exit;
  end;

  ShowMessage('�α��� ����');
end;

end.
