unit termapi_quick;

interface

uses
  Windows, Messages, SysUtils, Forms, Dialogs, ftpapi, Classes;

type API_TERM_SA = array of AnsiString;

function terminal_nastav(typ_terminalu : String; ip_terminalu : String; port_terminalu : String; pos_id_terminalu : String; port_stanice : String; log_adresar : String) : Integer;
function terminal_platba(castka : String; symbol : String; mena : String) : Integer;
function terminal_navrat(castka : String; symbol : String; mena : String; PAN : String) : Integer;
function terminal_storno_posledni(autorizacni_kod : String) : Integer;
function terminal_posledni_platba() : Integer;
function terminal_verze() : String;
function terminal_zrus_akci() : Integer;
function terminal_handshake() : String;
function terminal_uzaverka() : Integer;
function terminal_tms_call() : Integer;
function terminal_hotovo() : Integer;
function terminal_pripojen_k_pc() : Boolean;
function terminal_bylo_autorizovano() : Boolean;
function terminal_vytisknout_uctenku() : Boolean;
function terminal_vyzaduje_podpis() : Boolean;
function terminal_text_pro_zakaznika(var radky : API_TERM_SA) : Integer;
function terminal_text_pro_obchodnika(var radky : API_TERM_SA) : Integer;
function terminal_autorizacni_kod() : String;
function terminal_PAN_karty() : String;
function terminal_chyba_kod() : String;
function terminal_chyba_text() : String;

var
  last_result : Integer;

  bef_typ_terminalu : String = '';
  bef_ip_terminalu : String = '';
  bef_port_terminalu : String = '';
  bef_pos_id_terminalu : String = '';
  bef_port_stanice : String = '';
  bef_log_adresar : String = '';

implementation

function terminal_nastav(typ_terminalu : String; ip_terminalu : String; port_terminalu : String; pos_id_terminalu : String; port_stanice : String; log_adresar : String) : Integer;
var
  tm_result : Integer;

begin
  term_init();

  (*
  if (
    (bef_typ_terminalu = typ_terminalu) and
    (bef_ip_terminalu = ip_terminalu) and
    (bef_port_terminalu = port_terminalu) and
    (bef_pos_id_terminalu = pos_id_terminalu) and
    (bef_port_stanice = port_stanice) and
    (bef_log_adresar = log_adresar)
  ) then
  begin
    result := 0;
  end
  else
  begin
    while (term_is_session_state_opened() = false) and (term_is_session_state_waiting_confirm() = false) do
    begin
      sleep(200);
    end;
  *)
    term_stop();

    tm_result := term_set_log_path(log_adresar);

    if (tm_result = 0) then
    begin
      tm_result := term_setup(typ_terminalu, ip_terminalu, port_terminalu, pos_id_terminalu, StrToInt(port_stanice));
    end;

    if (tm_result = 0) then
    begin
      bef_typ_terminalu := typ_terminalu;
      bef_ip_terminalu := ip_terminalu;
      bef_port_terminalu := port_terminalu;
      bef_pos_id_terminalu := pos_id_terminalu;
      bef_port_stanice := port_stanice;
      bef_log_adresar := log_adresar;
    end;

    result := tm_result;
  (*
  end;
  *)
end;

function terminal_platba(castka : String; symbol : String; mena : String) : Integer;
var
  mn_sep : Char;
  amount : Double;

begin
  mn_sep := SysUtils.DecimalSeparator;
  SysUtils.DecimalSeparator := '.';

  amount := StrToFloat(StringReplace(StringReplace(castka, '.', '', [rfIgnoreCase, rfReplaceAll]), ',', '.', [rfIgnoreCase, rfReplaceAll]));

  SysUtils.DecimalSeparator := mn_sep;

  last_result := term_payment_request(amount, symbol, mena);
  
  if (last_result >= 0) then
  begin
    while (term_is_session_state_opened() = false) and (term_is_session_state_waiting_confirm() = false) do
    begin
      sleep(200);
    end;

    if (term_is_session_state_waiting_confirm()) then last_result := 0
    else if (term_get_resp_err_approved()) then last_result := 0
    else last_result := -8011;
  end;

  result := last_result;
end;

function terminal_navrat(castka : String; symbol : String; mena : String; PAN : String) : Integer;
var
  mn_sep : Char;
  amount : Double;

begin
  mn_sep := SysUtils.DecimalSeparator;
  SysUtils.DecimalSeparator := '.';

  amount := StrToFloat(StringReplace(StringReplace(castka, '.', '', [rfIgnoreCase, rfReplaceAll]), ',', '.', [rfIgnoreCase, rfReplaceAll]));

  SysUtils.DecimalSeparator := mn_sep;

  last_result := term_refund_request(amount, symbol, mena, PAN);

  if (last_result >= 0) then
  begin
    while (term_is_session_state_opened() = false) and (term_is_session_state_waiting_confirm() = false) do
    begin
      sleep(200);
    end;

    if (term_is_session_state_waiting_confirm()) then last_result := 0
    else if (term_get_resp_err_approved()) then last_result := 0
    else last_result := -8011;
  end;

  result := last_result;
end;

function terminal_storno_posledni(autorizacni_kod : String) : Integer;
var
  mn_sep : Char;

begin
  last_result := term_reversal_request(autorizacni_kod);

  if (last_result >= 0) then
  begin
    while (term_is_session_state_opened() = false) and (term_is_session_state_waiting_confirm() = false) do
    begin
      sleep(200);
    end;

    if (term_is_session_state_waiting_confirm()) then last_result := 0
    else if (term_get_resp_err_approved()) then last_result := 0
    else last_result := -8011;
  end;

  result := last_result;
end;

function terminal_posledni_platba() : Integer;
begin
  last_result := term_last_result_request();

  if (last_result >= 0) then
  begin
    while (term_is_session_state_opened() = false) do
    begin
      sleep(200);
    end;

    if (term_get_resp_err_approved()) then last_result := 0
    else last_result := -8011;
  end;

  result := last_result;
end;

function terminal_verze() : String;
begin
  last_result := term_app_info_request();

  if (last_result >= 0) then
  begin
    while (term_is_session_state_opened() = false) do
    begin
      sleep(200);
    end;
  end;

  if (last_result >= 0) then
  begin
    result := term_get_status_version();    
  end
  else
  begin
    result := '';
  end;
end;

function terminal_zrus_akci() : Integer;
begin
  result := term_passivate_no_reply();
end;

function terminal_handshake() : String;
begin
  last_result := term_handshake();

  if (last_result >= 0) then
  begin
    while (term_is_session_state_opened() = false) do
    begin
      sleep(200);
    end;
  end;

  if (last_result >= 0) and (term_get_resp_err_approved()) then
  begin
    result := term_get_resp_server_message();
  end
  else
  begin
    result := '';
  end;
end;

function terminal_uzaverka() : Integer;
begin
  last_result := term_close_totals();

  if (last_result >= 0) then
  begin
    while (term_is_session_state_opened() = false) do
    begin
      sleep(200);
    end;

    if (term_get_resp_err_approved()) then last_result := 0
    else last_result := -8011;
  end;

  result := last_result;
end;

function terminal_tms_call() : Integer;
begin
  last_result := term_tms_call();

  if (last_result >= 0) then
  begin
    while (term_is_session_state_opened() = false) do
    begin
      sleep(200);
    end;

    if (term_get_resp_err_approved()) then last_result := 0
    else last_result := -8011;
  end;

  result := last_result;
end;

function terminal_hotovo() : Integer;
begin
  last_result := term_send_confirmation();
  result := last_result;
end;

function terminal_pripojen_k_pc() : Boolean;
begin
  last_result := term_app_info_request();

  if (last_result >= 0) then
  begin
    while (term_is_session_state_opened() = false) do
    begin
      sleep(200);
    end;
    
    if (term_get_resp_err_approved()) then last_result := 0
    else last_result := -8011;
  end;

  if (last_result >= 0) then
  begin
    result := true;
  end
  else
  begin
    result := false;
  end;
end;

function terminal_bylo_autorizovano() : Boolean;
begin
  result := term_get_resp_err_approved();
end;

function terminal_vytisknout_uctenku() : Boolean;
begin
  result := term_get_status_listecek(); 
end;

function terminal_vyzaduje_podpis() : Boolean;
begin
  result := term_get_status_podpis();
end;

procedure SplitStr(const Source, Delimiter : String; var DelimitedList : TStringList);
var
  s : PChar;

  DelimiterIndex : Integer;
  Item : String;
begin
  s := PChar(Source);

  repeat
    DelimiterIndex := Pos(Delimiter, s);
    if DelimiterIndex = 0 then Break;

    Item := Copy(s, 1, DelimiterIndex - 1);

    DelimitedList.Add(Item);

    inc(s, DelimiterIndex + Length(Delimiter) - 1);
    
  until DelimiterIndex = 0;

  DelimitedList.Add(s);
end;

function terminal_text_pro_zakaznika(var radky : API_TERM_SA) : Integer;
var
  tmp : String;
  lst : TStringList;
  sf : Integer;
begin
  tmp := term_get_resp_ticket_customer();
  
  lst := TStringList.Create;
  SplitStr(tmp, chr(10), lst);
  
  SetLength(radky, 0);
  SetLength(radky, lst.Count + 1);

  for sf := 0 to lst.Count - 1 do
  begin
    radky[sf + 1] := lst[sf];
  end;

  lst.Free;

  result := 0;
end;

function terminal_text_pro_obchodnika(var radky : API_TERM_SA) : Integer;
var
  tmp : String;
  lst : TStringList;
  sf : Integer;
begin
  tmp := term_get_resp_ticket_merchant();

  lst := TStringList.Create;
  SplitStr(tmp, chr(10), lst);

  SetLength(radky, 0);
  SetLength(radky, lst.Count + 1);

  for sf := 0 to lst.Count - 1 do
  begin
    radky[sf + 1] := lst[sf];
  end;

  lst.Free;

  result := 0;
end;

function terminal_autorizacni_kod() : String;
begin
  result := term_get_resp_approval_code();
end;

function terminal_PAN_karty() : String;
begin
  result := term_get_resp_pan();
end;

function terminal_chyba_kod() : String;
var
  str : String;
begin
  if (last_result <> 0) then
  begin
    str := 'E';
    str := str + IntToStr(last_result);
  end
  else
  begin
    if (term_get_resp_err_approved()) then
    begin
      str := '';
    end
    else
    begin
      str := 'T';
      str := str + IntToStr(term_get_resp_err_code());
    end;
  end;

  result := str;
end;

function terminal_chyba_text() : String;
var
  str : String;
  tmp : String;
begin
  str := '';

  tmp := term_get_status_internal_error();

  if (length(tmp) > 0) then
  begin
    str := tmp;
  end;

  if (term_get_resp_err_approved() = false) then
  begin
    tmp := term_get_resp_err_readable_info();

    if (length(tmp) > 0) then
    begin
      if (length(str) > 0) then str := str + ', ';
      str := str + tmp;
    end;
  end;

  result := str;
end;


end.
