unit uEditorCtor;

interface
uses
  uEditorIntf, Classes;

type
  TEditorCtor = class
  protected
    function DoCreateAnEditor(Editor: IEditorIntf; ParentCtrl: TComponent): Integer; virtual; abstract;
  public
    // 创建一个编辑器对象并返回索引
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
  // 如果 Result = 0 说明编辑器没有创建成功。
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
