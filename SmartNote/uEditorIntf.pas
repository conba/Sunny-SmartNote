unit uEditorIntf;

interface
uses
  Graphics, Dialogs;

type
  TWordCount = record
    AnsiChar: Integer;
    MultiChar: Integer;
    NumChar: Integer;
    Other: Integer;
  end;

  IEditorIntf = interface
  ['{2D1EAB66-95CB-4EA9-B9B6-C271EA1DAA24}']
    function GetFileName: string;
    function GetSaved: Boolean;
    function Save: Boolean;
    function SaveAs: Boolean;
    function GetSelectText: String;
    function CanUndo: Boolean;
    procedure Undo;
    function CanRedo: Boolean;
    procedure Redo;
    function CanCopy: Boolean;
    procedure Copy;
    function CanCut: Boolean;
    procedure Cut;
    function CanPaster: Boolean;
    procedure Paster;
    function CanDeleteSelection: Boolean;
    procedure DelectSelection;
    procedure SetFont(Font: TFont);
    function FindNext(Text: String; Option: TFindOptions): Boolean;
    function Replace(FindText, ReplaceText: String; Option: TFindOptions): Integer;
    function GetWordCount: TWordCount;
    function GetWordWarp: Boolean;  // ÊÇ·ñ·ÖÐÐ
    procedure SetWordWarp(WordWarp: Boolean);
  end;

implementation

end.
