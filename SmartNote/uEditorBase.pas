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
    // 获取所有文本
    function GetText: string; virtual; abstract;
  public
    procedure LoadFormFile(FileName: string);
    function GetFileName: string;
    function GetWordCount: TWordCount;
    function GetWordWarp: Boolean; virtual; abstract; // 是否分行
    procedure SetWordWarp(WordWarp: Boolean); virtual; abstract;
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
    function Save: Boolean; virtual;
    function SaveAs: Boolean; virtual;
    procedure SelectAll; virtual;
    // 在保存的时候判断该文件是否已修改
    function GetSaved: Boolean; virtual; abstract;
    function GetSelectText: String; virtual; abstract;
    //  这里构建方法不属于这里，但是如果没有构建方法就不能够直接使用
    // 该类直接创建  编辑器  对象。
//    constructor Create(AOwner: TComponent); override;
//    property FileName: string read FFileName;
  end;

implementation


{ TEditorBase }

//constructor TEditorBase.Create(AOwner: TComponent);
//begin
//  inherited;
//
//end;

function TEditorBase.GetFileName: string;
begin
  Result := FFileName;
end;

function TEditorBase.GetWordCount: TWordCount;
var
  TextStr: string;
  I: Integer;
  bHalf : Boolean;
  nAsc: Integer;
begin
  TextStr := GetText();
  for I := 1 to Length(TextStr) do
  begin
    nAsc := ord(TextStr[I]);

    if bHalf then
    begin
      bHalf := false;
      nAsc := 0;
    end;

    if nAsc > 127 then
    begin //chinese
      if not bHalf then
        Inc(Result.MultiChar);
      bHalf := not bHalf;
    end
    else if (nAsc >= 48) and (nAsc <= 57) then
      Inc(Result.NumChar)
    else if (nAsc >= 65) and (nAsc <= 90) then
      Inc(Result.AnsiChar)
    else if (nAsc >= 97) and (nAsc <= 122) then
      Inc(Result.AnsiChar)
    else if (nAsc <> 32) and (nAsc <> 0) and (nAsc <> 13) and (nAsc <> 10) then
      Inc(Result.Other);
  end;
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

procedure TEditorBase.SelectAll;
begin

end;

end.
