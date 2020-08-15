unit uEditorCtor;

interface
uses
  uEditorIntf, Classes;

type
  TEditorCtor = class
  protected
    function DoCreateAnEditor(Editor: IEditorIntf; ParentCtrl: TComponent): Integer; virtual; abstract;
  public
    // ����һ���༭�����󲢷�������
    function CreateAnEditor(Editor: IEditorIntf; ParentCtrl: TComponent): integer;
  end;

  TMemoEditorCtro = class(TEditorCtor)
  protected
    function DoCreateAnEditor(Editor: IEditorIntf; ParentCtrl: TComponent): Integer; override;
  end;

  TRichEditorCtro = class(TEditorCtor)
  protected
    function DoCreateAnEditor(Editor: IEditorIntf; ParentCtrl: TComponent): Integer; override;
  end;

implementation
uses
  uMemoEditor, uRichEditor;
{ TEditorCtor }

function TEditorCtor.CreateAnEditor(Editor: IEditorIntf;
  ParentCtrl: TComponent): integer;
begin
  Result := DoCreateAnEditor(Editor, ParentCtrl);
  // ��� Result = 0 ˵���༭��û�д����ɹ���
//  if Result <> 0 then
//    Editor
end;

{ TMemoEditorCtro }

function TMemoEditorCtro.DoCreateAnEditor(Editor: IEditorIntf;
  ParentCtrl: TComponent): Integer;
begin
  Editor := TMemoEditor.Create(ParentCtrl);
  Result := Integer(Editor <> nil);
end;

{ TRichEditorCtro }

function TRichEditorCtro.DoCreateAnEditor(Editor: IEditorIntf;
  ParentCtrl: TComponent): Integer;
begin
  Editor := TRichEditor.Create(ParentCtrl);
  Result := Integer(Editor <> nil);
end;

end.
