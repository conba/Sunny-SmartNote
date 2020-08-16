unit uWorkSpaceMgr;

interface
uses
  uWorkSpace, Classes, SysUtils, ComCtrls, uConstFile;

type
  TWorkSpaceStatusRec = record
    Opened: Boolean;
  end;

  TWorkSpaceMgr = class
  private
    FWorkSpaceList: array[0..cst_WokeSpace_MaxCount] of TWorkSpace;
    FWorkSpaceStatusList: array[0..cst_WokeSpace_MaxCount] of TWorkSpaceStatusRec;
    function DoNewWorkSpace(FileName: string): TWorkSpace; abstract;
  protected
  public
    constructor Create;
    destructor Destroy; override;
    // 新建工作区
    function NewWorkSpace(FileName: string): Integer;
  end;

implementation

{ TWorkSpaceMgr }

constructor TWorkSpaceMgr.Create;
var
  I: Integer;
begin
  for I := Low to High do
  begin
    FWorkSpaceList[i] := nil;
    FWorkSpaceStatusList[i].Opened := False;
  end;
end;

destructor TWorkSpaceMgr.Destroy;
var
  I: Integer;
begin
  for I := Low[FWorkSpaceList] to High[FWorkSpaceList] do
  begin
    FWorkSpaceList[i].Free;
    FWorkSpaceList[i] := nil;
    FWorkSpaceStatusList[i].Opened := False;
  end;
  inherited;
end;

function TWorkSpaceMgr.NewWorkSpace(FileName: string): Integer;
var
  WorkSpace: TWorkSpace;
  I: Integer;
  bCanCreate: Boolean;
begin
//  WorkSpace :=
  bCanCreate := False;
  for I := Low(FWorkSpaceStatusList) to High(FWorkSpaceStatusList) do
  begin
    if FWorkSpaceStatusList[i].Opened = True then
      Continue;

    FWorkSpaceStatusList[i].Opened := True;
    bCanCreate := True;
    Break;
  end;

  WorkSpace := DoNewWorkSpace(FileName);
  FWorkSpaceList[i] := WorkSpace;
end;

end.
