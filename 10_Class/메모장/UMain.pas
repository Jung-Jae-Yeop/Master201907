unit UMain;

interface

uses
  System.Win.ScktComp,Vcl.OleAuto,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Ribbon, Vcl.ActnMenus, Vcl.RibbonActnMenus,
  Vcl.RibbonActnCtrls, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.StdActns,
  Vcl.ExtActns, System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList,
  Vcl.RibbonLunaStyleActnCtrls, Vcl.Menus, Vcl.JumpList,
  Vcl.RibbonSilverStyleActnCtrls, System.Win.TaskbarCore, Vcl.Taskbar,
  Vcl.Touch.GestureMgr,Vcl.Themes, Vcl.CategoryButtons, Vcl.ButtonGroup;

type
  TAboutProc = procedure; stdcall;
  TcalcFunc<t> = function(x,y:t):t; stdcall;

  TMainForm = class(TForm)
    ActionManager1: TActionManager;
    ImageList1: TImageList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    FormatRichEditBold1: TRichEditBold;
    FormatRichEditItalic1: TRichEditItalic;
    FormatRichEditUnderline1: TRichEditUnderline;
    FormatRichEditAlignLeft1: TRichEditAlignLeft;
    FormatRichEditAlignRight1: TRichEditAlignRight;
    FormatRichEditAlignCenter1: TRichEditAlignCenter;
    FileOpen1: TFileOpen;
    FileSaveAs1: TFileSaveAs;
    FileExit1: TFileExit;
    SearchFind1: TSearchFind;
    SearchFindNext1: TSearchFindNext;
    SearchReplace1: TSearchReplace;
    SearchFindFirst1: TSearchFindFirst;
    New_Action: TAction;
    About_Action: TAction;
    Top_Action: TAction;
    Window_Action: TAction;
    Silver_Action: TAction;
    Auric_Action: TAction;
    Ribbon1: TRibbon;
    RibbonPage1: TRibbonPage;
    RibbonPage2: TRibbonPage;
    RibbonGroup1: TRibbonGroup;
    RibbonGroup2: TRibbonGroup;
    RibbonGroup3: TRibbonGroup;
    RibbonGroup4: TRibbonGroup;
    RibbonSpinEdit1: TRibbonSpinEdit;
    RibbonGroup5: TRibbonGroup;
    RibbonGroup6: TRibbonGroup;
    RibbonGroup7: TRibbonGroup;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    StatusBar1: TStatusBar;
    GridPanel1: TGridPanel;
    CategoryPanelGroup1: TCategoryPanelGroup;
    RichEdit1: TRichEdit;
    PopupMenu1: TPopupMenu;
    Open1: TMenuItem;
    SaveAs1: TMenuItem;
    New1: TMenuItem;
    N1: TMenuItem;
    About1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Exit1: TMenuItem;
    TrayIcon1: TTrayIcon;
    JumpList1: TJumpList;
    Taskbar1: TTaskbar;
    GestureManager1: TGestureManager;
    RibbonQuickAccessToolbar1: TRibbonQuickAccessToolbar;
    Timer1: TTimer;
    CategoryPanel1: TCategoryPanel;
    CategoryPanel2: TCategoryPanel;
    CategoryPanel3: TCategoryPanel;
    CategoryButtons1: TCategoryButtons;
    ButtonGroup1: TButtonGroup;
<<<<<<< HEAD
    About_dll_Action: TAction;
    Dept_Action: TAction;
    Insa_Action: TAction;
    RibbonPage3: TRibbonPage;
    RibbonGroup8: TRibbonGroup;
=======
>>>>>>> d8b010b9e3be5cdf4a778512695cdc67730e02d9
    procedure RichEdit1Gesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure Window_ActionExecute(Sender: TObject);
    procedure Silver_ActionExecute(Sender: TObject);
    procedure Auric_ActionExecute(Sender: TObject);
    procedure Top_ActionExecute(Sender: TObject);
    procedure New_ActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RibbonSpinEdit1Change(Sender: TObject);
    procedure FileOpen1BeforeExecute(Sender: TObject);
    procedure FileOpen1Accept(Sender: TObject);
    procedure FileSaveAs1BeforeExecute(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ShowHint(Sender:tobject);
    procedure About_ActionExecute(Sender: TObject);
    procedure exceptionHandler(sender:tobject; e:exception);
<<<<<<< HEAD
    procedure About_dll_ActionExecute(Sender: TObject);
    procedure Insa_ActionExecute(Sender: TObject);
=======
>>>>>>> d8b010b9e3be5cdf4a778512695cdc67730e02d9
  private
    { Private declarations }
  public
     procedure greeting(value:string);
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

<<<<<<< HEAD
uses uABOUT, UInsa;
=======
uses uABOUT;
>>>>>>> d8b010b9e3be5cdf4a778512695cdc67730e02d9
var
  curr_path:string;
  h:thandle;
  AboutProc:TAboutProc;
  calcFunc:TcalcFunc<real>;
{$R *.dfm}

<<<<<<< HEAD
procedure Display_About; stdcall;
external  'PAboutBox.dll';   //+2010 delayed


=======
>>>>>>> d8b010b9e3be5cdf4a778512695cdc67730e02d9
procedure TMainForm.About_ActionExecute(Sender: TObject);
begin
  AboutBox := TAboutBOx.create(application);
  try
    AboutBox.ShowModal;
  finally
    AboutBOx.free;
  end;
end;

<<<<<<< HEAD
procedure TMainForm.About_dll_ActionExecute(Sender: TObject);
begin
//    Display_About;

     H := LoadLibrary('PaboutBox.dll');
     if h < 32 then
        raise Exception.Create('���̺귯�� �̸��� �о�');

     AboutProc := GetProcAddress(h,'Display_About');
     AboutProc;

     calcFunc := GetProcAddress(h,'Divide');
     showmessage(floattostr(calcFunc(12.0,3.0)));

     FreeLibrary(h);
end;

=======
>>>>>>> d8b010b9e3be5cdf4a778512695cdc67730e02d9
procedure TMainForm.Auric_ActionExecute(Sender: TObject);
begin
  TStyleManager.TrySetStyle('auric');
end;

procedure TMainForm.exceptionHandler(sender: tobject; e: exception);
begin
  if e is EFopenError then
     ShowMessagE('���� ���� ����:�̸� �о� Ȯ��')
  else if e is EwriteError then
     ShowMessagE('���� ���� ����')
  else if e is EConvertError then
     ShowMessagE('������ ����')
  else if e is Einvalidcast then
     ShowMessagE('as ������  ����')
  else if e is EIntError then
     ShowMessagE('����������')
  else if e is EMathError then
     ShowMessagE('�Ǽ�������')
  else if e is Eaccessviolation then
     ShowMessagE('�＼�� ���� ����Ȯ��')
  else if e is EListError then
        ShowMessagE('÷�ڿ���')
  else if e is EOutofMemory then
     ShowMessagE('�޸𸮺���')
  else if e is EoleError then
     ShowMessagE('ms office ��ġ�Ǿ� �ִ��� Ȯ��,����')
  else if e is EsocketError then
     ShowMessagE('��ſ���')
  else if e is EinvalidPointer then
     showmessage('������ ����')
  else if e is einouterror then
     showmessage('�������ġ����')
  else application.ShowException(e);
<<<<<<< HEAD
=======




>>>>>>> d8b010b9e3be5cdf4a778512695cdc67730e02d9
end;

procedure TMainForm.FileOpen1Accept(Sender: TObject);
begin
   try
<<<<<<< HEAD
     greeting('hi');
=======
>>>>>>> d8b010b9e3be5cdf4a778512695cdc67730e02d9
     richEdit1.Lines.LoadFromFile(FileOpen1.Dialog.FileName);
   Except
      on eFopenError do
         Showmessage('�׷� ���� �����ϴ�. �н��� ���ϸ�Ȯ��');
      on eOutofMemory do
         ShowmessagE('�޸� ����');
      else showmessage('��Ÿ ����');
   end;
end;

procedure TMainForm.FileOpen1BeforeExecute(Sender: TObject);
begin
   FileOpen1.Dialog.InitialDir := curr_path;
   FileOpen1.Dialog.Filter :=
   '����Ʈ����|*.pas|�ؽ�Ʈ����|*.txt|������Ʈ����|*.dpr';
end;

procedure TMainForm.FileSaveAs1Accept(Sender: TObject);
begin
 try
   richedit1.Lines.SaveToFile(FileSaveAs1.Dialog.FileName);
 except
   on e:ewriteError do
      Showmessage(e.Message);
 end;
end;

procedure TMainForm.FileSaveAs1BeforeExecute(Sender: TObject);
begin
  FileSaveAs1.Dialog.InitialDir := curr_path;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if richEdit1.lines.text  <> ''  then
  begin
    ShowMessagE('�޸���������ð������Ͻʽÿ�');
    canclose := false;
  end;

end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  RibbonSpinEdit1.Value := RichEdit1.Font.Size;
  curr_path := ExtractFilePath(Application.ExeName);
  application.OnHint := ShowHint;
  application.OnException := exceptionHandler;
<<<<<<< HEAD
end;

procedure TMainForm.greeting(value: string);
begin
  showmessage(value);
end;

procedure TMainForm.Insa_ActionExecute(Sender: TObject);
begin
   InsaForm := TInsaForm.create(Application);
   InsaForm.Show;
=======
>>>>>>> d8b010b9e3be5cdf4a778512695cdc67730e02d9
end;

procedure TMainForm.New_ActionExecute(Sender: TObject);
begin
  RichEdit1.lines.Clear;
end;

procedure TMainForm.RibbonSpinEdit1Change(Sender: TObject);
begin
  RichEdit1.Font.Size := RibbonSpinEdit1.value;
end;

procedure TMainForm.RichEdit1Gesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  case EventInfo.GestureID of
    sgiCircle:ShowMessage('��');
    sgiSquare:ShowMessage('�簢��');
    sgiTriAngle:ShowMessage('�ﰢ��');
  end;
end;

procedure TMainForm.ShowHint(Sender: tobject);
begin
  StatusBar1.Panels[0].Text := application.Hint;
 //application.hintpause
end;

procedure TMainForm.Silver_ActionExecute(Sender: TObject);
begin
 TStyleManager.TrySetStyle('silver');
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  statusBar1.Panels[2].Text :=
  FormatDateTime('yyyy-mmmm-dd dddd hh:nn:ss ampm',now);

end;

procedure TMainForm.Top_ActionExecute(Sender: TObject);
begin
  Top_Action.Checked := not Top_Action.Checked;
  if Top_Action.Checked  then
     FormStyle := fsStayOnTop
  else
     FormStyle := fsNormal;
end;

procedure TMainForm.Window_ActionExecute(Sender: TObject);
begin
   TStyleManager.TrySetStyle('windows');
end;

end.
