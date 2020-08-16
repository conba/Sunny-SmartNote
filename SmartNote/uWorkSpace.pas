unit uWorkSpace;

interface
uses
  uWorkSpaceIntf, uEditorBase, Classes, Graphics, StdCtrls, Dialogs, uEditorIntf;

type
  TWorkSpace = class(TInterfacedObject, IWorkSpaceIntf)
  private
    // ������Ϊ�༭���Ĵ���
    FEditor: TEditorBase;
    FIndex: Integer;
  protected
    // ��ȡ����
    function GetIndex: Integer;
    // ���ü���
    procedure SetActive;
    procedure OnSave(); virtual; abstract;
  public
    constructor Create(ParentControl: TComponent; Index: Integer; FileName: string);
    function Close(): Integer;
    function GetFileName: string;
    function GetSaved: Boolean;
    function Save: Boolean;
    function SaveAs: Boolean;
    function GetSelectText: String;
    function CanUndo: Boolean;
    procedure Undo;
    function CanRedo: Boolean;
    procedure Redo;
    function CanCopy: Boolean;
    procedure Copy;
    function CanCut: Boolean;
    procedure Cut;
    function CanPaster: Boolean;
    procedure Paster;
    function CanDeleteSelection: Boolean;
    procedure DelectSelection;
    procedure SetFont(Font: TFont);
    function FindNext(Text: String; Option: TFindOptions): Boolean;
    function Replace(FindText, ReplaceText: String; Option: TFindOptions): Integer;
    function GetWordCount: TWordCount;
    function GetWordWarp: Boolean;  // �Ƿ����
    procedure SetWordWarp(bWordWarp: Boolean);
    procedure SelectAll;
  end;
implementation
uses
  uGlobalObject;
{ TWorkSpace }

function TWorkSpace.CanCopy: Boolean;
begin
  Result := FEditor.CanCopy;
end;

function TWorkSpace.CanCut: Boolean;
begin
  Result := FEditor.CanCut;
end;

function TWorkSpace.CanDeleteSelection: Boolean;
begin
  Result := FEditor.CanDeleteSelection;
end;

function TWorkSpace.CanPaster: Boolean;
begin
  Result := FEditor.CanPaster;
end;

function TWorkSpace.CanRedo: Boolean;
begin
  Result := FEditor.CanRedo;
end;

function TWorkSpace.CanUndo: Boolean;
begin
  Result := FEditor.CanUndo;
end;

function TWorkSpace.Close: Integer;
begin
  // �жϹ������Ƿ��޸�
  if FEditor.GetSaved then
    FEditor.Save;
end;

procedure TWorkSpace.Copy;
begin
  FEditor.Copy;
end;

constructor TWorkSpace.Create(ParentControl: TComponent; Index: Integer;
  FileName: string);
begin
  {���� FEditor ��û�����������û�а취ʹ�ø���������FEditor����
   Ϊ�˿��Դ�����ͬ�� �༭����� ������Ҫʹ��һ��  ������  ��}
  FEditorCtor.CreateAnEditor(FEditor, ParentControl);
  if Assigned(FEditor) then
  begin
    FEditor.LoadFormFile(FileName);
    FIndex := Index;
  end;
end;

procedure TWorkSpace.Cut;
begin
  FEditor.Cut;
end;

procedure TWorkSpace.DelectSelection;
begin
  FEditor.DelectSelection;
end;

function TWorkSpace.FindNext(Text: String; Option: TFindOptions): Boolean;
begin
  FEditor.FindNext(Text, Option);
end;

function TWorkSpace.GetFileName: string;
begin
  Result := FEditor.GetFileName;
end;

function TWorkSpace.GetIndex: Integer;
begin
  Result := FIndex;
end;

function TWorkSpace.GetSaved: Boolean;
begin
  Result := FEditor.GetSaved;
end;

function TWorkSpace.GetSelectText: String;
begin
  Result := FEditor.GetSelectText;
end;

function TWorkSpace.GetWordCount: TWordCount;
begin
  Result := FEditor.GetWordCount;
end;

function TWorkSpace.GetWordWarp: Boolean;
begin
  Result := FEditor.GetWordWarp;
end;

procedure TWorkSpace.Paster;
begin
  FEditor.Paster;
end;

procedure TWorkSpace.Redo;
begin
  FEditor.Redo;
end;

function TWorkSpace.Replace(FindText, ReplaceText: String;
  Option: TFindOptions): Integer;
begin
  FEditor.Replace(FindText, ReplaceText, Option);
end;

function TWorkSpace.Save: Boolean;
begin
  FEditor.Save;
  OnSave();
end;

function TWorkSpace.SaveAs: Boolean;
begin
  FEditor.Save;
  OnSave();
end;

procedure TWorkSpace.SelectAll;
begin
  FEditor.SelectAll;
end;

procedure TWorkSpace.SetActive;
begin

end;

procedure TWorkSpace.SetFont(Font: TFont);
begin
  FEditor.SetFont(Font);
end;

procedure TWorkSpace.SetWordWarp(bWordWarp: Boolean);
begin
  FEditor.SetWordWarp(bWordWarp);
end;

procedure TWorkSpace.Undo;
begin
  FEditor.Undo;
end;

end.
