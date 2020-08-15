program SmartNote;

uses
  Forms,
  MainForm in 'MainForm.pas' {Form13},
  uEditorIntf in 'uEditorIntf.pas',
  uEditorBase in 'uEditorBase.pas',
  uMemoEditor in 'uMemoEditor.pas',
  uRichEditor in 'uRichEditor.pas',
  uTabWorkSpace in 'uTabWorkSpace.pas',
  uWorkSpace in 'uWorkSpace.pas',
  uWorkSpaceIntf in 'uWorkSpaceIntf.pas',
  uWorkSpaceMgr in 'uWorkSpaceMgr.pas',
  uEditorCtor in 'uEditorCtor.pas',
  uGlobalObject in 'uGlobalObject.pas',
  uConstFile in 'uConstFile.pas';

{$R *.res}

begin
  Application.Initialize;
  InitObjects;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
