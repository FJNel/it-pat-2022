unit frmManage_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, TournamentData_u, DateUtils, Grids,
  DBGrids, Spin;

type
  TfrmManage = class(TForm)
    pgcManage: TPageControl;
    tbsSchedule: TTabSheet;
    tbsScore: TTabSheet;
    pnlTitleCreate: TPanel;
    lblCreate: TLabel;
    lblCreateInfo: TLabel;
    lblItem: TLabel;
    cmbItem: TComboBox;
    pnlbtnCreate: TPanel;
    redCreated: TRichEdit;
    lblScCreated: TLabel;
    lblTime: TLabel;
    lblLunch: TLabel;
    cbxTea: TCheckBox;
    dtpTime: TDateTimePicker;
    dtpDate: TDateTimePicker;
    pnlTitleScore: TPanel;
    lblScore: TLabel;
    lblInfoScore: TLabel;
    dbScore: TDBGrid;
    lblItemCode: TLabel;
    edtItemCode: TEdit;
    lblParticipant: TLabel;
    lblFillParticipant: TLabel;
    lblRound: TLabel;
    spnRound: TSpinEdit;
    lblItemName: TLabel;
    lblFillItemName: TLabel;
    lblStart: TLabel;
    lblEndTime: TLabel;
    lblFillStart: TLabel;
    lblFillEnd: TLabel;
    tbsEliminate: TTabSheet;
    pnlbtnStart: TPanel;
    pnlbtnNext: TPanel;
    cbxLunch: TCheckBox;
    cbxCoffee: TCheckBox;
    lblScoreing: TLabel;
    lblScoreR: TLabel;
    spnScore: TSpinEdit;
    lblCommentR: TLabel;
    redComments: TRichEdit;
    pnlbtnSubmit: TPanel;
    lblPaidT: TLabel;
    edtPaid: TEdit;
    lblRand: TLabel;
    pnlTitleElim: TPanel;
    lblEliminate: TLabel;
    lblElimInfo: TLabel;
    cmbElimItem: TComboBox;
    lblElimItem: TLabel;
    lblElimCriteria: TLabel;
    pnlbtnHelpShcedule: TPanel;
    pnlbtnHelpScore: TPanel;
    pnlbtnHelpEliminate: TPanel;
    lblElimRound: TLabel;
    spnElimRound: TSpinEdit;
    pnlbtnEliminate: TPanel;
    spnTop: TSpinEdit;
    lblComplete: TLabel;
    lblCompleteInfo: TLabel;
    lblDeleteItem: TLabel;
    cmbDeleteItem: TComboBox;
    pnlbtnDelete: TPanel;
    tbsResult: TTabSheet;
    pnlResultTitle: TPanel;
    lblResultTtile: TLabel;
    lblResultInfo: TLabel;
    lblResultItem: TLabel;
    cmbResultItem: TComboBox;
    lblResultRound: TLabel;
    spnResultRound: TSpinEdit;
    pnlbtnResults: TPanel;
    redResults: TRichEdit;
    pnlbtnHelpResults: TPanel;
    lblEnter: TLabel;
    lblYesNo: TLabel;
    pnlbtnYes: TPanel;
    pnlbtnNo: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure pnlbtnCreateClick(Sender: TObject);
    procedure pnlbtnStartClick(Sender: TObject);
    procedure pnlbtnNextClick(Sender: TObject);
    procedure pnlbtnSubmitClick(Sender: TObject);
    procedure pnlbtnHelpShceduleClick(Sender: TObject);
    procedure pnlbtnHelpScoreClick(Sender: TObject);
    procedure pnlbtnHelpEliminateClick(Sender: TObject);
    procedure pnlbtnEliminateClick(Sender: TObject);
    procedure pnlbtnDeleteClick(Sender: TObject);
    procedure pnlbtnResultsClick(Sender: TObject);
    procedure pnlbtnHelpResultsClick(Sender: TObject);
    procedure pnlbtnYesClick(Sender: TObject);
    procedure pnlbtnNoClick(Sender: TObject);
  private
    { Private declarations }
     iUsernameC : Integer;
  public
    { Public declarations }
    procedure LoadItem(sItemCode:String);
    procedure FindItem(sItemCode:String);
    procedure Help(sFile:String);
  end;

var
  frmManage: TfrmManage;

implementation
uses
  Tournament_u;

{$R *.dfm}

procedure TfrmManage.FindItem(sItemCode: String);
var
  bItemFound, bUserFound : Boolean;
  sUsername : String;
begin
  with dmTournamentData do
  begin
    tblScore.Sort := 'ItemCode ASC';
    tblScore.First;
    bItemFound := False;
    while (NOT tblScore.EOF) AND (bItemFound = False) do
    begin
      if tblScore['ItemCode'] = sItemCode then
      begin
        bItemFound := True;
        sUsername := tblScore['Username']
      end//if
      else
      begin
        tblScore.Next;
      end;//else
    end;//while

    tblUsers.Sort := 'Username ASC';
    tblUsers.First;
    bUserFound := False;
    while (NOT tblUsers.Eof) AND (bUserFound = False) do
    begin
      if tblUsers['Username'] = sUsername then
      begin
        bUserFound := True;
      end
      else
      begin
        tblUsers.Next;
      end;

    end;//while
  end;//with
end;

procedure TfrmManage.FormActivate(Sender: TObject);
var
  iBut, iItems, k, l : Integer;
  FITems, FEnter : TExtFile;
  sLine, sTemp, sEnter : String;
  arrItems : array[1..30] of string;
begin
  iUsernameC := 0;
  iItems := 0;

  lblCreate.Width := 766;
  lblCreateInfo.Width := 766;
  lblScore.Width := 766;
  lblInfoScore.Width := 766;
  lblEliminate.Width := 766;
  lblElimInfo.Width := 766;
  lblComplete.Width := 766;
  lblCompleteInfo.Width := 766;
  lblResultTtile.Width := 766;
  lblResultInfo.Width := 766;
  dtpDate.Date := Date;

  if FileExists('Items.txt') = FALSE then //Test if the teachers file is there
  begin //if it isn't, show error and exit
    iBut := MessageDlg('The Items.txt file needed to create a schedule could not be found! Contact an admin to fix this error.',mtError,[mbAbort],0);
    Exit;
  end;
   AssignFile(FItems,'Items.txt'); //if it is, it'll be assigned so it can be read
  reset(FItems);

  AssignFile(FEnter,'Enter.txt');
  reset(FEnter);
  readln(FEnter, sEnter);
  if sEnter = 'Yes' then
  begin
    lblYesNo.Caption := 'Yes';
    pnlbtnYes.Enabled := False;
    pnlbtnNo.Enabled := True;
  end
  else if sEnter = 'No' then
       begin
        lblYesNo.Caption := 'No';
        pnlbtnYes.Enabled := True;
        pnlbtnNo.Enabled := False;
       end;

  closefile(fEnter);
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
    for k := 1 to iItems do begin
      cmbItem.Items.Add(arrItems[k]);
      cmbElimItem.Items.Add(arrItems[k]);
      cmbDeleteItem.Items.Add(arrItems[k]);
      cmbResultItem.Items.Add(arrItems[k]);
    end;

  closefile(FITems);
  pnlbtnSubmit.Enabled := False;
end;

procedure TfrmManage.Help(sFile: String);
var
  FHelp : TextFile;
  sMessage, sLine : String;
  iBut : Integer;
begin
  if FileExists('Help\'+sFile+'.txt') =False then
  begin
    iBut := MessageDlg('Help file not found! Contact an admin to fix this error.',mtError,[mbAbort],0);
    Exit;
  end;

  sMessage := '';
  AssignFile(FHelp,'Help\'+sFile+'.txt');
  Reset(FHelp);
  while NOT EOF(FHelp) do
  begin
  ReadLn(FHelp,sLine);
    if sMessage = '' then
    begin
      sMessage := sLine;
    end//if
    else
    begin
      sMessage := sMessage + #10+ sLine;
    end; //else
  end;//while

  iBut := MessageDlg(sMessage,mtInformation,[mbOk],0);
  Closefile(FHelp);
end;

procedure TfrmManage.LoadItem(sItemCode: String);
var
  iRound, iBut : Integer;
  bFound : Boolean;
  sUsername, sParticipant : String;
begin
  dmTournamentData.tblScore.First;
  sItemCode := Uppercase(edtItemCode.Text);
  iRound := spnRound.Value;
  bFound := False;
  while not (dmTournamentData.tblScore.EOF) and (bFound = false) do
  begin
    if dmTournamentData.tblScore['ItemCode'] = sItemcode then
    begin
      bFound := True;
      sUsername := dmTournamentData.tblScore['Username']
    end
    else dmTournamentData.tblScore.Next;
  end;//while

  if bFound then
  begin
    with dmTournamentData do
    begin
      tblUsers.First;
      sUsername := tblScore['Username'];
      while not tblUsers.EOF do
      begin
        if tblUsers['Username'] = sUsername then
          sParticipant := tblUsers['First_Name']+' '+tblUsers['Last_Name'];
      tblUsers.Next;
      end;//while
    end;//with
  end;

  lblFillParticipant.Caption := sParticipant;
  lblFillItemName.Caption := dmTournamentData.tblScore['ItemName'];
  if dmTournamentData.tblScore['LastRoundPart'] = dmTournamentData.tblScore['TimeRound'] then
  begin
    lblFillStart.Caption := 'No schedule';
    lblFillEnd.Caption := 'No schedule';
    iBut := MessageDlg('You haven''t created a schedule for this item (and round) yet. You can score the item, but it is recomennded that you create a schedule first.',mtInformation,[mbOk],0);
  end else
  begin
  lblFillStart.Caption := FormatDateTime('HH:NN',dmTournamentData.tblScore['NextTime']);
  lblFillEnd.Caption := FormatDateTime('HH:NN',IncMinute(dmTournamentData.tblScore['NextTime'],dmTournamentData.tblScore['PartTime']));
  end;

end;

procedure TfrmManage.pnlbtnDeleteClick(Sender: TObject);
var
sItem : String;
iCount, iBut : Integer;
FScore : TextFile;
begin
  //Input
  sItem := cmbDeleteItem.Items[cmbDeleteItem.ItemIndex];
  iCount := 0;
    //Validation - is an item selected?
  if cmbDeleteItem.ItemIndex = -1 then
  begin //if not, error
    MessageDlg('Please select an item in the delete combobox',mtError,[mbAbort],0);
    Exit;
  end;
  //count the amount of records being deleted
  with dmTournamentData do
  begin
    tblScore.First;
    tblScore.Sort := 'ItemCode ASC';
    while not tblScore.EOF do
    begin
      if (uppercase(Copy(sItem,1,3)) = copy(tblScore['ItemCode'],1,3)) then
      begin
        inc(iCount);
      end;//if
      tblScore.Next;
    end;//while
    //give warninging message
    iBut := MessageDlg('You are about to DELETE all records related to: '+sItem+'. BEWARE This will remove the participant''s item information.'+#10+'It is recomennded to do this a week after the winners for this item has been announced!'+#10+IntToStr(iCount)+' items will be removed forever. Are you sure you want to do this? This action is NOT reversable.',mtConfirmation,[mbYes,mbNo],0);
    if iBut = 6 then //if yes
    begin //delete all these utems
      tblScore.First;
      tblScore.Sort := 'ItemCode ASC';
      while not tblScore.EOF do
      begin
        if (uppercase(Copy(sItem,1,3)) = copy(tblScore['ItemCode'],1,3)) then
        begin
          tblScore.Delete;
        end else//if
          tblScore.Next;
        end;//while
        MessageDlg(IntToStr(iCount)+' records deleted',mtInformation,[mbOk],0);
    end else//if
      MessageDlg('Records NOT deleted',mtInformation,[mbOk],0);
  end;//with
  //Resets the text file too
  AssignFile(FScore,'Items\'+sItem+'.txt');
  if FileExists('Items\'+sItem+'.txt') then
  begin
    Rewrite(FScore);
    WriteLn(FScore,'00');
    Closefile(FScore);
  end;

end;

procedure TfrmManage.pnlbtnHelpResultsClick(Sender: TObject);
begin
  Help('Results');
end;

procedure TfrmManage.pnlbtnCreateClick(Sender: TObject);
var
  arrUsername : array[0..1000] of String;
  k, iRound, iDash, IbUT, iPrint, iCount : Integer;
  sItem, sTICode, sItemCode, sUsername, sParticipant : String;
  FSchedule : TextFile;
  tStartTime, tNowTime : TTime;
  bLunchAdded, bTeaAdded, bCoffeAdded : Boolean;
begin
  dmTournamentData.tblScore.Sort := 'ItemCode ASC';
  dmTournamentData.tblScore.First;

  sItem := cmbItem.Items[cmbItem.ItemIndex];
  sItemCode := Uppercase(Copy(sItem,1,3));
  iRound := 0;

  if (cmbItem.ItemIndex = -1) then
  begin
    iBut := MessageDlg('You need to select an item in the combobox to continue.',mtError,[mbAbort],0);
    Exit;
  end;

  //Is this needed?
  while NOT dmTournamentData.tblScore.EOF do
  begin
    sTICode := Copy(dmTournamentData.tblScore['ItemCode'],1,3);
  if (dmTournamentData.tblScore['Participating'] = True) AND (sTICode = sItemCode) then
  begin
    inc(iUsernameC);
    //All the usernames in the array will be those with the item selected, that are still participating...
    arrUsername[iUsernameC] := dmTournamentData.tblScore['Username'];
    iRound := iRound + dmTournamentData.tblScore['LastRoundPart'];
  end;//if
  dmTournamentData.tblScore.Next;
  end;//while

  if iUsernameC <> 0 then
    iRound := Round(iRound/iUsernameC)+1
  else
  begin
    iBut := MessageDlg('No participants for this item. Create a schedule for another item',mtError,[mbAbort],0);
    Exit;
  end;

  //AssignFile(FSchedule, 'Schedules\'+sItem+IntToStr(iRound));
  //Rewrite(FSchedule);
  //Tab stops
  redCreated.Lines.Clear;
  redCreated.Paragraph.TabCount := 4;
  redCreated.Paragraph.Tab[0] := 50;
  redCreated.Paragraph.Tab[1] := 125;
  redCreated.Paragraph.Tab[2] := 225;
  redCreated.Paragraph.Tab[3] := 275;

    dtpTime.Date := dtpDate.Date;
    TNowTime := dtpTime.Time;
  //Top section and headings
  redCreated.Lines.Add('SCHEDULE');
  redCreated.Lines.Add('For '+sItem+' (Round '+IntToStr(iRound)+')');
  redCreated.Lines.Add('Round takes place on: '+FormatDateTime('DDDD, DD MMMM YYYY', dtpTime.Date)+', and starts at '+FormatDateTime('HH:NN', dtpTime.Date));
  redCreated.Lines.Add('');
  redCreated.Lines.Add('Time'+#9+'Item Code'+#9+'Participant'+#9+'Duration'+#9+'Item Name');
  redCreated.Lines.Add('--------------------------------------------------------------------------------------------------------------------------------------------');

  bLunchAdded := False;
  bTeaAdded := False;
  bCoffeAdded := False;
  dmTournamentData.tblScore.First;
  while NOT dmTournamentData.tblScore.EOF do
  begin
  //if it is an appropriate time for tea, lunch, coffee, add to shedule
  sTICode := Copy(dmTournamentData.tblScore['ItemCode'],1,3);
  if (bTeaAdded = False) AND(HourOF(tNowTime) = 11) AND (cbxTea.Checked) then //Tea time
    begin
      bTeaAdded := True;
      redCreated.Lines.Add(FormatDateTime('HH:NN',tNowTime)+#9'---------- Tea ----------'+#9+'20 min');
      tNowTime := IncMinute(tNowTime,20);
    end; //if
  if (bLunchAdded = False) AND(HourOF(tNowTime) = 13) AND (cbxLunch.Checked) then //Lunch time
    begin
      bLunchAdded := True;
      redCreated.Lines.Add(FormatDateTime('HH:NN',tNowTime)+#9'---------- Lunch ----------'+#9+'30 min');
      tNowTime := IncMinute(tNowTime,30);
    end; //if
  if (bCoffeAdded = False) AND(HourOF(tNowTime) = 15) AND (cbxCoffee.Checked) then //Coffee time
    begin
      bCoffeAdded := True;
      redCreated.Lines.Add(FormatDateTime('HH:NN',tNowTime)+#9'---------- Coffee ----------'+#9+'15 min');
      tNowTime := IncMinute(tNowTime,15);
    end; //if
  if (dmTournamentData.tblScore['Participating'] = True) AND (sTICode = sItemCode) then
    begin
    with dmTournamentData do
    begin
      tblUsers.First;
      sUsername := tblScore['Username'];
      while not tblUsers.EOF do
      begin
        if tblUsers['Username'] = sUsername then
          sParticipant := tblUsers['First_Name']+' '+tblUsers['Last_Name'];
      tblUsers.Next;
      end;//while

      //Edit time
      tblScore.Edit;
      tblScore['NextTime'] := tNowTime;
      tblScore['TimeRound'] := iRound;
      tblScore.Post;
      //Display
      inc(iCount);
      //Display in rickedit
        redCreated.Lines.Add(FormatDateTime('HH:MM',tblScore['NextTime'])+#9+tblScore['ItemCode']+#9+{tblUsers['First_Name']+' '
        +tblUsers['Last_Name']}sParticipant+#9+IntToStr(tblScore['PartTime'])+' min'+#9+tblScore['ItemName']);
        //Increase time
        tNowTime := IncMinute(tNowTime,tblScore['PartTime']);
      end;//with
    end;//if
  dmTournamentData.tblScore.Next;
  end;//while
  //after all participants showed, make a line and show the amount participating
  redCreated.Lines.Add('--------------------------------------------------------------------------------------------------------------------------------------------');
  redCreated.Lines.Add('');
  redCreated.Lines.Add('Total participants: '+IntToStr(iCount));
  //store in text file
  AssignFile(fSchedule,'Schedules\'+sItem+IntToStr(iRound)+'.txt');
  Rewrite(fSchedule);
  Write(fSchedule,redCreated.Text);
  Closefile(fSchedule);
  iPrint := MessageDlg('Do you want to print the created schedule?',mtConfirmation,[mbYes,mbNo],0);
  //Print?
  if iPrint = mrYes then
  begin
    redCreated.Lines.Add('');
    redCreated.Lines.Add('Printed on: '+FormatDateTime('DD MMMM YYYY, HH:NN',Now));
    redCreated.Print('Schedule: '+sItem+IntToStr(iRound));
    iBut := MessageDlg('Print command sent to default printer',mtInformation,[mbOk],0);
  end
  else
    iBut := MessageDlg('Schedule not printed.',mtInformation,[mbOk],0);

  //for k := 0 to iUsernameC do
 ///begin
    //redCreated.Lines.Add(arrUsername[k]);

  //Sleep(5000);
  //CloseFile(FSchedule);

  //end;
end;

procedure TfrmManage.pnlbtnEliminateClick(Sender: TObject);
var
  sItem, sTemp, sThrough : String;
  iRound, iTop, iSize, k, l, iTemp, iBut : Integer;
  arrScore : array[1..1000] of Integer;
  arrUser : array[1..1000] of String;
begin
  //Input
  sItem := cmbElimItem.Items[cmbElimItem.ItemIndex];
  iRound := spnElimRound.Value;
  iTop := spnTop.Value;
  iSize := 0;
  sThrough := '';

  //Validation - is an item selected?
  if cmbElimItem.ItemIndex = -1 then
  begin //if not, error
    MessageDlg('Please select an item in the combobox',mtError,[mbAbort],0);
    Exit;
  end;

  //Load data into arrays
  dmTournamentData.tblScore.First;
  while NOT dmTournamentData.tblScore.Eof do
  begin
  with dmTournamentData do
  begin
    if (tblScore['LastRoundPart'] = iRound) AND (uppercase(Copy(sItem,1,3)) = copy(tblScore['ItemCode'],1,3)) AND (tblScore['Participating'] = True) then
    begin
      inc(iSize);
      arrScore[iSize] := tblScore['Score'];
      arrUser[iSize] := tblScore['Username'];
      tblScore.Edit;
      tblScore['Participating'] := False;
      tblScore.Post;
    end;//if
    tblScore.Next;
  end;//with
  end;//while

  //SShow error if no one recorded in arrays the criteria
  if iSize = 0 then
  begin
    MessageDlg('No participants found. Ensure the round you entered is correct in order for the program to correctly identify participants.',mtError,[mbAbort],0);
    Exit;
  end;

  //Sort arrays to determine the top players
  for k := 1 to iSize - 1 do
    for l := k+1 to iSize do
      begin
        if arrScore[k] < arrScore [l] then
        begin
          iTemp := arrScore[k];
          arrScore[k] := arrScore[l];
          arrScore[l] := iTemp;

          sTemp := arrUser[k];
          arrUser[k] := arrUser[l];
          arrUser[l] := sTemp;
        end;
      end;

  //Now, determine the top participants
  with dmTournamentData do
  begin
  tblScore.First;
  if iTop = 1 then
  begin //IF only one goes through
    if tblScore.Locate('Username',arrUser[1],[]) then
    begin
    tblScore.Edit;
    tblScore['Participating'] := False;
    tblScore['Comments'] := 'WINNER! No further rounds will take place. Congrats! Here follows the previous round''s comments: '+tblScore['Comments'];
    tblScore.Post;
    sThrough := arrUser[1];

    iBut := MessageDlg(sThrough+' is the tournament winner. Their comments have been adjusted. No further round to take place.',mtInformation,[mbOk],0);
    dmTOurnamentData.tblScore.Sort := 'ItemCode ASC';
    end;//if
  end
  else
  begin
  if iTop <> 1 then
  begin
  for k := 1 to iTop do
  begin
  if tblScore.Locate('Username',arrUser[k],[]) then
  begin
    tblScore.Edit;
    tblScore['Participating'] := True;
    tblScore.Post;
    sThrough := tblScore['Username'] + ', '+sThrough;
  end;//if
  end;//for
  end;//width
  iBut := MessageDlg('The following users are through to the next round: '+sThrough+#10+'The rest have been eliminated.',mtInformation,[mbOk],0);
  dmTOurnamentData.tblScore.Sort := 'ItemCode ASC';
  end;//else
  end;
end;

procedure TfrmManage.pnlbtnHelpEliminateClick(Sender: TObject);
begin
  Help('Eliminate');
end;

procedure TfrmManage.pnlbtnHelpScoreClick(Sender: TObject);
begin
  Help('Score');
end;

procedure TfrmManage.pnlbtnHelpShceduleClick(Sender: TObject);
begin
  Help('Schedule');
end;

procedure TfrmManage.pnlbtnNextClick(Sender: TObject);
var
  sNumber, sItemCode : String;
  iBut, iRound : Integer;
  bFound : Boolean;
begin
  sItemCode := edtItemCode.Text;
  iRound := spnRound.Value;

  if sItemCode = '' then
  begin
    iBut := MessageDlg('You need to enter an item code to continue.',mtError,[mbAbort],0);
  end;

  {sNumber := Copy(sItemCode,4,2);
  iNumber := StrToInt(sNumber);
  inc(iNumber);
  sNumber := IntToStr(iNumber);

  if Length(sNumber)=1 then
    sNumber := '0'+sNumber;

  sItemCode := Copy(sItemCode,1,3)+sNumber;
  edtItemCode.Text := sItemCode;}
  dmTournamentData.tblScore.First;
  dmTournamentData.tblScore.Sort := 'ItemCode ASC';
  bFound := False;
  while not (dmTournamentData.tblScore.EOF) and (bFound = false) do
  begin //If the next item code is valid (still participating in the same category, and bigger than current item code)
    if (Copy(dmTournamentData.tblScore['ItemCode'],1,3) = Copy(sItemcode,1,3)) AND ((dmTournamentData.tblScore['LastRoundPart']+1) = iRound)
    AND ((dmTournamentData.tblScore['Participating'])) AND (StrToInt(Copy(dmTournamentData.tblScore['ItemCode'],4,2)) > StrToInt(Copy(sItemcode,4,2))) then
    begin
      bFound := True;
      sItemCode := dmTournamentData.tblScore['ItemCode'];
    end else
   dmTournamentData.tblScore.Next;
  end;//while  /display item code
  if bFound then
  begin
    edtItemCode.Text := sItemCode;
  end
  else //if no code found, error
    iBut := MessageDlg('No more valid itemcodes found',mtInformation,[mbOk],0);

end;

procedure TfrmManage.pnlbtnNoClick(Sender: TObject);
var
  FEnter : TextFile;
  sEnter : String;
begin
  //Prevent the participants from entering the tournament
  AssignFile(FEnter,'Enter.txt');
  rewrite(FEnter);
  writeln(FEnter,'No');
    lblYesNo.Caption := 'No';
    pnlbtnYes.Enabled := True;
    pnlbtnNo.Enabled := False;
    closefile(FEnter);
end;

procedure TfrmManage.pnlbtnResultsClick(Sender: TObject);
var
  sItem, sTICode, sUsername, sParticipant, sItemCode : String;
  iRound, iPos, iPrint, iBut : Integer;
  fResults : TextFile;
begin
  sItem := cmbResultItem.Items[cmbResultItem.ItemIndex];
  iRound := spnResultRound.Value;
  iPos := 0;
  sItemCode := Uppercase(Copy(sItem,1,3));

  if cmbResultItem.ItemIndex = -1 then
  begin
    MessageDlg('Please select an item in the combobox',mtError,[mbAbort],0);
    Exit;
  end;

  redResults.Lines.Clear;
  redResults.Paragraph.TabCount := 4;
  redResults.Paragraph.Tab[0] := 50;
  redResults.Paragraph.Tab[1] := 125;
  redResults.Paragraph.Tab[2] := 225;
  redResults.Paragraph.Tab[3] := 275;

  redResults.Lines.Add('RESULTS');
  redResults.Lines.Add('For '+sItem+' (Round '+IntToStr(iRound)+')');
  redResults.Lines.Add('');
  redResults.Lines.Add('Pos'+#9+'Item Code'+#9+'Participant'+#9+'Score'+#9+'Item Name');
  redResults.Lines.Add('--------------------------------------------------------------------------------------------------------------------------------------------');

  dmTournamentData.tblScore.Sort := 'Score DESC, ItemCode ASC';
  dmTournamentData.tblScore.First;
  while NOT dmTournamentData.tblScore.EOF do
  begin
  sTICode := Copy(dmTournamentData.tblScore['ItemCode'],1,3);
   if (dmTournamentData.tblScore['LastRoundPart'] = iRound) AND (sTICode = sItemCode) AND (dmTournamentData.tblScore['Participating'] = True) then
    begin
    with dmTournamentData do
    begin
      tblUsers.First;
      sUsername := tblScore['Username'];
      while not tblUsers.EOF do
      begin
        if tblUsers['Username'] = sUsername then
          sParticipant := tblUsers['First_Name']+' '+tblUsers['Last_Name'];
      tblUsers.Next;
      end;//while
      inc(iPos);
        redResults.Lines.Add(IntToStr(iPos)+#9+tblScore['ItemCode']+#9+{tblUsers['First_Name']+' '
        +tblUsers['Last_Name']}sParticipant+#9+IntToStr(tblScore['Score'])+'%'+#9+tblScore['ItemName']);
      end;//with
    end;//if
  dmTournamentData.tblScore.Next;
  end;
  redResults.Lines.Add('--------------------------------------------------------------------------------------------------------------------------------------------');
  //redCreated.Lines.Add('');

  if iPos = 0 then
  begin
    redResults.Lines.Clear;
    iBut := MessageDlg('There is no results to retrieve for this round and item.',mtError,[mbAbort],0);
  end
  else
  begin
  AssignFile(fResults,'Results\'+sItem+IntToStr(iRound)+'.txt');
  Rewrite(fResults);
  Write(fResults,redResults.Text);
  Closefile(fResults);
  iPrint := MessageDlg('Do you want to print the created results?',mtConfirmation,[mbYes,mbNo],0);
  if iPrint = mrYes then
  begin
    redResults.Lines.Add('');
    redResults.Lines.Add('Printed on: '+FormatDateTime('DD MMMM YYYY, HH:NN',Now));
    redResults.Print('Results: '+sItem+IntToStr(iRound));
    iBut := MessageDlg('Print command sent to default printer',mtInformation,[mbOk],0);
  end
  else
    iBut := MessageDlg('Results not printed.',mtInformation,[mbOk],0);
  end;

end;

procedure TfrmManage.pnlbtnStartClick(Sender: TObject);
var
  bFound, bValid : Boolean;
  sItemCode : String;
  iRound, iBut : Integer;
begin
  dmTournamentData.tblScore.Sort := 'ItemCode ASC';
  dmTournamentData.tblScore.First;
  //clear input boxes
  //ShowMessage('First');
  spnScore.Value := 0;
  redComments.Lines.Clear;
  edtPaid.Text := '0.00';
  //input
  sItemCode := Uppercase(edtItemCode.Text);
  iRound := spnRound.Value;
  bFound := False;
  bValid := True;
  if sItemCode = '' then
  begin
    iBut := MessageDlg('No item code entered',mtError,[mbAbort],0);
    Exit;
  end;
  //search for item code
  while not (dmTournamentData.tblScore.EOF) and (bFound = false) AND (bValid = True) do
  begin
    if dmTournamentData.tblScore['ItemCode'] = sItemcode then
    begin
      bFound := True;
    end else
   dmTournamentData.tblScore.Next;
  end;//while
  //if not found, error
  if bFound = False then
  begin
    iBut := MessageDlg('Could not locate item code.',mtError,[mbAbort],0);
    Exit;
  end;
  //if found, but not participating or round wrong, error
  if (dmTournamentData.tblScore['Participating'] = False) AND (bFound = True) then
    bValid := False;

  if ((dmTournamentData.tblScore['LastRoundPart']+1) <> iRound) AND (bFound = True) then
      begin
        bValid := False;
      end;


  if bValid = False then
  begin
    iBut := MessageDlg('The item code you entered''s round does not correspond to the round you entered, or the participant has been eliminated. Try again.',mtError,[mbAbort],0);
    Exit;
  end
  else begin
    iBut := MessageDlg('You can now start scoring this participant.',mtConfirmation,[mbOk],0);
  end;
  //move pointer and load into lables
  FindItem(sItemCode);
  LoadItem(sItemCode);
  //allow to submit
  pnlbtnSubmit.Enabled := True;
end;

procedure TfrmManage.pnlbtnSubmitClick(Sender: TObject);
var
  iRound, iScore, iBut : Integer;
  sComments, sItemCode, sUsername, sParticipant : String;
  rPaid : Extended;
  FScore : TextFile;
  bFound : Boolean;
begin
  //input
  iRound := spnRound.Value;
  iScore := spnScore.Value;
  sComments := redComments.Text;
  If TryStrToFloat(edtPaid.Text, rPaid) then
  begin
    rPaid := StrToFloat(edtPaid.Text);
  end
  else
  begin
    iBut := MessageDlg('Amount paid is in the wrong format. Do not add a ''R'', and ensure the decimal seperator is correct.',mtError,[mbAbort],0);
    Exit;
  end;

  sItemCode := Uppercase(edtItemCode.Text);
  if sItemCode = '' then
  begin
    iBut := MessageDlg('You need to enter an item code to continue.',mtError,[mbAbort],0);
  end;

  if (sComments = '') OR (edtPaid.Text = '') then
  begin
    iBut := MessageDlg('You need to enter information in all of the fields to submit a score',mtError,[mbAbort],0);
    Exit;
  end;

  dmTournamentData.tblScore.Sort := 'ItemCode ASC';
  dmTournamentData.tblScore.First;

  bFound := False;
  //find user in tblUsers
  while not (dmTournamentData.tblScore.EOF) and (bFound = false) do
  begin
    if dmTournamentData.tblScore['ItemCode'] = sItemcode then
    begin
      bFound := True;
      sUsername := dmTournamentData.tblScore['Username'];
    end
    else dmTournamentData.tblScore.Next;
  end;//while
dmTournamentData.tblUsers.First;
if dmTournamentData.tblUsers.Locate('Username',sUsername,[]) then
  begin
  with dmTournamentData do
  begin //add to amount paid
          tblUsers.Edit;
          tblUsers['Paid'] := tblUsers['Paid']+rPaid;
          tblUsers.Post;
  end;
  end;

  FindItem(sItemCode);
  //output rest into db
  with  dmTournamentData do
      begin
    sUsername := tblScore['Username'];
    tblScore.Edit;
    tblScore['LastRoundPart'] := iRound;
    tblScore['Score'] := iScore;
    tblScore['Comments'] := sComments;
    tblScore.Post;

    iBut := MessageDlg('Information has been posted to the database.',mtConfirmation,[mbOk],0);
      end;
  //store in text file
  AssignFile(FScore,'Scores\'+sItemCode+' '+sUsername+'.txt');
  if fileexists('Scores\'+sItemCode+' '+sUsername+'.txt') then
    Append(FScore)
  else
  begin
    rewrite(FScore);
  end;
  writeln(FScore,'Round '+IntToStr(iRound));
  writeln(FScore,'Score: '+IntToStr(iScore));
  writeln(FScore,'Comments: '+sComments);
  writeln(FScore,'----------');
  writeln(FScore,'');;


  closefile(fscore);
  pnlbtnSubmit.Enabled := False;
end;

procedure TfrmManage.pnlbtnYesClick(Sender: TObject);
var
  FEnter : TextFile;
  sEnter : String;
begin
  //Allows participants to enter the tournament again
  AssignFile(FEnter,'Enter.txt');
  rewrite(FEnter);
  writeln(FEnter,'Yes');
    lblYesNo.Caption := 'Yes';
    pnlbtnYes.Enabled := False;
    pnlbtnNo.Enabled := True;
    closefile(fEnter);
end;

end.
