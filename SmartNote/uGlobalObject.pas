unit uGlobalObject;

interface
uses
  uEditorCtor;

var
  FEditorCtor: TEditorCtor = nil;

  // ��ʼ������ȫ�ֱ���
  procedure InitObjects;

  // ��������ȫ�ֱ���
  procedure UnInitObjects;

implementation

procedure InitObjects;
begin
  FEditorCtor := TMemoEditorCtro.create;
end;

procedure UnInitObjects;
begin
  FEditorCtor.free;
  FEditorCtor := nil;
end;

end.
