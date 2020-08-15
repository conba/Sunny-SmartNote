unit uGlobalObject;

interface
uses
  uEditorCtor;

var
  FEditorCtor: TEditorCtor = nil;

  // 初始化所有全局变量
  procedure InitObjects;

  // 销毁所有全局变量
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
