unit uWorkSpaceIntf;

interface
uses
  uEditorIntf;

type
  IWorkSpaceIntf = interface(IEditorIntf)
    // ��ȡ����
    function GetIndex: Integer;
    // ���ü���
    procedure SetActive;
    // ����
    procedure OnSave();
  end;

implementation

end.
