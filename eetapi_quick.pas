unit eetapi_quick;

interface

function EET_dic_popl(hodnota : AnsiString) : Integer;
function EET_cesta_pkcs(cesta : AnsiString) : Integer;
function EET_cesta_pkcs_heslo(cesta : AnsiString; heslo : AnsiString) : Integer;

function EET_nastav_casove_pasmo(hodnota : AnsiString) : Integer;
function EET_nastav_url(hodnota : AnsiString) : Integer;
function EET_nastav_timeout(hodnota : Integer) : Integer;

function EET_vrat_casove_pasmo() : AnsiString;
function EET_vrat_url() : AnsiString;
function EET_vrat_timeout_pripojeni() : Integer;
function EET_vrat_timeout_pozadavek() : Integer;

function EET_nastav_string(parametr : AnsiString;hodnota : AnsiString) : Integer;
function EET_nastav_integer(parametr : AnsiString;hodnota : Integer) : Integer;
function EET_nastav_double(parametr : AnsiString;hodnota : Double) : Integer;

function EET_aktualni_cas() : AnsiString;
function EET_aktualni_cas_timezone(timezone : AnsiString) : AnsiString;

function EET_zahod_pozadavek_zacni_znovu() : Integer;

function EET_zjisti_kody(var BKP : AnsiString; var PKP : AnsiString) : Integer;
function EET_pozadavek_xml() : AnsiString;
function EET_odesli_zpravu(var FIK : AnsiString; var BKP : AnsiString; var PKP : AnsiString) : Integer;
function EET_odesli_zpravu_overeni(var FIK : AnsiString; var BKP : AnsiString; var PKP : AnsiString) : Integer;
function EET_otestuj_spojeni(var chyba : AnsiString) : Integer;

function EET_odpoved_xml() : AnsiString;
function EET_odpoved_hlavicky() : AnsiString;
function EET_odpoved_uuid_zpravy() : AnsiString;
function EET_odpoved_datum() : AnsiString;
function EET_odpoved_fik() : AnsiString;
function EET_odpoved_byl_test() : Boolean;
function EET_odpoved_chyba() : AnsiString;
function EET_odpoved_chyba_kod() : Integer;
function EET_odpoved_varovani() : AnsiString;
function EET_odpoved_varovani_kod() : Integer;

var
  g_eet_index : Integer = -1;

implementation

uses
  Dialogs, SysUtils, eetapi;

function EET_dic_popl(hodnota : AnsiString) : Integer;
begin
  eet_env_init;
  g_eet_index := eet_get(hodnota);
  result := g_eet_index;
end;

function EET_cesta_pkcs(cesta : AnsiString) : Integer;
begin
  eet_env_init;
  result := eet_set_pkcs(g_eet_index, cesta, '');
end;

function EET_cesta_pkcs_heslo(cesta : AnsiString; heslo : AnsiString) : Integer;
begin
  eet_env_init;
  result := eet_set_pkcs(g_eet_index, cesta, heslo);
end;

function EET_nastav_casove_pasmo(hodnota : AnsiString) : Integer;
begin
  result := eet_set_timezone(g_eet_index, hodnota);
end;

function EET_nastav_url(hodnota : AnsiString) : Integer;
begin
  result := eet_set_url(g_eet_index, hodnota);
end;

function EET_nastav_timeout(hodnota : Integer) : Integer;
begin
  result := eet_set_timeout(g_eet_index, hodnota, hodnota);
end;

function EET_vrat_casove_pasmo() : AnsiString;
begin
  result := eet_get_timezone(g_eet_index);
end;

function EET_vrat_url() : AnsiString;
begin
  result := eet_get_url(g_eet_index);
end;

function EET_vrat_timeout_pripojeni() : Integer;
begin
  result := eet_get_timeout_connect(g_eet_index);
end;

function EET_vrat_timeout_pozadavek() : Integer;
begin
  result := eet_get_timeout_request(g_eet_index);
end;

function EET_nastav_string(parametr : AnsiString; hodnota : AnsiString) : Integer;
var
  tmp : Integer;
begin
  eet_env_init;
  tmp := eet_create_request_once(g_eet_index);

  if (tmp = 0) then
  begin
    if (parametr = 'overeni') or (parametr = 'prvni_zaslani') then
    begin
      if (hodnota = 'true') or (hodnota = 'True') or (hodnota = 'TRUE') then hodnota := '1'
      else if (hodnota = 'false') or (hodnota = 'False') or (hodnota = 'FALSE') then hodnota := '0';
    end;

    result := eet_request_set_any(g_eet_index, parametr, hodnota);
  end
  else
  begin
    result := tmp;
  end;
end;

function EET_nastav_integer(parametr : AnsiString; hodnota : Integer) : Integer;
var
  tmp : Integer;
begin
  eet_env_init;
  tmp := eet_create_request_once(g_eet_index);

  if (tmp = 0) then
  begin
    result := eet_request_set_int(g_eet_index, parametr, hodnota);
  end
  else
  begin
    result := tmp;
  end;
end;

function EET_nastav_double(parametr : AnsiString; hodnota : Double) : Integer;
var
  tmp : Integer;
begin
  eet_env_init;
  tmp := eet_create_request_once(g_eet_index);

  if (tmp = 0) then
  begin
    result := eet_request_set_double(g_eet_index, parametr, hodnota);
  end
  else
  begin
    result := tmp;
  end;
end;

function EET_aktualni_cas() : AnsiString;
var
  tmp : Integer;
begin
  eet_env_init;
  result := eet_request_get_some_now();
end;

function EET_aktualni_cas_timezone(timezone : AnsiString) : AnsiString;
var
  tmp : Integer;
begin
  eet_env_init;
  result := eet_request_get_some_now_tz(timezone);
end;

function EET_zahod_pozadavek_zacni_znovu() : Integer;
begin
  eet_env_init;
  result := eet_drop_request(g_eet_index);
end;

function EET_zjisti_kody(var BKP : AnsiString; var PKP : AnsiString) : Integer;
var
  tmp : Integer;
begin
  eet_env_init;
  tmp := eet_request_compose_result(g_eet_index);

  if (tmp = -16) then
  begin
    tmp := eet_request_compose(g_eet_index);
  end;

  if (tmp = 0) then
  begin
    BKP := eet_request_get_bkp_signed(g_eet_index);
    PKP := eet_request_get_pkp_signed(g_eet_index);
  end;

  result := tmp;
end;

function EET_pozadavek_xml() : AnsiString;
begin
  result := eet_request_get_xml_source(g_eet_index);
end;

function EET_odesli_zpravu(var FIK : AnsiString; var BKP : AnsiString; var PKP : AnsiString) : Integer;
var
  tmp : Integer;
begin
  eet_env_init;

  tmp := eet_request_set_int(g_eet_index, 'overeni', 0);

  if (tmp = 0) then
  begin
    tmp := eet_request_compose_result(g_eet_index);

    if (tmp = -16) then
    begin
      tmp := eet_request_compose(g_eet_index);
    end;
  end;

  if (tmp = 0) then
  begin
    tmp := eet_request_send(g_eet_index);
  end;

  if (tmp = 0) then
  begin
    FIK := eet_request_get_response_fik(g_eet_index);
    BKP := eet_request_get_bkp_signed(g_eet_index);
    PKP := eet_request_get_pkp_signed(g_eet_index);
  end
  else
  begin
    BKP := eet_request_get_bkp_signed(g_eet_index);
    PKP := eet_request_get_pkp_signed(g_eet_index);
  end;

  result := tmp;
end;

function EET_odesli_zpravu_overeni(var FIK : AnsiString; var BKP : AnsiString; var PKP : AnsiString) : Integer;
var
  tmp : Integer;
begin
  eet_env_init;

  tmp := eet_request_set_int(g_eet_index, 'overeni', 1);

  if (tmp = 0) then
  begin
    tmp := eet_request_compose_result(g_eet_index);

    if (tmp = -16) then
    begin
      tmp := eet_request_compose(g_eet_index);
    end;
  end;

  if (tmp = 0) then
  begin
    tmp := eet_request_send(g_eet_index);
  end;

  if (tmp = 0) then
  begin
    FIK := eet_request_get_response_fik(g_eet_index);
    BKP := eet_request_get_bkp_signed(g_eet_index);
    PKP := eet_request_get_pkp_signed(g_eet_index);
  end
  else
  begin
    BKP := eet_request_get_bkp_signed(g_eet_index);
    PKP := eet_request_get_pkp_signed(g_eet_index);
  end;

  result := tmp;
end;

function EET_otestuj_spojeni(var chyba : AnsiString) : Integer;
begin
  chyba := '';
  result := 0;
end;

function EET_odpoved_xml() : AnsiString;
begin
  result := eet_request_get_response_data(g_eet_index);
end;

function EET_odpoved_hlavicky() : AnsiString;
begin
  result := eet_request_get_response_header(g_eet_index);
end;

function EET_odpoved_uuid_zpravy() : AnsiString;
begin
  result := eet_request_get_response_uuid_zpravy(g_eet_index);
end;

function EET_odpoved_datum() : AnsiString;
begin
  result := eet_request_get_response_datum(g_eet_index);
end;

function EET_odpoved_fik() : AnsiString;
begin
  result := eet_request_get_response_fik(g_eet_index);
end;

function EET_odpoved_byl_test() : Boolean;
begin
  result := eet_request_get_response_test(g_eet_index);
end;

function EET_odpoved_chyba() : AnsiString;
begin
  result := eet_request_get_response_chyba(g_eet_index);
end;

function EET_odpoved_chyba_kod() : Integer;
begin
  result := eet_request_get_response_chyba_kod(g_eet_index);
end;

function EET_odpoved_varovani() : AnsiString;
begin
  result := eet_request_get_response_varovani(g_eet_index);
end;

function EET_odpoved_varovani_kod() : Integer;
begin
  result := eet_request_get_response_varovani_kod(g_eet_index);
end;


end.
