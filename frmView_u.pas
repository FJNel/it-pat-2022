unit frmView_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Spin, Registry, TournamentData_u;

type
  TfrmView = class(TForm)
    tbsEnter: TTabSheet;
    tbsView: TTabSheet;
    pgcViewing: TPageControl;
    pnTitleView: TPanel;
    lblView: TLabel;
    pnlTitleEnter: TPanel;
    lblEnter: TLabel;
    lblEnterInfo: TLabel;
    lblItem: TLabel;
    cmbItem: TComboBox;
    lblItemName: TLabel;
    edtItemName: TEdit;
    lblApprozTime: TLabel;
    spnApproxT: TSpinEdit;
    Label1: TLabel;
    pnlbtnEnter: TPanel;
    lblOne: TLabel;
    lblViewInfo: TLabel;
    lblCode: TLabel;
    lblFillItemCode: TLabel;
    lblViewName: TLabel;
    lblFillItemName: TLabel;
    lblScore: TLabel;
    lblFillScore: TLabel;
    lblUsername: TLabel;
    lblFillUsername: TLabel;
    lblLastPart: TLabel;
    lblFillLastPart: TLabel;
    lblStillPart: TLabel;
    lblFillStillPart: TLabel;
    lblOwed: TLabel;
    lblFillOwed: TLabel;
    lblComment: TLabel;
    redComments: TRichEdit;
    pnlbtnHelpEnter: TPanel;
    pnlbtnHelpView: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure pnlbtnEnterClick(Sender: TObject);
    procedure pnlbtnHelpEnterClick(Sender: TObject);
    procedure pnlbtnHelpViewClick(Sender: TObject);
  private
    { Private declarations }
    sUsername : String;
  public
    { Public declarations }
    procedure DisplayItem(sUsername:String);
    procedure Help(sFile:String);
  end;

var
  frmView: TfrmView;

implementation
uses
  Tournament_u;

{$R *.dfm}

procedure TfrmView.DisplayItem(sUsername: String);
var
  rOwed : Real;
begin
  //Display item info
      lblFillUsername.Caption := dmTournamentData.tblScore['Username']; //Username
      lblFillItemCode.Caption := dmTournamentData.tblScore['ItemCode']; //Itemcode
      lblFillItemName.Caption := dmTournamentData.tblScore['ItemName']; //Item name
      if dmTournamentData.tblScore['Score'] = 0 then //if the score is 0, then show no score yet. The min score during participation is 1
      begin
        lblFillScore.Caption := 'No score yet';
      end else //otherwise show score
         lblFillScore.Caption := IntToStr(dmTournamentData.tblScore['Score'])+'%';
      //If haven't participated yet, show it
      if dmTournamentData.tblScore['LastRoundPart'] = 0 then
        lblFillLastPart.Caption := 'Not participated yet'
      else//else show last round part.
        lblFillLastPart.Caption := dmTournamentData.tblScore['LastRoundPart'];
      //if not participating anymore
      if dmTournamentData.tblScore['Participating'] = False then
        lblFillStillPart.Caption := 'No' //show now
      else //else, if the round they participated in is equal to their time roumd, show that no shcedule generated
      if (dmTournamentData.tblScore['NextTime'] = Null) OR (dmTournamentData.tblScore['TimeRound'] = dmTournamentData.tblScore['LastRoundPart']) then
         lblFillStillPart.Caption := 'Yes (No schedule for round '+IntToStr(dmTournamentData.tblScore['LastRoundPart']+1)+' yet)'
      else //else, show next participation time
        lblFillStillPart.Caption := 'Yes ('+FormatDateTime('DD MMM YYYY, HH:MM',dmTournamentData.tblScore['NextTime'])+')';
      //calculate and display the amount owed
      rOwed := dmTournamentData.tblScore['LastRoundPart']*250 - dmTournamentData.tblUsers['Paid'];
      lblFillOwed.Caption := FloatToStrF(rOwed,ffCurrency,10,2);
      //load comments into richedit
      redComments.Lines.Clear;
      redComments.Lines.Add(dmTournamentData.tblScore['Comments']);
end;

procedure TfrmView.FormActivate(Sender: TObject);
var
  sLine, sTemp, sEnter : String;
  k, iBut, iItems, l : Integer;
  FItems : TextFile;
  bFound : Boolean;
  fCurrent, FEnter : TextFile;
  rOwed : Real;
  arrItems : array[1..30] of string;
begin
  //Retrieve the currently logged in username
  AssignFile(fCurrent,'Current.txt');
  reset(fCurrent);
  readln(fCurrent,sUsername);
  closefile(fCurrent);

  AssignFile(fEnter,'Enter.txt');
  reset(fEnter);
  readln(fEnter,sEnter);
  //Initialise the amount of items in the item text file
  iItems := 0;
  //Change label widths to ensure they're centred
  lblView.Width := 766;
  lblViewInfo.Width := 766;
  lblEnter.Width := 766;
  lblEnterInfo.Width := 766;
  lblOne.Width := 766;

  if FileExists('Items.txt') = FALSE then //Test if the items file is there
  begin //if it isn't, show error and exit
    iBut := MessageDlg('The Items.txt file needed to enter could not be found! Contact an admin to fix this error.',mtError,[mbAbort],0);
    Exit;
  end;
  AssignFile(FItems,'Items.txt'); //if it is, it'll be assigned so it can be read
  reset(FItems);

  while NOT(EOF(FItems)) do
  begin
    readln(FItems,sLine); //read and add the item to the array
    //sLine := Copy(sLine,1,Pos('#',sLine)-1);
    inc(iItems);
    arrItems[iItems] := sLine;
  end;
  dmTournamentData.tblScore.Active := True;
  //now, sort the array in alphabetical order to ensure items are always listed alhpabettically
  for k := 1 to iItems - 1 do
    for l := k+1 to iItems do
    begin
      if arrItems[k] > arrItems[l] then
      begin
        sTemp := arrItems[k];
        arrItems[k] := arrItems[l];
        arrItems[l] := sTemp;
      end;
    end;
    for k := 1 to iItems do
      cmbItem.Items.Add(arrItems[k]);

  //Check if the username is already in the database
  bFound := False;
  dmTournamentData.tblScore.First;
  while NOT(dmTournamentData.tblScore.EOF) AND (bFound = False) do
  begin
    if dmTournamentData.tblScore['Username'] = sUsername then
    begin
      bFound := True;
    end //if
    else dmTournamentData.tblScore.Next;
  end;//while


  //Update headings if the user has already entered an item and go to view page
  if bFound then
  begin
    tbsEnter.Enabled := False;
      lblEnter.Caption := 'Already entered';
      lblEnterInfo.Caption := 'Item code: '+dmTournamentData.tblScore['ItemCode'];
      lblOne.Caption := 'Note: The information above doesn''t reflect your entry';
      lblOne.Width := 766;
      lblEnterInfo.Width := 766;
      lblEnter.Width := 766;
      cmbItem.Enabled := False;
      edtItemName.Enabled := False;
      spnApproxT.Enabled := False;
      //Label2.Caption := 'Found';
      pgcViewing.ActivePageIndex := 1;

      DisplayItem(sUsername);
  end
  else
  begin //if the user hasn't entered an item, also update the headings and stay on enter page
    if sEnter = 'Yes' then
    begin
    tbsView.Enabled := False;
    lblView.Caption := 'Not entered';
    lblViewInfo.Caption := 'Enter on the Enter tab above.';
    lblView.Width := 766;
    lblViewInfo.Width := 766;
    end
    else
    begin
    tbsView.Enabled := False;
    tbsEnter.Enabled := False;
    lblView.Caption := 'Too late!';
    lblViewInfo.Caption := 'You cannot enter. The tournament has already started!';
    lblView.Width := 766;
    lblViewInfo.Width := 766;

    lblEnter.Caption := 'Too late!';
    lblEnterInfo.Caption := 'You cannot enter. The tournament has already started!';
    lblEnter.Width := 766;
    lblEnterInfo.Width := 766;
    end;

  end;
  closefile(fEnter);
end;

procedure TfrmView.Help(sFile: String);
var
  FHelp : TextFile;
  sMessage, sLine : String;
  iBut : Integer;
begin
  //Test if the help text file is there
  if FileExists('Help\'+sFile+'.txt') =False then
  begin//if not, show error
    iBut := MessageDlg('Help file not found! Contact an admin to fix this error.',mtError,[mbAbort],0);
    Exit;
  end;
  //If it is, assign and reset file pointer
  sMessage := '';
  AssignFile(FHelp,'Help\'+sFile+'.txt');
  Reset(FHelp);
  //generate a string help message
  while NOT EOF(FHelp) do
  begin
  ReadLn(FHelp,sLine);
    if sMessage = '' then//if it is the first line in the message, don't add a 'line' in the message
    begin
      sMessage := sLine;
    end//if
    else
    begin
      sMessage := sMessage + #10+ sLine;
    end; //else
  end;//while
  //show the retrieved help message
  iBut := MessageDlg(sMessage,mtInformation,[mbOk],0);
  Closefile(FHelp);

end;

procedure TfrmView.pnlbtnHelpViewClick(Sender: TObject);
begin
  //Help button on view page clicked
  Help('View');
end;

procedure TfrmView.pnlbtnEnterClick(Sender: TObject);
var
  sItem, sItemName, sLine, sCode : String;
  iApproxT, iBut, k, iNum : Integer;
  bFound : Boolean;
  rOwed : Real;
  //fCurrent : TextFile;
  FScore : TextFile;
begin
  //Enter item button clicked
  //Input
  sItem := cmbItem.Items[cmbItem.ItemIndex];
  sItemName := edtItemName.Text;
  iApproxT := spnApproxT.Value;

  //Validation
  //Test if information has been entered
  if (sItem = '') OR (sItemName = '') OR (cmbItem.ItemIndex = -1) then
  begin //if not, error
    iBut := MessageDlg('You need to enter information in all of the fields to enter.',mtError,[mbAbort],0);
    Exit;
  end;

  //Test if information entered is too long
  if (Length(sItemName) > 50) then
  begin //if too long, error
    iBut := MessageDlg('The item name cannot be longer than 50 characters. Please make sure your''s isn''t too long. (This ensures data isn''t lost when stored)',mtError,[mbAbort],0);
    Exit;
  end;

  //Process
  //Check if the username is already in the database
  bFound := False;
  dmTournamentData.tblScore.First;
  while NOT(dmTournamentData.tblScore.EOF) AND (bFound = False) do
  begin
    if dmTournamentData.tblScore['Username'] = sUsername then //if username is found
    begin
      bFound := True;
      //show error and exit
      iBut := MessageDlg('You have already entered an item. You cannot do so twice.',mtError,[mbAbort],0);
      Exit;
    end //if
    else dmTournamentData.tblScore.Next; //otherwise, go to the record
  end;//while

  //Determine the last used code for this item, explanation in documentation
  AssignFile(FScore,'Items\'+sItem+'.txt');
  if FileExists('Items\'+sItem+'.txt') then
    reset(FScore)
  else begin
    Rewrite(FScore);
    WriteLn(FScore,'00');
  end;
  //read code apply to item code, and increase
  reset(FScore);
  readln(FScore,sLine);
  sCode := sLine;
  iNum := StrToInt(sCode);
  inc(iNum);
  sCode := IntToStr(iNum);
  if Length(sCode)=1 then
    sCode := '0'+sCode;

  Rewrite(FSCore);
  WriteLn(FScore,sCode);

  CloseFile(FSCore);
  //while NOT(EOF(FItems)) do
  //begin
  //  readln(FItems,sLine);
  //  if sItem = Copy(sLine,1,Pos('#',sLine)-1) then
  //  begin
  //    Delete(sLine,1,Pos('#',sLine));
  //    sCode := sLine;
  //    iNum := StrToInt(sCode);
  //    inc(iNum);
  //    sCode := IntToStr(iNum);
  //    if Length(sCode)=1 then
  //      sCode := '0'+sCode;

  //  end;
  //end;
  //Insert item information into tblScore
  dmTournamentData.tblScore.Insert;
  dmTournamentData.tblScore['ItemCode'] := Uppercase(Copy(sItem,1,3))+sCode;
  dmTournamentData.tblScore['Username'] := sUsername;
  dmTournamentData.tblScore['ItemName'] := sItemName;
  dmTournamentData.tblScore['PartTime'] := iApproxT;
  dmTournamentData.tblScore['LastRoundPart'] := 0;
  dmTournamentData.tblScore['Score'] := 0;
  dmTournamentData.tblScore.Post;
  //Inform the user
  iBut := MessageDlg('You''ve entered your item succesfully! Check the View tab above for more information.',mtInformation,[mbOk],0);
  pgcViewing.ActivePageIndex := 1;
      //go to the view page and update headings
      tbsEnter.Enabled := False;
      lblEnter.Caption := 'Already entered';
      lblEnterInfo.Caption := 'Item code: '+dmTournamentData.tblScore['ItemCode'];
      lblEnterInfo.Width := 766;
      lblEnter.Width := 766;
      cmbItem.Enabled := False;
      edtItemName.Enabled := False;
      spnApproxT.Enabled := False;
      //Label2.Caption := 'Found';
      pgcViewing.ActivePageIndex := 1;

      lblView.Caption := 'View your entry';
      lblViewInfo.Caption := 'See your entry''s information below:';
      lblView.Width := 766;
      lblViewInfo.Width := 766;
      DisplayItem(sUsername);


  //resort the table
  dmTournamentData.tblScore.Sort := 'ItemCode ASC';

end;



procedure TfrmView.pnlbtnHelpEnterClick(Sender: TObject);
begin
  //Help button on enter page clicked
  Help('Enter');
end;

end.
