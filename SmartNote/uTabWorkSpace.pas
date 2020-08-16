unit uTabWorkSpace;

interface
uses
  uWorkSpace, ComCtrls, Controls, Classes, Sysutils;

type
  TTabWorkSpace = class(TWorkSpace)
  private
    FTabSheet: TTabSheet;
    procedure SetCaption(FileName: string);
  protected
    procedure DoSave();
  public
    constructor Create(AOwner: TComponent; iIndex: Integer; FileName: string);
    destructor Destroy; override;
    function TabWS_GetPageIndex() : Integer;
  end;

implementation
uses
  uConstFile;
{ TTabWorkSpace }

constructor TTabWorkSpace.Create(AOwner: TComponent; iIndex: Integer; FileName: string);
begin
  inherited;
  FTabSheet := TTabSheet.Create(nil);
  FTabSheet.PageControl := TPageControl(AOwner);
  FTabSheet.Align := alClient;
  FTabSheet.Visible := True;
  FTabSheet.Tag := iIndex;
end;

destructor TTabWorkSpace.Destroy;
begin
  FTabSheet.Free;
  FTabSheet := nil;
  inherited;
end;

procedure TTabWorkSpace.DoSave;
begin
  SetCaption(GetFileName());
end;

procedure TTabWorkSpace.SetCaption(FileName: string);
begin
  if FileName = '' then
    FTabSheet.Caption := cst_Default_Title
  else
    FTabSheet.Caption := System.Copy(ExtractFileName(FileName), 1, 10);
end;

function TTabWorkSpace.TabWS_GetPageIndex: Integer;
begin
  Result := FTabSheet.PageIndex;
end;

end.
