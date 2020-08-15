unit uRichEditor;

interface
uses
  uEditorBase, Classes, SysUtils, StdCtrls, Controls, Graphics, Dialogs,
  ComCtrls;

type
  TRichEditor = class(TEditorBase)
  private
    FRichEditor: TRichEdit;
    function GetWordCount: Integer;
  protected
    procedure DoLoadFromFile(FileName: string);
    function DoSaveFile(FileName: string): Boolean;
    function GetText: string; override;
  public
    constructor Create(ParentComponent: TComponent);
    destructor Destroy; override;
    function GetWordWarp: Boolean; // �Ƿ����
    procedure SetWordWarp(WordWarp: Boolean);
    // �ж��Ƿ���Ҫ���棬ͨ����ǰ�༭����״̬���ж�
    // ����༭��״̬���ڱ༭״̬����ô����Ҫ���棬����ʹ����ѱ���״̬��
    function GetSaved: Boolean;
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
        // ���Memo��ѡ�е��ı�
    function GetSelectText: String;
  end;

implementation

{ TRichEditor }

function TRichEditor.CanCopy: Boolean;
begin

end;

function TRichEditor.CanCut: Boolean;
begin

end;

function TRichEditor.CanDeleteSelection: Boolean;
begin

end;

function TRichEditor.CanPaster: Boolean;
begin

end;

function TRichEditor.CanRedo: Boolean;
begin

end;

function TRichEditor.CanUndo: Boolean;
begin

end;

procedure TRichEditor.Copy;
begin

end;

constructor TRichEditor.Create(ParentComponent: TComponent);
begin

end;

procedure TRichEditor.Cut;
begin

end;

procedure TRichEditor.DelectSelection;
begin

end;

destructor TRichEditor.Destroy;
begin

  inherited;
end;

procedure TRichEditor.DoLoadFromFile(FileName: string);
begin

end;

function TRichEditor.DoSaveFile(FileName: string): Boolean;
begin

end;

function TRichEditor.FindNext(Text: String; Option: TFindOptions): Boolean;
begin

end;

function TRichEditor.GetSaved: Boolean;
begin

end;

function TRichEditor.GetSelectText: String;
begin

end;

function TRichEditor.GetText: string;
begin

end;

function TRichEditor.GetWordCount: Integer;
begin

end;

function TRichEditor.GetWordWarp: Boolean;
begin

end;

procedure TRichEditor.Paster;
begin

end;

procedure TRichEditor.Redo;
begin

end;

function TRichEditor.Replace(FindText, ReplaceText: String;
  Option: TFindOptions): Integer;
begin

end;

procedure TRichEditor.SetFont(Font: TFont);
begin

end;

procedure TRichEditor.SetWordWarp(WordWarp: Boolean);
begin

end;

procedure TRichEditor.Undo;
begin

end;

end.
