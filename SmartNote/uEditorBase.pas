unit uEditorBase;

interface
uses
  uEditorIntf, Classes, SysUtils, Dialogs, Graphics;

type
  // 这个类的功能主要是对要操作的文件进行控制。
  TEditorBase = class(TInterfacedObject, IEditorIntf)
  private
    FFileName: string;
  protected
    procedure DoLoadFromFile(FileName: string); virtual; abstract;
    function DoSaveFile(FileName: string): Boolean; virtual; abstract;
    function GetSaved: Boolean; virtual; abstract;
    function Save: Boolean; virtual;
    function SaveAs: Boolean; virtual;
    function GetSelectText: String; virtual; abstract;
    function CanUndo: Boolean; virtual; abstract;
    procedure Undo; virtual; abstract;
    function CanRedo: Boolean; virtual; abstract;
    procedure Redo; virtual; abstract;
    function CanCopy: Boolean; virtual; abstract;
    procedure Copy; virtual; abstract;
    function CanCut: Boolean; virtual; abstract;
    procedure Cut; virtual; abstract;
    function CanPaster: Boolean; virtual; abstract;
    procedure Paster; virtual; abstract;
    function CanDeleteSelection: Boolean; virtual; abstract;
    procedure DelectSelection; virtual; abstract;
    procedure SetFont(Font: TFont); virtual; abstract;
    function FindNext(Text: String; Option: TFindOptions): Boolean; virtual; abstract;
    function Replace(FindText, ReplaceText: String; Option: TFindOptions): Integer; virtual; abstract;
    function GetWordWarp: Boolean; virtual; abstract; // 是否分行
    procedure SetWordWarp(WordWarp: Boolean); virtual; abstract;
    function GetText: string; virtual; abstract;
  public
    procedure LoadFormFile(FileName: string);
    function GetFileName: string;
    function GetWordCount: Integer; virtual;
//    property FileName: string read FFileName;
  end;

implementation


{ TEditorBase }

function TEditorBase.GetFileName: string;
begin
  Result := FFileName;
end;

function TEditorBase.GetWordCount: Integer;
var
  TextStr: string;
begin
  TextStr := GetText;
  if True then

end;

procedure TEditorBase.LoadFormFile(FileName: string);
begin
  FFileName := FileName;
  if FFileName <> EmptyStr then
    DoLoadFromFile(FFileName);
end;

function TEditorBase.Save: Boolean;
begin
  if FFileName = EmptyStr then
  begin
    Result := SaveAs;
    Exit;
  end;

  Result := DoSaveFile(FFileName);

end;

function TEditorBase.SaveAs: Boolean;
var
  FSaveDlg: TSaveDialog;
begin
  Result := False;
  FSaveDlg := TSaveDialog.Create(nil);
  try
    FSaveDlg.Options := [ofOverwritePrompt, ofHideReadOnly];
    if FSaveDlg.Execute() then
      Result := DoSaveFile(FSaveDlg.FileName);
  finally
    FSaveDlg.Free;
    FSaveDlg := nil;
  end;
end;

end.
