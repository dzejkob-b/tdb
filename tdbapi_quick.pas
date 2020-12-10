unit tdbapi_quick;

interface

type API_SA = array of AnsiString;

API_TBL = record
  name : String;
  code_start : Integer;
  code_end : Integer;
  status : Boolean;
  saved : Boolean;
  index : Integer;
end;

API_TBLRES = record
  left : String;
  middle : String;
  right : String;
end;

function API_zacatek(spojeni : AnsiString) : Integer;
function API_prihlasit(heslo : AnsiString) : AnsiString;
function API_prihlasit_full(heslo : AnsiString; vynucene : Boolean) : AnsiString;
function API_je_prihlasen(hash : AnsiString) : Integer;
function API_konec() : Integer;
function API_vypnout() : Integer;
function API_sestrelit() : Integer;
function API_test() : Integer;
function API_test_zapis(nazev_databaze : AnsiString) : Integer;
function API_verze_klient() : Integer;
function API_verze_server() : Integer;
function API_databaze_v_poradku(nazev_databaze : AnsiString) : Boolean;
function API_oprava_A(nazev_databaze : AnsiString) : Integer;
function API_oprava_B(nazev_databaze : AnsiString) : Integer;
function API_oprava_C(nazev_databaze : AnsiString) : Integer;
function API_vytahnout_data(nazev_databaze : AnsiString) : AnsiString;
function API_vytahnout_data_vcetne_chyb(nazev_databaze : AnsiString) : AnsiString;
function API_ulozit_data(nazev_databaze : AnsiString; data : AnsiString) : Integer;
function API_server_spusten() : Integer;
procedure API_nastav_pocet_radku_v_paketu_cteni(pocet : Integer);
procedure API_nastav_pocet_radku_v_paketu_zapis(pocet : Integer);

function predpis_tabulky_full(nazev_tabulky : String; code_start : Integer; code_end : Integer; allow_change : Boolean) : Boolean;
function predpis_tabulky(nazev_tabulky : String; code_start : Integer; code_end : Integer) : Boolean;
function predpis_tabulky_se_zmenou(nazev_tabulky : String; code_start : Integer; code_end : Integer) : Boolean;
function nacti_predpisy() : Integer;
function vrat_predpis(nazev_tabulky : String) : API_TBL;
function smaz_predpis(index : Integer) : Integer;
function uloz_predpis(index : Integer) : Integer;
function zjisti_predpis(nazev_tabulky : String) : API_TBL;
function aplikuj_predpis(predpis : API_TBL; vstup : AnsiString) : API_TBLRES;
function sestav_dle_predpisu(predpis : API_TBL; vstup : API_TBLRES) : String;

function seznam_databazi(var data : API_SA) : Integer;
function nastav_heslo(nazev_databaze : AnsiString; heslo : AnsiString) : Integer;
function vytvorena_databaze(nazev_databaze : AnsiString) : Boolean;
function vyber_databazi(nazev_databaze : AnsiString; pobocka : AnsiString) : Integer;
function vytvor_databazi(nazev_databaze : AnsiString) : Integer;
function odstran_databazi(nazev_databaze : AnsiString) : Integer;
function preusporadej_databazi() : Integer;

function seznam_tabulek(var data : API_SA) : Integer;
function seznam_tabulek_detail(var data : API_SA) : Integer;
function seznam_tabulek_detail_vyber(var data : API_SA; seznam_tabulek : API_SA) : Integer;
function vymaz_prazdne_tabulky() : Integer;
function vytvorena_tabulka(nazev_tabulky : AnsiString) : Boolean;
function vytvor_tabulku(nazev_tabulky : AnsiString) : Integer;
function odstran_tabulku(nazev_tabulky : AnsiString) : Integer;

function uloz_pole_do_table(data : API_SA; nazev_tabulky : AnsiString) : Integer;
function pridej_pole_do_table(data : API_SA; nazev_tabulky : AnsiString) : Integer;
function pridej_pole_do_table_bez_kuss(data : API_SA; nazev_tabulky : AnsiString) : Integer;
function smaz_pole_v_table(data : API_SA; nazev_tabulky : AnsiString) : Integer;

function table_velikost(nazev_tabulky : AnsiString) : Integer;

function table_do_pole_limit(var data : API_SA; nazev_tabulky : AnsiString; zacatek : Integer; pocet : Integer) : Integer;
function table_do_pole(var data : API_SA; nazev_tabulky : AnsiString) : Integer;
function table_do_string_limit(nazev_tabulky : AnsiString; zacatek : Integer; pocet : Integer) : AnsiString;
function table_do_string(nazev_tabulky : AnsiString) : AnsiString;
function table_do_string_fajl(nazev_tabulky : AnsiString; nazev_souboru : AnsiString) : Boolean;
function table_vycucni(nazev_tabulky : AnsiString) : AnsiString;
function table_vycucni_fajl(nazev_tabulky : AnsiString; nazev_souboru : AnsiString) : Boolean;
function kody_do_pole(var data : API_SA; nazev_tabulky : AnsiString) : Integer;
function kody_table_do_pole(data_kod : API_SA; var data_hodnota : API_SA; nazev_tabulky : AnsiString) : Integer;
function kody_cas_vytvoreni_do_pole(data_kod : API_SA; var data_hodnota : API_SA; nazev_tabulky : AnsiString) : Integer;
function kody_cas_zmeny_do_pole(data_kod : API_SA; var data_hodnota : API_SA; nazev_tabulky : AnsiString) : Integer;
function kody_cas_zmeny_do_pole_od_hranice(hranice : AnsiString; data_kod : API_SA; var data_hodnota : API_SA; nazev_tabulky : AnsiString) : Integer;
function kody_cas_zmeny_do_pole_od_hranice_zaznamy(hranice : AnsiString; data_kod : API_SA; var data_hodnota : API_SA; nazev_tabulky : AnsiString) : Integer;
function kody_cas_zmeny_do_pole_od_hranice_vse_zaznamy(hranice : AnsiString; var data_hodnota : API_SA; nazev_tabulky : AnsiString) : Integer;
function kody_cas_zmeny_do_pole_od_hranice_full(return_all : Boolean; return_data : Boolean; hranice : AnsiString; data_kod : API_SA; var data_hodnota : API_SA; nazev_tabulky : AnsiString) : Integer;

function vrat_pole_kuss(st : Integer; en : Integer; kuss : AnsiString; var data : API_SA; nazev_tabulky : AnsiString) : Integer;

function zapis_prvek(text : AnsiString; nazev_tabulky : AnsiString) : Integer;
function smaz_prvek_kod(kod : AnsiString; nazev_tabulky : AnsiString) : Integer;
function smaz_prvek_radek(radek : AnsiString; nazev_tabulky : AnsiString) : Integer;
function vrat_zaznam(kod : AnsiString; nazev_tabulky : AnsiString) : String;
function vrat_zaznam_posledni_vytvoreny(nazev_tabulky : AnsiString) : String;
function vrat_zaznam_posledni_zmeneny(nazev_tabulky : AnsiString) : String;
function vrat_cas_posledni_vytvoreny(nazev_tabulky : AnsiString) : String;
function vrat_cas_posledni_zmeneny(nazev_tabulky : AnsiString) : String;
function pricti_mnozstvi_kod(kod : AnsiString; mnozstvi : Integer; nazev_tabulky : AnsiString) : Integer;
function pricti_mnozstvi_kod_pole(data : API_SA; data_mnozstvi : API_SA; nazev_tabulky : AnsiString) : Integer;
function pricti_mnozstvi_kod_currency(kod : AnsiString; mnozstvi : Currency; nazev_tabulky : AnsiString) : Integer;
function pricti_mnozstvi_kod_currency_pole(data : API_SA; data_mnozstvi : API_SA; nazev_tabulky : AnsiString) : Integer;

function posledni_kod(nazev_tabulky : AnsiString) : String;
function pozice_kodu(kod : AnsiString; nazev_tabulky : AnsiString) : Integer;
function smaz_prvek_na_pozici(pozice : Integer; nazev_tabulky : AnsiString) : Integer;
function nahrad_prvek_na_pozici(pozice : Integer; text : AnsiString; nazev_tabulky : AnsiString) : Integer;

function odstran_smazane(nazev_tabulky : AnsiString) : Integer;
function odstran_smazane_starsi_dni(nazev_tabulky : AnsiString; pocet_dni : Integer) : Integer;
function precetl_tabulku(nazev_tabulky : AnsiString) : Integer;

function podej_zmeny_do_pole(var data : API_SA; nazev_tabulky : AnsiString) : Integer;
function podej_smazane_do_pole(var data : API_SA; nazev_tabulky : AnsiString) : Integer;
function podej_zmeny_a_smazane_do_pole(var data : API_SA; nazev_tabulky : AnsiString) : Integer;

var
  g_api_env_init : Boolean = False;
  g_api_init : Boolean = False; // priznak ktery slouzil pro pripojeno / nepripojeno - nepouziva se (nikde se nenastavi na true)
  g_layer_index : Integer = -1;
  g_database_index : Integer = -1;
  g_predef : Array of API_TBL;
  g_predef_len : Integer = 0;
  g_chunk_read : Integer = 2000;
  g_chunk_write : Integer = 2000;

  g_spojeni : AnsiString = '';
  g_nazev_databaze : AnsiString = '';
  g_pobocka : AnsiString = '';
  g_heslo : AnsiString = '';
  g_current_hash : AnsiString = '';

implementation

uses
  Dialogs, SysUtils, tdbapi;

function API_zacatek(spojeni : AnsiString) : Integer;
begin
  if (g_api_env_init = False) then
  begin
    db_env_init();
    g_api_env_init := True;
  end;

  if (g_api_init) then
  begin
    if (spojeni <> g_spojeni) then
    begin
      API_konec();
      result := API_zacatek(spojeni);
    end
    else
    begin
      result := g_layer_index;
    end;

  end
  else
  begin
    if (spojeni <> g_spojeni) then
    begin
      g_layer_index := -1;
      g_database_index := -1;

      g_spojeni := spojeni;
      g_nazev_databaze := '';
      g_pobocka := '';
      g_heslo := '';
      g_current_hash := '';

      g_layer_index := layer_get(spojeni);
      result := g_layer_index;

    end
    else
    begin
      result := g_layer_index;
    end;
  end;
end;

function API_prihlasit(heslo : AnsiString) : AnsiString;
begin
  result := API_prihlasit_full(heslo, False);
end;

function API_prihlasit_full(heslo : AnsiString; vynucene : Boolean) : AnsiString;
begin
  if (heslo <> g_heslo) or vynucene then
  begin
    g_current_hash := layer_authorize(g_layer_index, '', heslo);
    g_heslo := '';
    
    if (Length(g_current_hash) > 0) then
    begin
      g_heslo := heslo;

      if (layer_set_auth_hash(g_layer_index, g_current_hash) <> 0) then
      begin
        g_current_hash := '';
        g_heslo := '';
      end;
    end;
  end;

  result := g_current_hash;
end;

function API_je_prihlasen(hash : AnsiString) : Integer;
begin
  result := layer_is_authorized(g_layer_index, '', hash);
end;

function API_konec() : Integer;
begin
  if (g_layer_index >= 0) then
  begin
    database_free(g_database_index);
    layer_free(g_layer_index);

    g_spojeni := '';
    g_nazev_databaze := '';
    g_pobocka := '';
    g_heslo := '';
    g_current_hash := '';
  end;
  {*
  if (g_api_init) then
  begin
    database_free(g_database_index);
    layer_free(g_layer_index);

    ShowMessage('free');

    g_spojeni := '';
    g_nazev_databaze := '';
    g_pobocka := '';
    g_heslo := '';
    g_current_hash := '';

    g_api_init := False;
    result := 0
  end
  else
  begin
    result := -1
  end;
  *}
end;

function API_vypnout() : Integer;
begin
  result := layer_stop(g_layer_index);
end;

function API_sestrelit() : Integer;
begin
  result := layer_crash(g_layer_index);
end;

function API_test() : Integer;
begin
  result := layer_test(g_layer_index);
end;

function API_test_zapis(nazev_databaze : AnsiString) : Integer;
begin
  result := layer_test_full(g_layer_index, nazev_databaze);
end;

function API_verze_klient() : Integer;
begin
  result := layer_get_client_version(g_layer_index);
end;

function API_verze_server() : Integer;
begin
  result := layer_get_server_version(g_layer_index);
end;

function API_databaze_v_poradku(nazev_databaze : AnsiString) : Boolean;
begin
  result := (layer_test_corrupted(g_layer_index, nazev_databaze) = 0);
end;

function API_oprava_A(nazev_databaze : AnsiString) : Integer;
begin
  result := layer_repair_level_a(g_layer_index, nazev_databaze);
end;

function API_oprava_B(nazev_databaze : AnsiString) : Integer;
begin
  result := layer_repair_level_b(g_layer_index, nazev_databaze);
end;

function API_oprava_C(nazev_databaze : AnsiString) : Integer;
begin
  result := layer_repair_level_c(g_layer_index, nazev_databaze);
end;

function API_vytahnout_data(nazev_databaze : AnsiString) : AnsiString;
begin
  result := layer_make_dump_read(g_layer_index, nazev_databaze, false);
end;

function API_vytahnout_data_vcetne_chyb(nazev_databaze : AnsiString) : AnsiString;
begin
  result := layer_make_dump_read(g_layer_index, nazev_databaze, true);
end;

function API_ulozit_data(nazev_databaze : AnsiString; data : AnsiString) : Integer;
begin
  result := layer_read_dump_content(g_layer_index, nazev_databaze, data);
end;

function API_server_spusten() : Integer;
begin
  if (g_api_env_init = False) then
  begin
    db_env_init();
    g_api_env_init := True;
  end;

  result := layer_service_runing();
end;

procedure API_nastav_pocet_radku_v_paketu_cteni(pocet : Integer);
begin
  g_chunk_read := pocet;
end;

procedure API_nastav_pocet_radku_v_paketu_zapis(pocet : Integer);
begin
  g_chunk_write := pocet;
end;

function predpis_tabulky_full(nazev_tabulky : String; code_start : Integer; code_end : Integer; allow_change : Boolean) : Boolean;
var
  tbl : API_TBL;
begin
  if (code_start > 0) and (code_end > 0) then
  begin
    tbl := vrat_predpis(nazev_tabulky);

    if (tbl.status = False) then
    begin
      SetLength(g_predef, g_predef_len + 1);

      g_predef[g_predef_len].name := nazev_tabulky;
      g_predef[g_predef_len].code_start := code_start;
      g_predef[g_predef_len].code_end := code_end;
      g_predef[g_predef_len].status := True;
      g_predef[g_predef_len].saved := False;
      g_predef[g_predef_len].index := g_predef_len;

      uloz_predpis(g_predef_len);

      g_predef_len := g_predef_len + 1;

      result := True;

    end
    else if (allow_change) and ((tbl.saved = False) or (tbl.code_start <> code_start) or (tbl.code_end <> code_end)) then
    begin
      g_predef[tbl.index].code_start := code_start;
      g_predef[tbl.index].code_end := code_end;

      uloz_predpis(tbl.index);

      result := True;

    end
    else
    begin
      result := False;
    end;
  end
  else
  begin
	result := True;
  end;
end;

function predpis_tabulky(nazev_tabulky : String; code_start : Integer; code_end : Integer) : Boolean;
begin
  result := predpis_tabulky_full(nazev_tabulky, code_start, code_end, False);
end;

function predpis_tabulky_se_zmenou(nazev_tabulky : String; code_start : Integer; code_end : Integer) : Boolean;
begin
  result := predpis_tabulky_full(nazev_tabulky, code_start, code_end, True);
end;

function nacti_predpisy() : Integer;
var
  query_index : Integer;
  result_index : Integer;
  total_count : Integer;
  total_index : Integer;
  loop : Integer;
  loop_max : Integer;
  code_start : Integer;
  code_end : Integer;

begin
  query_index := query_born(g_database_index, '_table_predef', '', '');

  if (query_index > 0) then
  begin
    result_index := query_process_limit(query_index, -1, -1, false);
    loop_max := result_set_get_count(result_index);
    g_predef_len := 0;

    for loop := 0 to (loop_max - 1) do
    begin
      code_start := result_set_item_get_int(result_index, loop, 'code_start');
      code_end := result_set_item_get_int(result_index, loop, 'code_end');

      if (code_start > 0) and (code_end > 0) then
      begin
        SetLength(g_predef, g_predef_len + 1);

        g_predef[g_predef_len].name := result_set_item_get_text_output(result_index, loop, 'name');
        g_predef[g_predef_len].code_start := result_set_item_get_int(result_index, loop, 'code_start');
        g_predef[g_predef_len].code_end := result_set_item_get_int(result_index, loop, 'code_end');
        g_predef[g_predef_len].status := True;
        g_predef[g_predef_len].saved := True;
        g_predef[g_predef_len].index := loop;

        g_predef_len := g_predef_len + 1;
      end;
    end;

    result_set_free(result_index);

    result := query_index;
    query_free(query_index);
  end
  else
  begin
    result := query_index;
  end;
end;

function smaz_predpis(index : Integer) : Integer;
var
  result_index : Integer;
  push_result : Integer;
begin
  result_index := database_born_result_set(g_database_index, '_table_predef');

  if (result_index > 0) then
  begin
    result_set_item_insert(result_index);
    result_set_item_set_text(result_index, 0, 'name', g_predef[index].name);
    result_set_item_drop(result_index, 0);
    
    push_result := database_push_result_set(g_database_index, result_index);
    result_set_free(result_index);

    if (push_result = 0) then
    begin
      g_predef[index].saved := False;
    end;

    result := push_result;
    
  end
  else
  begin
    result := result_index;
  end;
end;

function uloz_predpis(index : Integer) : Integer;
var
  table_index : Integer;
  set_index : Integer;
begin
  if (g_predef[index].saved = False) then
  begin
    if (table_exist(g_database_index, '_table_predef') = False) then
    begin
      table_index := table_born(g_database_index, '_table_predef');
      table_column_add(table_index, 'text_short', 'name', True);
      table_column_add(table_index, 'int', 'code_start', False);
      table_column_add(table_index, 'int', 'code_end', False);
      table_create(g_database_index, table_index);
      table_free(table_index);
    end;

    set_index := database_born_result_set(g_database_index, '_table_predef');
    result_set_item_insert(set_index);
    result_set_item_set_text(set_index, 0, 'name', g_predef[index].name);
    result_set_item_set_int(set_index, 0, 'code_start', g_predef[index].code_start);
    result_set_item_set_int(set_index, 0, 'code_end', g_predef[index].code_end);

    if (database_push_result_set(g_database_index, set_index) = 0) then
    begin
      g_predef[index].saved := True;
    end;

    result_set_free(set_index);
  end;
end;

function zjisti_predpis(nazev_tabulky : String) : API_TBL;
var
  res : API_TBL;
  query_index : Integer;
  set_index : Integer;

  code_start : Integer;
  code_end : Integer;

begin
  res.name := nazev_tabulky;
  res.code_start := 0;
  res.code_end := 0;
  res.status := False;

  query_index := query_born(g_database_index, '_table_predef', '', 'name = @1');
  query_param_add_text(query_index, nazev_tabulky);
  set_index := query_process_limit(query_index, -1, -1, false);

  if (query_get_count(query_index) > 0) and (set_index > 0) then
  begin
    code_start := result_set_item_get_int(set_index, 0, 'code_start');
    code_end := result_set_item_get_int(set_index, 0, 'code_end');

    if (code_start > 0) and (code_end > 0) then
    begin
      res.code_start := code_start;
      res.code_end := code_end;
      res.status := True;
    end;
  end;

  query_free(query_index);

  result := res;
end;

function vrat_predpis(nazev_tabulky : String) : API_TBL;
var
  founded : Boolean;
  pos : Integer;
  final : API_TBL;
  tbl : API_TBL;
begin
  founded := False;
  pos := 0;

  final.Status := False;

  while (founded = False) and (pos < g_predef_len) do
  begin
    if (g_predef[pos].name = nazev_tabulky) then founded := True
    else pos := pos + 1;
  end;

  if (founded) then
  begin
    final := g_predef[pos];
  end
  else
  begin
    final.status := False;

    tbl := zjisti_predpis(nazev_tabulky);
    
    if (tbl.status = True) then
    begin
      SetLength(g_predef, g_predef_len + 1);

      g_predef[g_predef_len] := tbl;
      g_predef[g_predef_len].index := g_predef_len;

      g_predef_len := g_predef_len + 1;

      final := tbl;
    end
    else
    begin
      final.code_start := 0;
      final.code_end := 0;
    end;
  end;

  result := final;
end;

function aplikuj_predpis(predpis : API_TBL; vstup : AnsiString) : API_TBLRES;
var
  final : API_TBLRES;
begin
  if (predpis.code_start > 1) then final.left := Copy(vstup, 1, predpis.code_start - 1)
  else final.left := '';

  final.middle := Trim(Copy(vstup, predpis.code_start, predpis.code_end - predpis.code_start + 1));
  final.right := Copy(vstup, predpis.code_end + 1, Length(vstup) - predpis.code_end + 1);

  result := final;
end;

function sestav_dle_predpisu(predpis : API_TBL; vstup : API_TBLRES) : String;
var
  final : String;
  sf : Integer;
  diff : Integer;
begin
  diff := predpis.code_start - Length(vstup.left) - 1;
  final := vstup.left;

  for sf := 1 to diff do
  begin
    final := final + ' ';
  end;

  diff := predpis.code_end - predpis.code_start + 1 - Length(vstup.middle);
  final := final + vstup.middle;

  for sf := 1 to diff do
  begin
    final := final + ' ';
  end;
  
  final := final + vstup.right;

  result := final;
end;

function seznam_databazi(var data : API_SA) : Integer;
var
  cnt : Integer;
  loop : Integer;
begin
  cnt := database_get_list_count(g_layer_index);

  if (cnt >= 0) then
  begin
    SetLength(data, cnt + 1);

    for loop := 0 to cnt - 1 do
    begin
      data[loop + 1] := database_get_list_name(g_layer_index, loop);
    end;
  end;
end;

function nastav_heslo(nazev_databaze : AnsiString; heslo : AnsiString) : Integer;
begin
  result := layer_set_password(g_layer_index, nazev_databaze, heslo);
end;

function vytvorena_databaze(nazev_databaze : AnsiString) : Boolean;
begin
  result := database_exist(g_layer_index, nazev_databaze);
end;

function vyber_databazi(nazev_databaze : AnsiString; pobocka : AnsiString) : Integer;
begin
  if (g_nazev_databaze <> nazev_databaze) or (g_pobocka <> pobocka) then
  begin
    g_nazev_databaze := nazev_databaze;
    g_pobocka := pobocka;
    g_database_index := database_get_branch(g_layer_index, nazev_databaze, pobocka);
    result := g_database_index;
    nacti_predpisy();
  end
  else
  begin
    result := g_database_index;
  end;
end;

function vytvor_databazi(nazev_databaze : AnsiString) : Integer;
begin
  result := database_create(g_layer_index, nazev_databaze);
end;

function odstran_databazi(nazev_databaze : AnsiString) : Integer;
begin
  result := database_drop(g_layer_index, nazev_databaze);
end;

function preusporadej_databazi() : Integer;
begin
  result := database_command(g_layer_index, g_database_index, 'VACUUM');
end;

function seznam_tabulek(var data : API_SA) : Integer;
var
  cnt : Integer;
  loop : Integer;
begin
  cnt := table_get_list_count(g_database_index);

  if (cnt >= 0) then
  begin
    SetLength(data, cnt + 1);

    for loop := 0 to cnt - 1 do
    begin
      data[loop + 1] := table_get_list_name(g_database_index, loop);
    end;
  end;

  result := 0;
end;

function seznam_tabulek_detail(var data : API_SA) : Integer;
var
  tmp : AnsiString;
  f : Integer;
  toadd : AnsiString;
  pos : Integer;
begin
  tmp := table_get_list_detailed(g_database_index);
  pos := 0;

  for f := 1 to Length(tmp) do
  begin
    if (tmp[f] = '~') then
    begin
      SetLength(data, pos + 2);
      data[pos + 1] := toadd;
      toadd := '';
      pos := pos + 1;
    end
    else
    begin
      toadd := toadd + tmp[f];
    end;
  end;

  SetLength(data, pos + 2);
  data[pos + 1] := toadd;
end;

function seznam_tabulek_detail_vyber(var data : API_SA; seznam_tabulek : API_SA) : Integer;
var
  tmp : AnsiString;
  f : Integer;
  toadd : AnsiString;
  pos : Integer;
  tlist : AnsiString;
begin
  tlist := '|';

  for f := 1 to Length(seznam_tabulek) - 1 do
  begin
    tlist := tlist + seznam_tabulek[f] + '|';
  end;

  tmp := table_get_list_detailed_specific(g_database_index, tlist);
  pos := 0;

  for f := 1 to Length(tmp) do
  begin
    if (tmp[f] = '~') then
    begin
      SetLength(data, pos + 2);
      data[pos + 1] := toadd;
      toadd := '';
      pos := pos + 1;
    end
    else
    begin
      toadd := toadd + tmp[f];
    end;
  end;

  SetLength(data, pos + 2);
  data[pos + 1] := toadd;
end;

function vymaz_prazdne_tabulky() : Integer;
var
  data : API_SA;
  res : Integer;
  res_b : Integer;
  sf : Integer;
  cnt : Integer;
begin
  res := seznam_tabulek(API_SA(data));

  if (res = 0) then
  begin
    for sf := 1 to Length(data) - 1 do
    begin
      cnt := table_record_count(g_database_index, data[sf]);

      if (cnt = 0) then
      begin
        res_b := odstran_tabulku(data[sf]);
        if (res_b <> 0) then
        begin
          res := res_b;
        end;
      end;
    end;
  end;

  result := res;
end;

function vytvorena_tabulka(nazev_tabulky : AnsiString) : Boolean;
begin
  result := table_exist(g_database_index, nazev_tabulky);
end;

function vytvor_tabulku(nazev_tabulky : AnsiString) : Integer;
var
  table_index : Integer;
  tbl : API_TBL;
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    if (table_exist(g_database_index, nazev_tabulky)) then
    begin
      result := -8;
    end
    else
    begin
      table_index := table_born_branch(g_database_index, nazev_tabulky);

      table_column_add(table_index, 'text_short', 'kod', True);
      table_column_add(table_index, 'text_long', 'hodnota', False);
      table_column_add(table_index, 'text_short', 'predpona', False);

      result := table_create(g_database_index, table_index);
      table_free(table_index);
    end;
  end
  else result := -1;
end;

function odstran_tabulku(nazev_tabulky : AnsiString) : Integer;
var
  tbl : API_TBL;
begin
  result := table_drop(g_database_index, nazev_tabulky);
  
  tbl := vrat_predpis(nazev_tabulky);
  if (tbl.Status = True) then
  begin
    smaz_predpis(tbl.index);
  end;
end;

function uloz_pole_do_table(data : API_SA; nazev_tabulky : AnsiString) : Integer;
var
  result_index : Integer;

  total_count : Integer;
  total_index : Integer;
  cnt : Integer;
  loop : Integer;

  tbl : API_TBL;
  res : API_TBLRES;
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    total_index := 1;
    total_count := Length(data);

    while (total_index < total_count) do
    begin
      result_index := database_born_result_set(g_database_index, nazev_tabulky);

      if (result_index > 0) then
      begin

        if (total_index = 1) then
        begin
          result_set_clean_flag(result_index);
        end;

        cnt := g_chunk_write;
        if (total_index + g_chunk_write >= total_count) then
        begin
          cnt := total_count - total_index;
        end;

        for loop := 0 to cnt - 1 do
        begin
          res := aplikuj_predpis(tbl, data[total_index + loop]);

          result_set_item_insert(result_index);
          result_set_item_set_text(result_index, loop, 'kod', res.middle);
          result_set_item_set_text(result_index, loop, 'hodnota', res.right);
          result_set_item_set_text(result_index, loop, 'predpona', res.left);
        end;

        database_push_result_set(g_database_index, result_index);
        result_set_free(result_index);
      end;

      total_index := total_index + g_chunk_write;
    end;

    if (total_count = 1) then
    begin
      result_index := database_born_result_set(g_database_index, nazev_tabulky);

      if (result_index > 0) then
      begin
        result_set_clean_flag(result_index);

        database_push_result_set(g_database_index, result_index);
        result_set_free(result_index);
      end;
    end;

    result := 0;
  end
  else result := -1;
end;

function pridej_pole_do_table(data : API_SA; nazev_tabulky : AnsiString) : Integer;
var
  result_index : Integer;
  f_result : Integer;

  total_count : Integer;
  total_index : Integer;
  cnt : Integer;
  loop : Integer;
  
  tbl : API_TBL;
  res : API_TBLRES;
begin
  tbl := vrat_predpis(nazev_tabulky);
  
  if (tbl.status = True) then
  begin
    total_index := 1;
    total_count := Length(data);

    while (total_index < total_count) do
    begin
      result_index := database_born_result_set(g_database_index, nazev_tabulky);

      if (result_index > 0) then
      begin

        cnt := g_chunk_write;
        if (total_index + g_chunk_write >= total_count) then
        begin
          cnt := total_count - total_index;
        end;

        for loop := 0 to cnt - 1 do
        begin
          res := aplikuj_predpis(tbl, data[total_index + loop]);

          result_set_item_insert(result_index);
          result_set_item_set_text(result_index, loop, 'kod', res.middle);
          result_set_item_set_text(result_index, loop, 'hodnota', res.right);
          result_set_item_set_text(result_index, loop, 'predpona', res.left);
        end;

        f_result := database_push_result_set(g_database_index, result_index);
        result_set_free(result_index);

      end;

      total_index := total_index + g_chunk_write;
    end;

    result := f_result;

  end
  else result := -1;
end;

function pridej_pole_do_table_bez_kuss(data : API_SA; nazev_tabulky : AnsiString) : Integer;
var
  result_index : Integer;
  mn_start : Integer;
  mn_end : Integer;
  put : AnsiString;
  f_result : Integer;

  total_count : Integer;
  total_index : Integer;
  cnt : Integer;
  loop : Integer;

  tbl : API_TBL;
  res : API_TBLRES;

begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    mn_start := 83 - tbl.code_end;
    mn_end := 92 - tbl.code_end;

    total_index := 1;
    total_count := Length(data);

    while (total_index < total_count) do
    begin
      result_index := database_born_result_set(g_database_index, nazev_tabulky);

      if (result_index > 0) then
      begin

        cnt := g_chunk_write;
        if (total_index + g_chunk_write >= total_count) then
        begin
          cnt := total_count - total_index;
        end;

        for loop := 0 to cnt - 1 do
        begin
          res := aplikuj_predpis(tbl, data[total_index + loop]);

          result_set_item_insert(result_index);
          result_set_item_set_text(result_index, loop, 'kod', res.middle);
          result_set_item_set_text(result_index, loop, 'predpona', res.left);

          put := '''' + StringReplace(Copy(res.right, 1, mn_start - 1), '''', '''''', [rfReplaceAll]) + '''';
          put := put + ' || ' + 'SUBSTRING("hodnota" FROM ' + IntToStr(mn_start) + ' FOR ' + IntToStr(mn_end - mn_start + 1) + ')' + ' || ';
          put := put + '''' + StringReplace(Copy(res.right, mn_end + 1, Length(res.right) - mn_end + 1), '''', '''''', [rfReplaceAll]) + '''';

          result_set_item_set_expr(result_index, loop, 'hodnota', put);

        end;

        f_result := database_push_result_set(g_database_index, result_index);
        result_set_free(result_index);

      end;

      total_index := total_index + g_chunk_write;
    end;
    
    result := f_result;

  end
  else result := -1;
end;

function smaz_pole_v_table(data : API_SA; nazev_tabulky : AnsiString) : Integer;
var
  result_index : Integer;
  loop : Integer;
  tbl : API_TBL;
  res : API_TBLRES;
begin
  tbl := vrat_predpis(nazev_tabulky);
  
  if (tbl.status = True) then
  begin
    result_index := database_born_result_set(g_database_index, nazev_tabulky);

    if (result_index > 0) then
    begin

      for loop := 1 to Length(data) - 1 do
      begin
        res := aplikuj_predpis(tbl, data[loop]);
        
        result_set_item_insert(result_index);
        result_set_item_set_text(result_index, loop - 1, 'kod', res.middle);
        result_set_item_drop(result_index, loop - 1);
      end;

      result := database_push_result_set(g_database_index, result_index);
      result_set_free(result_index);

    end
    else
    begin
      result := result_index;
    end;
  end
  else result := -1;
end;

function table_velikost(nazev_tabulky : AnsiString) : Integer;
var
  query_index : Integer;
begin
  query_index := query_born(g_database_index, nazev_tabulky, '', '');

  if (query_index > 0) then
  begin
    result := query_get_count(query_index);
    query_free(query_index);
  end
  else
  begin
    result := query_index;
  end;
end;

function table_do_pole_limit(var data : API_SA; nazev_tabulky : AnsiString; zacatek : Integer; pocet : Integer) : Integer;
var
  query_index : Integer;
  result_index : Integer;
  total_count : Integer;
  total_index : Integer;
  start_index : Integer;
  loop : Integer;
  cnt : Integer;

  tbl : API_TBL;
  res : API_TBLRES;

begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    query_index := query_born(g_database_index, nazev_tabulky, '', '');

    if (query_index > 0) then
    begin
      total_count := query_get_count(query_index);
      total_index := 0;
      start_index := 0;

      if (zacatek <> -1) and (zacatek - 1 >= 0) then start_index := zacatek - 1;

      if (pocet <> -1) and (pocet + start_index < total_count) then total_count := pocet
      else total_count := total_count - start_index;

      if (total_count >= 0) then
      begin
        SetLength(data, total_count + 1);

        while total_index < total_count do
        begin
          if (total_index + g_chunk_read <= total_count) then result_index := query_process_limit(query_index, total_index + start_index, g_chunk_read, false)
          else result_index := query_process_limit(query_index, total_index + start_index, total_count - total_index, false);

          cnt := result_set_get_count(result_index);

          for loop := 0 to (cnt - 1) do
          begin
            res.left := result_set_item_get_text_output(result_index, loop, 'predpona');
            res.middle := result_set_item_get_text_output(result_index, loop, 'kod');
            res.right := result_set_item_get_text_output(result_index, loop, 'hodnota');

            data[total_index + loop + 1] := sestav_dle_predpisu(tbl, res);
          end;

          // spusti se na serveru
          //if (result_set_drop_branch_readed(result_index) = 0) and (result_set_get_count(result_index) > 0) and (result_set_branch_update(result_index) = 0) then
          //begin
          //  database_push_result_set(g_database_index, result_index);
          //end;

          result_set_free(result_index);
          total_index := total_index + g_chunk_read;
        end;

        result := query_index;
      end
      else
      begin
        total_count := 0;

        SetLength(data, total_count + 1);

        result := total_count;
      end;

      query_free(query_index);
    end
    else
    begin
      result := query_index;
    end;
  end
  else result := -1;
end;

function table_do_pole(var data : API_SA; nazev_tabulky : AnsiString) : Integer;
begin
  result := table_do_pole_limit(data, nazev_tabulky, -1, -1);
end;

function table_do_string_limit(nazev_tabulky : AnsiString; zacatek : Integer; pocet : Integer) : AnsiString;
var
  query_index : Integer;
  total_count : Integer;
  total_index : Integer;
  start_index : Integer;
  loop : Integer;
  cnt : Integer;
  r_part : AnsiString;
  r_final : AnsiString;

  tbl : API_TBL;
  res : API_TBLRES;

begin
  tbl := vrat_predpis(nazev_tabulky);
  r_final := '';

  if (tbl.status = True) then
  begin
    query_index := query_born(g_database_index, nazev_tabulky, '', '');

    if (query_index > 0) then
    begin
      total_count := query_get_count(query_index);
      total_index := 0;
      start_index := 0;

      if (zacatek <> -1) and (zacatek - 1 >= 0) then start_index := zacatek - 1;

      if (pocet <> -1) and (pocet + start_index < total_count) then total_count := pocet
      else total_count := total_count - start_index;

      if (total_count >= 0) then
      begin
        while total_index < total_count do
        begin
          if (total_index + g_chunk_read <= total_count) then r_part := query_process_string(query_index, tbl.code_start - 1, tbl.code_end - 1, total_index + start_index, g_chunk_read, false)
          else r_part := query_process_string(query_index, tbl.code_start - 1, tbl.code_end - 1, total_index + start_index, total_count - total_index, false);

          r_final := r_final + r_part;

          total_index := total_index + g_chunk_read;
        end;
      end
      else
      begin
        total_count := 0;
      end;

      query_free(query_index);
      
      //database_mark_read(g_database_index, nazev_tabulky); // jiz se spousti na serveru
    end;
  end;

  result := r_final;
end;

function table_do_string(nazev_tabulky : AnsiString) : AnsiString;
begin
  result := table_do_string_limit(nazev_tabulky, -1, -1);
end;

function table_do_string_fajl(nazev_tabulky : AnsiString; nazev_souboru : AnsiString) : Boolean;
var
  fhand : TextFile;
  query_index : Integer;
  total_count : Integer;
  total_index : Integer;
  loop : Integer;
  cnt : Integer;
  r_part : AnsiString;
  
  tbl : API_TBL;
  res : API_TBLRES;

begin
  try
    AssignFile(fhand, nazev_souboru);
    ReWrite(fhand);

    tbl := vrat_predpis(nazev_tabulky);

    if (tbl.status = True) then
    begin
      query_index := query_born(g_database_index, nazev_tabulky, '', '');

      if (query_index > 0) then
      begin
        total_count := query_get_count(query_index);
        total_index := 0;

        if (total_count >= 0) then
        begin
          while total_index < total_count do
          begin
            if (total_index + g_chunk_read <= total_count) then r_part := query_process_string(query_index, tbl.code_start - 1, tbl.code_end - 1, total_index, g_chunk_read, false)
            else r_part := query_process_string(query_index, tbl.code_start - 1, tbl.code_end - 1, total_index, total_count - total_index, false);

            Write(fhand, r_part);

            total_index := total_index + g_chunk_read;
          end;
        end
        else
        begin
          total_count := 0;
        end;

        query_free(query_index);
      end;
    end;

    CloseFile(fhand);

    //database_mark_read(g_database_index, nazev_tabulky); // jiz se spousti na serveru

    result := True;

  except
    result := False;
  end;
end;

function table_vycucni(nazev_tabulky : AnsiString) : AnsiString;
var
  query_index : Integer;
  total_count : Integer;
  r_final : AnsiString;

  tbl : API_TBL;
  res : API_TBLRES;

begin
  tbl := vrat_predpis(nazev_tabulky);
  r_final := '';

  if (tbl.status = True) then
  begin
    query_index := query_born(g_database_index, nazev_tabulky, '', '');

    if (query_index > 0) then
    begin
      total_count := query_get_count(query_index);

      if (total_count >= 0) then
      begin
        r_final := query_process_string(query_index, tbl.code_start - 1, tbl.code_end - 1, -1, -1, false);
      end
      else
      begin
        total_count := 0;
      end;

      query_free(query_index);
      
      //database_mark_read(g_database_index, nazev_tabulky); // jiz se spousti na serveru
    end;
  end;

  result := r_final;
end;

function table_vycucni_fajl(nazev_tabulky : AnsiString; nazev_souboru : AnsiString) : Boolean;
var
  fhand : TextFile;

begin
  try
    AssignFile(fhand, nazev_souboru);
    ReWrite(fhand);
    Write(fhand, table_vycucni(nazev_tabulky));
    CloseFile(fhand);

    result := True;

  except
    result := False;
  end;
end;

function kody_do_pole(var data : API_SA; nazev_tabulky : AnsiString) : Integer;
var
  query_index : Integer;
  cnt : Integer;
  f : Integer;
  tbl : API_TBL;

begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    query_index := query_born(g_database_index, nazev_tabulky, '', '');

    if (query_index > 0) then
    begin
      result := query_process_codes_text(query_index);

      if (result = 0) then
      begin
        cnt := db_cha_count();
        SetLength(data, cnt + 1);

        for f := 1 to cnt do
        begin
          data[f] := db_cha_get(f - 1);
        end;
      end;

      query_free(query_index);
    end
    else
    begin
      result := query_index;
    end;
  end
  else result := -1;
end;

function kody_table_do_pole(data_kod : API_SA; var data_hodnota : API_SA; nazev_tabulky : AnsiString) : Integer;
var
  query_index : Integer;
  result_index : Integer;
  total_count : Integer;
  total_index : Integer;
  loop : Integer;
  cnt : Integer;

  f : Integer;
  cond : String;

  tbl : API_TBL;
  res : API_TBLRES;
  
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    cond := '';

    for f := 1 to Length(data_kod) - 1 do
    begin
      if (f <> 1) then cond := cond + ' OR ';
      cond := cond + 'kod = @' + IntToStr(f);
    end;
    
    query_index := query_born(g_database_index, nazev_tabulky, '', cond);

    for f := 1 to Length(data_kod) - 1 do
    begin
      query_param_add_text(query_index, Trim(data_kod[f]));
    end;

    if (query_index > 0) then
    begin
      total_count := query_get_count(query_index);
      total_index := 0;

      if (total_count >= 0) then
      begin
        SetLength(data_hodnota, total_count + 1);

        while total_index < total_count do
        begin
          if (g_chunk_read < total_count) then result_index := query_process_limit(query_index, total_index, g_chunk_read, false)
          else result_index := query_process_limit(query_index, -1, -1, false);

          cnt := result_set_get_count(result_index);

          for loop := 0 to (cnt - 1) do
          begin
            res.left := result_set_item_get_text_output(result_index, loop, 'predpona');
            res.middle := result_set_item_get_text_output(result_index, loop, 'kod');
            res.right := result_set_item_get_text_output(result_index, loop, 'hodnota');

            data_hodnota[total_index + loop + 1] := sestav_dle_predpisu(tbl, res);
          end;

          // spusti se na serveru
          //if (result_set_drop_branch_readed(result_index) = 0) and (result_set_get_count(result_index) > 0) and (result_set_branch_update(result_index) = 0) then
          //begin
          //  database_push_result_set(g_database_index, result_index);
          //end;

          result_set_free(result_index);
          total_index := total_index + g_chunk_read;
        end;

        result := query_index;
      end
      else
      begin
        result := total_count;
      end;

      query_free(query_index);
    end
    else
    begin
      result := query_index;
    end;
  end
  else result := -1;
end;

function kody_cas_vytvoreni_do_pole(data_kod : API_SA; var data_hodnota : API_SA; nazev_tabulky : AnsiString) : Integer;
var
  query_index : Integer;
  result_index : Integer;
  total_count : Integer;
  total_index : Integer;
  loop : Integer;
  cnt : Integer;

  f : Integer;
  cond : String;

  tbl : API_TBL;
  res : API_TBLRES;
  
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    cond := '';

    for f := 1 to Length(data_kod) - 1 do
    begin
      if (f <> 1) then cond := cond + ' OR ';
      cond := cond + 'kod = @' + IntToStr(f);
    end;
    
    query_index := query_born(g_database_index, nazev_tabulky, '', cond);

    for f := 1 to Length(data_kod) - 1 do
    begin
      query_param_add_text(query_index, Trim(data_kod[f]));
    end;

    if (query_index > 0) then
    begin
      total_count := query_get_count(query_index);
      total_index := 0;

      if (total_count >= 0) then
      begin
        SetLength(data_hodnota, total_count + 1);

        while total_index < total_count do
        begin

          if (g_chunk_read < total_count) then result_index := query_process_limit(query_index, total_index, g_chunk_read, false)
          else result_index := query_process_limit(query_index, -1, -1, false);

          cnt := result_set_get_count(result_index);

          for loop := 0 to (cnt - 1) do
          begin
            res.left := '';
            res.middle := result_set_item_get_text_output(result_index, loop, 'kod');
            res.right := result_set_item_get_text_output(result_index, loop, '_date_cre') + ' ' + result_set_item_get_text_output(result_index, loop, '_time_cre');
            //res.right := IntToStr(result_set_item_get_int(result_index, loop, '_date_cre')) + ' ' + FloatToStr(result_set_item_get_double(result_index, loop, '_time_cre'));

            data_hodnota[total_index + loop + 1] := sestav_dle_predpisu(tbl, res);
          end;

          // spusti se na serveru
          //if (result_set_drop_branch_readed(result_index) = 0) and (result_set_get_count(result_index) > 0) and (result_set_branch_update(result_index) = 0) then
          //begin
          //  database_push_result_set(g_database_index, result_index);
          //end;

          result_set_free(result_index);
          total_index := total_index + g_chunk_read;
        end;

        result := query_index;
      end
      else
      begin
        result := total_count;
      end;

      query_free(query_index);
    end
    else
    begin
      result := query_index;
    end;
  end
  else result := -1;
end;

function kody_cas_zmeny_do_pole(data_kod : API_SA; var data_hodnota : API_SA; nazev_tabulky : AnsiString) : Integer;
begin
  result := kody_cas_zmeny_do_pole_od_hranice_full(false, false, '', API_SA(data_kod), API_SA(data_hodnota), nazev_tabulky);
end;

function kody_cas_zmeny_do_pole_od_hranice(hranice : AnsiString; data_kod : API_SA; var data_hodnota : API_SA; nazev_tabulky : AnsiString) : Integer;
begin
  result := kody_cas_zmeny_do_pole_od_hranice_full(false, false, hranice, API_SA(data_kod), API_SA(data_hodnota), nazev_tabulky);
end;

function kody_cas_zmeny_do_pole_od_hranice_zaznamy(hranice : AnsiString; data_kod : API_SA; var data_hodnota : API_SA; nazev_tabulky : AnsiString) : Integer;
begin
  result := kody_cas_zmeny_do_pole_od_hranice_full(false, true, hranice, API_SA(data_kod), API_SA(data_hodnota), nazev_tabulky);
end;

function kody_cas_zmeny_do_pole_od_hranice_vse_zaznamy(hranice : AnsiString; var data_hodnota : API_SA; nazev_tabulky : AnsiString) : Integer;
var
  data_kod : API_SA;
begin
  result := kody_cas_zmeny_do_pole_od_hranice_full(true, true, hranice, API_SA(data_kod), API_SA(data_hodnota), nazev_tabulky);
end;

function kody_cas_zmeny_do_pole_od_hranice_full(return_all : Boolean; return_data : Boolean; hranice : AnsiString; data_kod : API_SA; var data_hodnota : API_SA; nazev_tabulky : AnsiString) : Integer;
var
  query_index : Integer;
  result_index : Integer;
  total_count : Integer;
  total_index : Integer;
  loop : Integer;
  cnt : Integer;

  f : Integer;
  cond : String;

  tbl : API_TBL;
  res : API_TBLRES;

  part : AnsiString;
  ch : AnsiString;
  ptidx : Integer;

  dd_d : Integer;
  dd_m : Integer;
  dd_y : Integer;
  dd_fin : Integer;
  tt_h : Integer;
  tt_m : Integer;
  tt_s : Integer;
  tt_cc : Integer;
  tt_fin : Double;

  mn_sep : Char;

begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    part := '';
    ptidx := 0;

    if (Length(hranice) > 0) then
    begin
      for f := 1 to Length(hranice) + 1 do
      begin
        if (f = Length(hranice) + 1) then ch := ' '
        else ch := Copy(hranice, f, 1);

        if (ch = '.') or (ch = ' ') or (ch = ':') then
        begin
          if (ptidx = 0) then dd_d := StrToInt(part)
          else if (ptidx = 1) then dd_m := StrToInt(part)
          else if (ptidx = 2) then dd_y := StrToInt(part)
          else if (ptidx = 3) then tt_h := StrToInt(part)
          else if (ptidx = 4) then tt_m := StrToInt(part)
          else if (ptidx = 5) then tt_s := StrToInt(part)
          else if (ptidx = 6) then tt_cc := StrToInt(part);

          part := '';
          ptidx := ptidx + 1;
        end else
        begin
          part := part + ch;
        end;
      end;
    end;

    if (return_all) then
    begin
      cond := '';
    end
    else
    begin
      cond := '(';
      
      for f := 1 to Length(data_kod) - 1 do
      begin
        if (f <> 1) then cond := cond + ' OR ';
        cond := cond + 'kod = @' + IntToStr(f);
      end;

      cond := cond + ')';
    end;

    if (ptidx > 0) then
    begin
      dd_m := (dd_m + 9) mod 12;
      dd_y := dd_y - Trunc(dd_m/10);

      dd_fin := 0;
      tt_fin := 0;

      if (dd_d > 0) and (dd_d > 0) and (dd_y > 0) then
      begin
        dd_fin := dd_y*365 + Trunc(dd_y/4) - Trunc(dd_y/100) + Trunc(dd_y/400) + Trunc((dd_m*306 + 5)/10) + (dd_d - 1);
        if (Length(cond) > 0) then cond := cond + ' AND ';
        cond := cond + '_date_mod >= ' + IntToStr(dd_fin);
      end;

      if (tt_h > 0) then
      begin
        mn_sep := SysUtils.DecimalSeparator;
        SysUtils.DecimalSeparator := '.';

        tt_fin := tt_h;

        if (tt_m > 0) then tt_fin := tt_fin + (tt_m / 60.0);
        if (tt_s > 0) then tt_fin := tt_fin + (tt_s / 60.0 / 60.0);
        if (tt_cc > 0) then tt_fin := tt_fin + (tt_cc / 60.0 / 60.0 / 1000000.0);

        if (Length(cond) > 0) then cond := cond + ' AND ';
        cond := cond + '( ( NOT _date_mod = ' + IntToStr(dd_fin) + ' ) OR _time_mod >= ' + FloatToStr(tt_fin) + ' )';

        SysUtils.DecimalSeparator := mn_sep;
      end;
    end;

    query_index := query_born(g_database_index, nazev_tabulky, '', cond);

    if not (return_all) then
    begin
      for f := 1 to Length(data_kod) - 1 do
      begin
        query_param_add_text(query_index, Trim(data_kod[f]));
      end;
    end;

    if (query_index > 0) then
    begin
      total_count := query_get_count(query_index);
      total_index := 0;

      if (total_count >= 0) then
      begin
        SetLength(data_hodnota, total_count + 1);

        while total_index < total_count do
        begin
          // vystupy z teto funkce neoznacuji zaznamy za prectene (posledni parametr disable_mark_changes na true) 
          if (g_chunk_read < total_count) then result_index := query_process_limit(query_index, total_index, g_chunk_read, true)
          else result_index := query_process_limit(query_index, -1, -1, true);

          cnt := result_set_get_count(result_index);

          for loop := 0 to (cnt - 1) do
          begin
            if (return_data) then
            begin
              res.left := result_set_item_get_text_output(result_index, loop, 'predpona');
              res.middle := result_set_item_get_text_output(result_index, loop, 'kod');
              res.right := result_set_item_get_text_output(result_index, loop, 'hodnota');

              data_hodnota[total_index + loop + 1] := sestav_dle_predpisu(tbl, res);

            end
            else
            begin
              res.left := '';
              res.middle := result_set_item_get_text_output(result_index, loop, 'kod');
              res.right := result_set_item_get_text_output(result_index, loop, '_date_mod') + ' ' + result_set_item_get_text_output(result_index, loop, '_time_mod');
              //res.right := IntToStr(result_set_item_get_int(result_index, loop, '_date_mod')) + ' ' + FloatToStr(result_set_item_get_double(result_index, loop, '_time_mod'));

              data_hodnota[total_index + loop + 1] := sestav_dle_predpisu(tbl, res);
            end;
          end;

          // spusti se na serveru
          //if (result_set_drop_branch_readed(result_index) = 0) and (result_set_get_count(result_index) > 0) and (result_set_branch_update(result_index) = 0) then
          //begin
          //  database_push_result_set(g_database_index, result_index);
          //end;

          result_set_free(result_index);
          total_index := total_index + g_chunk_read;
        end;

        result := query_index;
      end
      else
      begin
        result := total_count;
      end;

      query_free(query_index);
    end
    else
    begin
      result := query_index;
    end;
  end
  else result := -1;
end;

function vrat_pole_kuss(st : Integer; en : Integer; kuss : AnsiString; var data : API_SA; nazev_tabulky : AnsiString) : Integer;
var
  query_index : Integer;
  result_index : Integer;
  total_count : Integer;
  total_index : Integer;
  loop : Integer;
  cnt : Integer;
  c_st : Integer;
  c_en : Integer;
  cond : AnsiString;

  tbl : API_TBL;
  res : API_TBLRES;

begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    if (st <= tbl.code_start) and (en <= tbl.code_start) then
    begin
      c_st := st;
      c_en := en;
      cond := 'SUBSTRING(predpona FROM ' + IntToStr(c_st) + ' FOR ' + IntToStr(c_en - c_st + 1) + ') = $1';

    end
    else if (st >= tbl.code_start) and (en <= tbl.code_end) then
    begin
      c_st := st - tbl.code_start + 1;
      c_en := en - tbl.code_start + 1;
      cond := 'SUBSTRING(kod FROM ' + IntToStr(c_st) + ' FOR ' + IntToStr(c_en - c_st + 1) + ') = $1';

    end
    else
    begin
      c_st := st - tbl.code_end;
      c_en := en - tbl.code_end;
      cond := 'SUBSTRING(hodnota FROM ' + IntToStr(c_st) + ' FOR ' + IntToStr(c_en - c_st + 1) + ') = $1';
    end;

    //cond := cond + '''' + StringReplace(kuss, '''', '''''', [rfReplaceAll]) + ''' ';

    query_index := query_born(g_database_index, nazev_tabulky, '', cond);
    query_param_add_text(query_index, kuss);

    if (query_index > 0) then
    begin
      total_count := query_get_count(query_index);

      if (total_count >= 0) then
      begin
        total_index := 0;

        SetLength(data, total_count + 1);

        while total_index < total_count do
        begin
          if (g_chunk_read < total_count) then result_index := query_process_limit(query_index, total_index, g_chunk_read, false)
          else result_index := query_process_limit(query_index, -1, -1, false);
          
          cnt := result_set_get_count(result_index);

          for loop := 0 to (cnt - 1) do
          begin
            res.left := result_set_item_get_text_output(result_index, loop, 'predpona');
            res.middle := result_set_item_get_text_output(result_index, loop, 'kod');
            res.right := result_set_item_get_text_output(result_index, loop, 'hodnota');

            data[total_index + loop + 1] := sestav_dle_predpisu(tbl, res);
          end;

          // spusti se na serveru
          //if (result_set_drop_branch_readed(result_index) = 0) and (result_set_get_count(result_index) > 0) and (result_set_branch_update(result_index) = 0) then
          //begin
          //  database_push_result_set(g_database_index, result_index);
          //end;

          result_set_free(result_index);
          total_index := total_index + g_chunk_read;
        end;

        result := query_index;

      end
      else
      begin
        result := total_count;
      end;

      query_free(query_index);
    end
    else
    begin
      result := query_index;
    end;
  end
  else result := -1;
end;


function zapis_prvek(text : AnsiString; nazev_tabulky : AnsiString) : Integer;
var
  result_index : Integer;
  tbl : API_TBL;
  res : API_TBLRES;
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    result_index := database_born_result_set(g_database_index, nazev_tabulky);

    if (result_index > 0) then
    begin
      res := aplikuj_predpis(tbl, text);

      result_set_item_insert(result_index);
      result_set_item_set_text(result_index, 0, 'kod', res.middle);
      result_set_item_set_text(result_index, 0, 'hodnota', res.right);
      result_set_item_set_text(result_index, 0, 'predpona', res.left);
      
      result := database_push_result_set(g_database_index, result_index);
      result_set_free(result_index);

    end
    else
    begin
      result := result_index;
    end;
  end
  else result := -1;
end;

function smaz_prvek_kod(kod : AnsiString; nazev_tabulky : AnsiString) : Integer;
var
  result_index : Integer;
  tbl : API_TBL;
  res : API_TBLRES;

begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    result_index := database_born_result_set(g_database_index, nazev_tabulky);

    if (result_index > 0) then
    begin
      result_set_item_insert(result_index);
      result_set_item_set_text(result_index, 0, 'kod', Trim(kod));
      result_set_item_drop(result_index, 0);

      result := database_push_result_set(g_database_index, result_index);
      result_set_free(result_index);

    end
    else
    begin
      result := result_index;
    end;
  end
  else result := -1;
end;

function smaz_prvek_radek(radek : AnsiString; nazev_tabulky : AnsiString) : Integer;
var
  result_index : Integer;
  tbl : API_TBL;
  res : API_TBLRES;
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    result_index := database_born_result_set(g_database_index, nazev_tabulky);

    if (result_index > 0) then
    begin
      res := aplikuj_predpis(tbl, radek);

      result_set_item_insert(result_index);
      result_set_item_set_text(result_index, 0, 'kod', res.middle);
      result_set_item_drop(result_index, 0);

      result := database_push_result_set(g_database_index, result_index);
      result_set_free(result_index);

    end
    else
    begin
      result := result_index;
    end;
  end
  else result := -1;
end;

function vrat_zaznam(kod : AnsiString; nazev_tabulky : AnsiString) : String;
var
  query_index : Integer;
  result_index : Integer;
  tbl : API_TBL;
  res : API_TBLRES;
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    query_index := query_born(g_database_index, nazev_tabulky, '', 'kod = @1');

    query_param_add_text(query_index, Trim(kod));

    if (query_index > 0) then
    begin
      result_index := query_process_limit(query_index, -1, -1, false);

      if (result_index > 0) then
      begin
        if (result_set_get_count(result_index) > 0) then
        begin
          res.middle := result_set_item_get_text_output(result_index, 0, 'kod');
          res.right := result_set_item_get_text_output(result_index, 0, 'hodnota');
          res.left := result_set_item_get_text_output(result_index, 0, 'predpona');

          result := sestav_dle_predpisu(tbl, res);

          // spusti se na serveru
          //if (result_set_drop_branch_readed(result_index) = 0) and (result_set_get_count(result_index) > 0) and (result_set_branch_update(result_index) = 0) then
          //begin
          //  database_push_result_set(g_database_index, result_index);
          //end;
        end;

        result_set_free(result_index);
      end;

      query_free(query_index);
    end;
  end;
end;

function vrat_zaznam_posledni_vytvoreny(nazev_tabulky : AnsiString) : String;
var
  query_index : Integer;
  result_index : Integer;
  tbl : API_TBL;
  res : API_TBLRES;
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    query_index := query_born(g_database_index, nazev_tabulky, '_date_cre DESC, _time_cre DESC', '');

    if (query_index > 0) then
    begin
      result_index := query_process_limit(query_index, 0, 1, false);

      if (result_index > 0) then
      begin
        if (result_set_get_count(result_index) > 0) then
        begin
          res.middle := result_set_item_get_text_output(result_index, 0, 'kod');
          res.right := result_set_item_get_text_output(result_index, 0, 'hodnota');
          res.left := result_set_item_get_text_output(result_index, 0, 'predpona');

          result := sestav_dle_predpisu(tbl, res);

          // spusti se na serveru
          //if (result_set_drop_branch_readed(result_index) = 0) and (result_set_get_count(result_index) > 0) and (result_set_branch_update(result_index) = 0) then
          //begin
          //  database_push_result_set(g_database_index, result_index);
          //end;
        end;

        result_set_free(result_index);
      end;

      query_free(query_index);
    end;
  end;
end;

function vrat_zaznam_posledni_zmeneny(nazev_tabulky : AnsiString) : String;
var
  query_index : Integer;
  result_index : Integer;
  tbl : API_TBL;
  res : API_TBLRES;
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    query_index := query_born(g_database_index, nazev_tabulky, '_date_mod DESC, _time_mod DESC', '');

    if (query_index > 0) then
    begin
      result_index := query_process_limit(query_index, 0, 1, false);

      if (result_index > 0) then
      begin
        if (result_set_get_count(result_index) > 0) then
        begin
          res.middle := result_set_item_get_text_output(result_index, 0, 'kod');
          res.right := result_set_item_get_text_output(result_index, 0, 'hodnota');
          res.left := result_set_item_get_text_output(result_index, 0, 'predpona');

          result := sestav_dle_predpisu(tbl, res);

          // spusti se na serveru
          //if (result_set_drop_branch_readed(result_index) = 0) and (result_set_get_count(result_index) > 0) and (result_set_branch_update(result_index) = 0) then
          //begin
          //  database_push_result_set(g_database_index, result_index);
          //end;
        end;

        result_set_free(result_index);
      end;

      query_free(query_index);
    end;
  end;
end;

function vrat_cas_posledni_vytvoreny(nazev_tabulky : AnsiString) : String;
var
  query_index : Integer;
  result_index : Integer;
  tbl : API_TBL;
  res : API_TBLRES;
  vystup : String;
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    query_index := query_born(g_database_index, nazev_tabulky, '_date_cre DESC, _time_cre DESC', '');

    if (query_index > 0) then
    begin
      result_index := query_process_limit(query_index, 0, 1, false);

      if (result_index > 0) then
      begin
        if (result_set_get_count(result_index) > 0) then
        begin
          result := result_set_item_get_text_output(result_index, 0, '_date_cre') + ' ' + result_set_item_get_text_output(result_index, 0, '_time_cre');
        end;

        result_set_free(result_index);
      end;

      query_free(query_index);
    end;
  end;
end;

function vrat_cas_posledni_zmeneny(nazev_tabulky : AnsiString) : String;
var
  query_index : Integer;
  result_index : Integer;
  tbl : API_TBL;
  res : API_TBLRES;
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    query_index := query_born(g_database_index, nazev_tabulky, '_date_mod DESC, _time_mod DESC', '');

    if (query_index > 0) then
    begin
      result_index := query_process_limit(query_index, 0, 1, false);

      if (result_index > 0) then
      begin
        if (result_set_get_count(result_index) > 0) then
        begin
          result := result_set_item_get_text_output(result_index, 0, '_date_mod') + ' ' + result_set_item_get_text_output(result_index, 0, '_time_mod');
        end;

        result_set_free(result_index);
      end;

      query_free(query_index);
    end;
  end;
end;

function query_add_int(tbl : API_TBL; value : Integer) : String;
var
  mn_start : Integer;
  mn_end : Integer;
  mn_len : Integer;
  mn_cond : String;
begin
  //mn_start := 83 - tbl.code_end + 1;
  //mn_end := 92 - tbl.code_end + 1;
  //mn_len := mn_end - mn_start;

  //mn_cond := '';
  //mn_cond := mn_cond + 'SUBSTRING("hodnota" FROM 1 FOR ' + IntToStr(mn_start - 1) + ') || ';
  //mn_cond := mn_cond + 'SUBSTRING(''                         '' FROM 1 FOR ' + IntToStr(mn_len) + ' - CHAR_LENGTH(';
  //mn_cond := mn_cond + '  CAST(CAST(SUBSTRING("hodnota" FROM ' + IntToStr(mn_start) + ' FOR ' + IntToStr(mn_len) + ') AS INTEGER) + ' + IntToStr(value) + ' AS CHAR) ';
  //mn_cond := mn_cond + ')) || ';
  //mn_cond := mn_cond + 'CAST(CAST(SUBSTRING("hodnota" FROM ' + IntToStr(mn_start) + ' FOR ' + IntToStr(mn_len) + ') AS INTEGER) + ' + IntToStr(value) + ' AS CHAR) || ';
  //mn_cond := mn_cond + 'SUBSTRING("hodnota" FROM ' + IntToStr(mn_start + mn_len) + ')';

  mn_start := 83 - tbl.code_end;
  mn_end := 92 - tbl.code_end;

  mn_cond := 'INCREMENT_NUMBER_IN_TEXT(' + IntToStr(mn_start) + ', ' + IntToStr(mn_end) + ', "hodnota", ' + IntToStr(value) + ')';

  result := mn_cond;
end;

function query_add_currency(tbl : API_TBL; value : Currency) : String;
var
  mn_start : Integer;
  mn_end : Integer;
  mn_len : Integer;
  mn_cond : String;
  mn_str : String;
  mn_sep : Char;
begin
  mn_sep := SysUtils.DecimalSeparator;
  SysUtils.DecimalSeparator := '.';

  mn_str := CurrToStrF(value, ffGeneral, 10);
  SysUtils.DecimalSeparator := mn_sep;

  {*
  mn_start := 83 - tbl.code_end + 1;
  mn_end := 92 - tbl.code_end + 1;
  mn_len := mn_end - mn_start;

  mn_cond := 'REPLACE(';
  mn_cond := mn_cond + 'SUBSTR(REPLACE(hodnota, ",", "."), 1, ' + IntToStr(mn_start - 1) + ') || ';

  mn_cond := mn_cond + 'SUBSTR(';
  mn_cond := mn_cond + 'SUBSTR("                         ", 1, ' + IntToStr(mn_len) + ' - LENGTH(';
  mn_cond := mn_cond + '  SUBSTR(CAST(ROUND(CAST(SUBSTR(REPLACE(hodnota, ",", "."), ' + IntToStr(mn_start) + ', ' + IntToStr(mn_len) + ') AS REAL) + ' + mn_str + ',4) AS TEXT), 1, ' + IntToStr(mn_len) + ')';
  mn_cond := mn_cond + ')) || ';
  mn_cond := mn_cond + 'SUBSTR(CAST(ROUND(CAST(SUBSTR(REPLACE(hodnota, ",", "."), ' + IntToStr(mn_start) + ', ' + IntToStr(mn_len) + ') AS REAL) + ' + mn_str + ',4) AS TEXT), 1, ' + IntToStr(mn_len) + ')';
  mn_cond := mn_cond + ', 1, ' + IntToStr(mn_len) + ') || ';

  mn_cond := mn_cond + 'SUBSTR(REPLACE(hodnota, ",", "."), ' + IntToStr(mn_start + mn_len) + ')';
  mn_cond := mn_cond + ', ".", ",")';
  *}

  mn_start := 83 - tbl.code_end;
  mn_end := 92 - tbl.code_end;

  mn_cond := 'INCREMENT_DOUBLE_IN_TEXT(' + IntToStr(mn_start) + ', ' + IntToStr(mn_end) + ', "hodnota", ' + mn_str + ')';
  
  result := mn_cond;
end;


function pricti_mnozstvi_kod(kod : AnsiString; mnozstvi : Integer; nazev_tabulky : AnsiString) : Integer;
var
  query_index : Integer;
  result_index : Integer;
  tbl : API_TBL;
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    query_index := query_born(g_database_index, nazev_tabulky, '', 'kod = @1');

    query_param_add_text(query_index, Trim(kod));

    if (query_index > 0) then
    begin
      result_index := query_process_limit(query_index, -1, -1, false);

      if (result_index > 0) then
      begin
        if (result_set_get_count(result_index) > 0) then
        begin
          result_set_item_set_expr(result_index, 0, 'hodnota', query_add_int(tbl, mnozstvi));

          result := database_push_result_set(g_database_index, result_index);
        end;

        result_set_free(result_index);
      end;

      query_free(query_index);
    end;
  end;
end;

function pricti_mnozstvi_kod_pole(data : API_SA; data_mnozstvi : API_SA; nazev_tabulky : AnsiString) : Integer;
var
  result_index : Integer;

  total_count : Integer;
  total_index : Integer;
  cnt : Integer;
  loop : Integer;

  tbl : API_TBL;
  res : API_TBLRES;
  
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    total_index := 1;
    total_count := Length(data);

    while (total_index < total_count) do
    begin
      result_index := database_born_result_set(g_database_index, nazev_tabulky);

      if (result_index > 0) then
      begin

        cnt := g_chunk_read;
        if (total_index + g_chunk_read >= total_count) then
        begin
          cnt := total_count - total_index;
        end;

        for loop := 0 to cnt - 1 do
        begin
          res := aplikuj_predpis(tbl, data[total_index + loop]);

          result_set_item_insert(result_index);
          result_set_item_set_text(result_index, loop, 'kod', res.middle);
          result_set_item_set_expr(result_index, loop, 'hodnota', query_add_int(tbl, StrToInt(data_mnozstvi[total_index + loop])));
        end;

        database_push_result_set(g_database_index, result_index);
        result_set_free(result_index);

      end;

      total_index := total_index + g_chunk_read;
    end;

    result := 0;
  end
  else result := -1;
end;

function pricti_mnozstvi_kod_currency(kod : AnsiString; mnozstvi : Currency; nazev_tabulky : AnsiString) : Integer;
var
  query_index : Integer;
  result_index : Integer;
  tbl : API_TBL;
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    query_index := query_born(g_database_index, nazev_tabulky, '', 'kod = @1');

    query_param_add_text(query_index, Trim(kod));

    if (query_index > 0) then
    begin
      result_index := query_process_limit(query_index, -1, -1, false);

      if (result_index > 0) then
      begin
        if (result_set_get_count(result_index) > 0) then
        begin
          result_set_item_set_expr(result_index, 0, 'hodnota', query_add_currency(tbl, mnozstvi));

          result := database_push_result_set(g_database_index, result_index);
        end;

        result_set_free(result_index);
      end;

      query_free(query_index);
    end;
  end;
end;

function pricti_mnozstvi_kod_currency_pole(data : API_SA; data_mnozstvi : API_SA; nazev_tabulky : AnsiString) : Integer;
var
  result_index : Integer;

  total_count : Integer;
  total_index : Integer;
  cnt : Integer;
  loop : Integer;
  bef_sep : Char;
  to_add : Currency;
  to_add_str : String;

  tbl : API_TBL;
  res : API_TBLRES;

begin
  tbl := vrat_predpis(nazev_tabulky);

  bef_sep := SysUtils.DecimalSeparator;
  SysUtils.DecimalSeparator := ',';

  if (tbl.status = True) then
  begin
    total_index := 1;
    total_count := Length(data);

    while (total_index < total_count) do
    begin
      result_index := database_born_result_set(g_database_index, nazev_tabulky);

      if (result_index > 0) then
      begin

        cnt := g_chunk_write;
        if (total_index + g_chunk_write >= total_count) then
        begin
          cnt := total_count - total_index;
        end;

        for loop := 0 to cnt - 1 do
        begin
          res := aplikuj_predpis(tbl, data[total_index + loop]);

          result_set_item_insert(result_index);
          result_set_item_set_text(result_index, loop, 'kod', res.middle);

          to_add_str := Trim(data_mnozstvi[total_index + loop]);

          try
            to_add := StrToCurr(to_add_str);
          except
            to_add := 0;
          end;

          result_set_item_set_expr(result_index, loop, 'hodnota', query_add_currency(tbl, to_add));
        end;

        database_push_result_set(g_database_index, result_index);
        result_set_free(result_index);

      end;

      total_index := total_index + g_chunk_write;
    end;

    result := 0;
  end
  else result := -1;

  SysUtils.DecimalSeparator := bef_sep;
end;

function posledni_kod(nazev_tabulky : AnsiString) : String;
var
  query_index : Integer;
  result_index : Integer;
begin
  query_index := query_born(g_database_index, nazev_tabulky, 'kod DESC', '');

  if (query_index > 0) then
  begin
    result_index := query_process_limit(query_index, 0, 1, false);

    if (result_index > 0) then
    begin
      if (result_set_get_count(result_index) > 0) then
      begin
        result := result_set_item_get_text_output(result_index, 0, 'kod');
      end;

      result_set_free(result_index);
    end;

    query_free(query_index);
  end
  else result := '';
end;

function pozice_kodu(kod : AnsiString; nazev_tabulky : AnsiString) : Integer;
var
  tmp_result : Integer;
  codes : API_SA;
  founded : Boolean;
  pos : Integer;
begin
  tmp_result := kody_do_pole(API_SA(codes), nazev_tabulky);

  if (tmp_result = 0) then
  begin
    founded := False;
    pos := 1;

    while (founded = False) and (pos <= Length(codes) - 1) do
    begin
      if (codes[pos] = Trim(kod)) then founded := True
      else pos := pos + 1;
    end;

    if (founded = True) then result := pos
    else result := -1;

  end
  else result := tmp_result;
end;

function smaz_prvek_na_pozici(pozice : Integer; nazev_tabulky : AnsiString) : Integer;
var
  query_index : Integer;
  result_index : Integer;
  tbl : API_TBL;
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    query_index := query_born(g_database_index, nazev_tabulky, '', '');

    if (query_index > 0) and (pozice >= 1) then
    begin
      result_index := query_process_limit(query_index, pozice - 1, 1, false);

      if (result_index > 0) then
      begin
        if (result_set_get_count(result_index) > 0) then
        begin
          result_set_item_drop(result_index, 0);
          result := database_push_result_set(g_database_index, result_index);
        end;

        result_set_free(result_index);
      end;

      query_free(query_index);
    end;
  end
  else result := -1;
end;

function nahrad_prvek_na_pozici(pozice : Integer; text : AnsiString; nazev_tabulky : AnsiString) : Integer;
var
  query_index : Integer;
  result_index : Integer;
  tbl : API_TBL;
  res : API_TBLRES;
begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    query_index := query_born(g_database_index, nazev_tabulky, '', '');

    if (query_index > 0) and (pozice >= 1) then
    begin
      result_index := query_process_limit(query_index, pozice - 1, 1, false);

      if (result_index > 0) then
      begin
        if (result_set_get_count(result_index) > 0) then
        begin
          res := aplikuj_predpis(tbl, text);

          result_set_item_set_text(result_index, 0, 'kod', res.middle);
          result_set_item_set_text(result_index, 0, 'hodnota', res.right);
          result_set_item_set_text(result_index, 0, 'predpona', res.left);

          result := database_push_result_set(g_database_index, result_index);
        end;

        result_set_free(result_index);
      end;

      query_free(query_index);
    end;
  end
  else result := -1;
end;

function odstran_smazane(nazev_tabulky : AnsiString) : Integer;
begin
  result := database_drop_unread(g_database_index, nazev_tabulky, -1);
end;

function odstran_smazane_starsi_dni(nazev_tabulky : AnsiString; pocet_dni : Integer) : Integer;
begin
  result := database_drop_unread(g_database_index, nazev_tabulky, pocet_dni);
end;

function precetl_tabulku(nazev_tabulky : AnsiString) : Integer;
begin
  result := database_mark_read(g_database_index, nazev_tabulky);
end;

function obecne_podej_zmeny(var data : API_SA; nazev_tabulky : AnsiString; zpusob : AnsiString) : Integer;
var
  query_index : Integer;
  result_index : Integer;
  loop : Integer;
  loop_inc : Integer;
  cnt : Integer;
  tbl : API_TBL;
  res : API_TBLRES;
  table_cnt : Integer;
  table_det : String;
  tmp_a : Integer;

begin
  tbl := vrat_predpis(nazev_tabulky);

  if (tbl.status = True) then
  begin
    if (zpusob = 'new_drop') then
    begin
      table_det := table_get_list_detailed_specific(g_database_index, '|' + nazev_tabulky + '|');
      
      if (Length(table_det) > 0) then
      begin
        tmp_a := Pos('|', table_det);
        table_det := Copy(table_det, tmp_a + 1, Length(table_det) - tmp_a);
        tmp_a := Pos('|', table_det);

        table_cnt := StrToInt(Copy(table_det, 1, tmp_a - 1));
        table_det := Copy(table_det, tmp_a + 1, Length(table_det) - tmp_a);
      end
      else
      begin
        table_cnt := -1;
      end;

      if (StrToInt(table_det) <> 0) then table_cnt := StrToInt(table_det);
      
    end
    else
    begin
      table_cnt := 0;
    end;

    if (table_cnt >= 0) then
    begin

      query_index := query_born_branch(g_database_index, nazev_tabulky, '', '', zpusob); // new, drop

      if (query_index > 0) then
      begin
        result_index := query_process_limit(query_index, -1, -1, false);

        if (result_index > 0) then
        begin
          if (zpusob = 'new_drop') then
          begin
            loop_inc := 2;
            cnt := result_set_get_count(result_index);
            SetLength(data, cnt + loop_inc);
            data[1] := IntToStr(table_cnt);
          end
          else
          begin
            loop_inc := 1;
            cnt := result_set_get_count(result_index);
            SetLength(data, cnt + loop_inc);
          end;

          if (zpusob = 'new_drop') then
          begin
            for loop := 0 to (cnt - 1) do
            begin
              res.middle := result_set_item_get_text_output(result_index, loop, 'kod');
              res.right := result_set_item_get_text_output(result_index, loop, 'hodnota');
              res.left := result_set_item_get_text_output(result_index, loop, 'predpona');

              if (result_set_item_get_int(result_index, loop, '_branch_delete') = 1) then
              begin
                data[loop + loop_inc] := 'D' + sestav_dle_predpisu(tbl, res);

              end
              else
              begin
                data[loop + loop_inc] := 'N' + sestav_dle_predpisu(tbl, res);
              end;
            end;

          end
          else
          begin
            for loop := 0 to (cnt - 1) do
            begin
              res.middle := result_set_item_get_text_output(result_index, loop, 'kod');
              res.right := result_set_item_get_text_output(result_index, loop, 'hodnota');
              res.left := result_set_item_get_text_output(result_index, loop, 'predpona');

              data[loop + loop_inc] := sestav_dle_predpisu(tbl, res);
            end;
          end;

          result := result_index;

          // spusti se na serveru
          //if (result_set_branch_update(result_index) = 0) then
          //begin
          //  database_push_result_set(g_database_index, result_index);
          //end;

          result_set_free(result_index);
        end
        else
        begin
          result := result_index;
        end;

        query_free(query_index);
      end
      else
      begin
        result := query_index;
      end;

    end else result := table_cnt;
  end
  else result := -1;
end;

function podej_zmeny_do_pole(var data : API_SA; nazev_tabulky : AnsiString) : Integer;
begin
  result := obecne_podej_zmeny(data, nazev_tabulky, 'new');
end;

function podej_smazane_do_pole(var data : API_SA; nazev_tabulky : AnsiString) : Integer;
begin
  result := obecne_podej_zmeny(data, nazev_tabulky, 'drop');
end;

function podej_zmeny_a_smazane_do_pole(var data : API_SA; nazev_tabulky : AnsiString) : Integer;
begin
  result := obecne_podej_zmeny(data, nazev_tabulky, 'new_drop');
end;


end.
