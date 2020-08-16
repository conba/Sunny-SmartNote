unit uMemoEditor;

interface
uses
  uEditorBase, Classes, SysUtils, StdCtrls, Controls, Graphics, Dialogs;

type
  TMemoEditor = Class(TEditorBase)
  private
    FMemo: TMemo;
  protected
    procedure DoLoadFromFile(FileName: string); override;
    function DoSaveFile(FileName: string): Boolean; override;
    // 判断是否需要保存，通过当前编辑器的状态来判断
    // 如果编辑其状态处于编辑状态，那么就需要保存，否则就处于已保存状态。
    function GetSaved: Boolean; override;
    function GetText: string; override;
  public
    constructor Create(ParentComponent: TComponent);
    destructor Destroy; override;
    function GetWordWarp: Boolean; override; // 是否分行
    procedure SetWordWarp(WordWarp: Boolean); override;
    function CanUndo: Boolean; override;
    procedure Undo; override;
    function CanRedo: Boolean; override;
    procedure Redo; override;
    function CanCopy: Boolean; override;
    procedure Copy; override;
    function CanCut: Boolean; override;
    procedure Cut; override;
    function CanPaster: Boolean; override;
    procedure Paster; override;
    function CanDeleteSelection: Boolean; override;
    procedure DelectSelection; override;
    procedure SetFont(Font: TFont); override;
    function FindNext(Text: String; Option: TFindOptions): Boolean; override;
    function Replace(FindText, ReplaceText: String; Option: TFindOptions): Integer; override;
    // 获得Memo中选中的文本
    function GetSelectText: String; override;
    // 全选
    procedure SelectAll; override;
  End;

implementation

{ TMemoEditor }

function TMemoEditor.CanCopy: Boolean;
begin
  Result := FMemo.SelLength <> 0;
end;

function TMemoEditor.CanCut: Boolean;
begin
  Result := FMemo.SelLength <> 0;
end;

function TMemoEditor.CanDeleteSelection: Boolean;
begin
  Result := FMemo.SelLength <> 0;
end;

function TMemoEditor.CanPaster: Boolean;
begin
  Result := True;
end;

function TMemoEditor.CanRedo: Boolean;
begin
  Result := True;
end;

function TMemoEditor.CanUndo: Boolean;
begin
  Result := True;
end;

procedure TMemoEditor.Copy;
begin
  FMemo.CopyToClipboard;
end;

constructor TMemoEditor.Create(ParentComponent: TComponent);
begin
  FMemo := TMemo.Create(nil);
  FMemo.Parent := TWinControl(ParentComponent);
  FMemo.Align := alclient;
  FMemo.Enabled := True;
  FMemo.WordWrap := False;
  FMemo.ScrollBars := ssBoth;
  if FMemo.CanFocus then
    FMemo.SetFocus;
end;

procedure TMemoEditor.Cut;
begin
  FMemo.CutToClipboard;
end;

procedure TMemoEditor.DelectSelection;
begin
  FMemo.ClearSelection;
end;

destructor TMemoEditor.Destroy;
begin
  FMemo.Free;
  FMemo := nil;
  inherited;
end;

procedure TMemoEditor.DoLoadFromFile(FileName: string);
begin
  FMemo.Lines.LoadFromFile(FileName);
end;

function TMemoEditor.DoSaveFile(FileName: string): Boolean;
begin
  FMemo.Lines.SaveToFile(FileName);
end;

function TMemoEditor.FindNext(Text: String; Option: TFindOptions): Boolean;
var
  TextStr: string;
  iPosition: Integer;
  iLastPos: Integer;
begin
  Result := False;
  // 向上或者向下查找
  if frDown in Option then
    TextStr := System.Copy(FMemo.Text, FMemo.SelStart + FMemo.SelLength + 1,
      Length(FMemo.Text))
  else
    TextStr := System.Copy(FMemo.Text, 0, FMemo.SelStart);

  // 大小写是否匹配
  if frMatchCase in Option then
  begin
    TextStr := UpperCase(TextStr);
    Text := UpperCase(Text);
  end;

  if frDown in Option then
  begin
    iPosition := Pos(TextStr, Text);
    if iPosition = 0 then
      Exit;

    FMemo.SelStart := FMemo.SelStart + FMemo.SelLength + iPosition;
  end
  else
  begin
    iLastPos := 0;
    repeat
      iPosition := Pos(TextStr, Text);
      if iPosition <> 0 then
      begin
        TextStr := System.Copy(TextStr, iPosition, Length(TextStr));
        iLastPos := iLastPos + iPosition;
      end;
    until iPosition = 0;
    if iLastPos = 0 then
      Exit;
    FMemo.SelStart := iLastPos;
  end;


end;

function TMemoEditor.GetSaved: Boolean;
begin
  Result := FMemo.Modified;
end;

function TMemoEditor.GetSelectText: String;
begin
  Result := FMemo.SelText;
end;

function TMemoEditor.GetText: string;
begin
  Result := FMemo.Lines.Text;
end;

function TMemoEditor.GetWordWarp: Boolean;
begin
  Result := FMemo.WordWrap;
end;

procedure TMemoEditor.Paster;
begin
  FMemo.PasteFromClipboard;
end;

procedure TMemoEditor.Redo;
begin
  FMemo.Undo;
end;

function TMemoEditor.Replace(FindText, ReplaceText: String;
  Option: TFindOptions): Integer;
begin

end;

procedure TMemoEditor.SelectAll;
begin
  FMemo.SelectAll;
end;

procedure TMemoEditor.SetFont(Font: TFont);
begin
  FMemo.Font := Font;
end;

procedure TMemoEditor.SetWordWarp(WordWarp: Boolean);
begin
  FMemo.WordWrap := WordWarp;
  if WordWarp  then
    FMemo.ScrollBars := ssVertical
  else
    FMemo.ScrollBars := ssBoth;
end;

procedure TMemoEditor.Undo;
begin
  FMemo.Undo;
end;

end.
