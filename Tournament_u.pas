unit Tournament_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, TournamentData_u, StdCtrls, ComCtrls, DateUtils, jpeg, frmView_u, frmManage_u;

type
  TfrmLogin = class(TForm)
    pnlLoginForm: TPanel;
    pnlTitleLogIn: TPanel;
    lblLogin: TLabel;
    lbledtUsername: TLabeledEdit;
    lbledtPassword: TLabeledEdit;
    pnlbtnLogin: TPanel;
    pnlSignUpForm: TPanel;
    lblSignUp: TLabel;
    pnlTitleSignUp: TPanel;
    lbledtName: TLabeledEdit;
    lbledtSurname: TLabeledEdit;
    pnlbtnReg: TPanel;
    dtpDOB: TDateTimePicker;
    lblDTP: TLabel;
    lbedtRegPW: TLabeledEdit;
    imgRegisterEye: TImage;
    lblSingupInfo: TLabel;
    lblGoSignUp: TLabel;
    pnlGoLogin: TLabel;
    imgLoginEye: TImage;
    lblLoginInfo: TLabel;
    pnlbtnHelpSignUp: TPanel;
    pnlbtnHelpLogin: TPanel;
    procedure pnlbtnLoginClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure pnlbtnRegClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgRegisterEyeClick(Sender: TObject);
    procedure lblGoSignUpClick(Sender: TObject);
    procedure pnlGoLoginClick(Sender: TObject);
    procedure imgLoginEyeClick(Sender: TObject);
    procedure pnlbtnHelpSignUpClick(Sender: TObject);
    procedure pnlbtnHelpLoginClick(Sender: TObject);
  private
    { Private declarations }
    bRegisterShow : Boolean;
    bLoginShow:Boolean;
  public
    { Public declarations }
    //sGlobalUN : String;
    function Encrypt(sString:String):String;
    procedure Help(sFile:String);


  end;

var
  frmLogin:TForm;

implementation

{$R *.dfm}


function TfrmLogin.Encrypt(sString:String): String;
var k : Integer;
begin
  //Encrypt/Decrypt password. For a full explanation, see the docx documentation
  //Code from: https://edn.embarcadero.com/article/28325
  //This function gets the Not(Ord) value of the character. This is the characters Ord value, but negative and minussed by 1.
  //Ex ASCII A = 65 -> After going through the Not(Ord), it will be -66.The encrypt function then gets the correcsponding character for the new ASCII value.
  //This also works in reverse
  Result := sString;
  for k := 1 to Length(sString) do
    Result[k] := chr(not(ord(sString[k])));
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
var
  sFileName : String;
begin
  //NullStictConvert := False;
  dmTournamentData.tblUsers.Active := True;

  //Change password characters for both image eues
  imgRegisterEye.Picture.LoadFromFile('imgHide.jpg');
  lbedtRegPW.PasswordChar := '*';
  bRegisterShow := False;
  bLoginShow := False;
  imgLoginEye.Picture.LoadFromFile('imgHide.jpg');
  lbledtPassword.PasswordChar := '*';
  //Update dtp date
  dtpDOB.Date := Date;
  //Show and position the login form
  pnlLoginForm.Show;
  pnlLoginForm.Left := 0;
  pnlLoginForm.Top := 0;
  pnlSignUpForm.Hide;
  //Change label widths to centre it
  lblLogin.Width := 801;
  lblSignUp.Width := 801;
  lblSingupInfo.Width := 801;
  lblLoginInfo.Width := 801;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //closefile(Log);
end;

procedure TfrmLogin.Help(sFile: String);
var
  FHelp : TextFile;
  sMessage, sLine : String;
  iBut : Integer;
begin
  //Test if the help text file is there
  if FileExists('Help\'+sFile+'.txt') =False then
  begin //if not show error
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
    if sMessage = '' then //if it is the first line in the message, don't add a 'line' in the message
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

procedure TfrmLogin.imgLoginEyeClick(Sender: TObject);
begin
  //Eye image on Login form clicked
  if bLoginShow = False then //If Password isn't visible - make it visible
  begin
    imgLoginEye.Picture.LoadFromFile('imgShow.jpg');
    lbledtPassword.PasswordChar := #0;
    bLoginShow := True;
  end
  else //If password is visible - make it invisible
  begin
    imgLoginEye.Picture.LoadFromFile('imgHide.jpg');
    lbledtPassword.PasswordChar := '*';
    bLoginShow := False;
  end;
end;

procedure TfrmLogin.imgRegisterEyeClick(Sender: TObject);
begin
  //Eye image on Register form clicked
  if bRegisterShow = False then //If Password isn't visible - make it visible
  begin
    imgRegisterEye.Picture.LoadFromFile('imgShow.jpg');
    lbedtRegPW.PasswordChar := #0;
    bRegisterShow := True;
  end
  else //If password is visible - make it invisible
  begin
    imgRegisterEye.Picture.LoadFromFile('imgHide.jpg');
    lbedtRegPW.PasswordChar := '*';
    bRegisterShow := False;
  end;
end;

procedure TfrmLogin.lblGoSignUpClick(Sender: TObject);
begin
  //Go to signup label clicked
  //Show signup panel panel and hide login panel
  pnlLoginForm.Hide;
  pnlSignUpForm.Show;
  //Position panel properly
  pnlSignUpForm.Top := 0;
  pnlSignUpForm.Left := 0;
  //Focus on the Name dit box
  lbledtName.SetFocus;
  //Clear GUI components
  lbledtUsername.Clear;
  lbledtPassword.Clear;
end;

procedure TfrmLogin.pnlbtnHelpLoginClick(Sender: TObject);
begin
  //Help button on login panel clicked
  Help('Login');
end;

procedure TfrmLogin.pnlbtnHelpSignUpClick(Sender: TObject);
begin
  //Help button on sign up panel clicked
  Help('SignUp');
end;

procedure TfrmLogin.pnlbtnLoginClick(Sender: TObject); //Login Button on Login Panel
var
 sUsername, sPassword : String;
 bFound : Boolean;
 iBut : Integer;
 fCurrent : TextFile;
begin
  //Input
  sUsername := lbledtUsername.Text;
  sPassword := Encrypt(lbledtPassword.Text);

  //Validation - Is the information that has been enterd too short
  if (Length(sUsername)<6) OR (Length(sPassword)<5) then
  begin //if it is too short, show erroe
    iBut := MessageDlg('The username must be at least five characters long, and the password at least 5 characters long.',mtError,[mbAbort],0);
  end;

  //Search for username in tblUsers
  bFound := False;
  dmTournamentData.tblUsers.First;
  while NOT(dmTournamentData.tblUsers.EOF) AND (bFound = False) do
  begin
    if dmTournamentData.tblUsers['Username'] = sUsername then //if the usernames match
    begin
      bFound := True;
      //code to execute if username is found - test if the passwords match
      if dmTournamentData.tblUsers['Password'] = sPassword then //if password matches
      begin
      //display first name
        iBut := MessageDlg('You''ve logged in successfully. Welcome '+dmTournamentData.tblUsers['First_Name'],mtInformation,[mbOk],0);
        //clear GUI components
        lbledtUsername.Clear;
        lbledtPassword.Clear;
        //Now, log the username into the text file so other forms can access it
        if FileExists('Current.txt') = False then
        begin
          iBut := MessageDlg('The ''Current.txt'' file could not be found. Contact your admin to fix this error.',mtError,[mbAbort],0);
          Exit;
        end;
        AssignFile(fCurrent,'Current.txt');
        rewrite(fCurrent);
        writeln(fCurrent,sUsername);
        closefile(fCurrent);
        //if the user is a manger, take them to the manage form
        if dmTournamentData.tblUsers['User_Type'] = 'M' then
        begin
            frmLogin.Hide;
            frmManage.Show;
        end //otherwise, take the viewer to the view form
          else begin
            frmLogin.Hide;
            frmView.Show;
          end;
      end //if
      else //if passwords don't match, show error message
      iBut := MessageDlg('The password entered does not match the username - Wrong password.',mtError,[mbAbort],0);
    end //if the usernames don't match, continue to next record
    else dmTournamentData.tblUsers.Next;
  end;//while

  if bFound = False then //if username not found in database, show error
  begin
  //code to execute if username isn't found
  //WriteLn(Log,TimeToStr(Now)+#9+'Username not found');
    iBut := MessageDlg('The username couldn''t be found. Try again or sign up.',mtError,[mbAbort],0);
  end;//if

end;

procedure TfrmLogin.pnlbtnRegClick(Sender: TObject);
var
  sName, sSurname, sPassword, sUsername, sTest, sLine : String;
  dDOB : TDate;
  iAge, iBut, k, iDateComp : Integer;
  bFound, bTest, bSpace : Boolean;
  FTeach : TextFile;
begin
  //Input
  sName := lbledtName.Text;
  sSurname := lbledtSurname.Text;
  dDOB := dtpDOB.Date;
  sPassword := lbedtRegPW.Text;

  //Validation
  //Does the teacher/organiser file exsist?
  if FileExists('Teachers.txt') = FALSE then //Test if the teachers file is there
  begin //if it isn't, show error and exit
    iBut := MessageDlg('The Teachers.txt file needed to complete sign up could not be found. Contact an admin to fix this error.',mtError,[mbAbort],0);
    Exit;
  end;
  AssignFile(FTeach,'Teachers.txt'); //if it is, it'll be assigned so it can be read later
  reset(FTeach);

  //Test if information has been entered:
  if (sName = '') OR (sSurname = '') or (dDOB = Date) or (sPassword = '') or (dtpDOB.Date = Date) then
  begin //if any component/variable is empty, show error message
    iBut := MessageDlg('You need to enter information in all of the fields to sign up.',mtError,[mbAbort],0);
    Exit;
  end;

  //Test if Name/Surname/Passowrd contains a space
  bSpace := False;
  for k := 1 to Length(sSurname) do
    if sSurname[k] = ' ' then
      bSpace := True;
  for k := 1 to Length(sName) do
    if sName[k] = ' ' then
      bSpace := True;
  for k := 1 to Length(sPassword) do
    if sPassword[k] = ' ' then
      bSpace := True;
  if bSpace then //if any of them do, show an error message
  begin
    iBut := MessageDlg('One of the fields you entered contains a space. Remove the space to continue.',mtError,[mbAbort],0);
    Exit;
  end;

  //Test if date is a future date
  iDateComp := CompareDate(Date, dDOB); //If the value is -1, it is a future date. Cannot enter future date as Birth Date
  if iDateComp < 0 then
  begin //show error message
    iBut := MessageDlg('The date you entered is a future date. Please enter a date that has already passed to sign up.',mtError,[mbAbort],0);
    Exit;
  end;

  //Test if information entered is long enough. This is required to generate a username
  if (Length(sName) < 2) OR (Length(sSurname) < 2) or (Length(sPassword) <5) then
  begin //if too short, show error
    iBut := MessageDlg('The name and surname fields must have a length of at least 2 characters, and the password must have at least 5 characters. Please make sure your fields have enough characters.',mtError,[mbAbort],0);
    Exit;
  end;
  //Test if information entered is too long - this is defnied by the database field lengths
  if (Length(sName) > 20) OR (Length(sSurname) > 20) OR (Length(sPassword) > 30) then
  begin //if too long, show error
    iBut := MessageDlg('The name and surname fields must have 20 characters or less, and the password must have 30 characters or less. Please make sure your fields aren''t too long. (This ensures data isn''t lost when stored)',mtError,[mbAbort],0);
    Exit;
  end;

  //Process
  iAge := YearsBetween(dDOB, Date); //Calculate the user's age
  sUsername := sName+sSurname+IntToStr(iAge); //Generate a username: Name+Surname+Age

  //Check if the username is already in the database
  bFound := False;
  while NOT(dmTournamentData.tblUsers.EOF) AND (bFound = False) do
  begin
    if uppercase(dmTournamentData.tblUsers['Username']) = uppercase(sUsername) then
    begin
      bFound := True;
      //if it is in the databse, show error and exit
      iBut := MessageDlg('The generated username: '+sUsername+' - is already in the database. Either use it to log in, or change a characteristic about your Name/Surname/DOB and try again.',mtError,[mbAbort],0);
      Exit;
    end //if
    else dmTournamentData.tblUsers.Next;
  end;//while

  if bFound = False then //if it isn't in the database, post info to database
  begin
    dmTournamentData.tblUsers.Insert;
    dmTournamentData.tblUsers['Username'] := sUsername;
    dmTournamentData.tblUsers['Password'] := Encrypt(sPassword);
    dmTournamentData.tblUsers['First_Name'] := sName;
    dmTournamentData.tblUsers['Last_Name'] := sSurname;
    dmTournamentData.tblUsers['Birth_Date'] := dDOB;
    dmTournamentData.tblUsers['User_Type'] := 'V'; //default: V - tournament viewer
    dmTournamentData.tblUsers.Post;
    iBut := MessageDlg('We have recored your information and it has been stored. To log in, use the username: '''+sUsername+''' (without apostrophes), and the password you entered.',mtConfirmation,[mbOk],0);
  //Go to login panel
  //Show login form and hide signup form
  pnlLoginForm.Show;
  pnlSignUpForm.Hide;
  //Position properly
  pnlLoginForm.Top := 0;
  pnlLoginForm.Left := 0;
  //Set focus on Username edit
  lbledtUsername.SetFocus;
  //Clear GUI components
  lbledtName.Clear;
  lbledtSurname.Clear;
  dtpDOB.Date := Date;
  lbedtRegPW.Clear;
  end;

  //Test if the user is a teacher/organiser
  sTest := sName+' '+sSurname; //first, combine name and surname
  bTest := False;
  while (NOT EOF(FTeach)) AND (bTest = False) do
  begin
    readln(FTeach, sLine);
    if sLine = sTest then //if the name in text file is the same as the user's name and surname
    begin
      bTest := True;
      //ask if they want to be a tournament manager/organiser
      iBut := MessageDlg('We found your name in the school''s teacher list. Do you want to be a tournament manager?',mtConfirmation,[mbYes,mbNo],0);
      if iBut = 6 then //if they click yes
      begin
        dmTournamentData.tblUsers.Edit;// change the user type to manager
        dmTournamentData.tblUsers['User_Type'] := 'M';
        dmTournamentData.tblUsers.Post;
        ShowMessage('We have updated your profile and you are now a tournament Manager!');//show message
      end//if yes pressed
      else
      begin
        ShowMessage('You will now be a tournament viewer. Contact the admin to change your user type.');//if they click no, this message will display.
      end;//else - clicked no
    end;//if teacher found
  end;//while

  closefile(FTeach);
end;

procedure TfrmLogin.pnlGoLoginClick(Sender: TObject);
begin
  //Go to login label clicked
  //Show login form and hide signup form
  pnlLoginForm.Show;
  pnlSignUpForm.Hide;
  //Position panel properly
  pnlLoginForm.Top := 0;
  pnlLoginForm.Left := 0;
  //Set focus
  lbledtUsername.SetFocus;

  //Clear GUI components
  lbledtName.Clear;
  lbledtSurname.Clear;
  lbedtRegPW.Clear;
  //Update DTP
  dtpDOB.Date := Date;

end;

end.
