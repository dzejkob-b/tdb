unit ftpapi_quick;

interface

uses
  Windows, SysUtils, Classes, Graphics, ImgList, DelphiZXingQRCode;


type API_FTP_SA = array of AnsiString;

function FTP_pripoj(server : AnsiString; uzivatel : AnsiString; heslo : AnsiString) : Integer;
function FTP_konec() : Integer;
function FTP_listuj(var soubory : API_FTP_SA; var adresare : API_FTP_SA) : Integer;
function FTP_nastav_cestu(cesta : AnsiString) : Integer;
function FTP_nastav_cestu_relativne(cesta : AnsiString) : Integer;
function FTP_nastav_cestu_nahoru() : Integer;
function FTP_cesta() : AnsiString;

function FTP_nahraj(ftp_cesta : AnsiString; lokalni_cesta : AnsiString) : Integer;
function FTP_nahraj_text(ftp_cesta : AnsiString; text : AnsiString) : Integer;

function FTP_stahni(ftp_cesta : AnsiString; lokalni_cesta : AnsiString) : Integer;
function FTP_stahni_text(ftp_cesta : AnsiString) : AnsiString;

function FTP_prejmenuj(ftp_cesta_puvodni : AnsiString; ftp_cesta_nova : AnsiString) : Integer;
function FTP_novy_adresar(ftp_cesta : AnsiString) : Integer;
function FTP_smaz_soubor(ftp_cesta : AnsiString) : Integer;
function FTP_smaz_adresar(ftp_cesta : AnsiString) : Integer;

function TISK_zacni_vychozi_tiskarna(nazev_ulohy : AnsiString; max_dpi : Integer) : Integer;
function TISK_zacni_vyber_tiskarnu(nazev_ulohy : AnsiString; max_dpi : Integer) : Integer;
function TISK_zacni_tiskarna(nazev_tiskarny : AnsiString; nazev_ulohy : AnsiString; max_dpi : Integer) : Integer;
function TISK_zacni_pdf(nazev_tiskarny : AnsiString; nazev_ulohy : AnsiString; max_dpi : Integer; pdf_soubor : AnsiString) : Integer;
function TISK_vrat_dpi(var dpi_x : API_FTP_SA; var dpi_y : API_FTP_SA) : Integer;
function TISK_nastav_bitmapu(bmp : TBitmap) : Integer;
function TISK_text(text : AnsiString) : Integer;
function TISK_obrazek_bmp(cesta : AnsiString; promile_x : Integer; promile_y : Integer; promile_sirka : Integer; promile_vyska : Integer) : Integer;
function TISK_obrazek_bitmapa(bmp : TBitmap; promile_x : Integer; promile_y : Integer; promile_sirka : Integer; promile_vyska : Integer) : Integer;
function TISK_dokonci_a_vytiskni() : Integer;
function TISK_zrusit() : Integer;

function ARES_hledat(ico : AnsiString; obchodni_firma : AnsiString = ''; nazev_obce : AnsiString = ''; max_pocet : Integer = 0) : Integer;
function ARES_hledat_chyba() : AnsiString;
function ARES_hledat_pocet() : Integer;
function ARES_hledat_hodnota(index : Integer; klic : AnsiString = '') : AnsiString;

function ARES_detail(ico : AnsiString) : Integer;
function ARES_detail_chyba() : AnsiString;
function ARES_detail_hodnota(klic : AnsiString = '') : AnsiString;

function WEB_stahnout(adresa : AnsiString) : Integer;
function WEB_stahnout_chyba() : AnsiString;
function WEB_stahnout_obsah() : AnsiString;
function WEB_stahnout_hlavicky() : AnsiString;

function QR_vytvor(text : AnsiString; mezera : Integer; width : Integer; height : integer) : TBitmap;
function QR_vytvor_uloz(text : AnsiString; mezera : Integer; width : Integer; height : integer; soubor : AnsiString) : Integer;

function BANKA_vytvor_IBAN(stat : AnsiString; pred : AnsiString; ucet : AnsiString; banka : AnsiString) : AnsiString;

var
  g_api_env_init : Boolean = False;
  g_ftp_index : Integer = -1;

implementation

uses
  Dialogs, ftpapi;

function FTP_pripoj(server : AnsiString; uzivatel : AnsiString; heslo : AnsiString) : Integer;
begin
  if (g_api_env_init = False) then
  begin
    ftp_env_init();
    g_api_env_init := True;
  end;

  g_ftp_index := ftp_get(server, uzivatel, heslo);
end;

function FTP_konec() : Integer;
begin
  ftp_free(g_ftp_index);
end;

function FTP_listuj(var soubory : API_FTP_SA; var adresare : API_FTP_SA) : Integer;
var
  cnt : Integer;
  loop : Integer;
  cwd : Integer;
  a_cnt : Integer;
  b_cnt : Integer;

begin
  result := ftp_listing(g_ftp_index);

  SetLength(soubory, 0);
  SetLength(adresare, 0);

  a_cnt := 0;
  b_cnt := 0;

  if (result = 0) then
  begin
    cnt := ftp_listing_count();

    for loop := 0 to cnt - 1 do
    begin
      cwd := ftp_listing_get_flagtrycwd(loop);

      if (cwd = 1) then
      begin
        a_cnt := a_cnt + 1;
      end
      else
      begin
        b_cnt := b_cnt + 1;
      end;
    end;

    SetLength(adresare, a_cnt + 1);
    SetLength(soubory, b_cnt + 1);

    a_cnt := 0;
    b_cnt := 0;

    for loop := 0 to cnt - 1 do
    begin
      cwd := ftp_listing_get_flagtrycwd(loop);

      if (cwd = 1) then
      begin
        adresare[a_cnt + 1] := ftp_listing_get_name(loop);
        a_cnt := a_cnt + 1;
      end
      else
      begin
        soubory[b_cnt + 1] := ftp_listing_get_name(loop);
        b_cnt := b_cnt + 1;
      end;
    end;
  end;
end;

function FTP_nastav_cestu(cesta : AnsiString) : Integer;
begin
  result := ftp_set_path_abs(g_ftp_index, cesta);
end;

function FTP_nastav_cestu_relativne(cesta : AnsiString) : Integer;
begin
  result := ftp_set_path_rel(g_ftp_index, cesta);
end;

function FTP_nastav_cestu_nahoru() : Integer;
begin
  result := ftp_set_path_parent(g_ftp_index);
end;

function FTP_cesta() : AnsiString;
begin
  result := ftp_get_path(g_ftp_index);
end;

function FTP_nahraj(ftp_cesta : AnsiString; lokalni_cesta : AnsiString) : Integer;
begin
  result := ftp_upload(g_ftp_index, ftp_cesta, lokalni_cesta);
end;

function FTP_nahraj_text(ftp_cesta : AnsiString; text : AnsiString) : Integer;
begin
  result := ftp_upload_text(g_ftp_index, ftp_cesta, text);
end;

function FTP_stahni(ftp_cesta : AnsiString; lokalni_cesta : AnsiString) : Integer;
begin
  result := ftp_download(g_ftp_index, ftp_cesta, lokalni_cesta);
end;

function FTP_stahni_text(ftp_cesta : AnsiString) : AnsiString;
begin
  result := ftp_download_text(g_ftp_index, ftp_cesta);
end;

function FTP_prejmenuj(ftp_cesta_puvodni : AnsiString; ftp_cesta_nova : AnsiString) : Integer;
begin
  result := ftp_rename(g_ftp_index, ftp_cesta_puvodni, ftp_cesta_nova);
end;

function FTP_novy_adresar(ftp_cesta : AnsiString) : Integer;
begin
  result := ftp_create_directory(g_ftp_index, ftp_cesta);
end;

function FTP_smaz_soubor(ftp_cesta : AnsiString) : Integer;
begin
  result := ftp_delete_file(g_ftp_index, ftp_cesta);
end;

function FTP_smaz_adresar(ftp_cesta : AnsiString) : Integer;
begin
  result := ftp_delete_directory(g_ftp_index, ftp_cesta);
end;

function TISK_zacni_vychozi_tiskarna(nazev_ulohy : AnsiString; max_dpi : Integer) : Integer;
begin
  result := print_start(false, nazev_ulohy, max_dpi);
end;

function TISK_zacni_vyber_tiskarnu(nazev_ulohy : AnsiString; max_dpi : Integer) : Integer;
begin
  result := print_start(true, nazev_ulohy, max_dpi);
end;

function TISK_zacni_tiskarna(nazev_tiskarny : AnsiString; nazev_ulohy : AnsiString; max_dpi : Integer) : Integer;
var
  cnt : Integer;
  f : Integer;
  ds : Boolean;
begin
  cnt := print_load_printers_get_count();
  ds := false;

  if (cnt > 0) then
  begin
    for f := 0 to cnt - 1 do
    begin
      if (print_get_printer_detail(f, 0) = nazev_tiskarny) then
      begin
        ds := true;
      end;
    end;
  end;

  if (ds) then
  begin
    result := print_start_by_name(nazev_tiskarny, nazev_ulohy, max_dpi);
  end
  else
  begin
    result := print_start(false, nazev_ulohy, max_dpi);
  end;
end;

function TISK_zacni_pdf(nazev_tiskarny : AnsiString; nazev_ulohy : AnsiString; max_dpi : Integer; pdf_soubor : AnsiString) : Integer;
var
  cnt : Integer;
  f : Integer;
  ds : Boolean;
begin
  cnt := print_load_printers_get_count();
  ds := false;

  if (cnt > 0) then
  begin
    for f := 0 to cnt - 1 do
    begin
      if (print_get_printer_detail(f, 0) = nazev_tiskarny) then
      begin
        ds := true;
      end;
    end;
  end;

  if (ds) then
  begin
    result := print_start_pdf(nazev_tiskarny, nazev_ulohy, max_dpi, pdf_soubor);
  end
  else
  begin
    result := print_start_pdf(nazev_tiskarny, nazev_ulohy, max_dpi, pdf_soubor);
  end;
end;

function TISK_vrat_dpi(var dpi_x : API_FTP_SA; var dpi_y : API_FTP_SA) : Integer;
var
  num : Integer;
  f : Integer;
begin
  SetLength(dpi_x, 0);
  SetLength(dpi_y, 0);

  num := print_get_dpi_count();

  if (num > 0) then
  begin
    SetLength(dpi_x, num + 1);
    SetLength(dpi_y, num + 1);

    for f := 0 to num - 1 do
    begin
      dpi_x[f + 1] := IntToStr(print_get_dpi_x(f));
      dpi_y[f + 1] := IntToStr(print_get_dpi_y(f));
    end;

    result := num;
  end
  else
  begin
    result := num;
  end;
end;

function TISK_nastav_bitmapu(bmp : TBitmap) : Integer;
var
  BytesPerPixel : Integer;
  j : Integer;
  b : Integer;
  Row : pByteArray;
  str : AnsiString;
  buf : PAnsiChar;
  len : Integer;
  StartTime, EndTime : Int64;

begin
  //QueryPerformanceCounter(StartTime);

  if (print_image_start(Bmp.Width, Bmp.Height) = 0) then
  begin
    BytesPerPixel := 1;

    case bmp.PixelFormat of
      pf32bit : BytesPerPixel := 4;
      pf24bit : BytesPerPixel := 3;
      pf16bit : BytesPerPixel := 2;
      pf15bit : BytesPerPixel := 2;
      pfDevice : BytesPerPixel := 4;
      pfCustom : BytesPerPixel := 0; // INVALID !
    end;
    
    for j := 0 to bmp.Height - 1 do
    begin
      Row := pByteArray(bmp.Scanline[j]);

      //len := length(bmp.Scanline[j]);

      SetString(str, PAnsiChar(@Row[0]), Bmp.Width * BytesPerPixel);
      
      print_image_add_line(PAnsiChar(str), Bmp.Width * BytesPerPixel, BytesPerPixel);
    end;

    //QueryPerformanceCounter(EndTime);

    //ShowMessage('NASTAV BITMAPU cas: ' + IntToStr((EndTime - StartTime) div 1000000));

    result := 0;

  end
  else
  begin
    result := -1;
  end;
end;

function TISK_text(text : AnsiString) : Integer;
begin
  result := print_page_text(text);
end;

function TISK_obrazek_bmp(cesta : AnsiString; promile_x : Integer; promile_y : Integer; promile_sirka : Integer; promile_vyska : Integer) : Integer;
begin
  result := print_page_bitmap(cesta, promile_x, promile_y, promile_sirka, promile_vyska);
end;

function TISK_obrazek_bitmapa(bmp : TBitmap; promile_x : Integer; promile_y : Integer; promile_sirka : Integer; promile_vyska : Integer) : Integer;
begin
  if (TISK_nastav_bitmapu(bmp) = 0) then
  begin
    result := print_page_cached_image(promile_x, promile_y, promile_sirka, promile_vyska);
  end
  else
  begin
    result := -1;
  end;
end;

function TISK_dokonci_a_vytiskni() : Integer;
begin
  result := print_finish();
end;

function TISK_zrusit() : Integer;
begin
  result := print_cancel();
end;

function ARES_hledat(ico : AnsiString; obchodni_firma : AnsiString; nazev_obce : AnsiString; max_pocet : Integer) : Integer;
begin
  if (g_api_env_init = False) then
  begin
    ftp_env_init();
    g_api_env_init := True;
  end;

  result := ares_list_request(ico, obchodni_firma, nazev_obce, max_pocet);
end;
              
function ARES_hledat_chyba() : AnsiString;
begin
  result := ares_list_error();
end;

function ARES_hledat_pocet() : Integer;
begin
  result := ares_list_response_count();
end;

function _separed_string_key(str : AnsiString; klic : AnsiString) : AnsiString;
var
  tmp : AnsiString;
  idx : Integer;

  sub : AnsiString;
  subIdx : Integer;

  found : Boolean;
  sumarize : AnsiString;
begin
  found := False;
  sumarize := '';

  repeat
    idx := Pos('|', str);

    if (idx = 0) then
    begin
      tmp := str;
    end
    else
    begin
      tmp := Copy(str, 1, idx - 1);
      str := Copy(str, idx + 1, Length(str) - idx);
    end;

    subIdx := Pos(':', tmp);

    sub := Copy(tmp, 1, subIdx - 1);
    tmp := Copy(tmp, subIdx + 1, Length(tmp) - subIdx);

    if (sub = '') then
    begin
      // ...
    end
    else if (klic = '') then
    begin
      sumarize := sumarize + sub + ': ' + tmp + Chr(10) + Chr(13); 
    end
    else if (klic = sub) then
    begin
      result := tmp;
      found := True;
    end;

  until (idx = 0) or (found = true);

  if (klic = '') then
  begin
    result := sumarize;
  end
  else if (found = False) then
  begin
    result := '';
  end;
end;

function ARES_hledat_hodnota(index : Integer; klic : AnsiString) : AnsiString;
begin
  result := _separed_string_key(ares_list_response(index), klic);
end;

function ARES_detail(ico : AnsiString) : Integer;
begin
  if (g_api_env_init = False) then
  begin
    ftp_env_init();
    g_api_env_init := True;
  end;

  result := ares_detail_request(ico);
end;

function ARES_detail_chyba() : AnsiString;
begin
  result := ares_detail_error();
end;

function ARES_detail_hodnota(klic : AnsiString) : AnsiString;
begin
  result := _separed_string_key(ares_detail_response(), klic);
end;

function WEB_stahnout(adresa : AnsiString) : Integer;
begin
  if (g_api_env_init = False) then
  begin
    ftp_env_init();
    g_api_env_init := True;
  end;

  result := http_request(adresa);
end;

function WEB_stahnout_chyba() : AnsiString;
begin
  result := http_error();
end;

function WEB_stahnout_obsah() : AnsiString;
begin
  result := http_response();
end;

function WEB_stahnout_hlavicky() : AnsiString;
begin
  result := http_header();
end;

function QR_vytvor(text : AnsiString; mezera : Integer; width : Integer; height : integer) : TBitmap;
var
  QRCode: TDelphiZXingQRCode;
  bmp: TBitmap;
  bmpBuff : TBitmap;
  Row, Column: Integer;

begin
  QRCode := TDelphiZXingQRCode.Create;
  QRCode.Data := text;
  QRCode.Encoding := qrISO88591;
  QRCode.QuietZone := 0;

  bmp := TBitmap.Create;
  bmp.Width := QRCode.Rows + mezera * 2;
  bmp.Height := QRCode.Columns + mezera * 2;

  for Row := 0 to QRCode.Rows - 1 do
  begin
    for Column := 0 to QRCode.Columns - 1 do
    begin
      if (QRCode.IsBlack[Row, Column]) then
      begin
        bmp.Canvas.Pixels[Column + mezera, Row + mezera] := clBlack;
      end else
      begin
        bmp.Canvas.Pixels[Column + mezera, Row + mezera] := clWhite;
      end;
    end;
  end;

  if (width <> -1) and (height <> -1) then
  begin
    bmpBuff := TBitmap.Create;
    bmpBuff.Width := width;
    bmpBuff.Height := height;
    bmpBuff.Canvas.StretchDraw(Rect(0, 0, width, height), bmp);

    bmp.Free;

    QR_vytvor := bmpBuff;

  end
  else
  begin
    QR_vytvor := bmp;
  end;
end;

function QR_vytvor_uloz(text : AnsiString; mezera : Integer; width : Integer; height : integer; soubor : AnsiString) : Integer;
var
  bmp: TBitmap;

begin
  bmp := QR_vytvor(text, mezera, width, height);
  bmp.SaveToFile(soubor);

  QR_vytvor_uloz := 0;
end;

function _iban_numeric(input : AnsiString) : AnsiString;
var
  pos : Integer;
  fin : AnsiString;
  ch : AnsiString;

begin
  fin := '';

  for pos := 1 to Length(input) do
  begin
    ch := Copy(input, pos, 1);

    if
      (ch = '0') or
      (ch = '1') or
      (ch = '2') or
      (ch = '3') or
      (ch = '4') or
      (ch = '5') or
      (ch = '6') or
      (ch = '7') or
      (ch = '8') or
      (ch = '9')
    then fin := fin + ch;
  end;

  result := fin;
end;

function _add_to_iban(iban : AnsiString; toAdd : AnsiString; maxLen : Integer) : AnsiString;
var
  pos : Integer;
  useLen : Integer;

begin
   useLen := Length(toAdd);

   if (useLen > maxLen) then useLen := maxLen;

   for pos := useLen + 1 to maxLen do
   begin
     iban := iban + '0';
   end;

   for pos := 1 to useLen do
   begin
     iban := iban + Copy(toAdd, pos, 1);
   end;

   result := iban;
end;

function BANKA_vytvor_IBAN(stat : AnsiString; pred : AnsiString; ucet : AnsiString; banka : AnsiString) : AnsiString;
var
  iban : AnsiString;
  pos : Integer;
  useLen : Integer;
  ibanCh : AnsiString;
  ch : AnsiString;
  part : AnsiString;
  rest : AnsiString;
  divRes : AnsiString;
  numb : Integer;

begin
  iban := '';
  stat := UpperCase(stat);

  if (stat = 'CZ') then
  begin
     iban := iban + 'CZ00';

     iban := _add_to_iban(iban, _iban_numeric(banka), 4);
     iban := _add_to_iban(iban, _iban_numeric(pred), 6);
     iban := _add_to_iban(iban, _iban_numeric(ucet), 10);
  end;

  if (Length(iban) > 4) then
  begin
     ibanCh := Copy(iban, 5, Length(iban) - 4);

     for pos := 1 to 4 do
     begin
        ch := Copy(iban, pos, 1);

        if (ch = 'A') then ibanCh := ibanCh + '10'
        else if (ch = 'B') then ibanCh := ibanCh + '11'
        else if (ch = 'C') then ibanCh := ibanCh + '12'
        else if (ch = 'D') then ibanCh := ibanCh + '13'
        else if (ch = 'E') then ibanCh := ibanCh + '14'
        else if (ch = 'F') then ibanCh := ibanCh + '15'
        else if (ch = 'G') then ibanCh := ibanCh + '16'
        else if (ch = 'H') then ibanCh := ibanCh + '17'
        else if (ch = 'I') then ibanCh := ibanCh + '18'
        else if (ch = 'J') then ibanCh := ibanCh + '19'
        else if (ch = 'K') then ibanCh := ibanCh + '20'
        else if (ch = 'L') then ibanCh := ibanCh + '21'
        else if (ch = 'M') then ibanCh := ibanCh + '22'
        else if (ch = 'N') then ibanCh := ibanCh + '23'
        else if (ch = 'O') then ibanCh := ibanCh + '24'
        else if (ch = 'P') then ibanCh := ibanCh + '25'
        else if (ch = 'Q') then ibanCh := ibanCh + '26'
        else if (ch = 'R') then ibanCh := ibanCh + '27'
        else if (ch = 'S') then ibanCh := ibanCh + '28'
        else if (ch = 'T') then ibanCh := ibanCh + '29'
        else if (ch = 'U') then ibanCh := ibanCh + '30'
        else if (ch = 'V') then ibanCh := ibanCh + '31'
        else if (ch = 'W') then ibanCh := ibanCh + '32'
        else if (ch = 'X') then ibanCh := ibanCh + '33'
        else if (ch = 'Y') then ibanCh := ibanCh + '34'
        else if (ch = 'Z') then ibanCh := ibanCh + '35'
        else ibanCh := ibanCh + ch;
     end;

     useLen := Length(ibanCh);
     pos := 1;

     part := '';
     rest := '';
     divRes := '';

     while (pos <= useLen) do
     begin
       part := Copy(ibanCh, pos, 1);
       rest := rest + part;

       numb := StrToInt(rest);
       divRes := divRes + IntToStr(numb div 97);

       //ShowMessage('PART: ' + rest + ', DIV: ' + IntToStr(numb div 97) + ', MOD: ' + IntToStr(numb mod 97) + ', DIVRES: ' + divRes);
       
       rest := IntToStr(numb mod 97);

       pos := pos + 1;
     end;

     //ShowMessage('DIVPRE: ' + ibanCh);
     //ShowMessage('DIVRES: ' + divRes);
     //ShowMessage('REST: ' + rest);

     numb := 98 - StrToInt(rest);
     part := IntToStr(numb);

     if (Length(part) < 2) then part := '0' + part;

     ibanCh := Copy(iban, 1, 2);
     ibanCh := ibanCh + part;
     ibanCh := ibanCh + Copy(iban, 5, Length(iban) - 4);

     iban := ibanCh;
  end;

  result := iban;
end;


end.
