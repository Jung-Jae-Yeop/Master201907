unit VariableDllUnit;

interface

procedure InitDataDll;
function AddNumDll(ANum: Integer): Integer;
function SubNumDll(ANum: Integer): Integer;

implementation


var
  Num: Integer;

procedure InitDataDll;
begin
  Num := 0;
end;

{ TODO : ������ Num ������ ANum�� ���� ���� ��ȯ�Ͻÿ�. �ش� ���� �����Ǿ�� �� }
function AddNumDll(ANum: Integer): Integer;
begin
  Result := 0;
end;

{ TODO : ������ Num ������ ANum�� �� ���� ��ȯ�Ͻÿ�. �ش� ���� �����Ǿ�� �� }
function SubNumDll(ANum: Integer): Integer;
begin
  Result := 0;
end;


end.
