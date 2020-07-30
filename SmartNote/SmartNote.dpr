program SmartNote;

uses
  ExceptionLog,
  Forms,
  MainForm in 'MainForm.pas' {Form13},
  uEditorIntf in 'uEditorIntf.pas',
  uEditorBase in 'uEditorBase.pas',
  uMemoEditor in 'uMemoEditor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm13, Form13);
  Application.Run;
end.
