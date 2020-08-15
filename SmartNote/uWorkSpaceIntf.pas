unit uWorkSpaceIntf;

interface
uses
  uEditorIntf;

type
  IWorkSpaceIntf = interface(IEditorIntf)
    // 获取索引
    function GetIndex: Integer;
    // 设置激活
    procedure SetActive;
    // 保存
    procedure OnSave();
  end;

implementation

end.
