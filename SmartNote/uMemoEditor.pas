unit uMemoEditor;

interface
uses
  uEditorBase, Classes, SysUtils, StdCtrls;

type
  TMemoEditor = Class(TEditorBase)
  private
    FMemo: TMemo;
  protected
    procedure DoLoadFromFile(FileName: string); virtual;
    function DoSaveFile(FileName: string): Boolean; virtual;
    function GetSaved: Boolean; virtual;
    function GetSelectText: String; virtual;
    function CanUndo: Boolean; virtual;
    procedure Undo; virtual;
    function CanRedo: Boolean; virtual;
    procedure Redo; virtual;
    function CanCopy: Boolean; virtual;
    procedure Copy; virtual;
    function CanCut: Boolean; virtual;
    procedure Cut; virtual;
    function CanPaster: Boolean; virtual;
    procedure Paster; virtual;
    function CanDeleteSelection: Boolean; virtual;
    procedure DelectSelection; virtual;
    procedure SetFont(Font: TFont); virtual;
    function FindNext(Text: String; Option: TFindOptions): Boolean; virtual;
    function Replace(FindText, ReplaceText: String; Option: TFindOptions): Integer; virtual;
    function GetWordCount: Integer; virtual;
    function GetWordWarp: Boolean; virtual; // ÊÇ·ñ·ÖÐÐ
    procedure SetWordWarp(WordWarp: Boolean); virtual;
  public
    constructor Create(ParentComponent: TComponent);
    destructor Destroy; override;
  End;

implementation

{ TMemoEditor }

function TMemoEditor.CanCopy: Boolean;
begin
//  Result :=
end;

function TMemoEditor.CanCut: Boolean;
begin

end;

function TMemoEditor.CanDeleteSelection: Boolean;
begin

end;

function TMemoEditor.CanPaster: Boolean;
begin

end;

function TMemoEditor.CanRedo: Boolean;
begin

end;

function TMemoEditor.CanUndo: Boolean;
begin

end;

procedure TMemoEditor.Copy;
begin

end;

constructor TMemoEditor.Create(ParentComponent: TComponent);
begin

end;

procedure TMemoEditor.Cut;
begin

end;

procedure TMemoEditor.DelectSelection;
begin

end;

destructor TMemoEditor.Destroy;
begin

  inherited;
end;

procedure TMemoEditor.DoLoadFromFile(FileName: string);
begin

end;

function TMemoEditor.DoSaveFile(FileName: string): Boolean;
begin

end;

function TMemoEditor.FindNext(Text: String; Option: TFindOptions): Boolean;
begin

end;

function TMemoEditor.GetSaved: Boolean;
begin

end;

function TMemoEditor.GetSelectText: String;
begin

end;

function TMemoEditor.GetWordCount: Integer;
begin

end;

function TMemoEditor.GetWordWarp: Boolean;
begin

end;

procedure TMemoEditor.Paster;
begin

end;

procedure TMemoEditor.Redo;
begin

end;

function TMemoEditor.Replace(FindText, ReplaceText: String;
  Option: TFindOptions): Integer;
begin

end;

procedure TMemoEditor.SetFont(Font: TFont);
begin

end;

procedure TMemoEditor.SetWordWarp(WordWarp: Boolean);
begin

end;

procedure TMemoEditor.Undo;
begin

end;

end.
