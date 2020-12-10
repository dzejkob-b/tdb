unit ftpapi;

interface

const ftpapi_dll_name = 'ftplibapi.dll';

type

TByteArray = array [0..32767] of Byte;
PByteArray = ^TByteArray;


T_ftp_env_init = procedure; cdecl;
T_ftp_env_close = procedure; cdecl;
T_ftp_freechar = procedure(ptr : PAnsiChar); cdecl;
T_ftp_cha_count = function() : Integer; cdecl;
T_ftp_cha_get = function(index : Integer) : PAnsiChar; cdecl;

T_ftp_get = function(prefix : PAnsiChar; username : PAnsiChar; password : PAnsiChar) : Integer; cdecl;
T_ftp_free = function(index : Integer) : Integer; cdecl;

T_ftp_set_path_rel = function(ftp_index : Integer; path : PAnsiChar) : Integer; cdecl;
T_ftp_set_path_abs = function(ftp_index : Integer; path : PAnsiChar) : Integer; cdecl;
T_ftp_set_path_parent = function(ftp_index : Integer) : Integer; cdecl;
T_ftp_get_path = function(ftp_index : Integer) : PAnsiChar; cdecl;

T_ftp_listing = function(ftp_index : Integer) : Integer; cdecl;
T_ftp_listing_count = function() : Integer; cdecl;
T_ftp_listing_get_flagtrycwd = function(index : Integer) : Integer; cdecl;
T_ftp_listing_get_name = function(index : Integer) : PAnsiChar; cdecl;

T_ftp_download = function(ftp_index : Integer; ftp_name : PAnsiChar; local_name : PAnsiChar) : Integer; cdecl;
T_ftp_download_text = function(ftp_index : Integer; ftp_name : PAnsiChar) : PAnsiChar; cdecl;

T_ftp_upload = function(ftp_index : Integer; ftp_name : PAnsiChar; local_name : PAnsiChar) : Integer; cdecl;
T_ftp_upload_text = function(ftp_index : Integer; ftp_name : PAnsiChar; text : PAnsiChar) : Integer; cdecl;

T_ftp_rename = function(ftp_index : Integer; ftp_name_before : PAnsiChar; ftp_name_after : PAnsiChar) : Integer; cdecl;
T_ftp_create_directory = function(ftp_index : Integer; ftp_dir_name : PAnsiChar) : Integer; cdecl;
T_ftp_delete_file = function(ftp_index : Integer; ftp_name : PAnsiChar) : Integer; cdecl;
T_ftp_delete_directory = function(ftp_index : Integer; ftp_name : PAnsiChar) : Integer; cdecl;

T_email_init = function(smtp_server : PAnsiChar; smtp_user : PAnsiChar; smtp_password : PAnsiChar) : Integer; cdecl;
T_email_do_send = function() : Integer; cdecl;
T_email_set_from = function(input : PAnsiChar) : Integer; cdecl;
T_email_set_to = function(input : PAnsiChar) : Integer; cdecl;
T_email_set_subject = function(input : PAnsiChar) : Integer; cdecl;
T_email_set_body = function(input : PAnsiChar) : Integer; cdecl;
T_email_add_attachment = function(path : PAnsiChar; name : PAnsiChar) : Integer; cdecl;

T_convert_iconv = function(from_charset : PAnsiChar; to_charset : PAnsiChar; input : PAnsiChar) : PAnsiChar; cdecl;
T_convert_xml_entities = function(input : PAnsiChar) : PAnsiChar; cdecl;

T_print_image_start = function(width : Integer; height : Integer) : Integer; cdecl;
T_print_image_add_line = function(bytes : PAnsiChar; bytes_length : Integer; bytes_pixel : Integer) : Integer; cdecl;
T_print_image_save_jpeg = function(filename : PAnsiChar; quality : Integer) : Integer; cdecl;
T_print_image_save_bmp = function(filename : PAnsiChar) : Integer; cdecl;

T_print_load_printers_get_count = function() : Integer; cdecl;
T_print_get_printer_detail = function(index : Integer; flag : Integer) : PAnsiChar; cdecl;
T_print_start = function(printer_dialog : Boolean; document_name : PAnsiChar; max_dpi : integer) : Integer; cdecl;
T_print_start_by_name = function(printer_name : PAnsiChar; document_name : PAnsiChar; max_dpi : Integer) : Integer; cdecl;
T_print_start_pdf = function(printer_name : PAnsiChar; document_name : PAnsiChar; max_dpi : Integer; pdf_file : PAnsiChar) : Integer; cdecl;
T_print_test_dpi = function(max_dpi : Integer) : Integer; cdecl;
T_print_get_dpi_count = function() : Integer; cdecl;
T_print_get_dpi_x = function(index : Integer) : Integer; cdecl;
T_print_get_dpi_y = function(index : Integer) : Integer; cdecl;
T_print_page_text = function(text : PAnsiChar) : Integer; cdecl;
T_print_page_bitmap = function(path : PAnsiChar; add_x : Integer; add_y : Integer; add_width : Integer; add_height : Integer) : Integer; cdecl;
T_print_page_cached_image = function(add_x : Integer; add_y : Integer; add_width : Integer; add_height : Integer) : Integer; cdecl;
T_print_finish = function() : Integer; cdecl;
T_print_cancel = function() : Integer; cdecl;


T_term_init = function() : Integer; cdecl;
T_term_setup = function(terminal_type : PAnsiChar; terminal_host : PAnsiChar; terminal_port : PAnsiChar; terminal_pos : PAnsiChar; self_port : Integer) : Integer; cdecl;
T_term_set_log_path = function(path : PAnsiChar) : Integer; cdecl;
T_term_stop = function() : Integer; cdecl;

T_term_get_status = function() : PAnsiChar; cdecl;
T_term_get_status_internal_error = function() : PAnsiChar; cdecl;
T_term_get_status_version = function() : PAnsiChar; cdecl;
T_term_get_status_podpis = function() : Boolean; cdecl;
T_term_get_status_listecek = function() : Boolean; cdecl;
T_term_is_session_state_opened = function() : Boolean; cdecl;
T_term_is_session_state_waiting_confirm = function() : Boolean; cdecl;
T_term_is_debug_verbose = function() : Boolean; cdecl;
T_term_get_terminal_pos = function() : PAnsiChar; cdecl;
T_term_get_resp_amount = function() : Double; cdecl;
T_term_get_resp_symbol = function() : PAnsiChar; cdecl;
T_term_get_resp_currency = function() : PAnsiChar; cdecl;
T_term_get_resp_server_message = function() : PAnsiChar; cdecl;
T_term_get_resp_card_brand = function() : PAnsiChar; cdecl;
T_term_get_resp_pan = function() : PAnsiChar; cdecl;
T_term_get_resp_approval_code = function() : PAnsiChar; cdecl;
T_term_get_resp_sequence_id = function() : PAnsiChar; cdecl;
T_term_get_resp_err_code = function() : Integer; cdecl;
T_term_get_resp_err_approved = function() : Boolean; cdecl;
T_term_get_resp_err_info = function() : PAnsiChar; cdecl;
T_term_get_resp_err_readable_info = function() : PAnsiChar; cdecl;
T_term_get_resp_ticket_merchant = function() : PAnsiChar; cdecl;
T_term_get_resp_ticket_customer = function() : PAnsiChar; cdecl;
T_term_get_status_readable = function() : PAnsiChar; cdecl;

T_term_app_info_request = function() : Integer; cdecl;
T_term_payment_request = function(amount : Double; symbol : PAnsiChar; currency : PAnsiChar) : Integer; cdecl;
T_term_refund_request = function(amount : Double; symbol : PAnsiChar; currency : PAnsiChar; PAN_value : PAnsiChar) : Integer; cdecl;
T_term_last_result_request = function() : Integer; cdecl;
T_term_reversal_request = function(approval_code : PAnsiChar) : Integer; cdecl;
T_term_passivate = function() : Integer; cdecl;
T_term_passivate_no_reply = function() : Integer; cdecl;
T_term_handshake = function() : Integer; cdecl;
T_term_tms_call = function() : Integer; cdecl;
T_term_close_totals = function() : Integer; cdecl;
T_term_send_confirmation = function() : Integer; cdecl;

T_ares_list_request = function(ico : PAnsiChar; obchodni_firma : PAnsiChar; nazev_obce : PAnsiChar; max_pocet : Integer) : Integer; cdecl;
T_ares_list_response_count = function() : Integer; cdecl;
T_ares_list_response = function(index : Integer) : PAnsiChar; cdecl;
T_ares_list_error = function() : PAnsiChar; cdecl;

T_ares_detail_request = function(ico : PAnsiChar) : Integer; cdecl;
T_ares_detail_response = function() : PAnsiChar; cdecl;
T_ares_detail_error = function() : PAnsiChar; cdecl;

T_http_request = function(url : PAnsiChar) : Integer; cdecl;
T_http_response = function() : PAnsiChar; cdecl;
T_http_header = function() : PAnsiChar; cdecl;
T_http_error = function() : PAnsiChar; cdecl;


var
_ftp_env_init : T_ftp_env_init;
_ftp_env_close : T_ftp_env_close;
_ftp_freechar : T_ftp_freechar;
_ftp_cha_count : T_ftp_cha_count;
_ftp_cha_get : T_ftp_cha_get;

_ftp_get : T_ftp_get;
_ftp_free : T_ftp_free;

_ftp_set_path_rel : T_ftp_set_path_rel;
_ftp_set_path_abs : T_ftp_set_path_abs;
_ftp_set_path_parent : T_ftp_set_path_parent;
_ftp_get_path : T_ftp_get_path;

_ftp_listing : T_ftp_listing;
_ftp_listing_count : T_ftp_listing_count;
_ftp_listing_get_flagtrycwd : T_ftp_listing_get_flagtrycwd;
_ftp_listing_get_name : T_ftp_listing_get_name;

_ftp_download : T_ftp_download;
_ftp_download_text : T_ftp_download_text;

_ftp_upload : T_ftp_upload;
_ftp_upload_text : T_ftp_upload_text;

_ftp_rename : T_ftp_rename;
_ftp_create_directory : T_ftp_create_directory;
_ftp_delete_file : T_ftp_delete_file;
_ftp_delete_directory : T_ftp_delete_directory;

_email_init : T_email_init;
_email_do_send : T_email_do_send;
_email_set_from : T_email_set_from;
_email_set_to : T_email_set_to;
_email_set_subject : T_email_set_subject;
_email_set_body : T_email_set_body;
_email_add_attachment : T_email_add_attachment;

_convert_iconv : T_convert_iconv;
_convert_xml_entities : T_convert_xml_entities;

_print_image_start : T_print_image_start;
_print_image_add_line : T_print_image_add_line;
_print_image_save_jpeg : T_print_image_save_jpeg;
_print_image_save_bmp : T_print_image_save_bmp;

_print_load_printers_get_count : T_print_load_printers_get_count;
_print_get_printer_detail : T_print_get_printer_detail;
_print_start : T_print_start;
_print_start_by_name : T_print_start_by_name;
_print_start_pdf : T_print_start_pdf;
_print_test_dpi : T_print_test_dpi;
_print_get_dpi_count : T_print_get_dpi_count;
_print_get_dpi_x : T_print_get_dpi_x;
_print_get_dpi_y : T_print_get_dpi_y;
_print_page_text : T_print_page_text;
_print_page_bitmap : T_print_page_bitmap;
_print_page_cached_image : T_print_page_cached_image;
_print_finish : T_print_finish;
_print_cancel : T_print_cancel;


_term_init : T_term_init;
_term_setup : T_term_setup;
_term_set_log_path : T_term_set_log_path;
_term_stop : T_term_stop;

_term_get_status : T_term_get_status;
_term_get_status_internal_error : T_term_get_status_internal_error;
_term_get_status_version : T_term_get_status_version;
_term_get_status_podpis : T_term_get_status_podpis;
_term_get_status_listecek : T_term_get_status_listecek;
_term_is_session_state_opened : T_term_is_session_state_opened;
_term_is_session_state_waiting_confirm : T_term_is_session_state_waiting_confirm;
_term_is_debug_verbose : T_term_is_debug_verbose;
_term_get_terminal_pos : T_term_get_terminal_pos;
_term_get_resp_amount : T_term_get_resp_amount;
_term_get_resp_symbol : T_term_get_resp_symbol;
_term_get_resp_currency : T_term_get_resp_currency;
_term_get_resp_server_message : T_term_get_resp_server_message;
_term_get_resp_card_brand : T_term_get_resp_card_brand;
_term_get_resp_pan : T_term_get_resp_pan;
_term_get_resp_approval_code : T_term_get_resp_approval_code;
_term_get_resp_sequence_id : T_term_get_resp_sequence_id;
_term_get_resp_err_code : T_term_get_resp_err_code;
_term_get_resp_err_approved : T_term_get_resp_err_approved;
_term_get_resp_err_info : T_term_get_resp_err_info;
_term_get_resp_err_readable_info : T_term_get_resp_err_readable_info;
_term_get_resp_ticket_merchant : T_term_get_resp_ticket_merchant;
_term_get_resp_ticket_customer : T_term_get_resp_ticket_customer;
_term_get_status_readable : T_term_get_status_readable;

_term_app_info_request : T_term_app_info_request;
_term_payment_request : T_term_payment_request;
_term_refund_request : T_term_refund_request;
_term_last_result_request : T_term_last_result_request;
_term_reversal_request : T_term_reversal_request;
_term_passivate : T_term_passivate;
_term_passivate_no_reply : T_term_passivate_no_reply;
_term_handshake : T_term_handshake;
_term_tms_call : T_term_tms_call;
_term_close_totals : T_term_close_totals;
_term_send_confirmation : T_term_send_confirmation;

_ares_list_request : T_ares_list_request;
_ares_list_response_count : T_ares_list_response_count;
_ares_list_response : T_ares_list_response;
_ares_list_error : T_ares_list_error;

_ares_detail_request : T_ares_detail_request;
_ares_detail_response : T_ares_detail_response;
_ares_detail_error : T_ares_detail_error;

_http_request : T_http_request;
_http_response : T_http_response;
_http_header : T_http_header;
_http_error : T_http_error;



procedure ftp_dll_init;
procedure ftp_env_init;
procedure ftp_env_close;
function ftp_cha_count() : Integer;
function ftp_cha_get(index : Integer) : AnsiString;

function ftp_get(prefix : AnsiString; username : AnsiString; password : AnsiString) : Integer;
function ftp_free(index : Integer) : Integer;

function ftp_set_path_rel(ftp_index : Integer; path : AnsiString) : Integer;
function ftp_set_path_abs(ftp_index : Integer; path : AnsiString) : Integer;
function ftp_set_path_parent(ftp_index : Integer) : Integer;
function ftp_get_path(ftp_index : Integer) : AnsiString;

function ftp_listing(ftp_index : Integer) : Integer;
function ftp_listing_count() : Integer;
function ftp_listing_get_flagtrycwd(index : Integer) : Integer;
function ftp_listing_get_name(index : Integer) : AnsiString;

function ftp_download(ftp_index : Integer; ftp_name : AnsiString; local_name : AnsiString) : Integer;
function ftp_download_text(ftp_index : Integer; ftp_name : AnsiString) : AnsiString;

function ftp_upload(ftp_index : Integer; ftp_name : AnsiString; local_name : AnsiString) : Integer;
function ftp_upload_text(ftp_index : Integer; ftp_name : AnsiString; text : AnsiString) : Integer;

function ftp_rename(ftp_index : Integer; ftp_name_before : AnsiString; ftp_name_after : AnsiString) : Integer;
function ftp_create_directory(ftp_index : Integer; ftp_dir_name : AnsiString) : Integer;
function ftp_delete_file(ftp_index : Integer; ftp_name : AnsiString) : Integer;
function ftp_delete_directory(ftp_index : Integer; ftp_name : AnsiString) : Integer;

function email_init(smtp_server : AnsiString; smtp_user : AnsiString; smtp_password : AnsiString) : Integer;
function email_do_send() : Integer;
function email_set_from(input : AnsiString) : Integer;
function email_set_to(input : AnsiString) : Integer;
function email_set_subject(input : AnsiString) : Integer;
function email_set_body(input : AnsiString) : Integer;
function email_add_attachment(path : AnsiString; name : AnsiString) : Integer;

function convert_iconv(from_charset : AnsiString; to_charset : AnsiString; input : AnsiString) : AnsiString;
function convert_xml_entities(input : AnsiString) : AnsiString;

function print_image_start(width : Integer; height : Integer) : Integer;
function print_image_add_line(bytes : PAnsiChar; bytes_length : Integer; bytes_pixel : Integer) : Integer;
function print_image_save_jpeg(filename : PAnsiChar; quality : Integer) : Integer;
function print_image_save_bmp(filename : PAnsiChar) : Integer;

function print_load_printers_get_count() : Integer;
function print_get_printer_detail(index : Integer; flag : Integer) : AnsiString;
function print_start(printer_dialog : Boolean; document_name : AnsiString; max_dpi : Integer) : Integer;
function print_start_by_name(printer_name : AnsiString; document_name : AnsiString; max_dpi : Integer) : Integer;
function print_start_pdf(printer_name : AnsiString; document_name : AnsiString; max_dpi : Integer; pdf_file : AnsiString) : Integer;
function print_test_dpi(max_dpi : Integer) : Integer;
function print_get_dpi_count() : Integer;
function print_get_dpi_x(index : Integer) : Integer;
function print_get_dpi_y(index : Integer) : Integer;
function print_page_text(text : AnsiString) : Integer;
function print_page_bitmap(path : AnsiString; add_x : Integer; add_y : Integer; add_width : Integer; add_height : Integer) : Integer;
function print_page_cached_image(add_x : Integer; add_y : Integer; add_width : Integer; add_height : Integer) : Integer;
function print_finish() : Integer;
function print_cancel() : Integer;

function term_init() : Integer;
function term_setup(terminal_type : AnsiString; terminal_host : AnsiString; terminal_port : AnsiString; terminal_pos : AnsiString; self_port : Integer) : Integer;
function term_set_log_path(path : AnsiString) : Integer;
function term_stop() : Integer;

function term_get_status() : AnsiString;
function term_get_status_internal_error() : AnsiString;
function term_get_status_version() : AnsiString;
function term_get_status_podpis() : Boolean;
function term_get_status_listecek() : Boolean;
function term_is_session_state_opened() : Boolean;
function term_is_session_state_waiting_confirm() : Boolean;
function term_is_debug_verbose() : Boolean;
function term_get_terminal_pos() : AnsiString;
function term_get_resp_amount() : Double;
function term_get_resp_symbol() : AnsiString;
function term_get_resp_currency() : AnsiString;
function term_get_resp_server_message() : AnsiString;
function term_get_resp_card_brand() : AnsiString;
function term_get_resp_pan() : AnsiString;
function term_get_resp_approval_code() : AnsiString;
function term_get_resp_sequence_id() : AnsiString;
function term_get_resp_err_code() : Integer;
function term_get_resp_err_approved() : Boolean;
function term_get_resp_err_info() : AnsiString;
function term_get_resp_err_readable_info() : AnsiString;
function term_get_resp_ticket_merchant() : AnsiString;
function term_get_resp_ticket_customer() : AnsiString;
function term_get_status_readable() : AnsiString;

function term_app_info_request() : Integer;
function term_payment_request(amount : Double; symbol : AnsiString; currency : AnsiString) : Integer;
function term_refund_request(amount : Double; symbol : AnsiString; currency : AnsiString; PAN_value : AnsiString) : Integer;
function term_last_result_request() : Integer;
function term_reversal_request(approval_code : AnsiString) : Integer;
function term_passivate() : Integer;
function term_passivate_no_reply() : Integer;
function term_handshake() : Integer;
function term_tms_call() : Integer;
function term_close_totals() : Integer;
function term_send_confirmation() : Integer;

function ares_list_request(ico : AnsiString; obchodni_firma : AnsiString; nazev_obce : AnsiString; max_pocet : Integer) : Integer;
function ares_list_response_count() : Integer;
function ares_list_response(index : Integer) : AnsiString;
function ares_list_error() : AnsiString;

function ares_detail_request(ico : AnsiString) : Integer;
function ares_detail_response() : AnsiString;
function ares_detail_error() : AnsiString;

function http_request(url : AnsiString) : Integer;
function http_response() : AnsiString;
function http_header() : AnsiString;
function http_error() : AnsiString;


implementation

uses
  Dialogs, SysUtils, Windows, Classes, Graphics, StdCtrls;

var
  g_dll_handle : Integer = 0;


procedure ftp_dll_init;
var
  SavedCW: word;
begin
  if (g_dll_handle = 0) then
  begin
    SavedCW := Default8087CW;
    //Set8087CW(SavedCW or $7);
    Set8087CW(8087);
    g_dll_handle := SafeLoadLibrary(ftpapi_dll_name);

    if (g_dll_handle = 0) then
    begin
      ShowMessage('Nebylo mozne inicializovat externi rozhrani pro praci s ftp! ' + SysErrorMessage(GetLastError()));
    end
    else
    begin
@_ftp_env_init := GetProcAddress(g_dll_handle, '_ftp_env_init');
@_ftp_env_close := GetProcAddress(g_dll_handle, '_ftp_env_close');
@_ftp_freechar := GetProcAddress(g_dll_handle, '_ftp_freechar');
@_ftp_cha_count := GetProcAddress(g_dll_handle, '_ftp_cha_count');
@_ftp_cha_get := GetProcAddress(g_dll_handle, '_ftp_cha_get');
@_ftp_get := GetProcAddress(g_dll_handle, '_ftp_get');
@_ftp_free := GetProcAddress(g_dll_handle, '_ftp_free');
@_ftp_set_path_rel := GetProcAddress(g_dll_handle, '_ftp_set_path_rel');
@_ftp_set_path_abs := GetProcAddress(g_dll_handle, '_ftp_set_path_abs');
@_ftp_set_path_parent := GetProcAddress(g_dll_handle, '_ftp_set_path_parent');
@_ftp_get_path := GetProcAddress(g_dll_handle, '_ftp_get_path');
@_ftp_listing := GetProcAddress(g_dll_handle, '_ftp_listing');
@_ftp_listing_count := GetProcAddress(g_dll_handle, '_ftp_listing_count');
@_ftp_listing_get_flagtrycwd := GetProcAddress(g_dll_handle, '_ftp_listing_get_flagtrycwd');
@_ftp_listing_get_flagtrycwd := GetProcAddress(g_dll_handle, '_ftp_listing_get_flagtrycwd');
@_ftp_listing_get_name := GetProcAddress(g_dll_handle, '_ftp_listing_get_name');
@_ftp_download := GetProcAddress(g_dll_handle, '_ftp_download');
@_ftp_download_text := GetProcAddress(g_dll_handle, '_ftp_download_text');
@_ftp_upload := GetProcAddress(g_dll_handle, '_ftp_upload');
@_ftp_upload_text := GetProcAddress(g_dll_handle, '_ftp_upload_text');
@_ftp_rename := GetProcAddress(g_dll_handle, '_ftp_rename');
@_ftp_create_directory := GetProcAddress(g_dll_handle, '_ftp_create_directory');
@_ftp_delete_file := GetProcAddress(g_dll_handle, '_ftp_delete_file');
@_ftp_delete_directory := GetProcAddress(g_dll_handle, '_ftp_delete_directory');
@_email_init := GetProcAddress(g_dll_handle, '_email_init');
@_email_do_send := GetProcAddress(g_dll_handle, '_email_do_send');
@_email_set_from := GetProcAddress(g_dll_handle, '_email_set_from');
@_email_set_to := GetProcAddress(g_dll_handle, '_email_set_to');
@_email_set_subject := GetProcAddress(g_dll_handle, '_email_set_subject');
@_email_set_body := GetProcAddress(g_dll_handle, '_email_set_body');
@_email_add_attachment := GetProcAddress(g_dll_handle, '_email_add_attachment');
@_convert_iconv := GetProcAddress(g_dll_handle, '_convert_iconv');
@_convert_xml_entities := GetProcAddress(g_dll_handle, '_convert_xml_entities');
@_print_image_start := GetProcAddress(g_dll_handle, '_print_image_start');
@_print_image_add_line := GetProcAddress(g_dll_handle, '_print_image_add_line');
@_print_image_save_jpeg := GetProcAddress(g_dll_handle, '_print_image_save_jpeg');
@_print_image_save_bmp := GetProcAddress(g_dll_handle, '_print_image_save_bmp');
@_print_load_printers_get_count := GetProcAddress(g_dll_handle, '_print_load_printers_get_count');
@_print_get_printer_detail := GetProcAddress(g_dll_handle, '_print_get_printer_detail');
@_print_start := GetProcAddress(g_dll_handle, '_print_start');
@_print_start_by_name := GetProcAddress(g_dll_handle, '_print_start_by_name');
@_print_start_pdf := GetProcAddress(g_dll_handle, '_print_start_pdf');
@_print_test_dpi := GetProcAddress(g_dll_handle, '_print_test_dpi');
@_print_get_dpi_count := GetProcAddress(g_dll_handle, '_print_get_dpi_count');
@_print_get_dpi_x := GetProcAddress(g_dll_handle, '_print_get_dpi_x');
@_print_get_dpi_y := GetProcAddress(g_dll_handle, '_print_get_dpi_y');
@_print_page_text := GetProcAddress(g_dll_handle, '_print_page_text');
@_print_page_bitmap := GetProcAddress(g_dll_handle, '_print_page_bitmap');
@_print_page_cached_image := GetProcAddress(g_dll_handle, '_print_page_cached_image');
@_print_finish := GetProcAddress(g_dll_handle, '_print_finish');
@_print_cancel := GetProcAddress(g_dll_handle, '_print_cancel');
@_term_init := GetProcAddress(g_dll_handle, '_term_init');
@_term_setup := GetProcAddress(g_dll_handle, '_term_setup');
@_term_set_log_path := GetProcAddress(g_dll_handle, '_term_set_log_path');
@_term_stop := GetProcAddress(g_dll_handle, '_term_stop');
@_term_get_status := GetProcAddress(g_dll_handle, '_term_get_status');
@_term_get_status_internal_error := GetProcAddress(g_dll_handle, '_term_get_status_internal_error');
@_term_get_status_version := GetProcAddress(g_dll_handle, '_term_get_status_version');
@_term_get_status_podpis := GetProcAddress(g_dll_handle, '_term_get_status_podpis');
@_term_get_status_listecek := GetProcAddress(g_dll_handle, '_term_get_status_listecek');
@_term_is_session_state_opened := GetProcAddress(g_dll_handle, '_term_is_session_state_opened');
@_term_is_session_state_waiting_confirm := GetProcAddress(g_dll_handle, '_term_is_session_state_waiting_confirm');
@_term_is_debug_verbose := GetProcAddress(g_dll_handle, '_term_is_debug_verbose');
@_term_get_terminal_pos := GetProcAddress(g_dll_handle, '_term_get_terminal_pos');
@_term_get_resp_amount := GetProcAddress(g_dll_handle, '_term_get_resp_amount');
@_term_get_resp_symbol := GetProcAddress(g_dll_handle, '_term_get_resp_symbol');
@_term_get_resp_currency := GetProcAddress(g_dll_handle, '_term_get_resp_currency');
@_term_get_resp_server_message := GetProcAddress(g_dll_handle, '_term_get_resp_server_message');
@_term_get_resp_card_brand := GetProcAddress(g_dll_handle, '_term_get_resp_card_brand');
@_term_get_resp_pan := GetProcAddress(g_dll_handle, '_term_get_resp_pan');
@_term_get_resp_approval_code := GetProcAddress(g_dll_handle, '_term_get_resp_approval_code');
@_term_get_resp_sequence_id := GetProcAddress(g_dll_handle, '_term_get_resp_sequence_id');
@_term_get_resp_err_code := GetProcAddress(g_dll_handle, '_term_get_resp_err_code');
@_term_get_resp_err_approved := GetProcAddress(g_dll_handle, '_term_get_resp_err_approved');
@_term_get_resp_err_info := GetProcAddress(g_dll_handle, '_term_get_resp_err_info');
@_term_get_resp_err_readable_info := GetProcAddress(g_dll_handle, '_term_get_resp_err_readable_info');
@_term_get_resp_ticket_merchant := GetProcAddress(g_dll_handle, '_term_get_resp_ticket_merchant');
@_term_get_resp_ticket_customer := GetProcAddress(g_dll_handle, '_term_get_resp_ticket_customer');
@_term_get_status_readable := GetProcAddress(g_dll_handle, '_term_get_status_readable');
@_term_app_info_request := GetProcAddress(g_dll_handle, '_term_app_info_request');
@_term_payment_request := GetProcAddress(g_dll_handle, '_term_payment_request');
@_term_refund_request := GetProcAddress(g_dll_handle, '_term_refund_request');
@_term_last_result_request := GetProcAddress(g_dll_handle, '_term_last_result_request');
@_term_reversal_request := GetProcAddress(g_dll_handle, '_term_reversal_request');
@_term_passivate := GetProcAddress(g_dll_handle, '_term_passivate');
@_term_passivate_no_reply := GetProcAddress(g_dll_handle, '_term_passivate_no_reply');
@_term_handshake := GetProcAddress(g_dll_handle, '_term_handshake');
@_term_tms_call := GetProcAddress(g_dll_handle, '_term_tms_call');
@_term_close_totals := GetProcAddress(g_dll_handle, '_term_close_totals');
@_term_send_confirmation := GetProcAddress(g_dll_handle, '_term_send_confirmation');
@_ares_list_request := GetProcAddress(g_dll_handle, '_ares_list_request');
@_ares_list_response_count := GetProcAddress(g_dll_handle, '_ares_list_response_count');
@_ares_list_response := GetProcAddress(g_dll_handle, '_ares_list_response');
@_ares_list_error := GetProcAddress(g_dll_handle, '_ares_list_error');
@_ares_detail_request := GetProcAddress(g_dll_handle, '_ares_detail_request');
@_ares_detail_response := GetProcAddress(g_dll_handle, '_ares_detail_response');
@_ares_detail_error := GetProcAddress(g_dll_handle, '_ares_detail_error');
@_http_request := GetProcAddress(g_dll_handle, '_http_request');
@_http_response := GetProcAddress(g_dll_handle, '_http_response');
@_http_header := GetProcAddress(g_dll_handle, '_http_header');
@_http_error := GetProcAddress(g_dll_handle, '_http_error');

    end;

    Set8087CW(SavedCW);
  end;
end;

procedure ftp_env_init;
begin
  ftp_dll_init;
  _ftp_env_init;
end;

procedure ftp_env_close;
begin
  _ftp_env_close;
end;

function ftp_cha_count() : Integer;
begin
  result := _ftp_cha_count();
end;

function ftp_cha_get(index : Integer) : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _ftp_cha_get(index);
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function ftp_get(prefix : AnsiString; username : AnsiString; password : AnsiString) : Integer;
begin
  result := _ftp_get(PAnsiChar(prefix), PAnsiChar(username), PAnsiChar(password));
end;

function ftp_free(index : Integer) : Integer;
begin
  result := _ftp_free(index);
end;

function ftp_set_path_rel(ftp_index : Integer; path : AnsiString) : Integer;
begin
  result := _ftp_set_path_rel(ftp_index, PAnsiChar(path));
end;

function ftp_set_path_abs(ftp_index : Integer; path : AnsiString) : Integer;
begin
  result := _ftp_set_path_abs(ftp_index, PAnsiChar(path));
end;

function ftp_set_path_parent(ftp_index : Integer) : Integer;
begin
  result := _ftp_set_path_parent(ftp_index);
end;

function ftp_get_path(ftp_index : Integer) : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _ftp_get_path(ftp_index);
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function ftp_listing(ftp_index : Integer) : Integer;
begin
  result := _ftp_listing(ftp_index);
end;

function ftp_listing_count() : Integer;
begin
  result := _ftp_listing_count();
end;

function ftp_listing_get_flagtrycwd(index : Integer) : Integer;
begin
  result := _ftp_listing_get_flagtrycwd(index);
end;

function ftp_listing_get_name(index : Integer) : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _ftp_listing_get_name(index);
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function ftp_download(ftp_index : Integer; ftp_name : AnsiString; local_name : AnsiString) : Integer;
begin
  result := _ftp_download(ftp_index, PAnsiChar(ftp_name), PAnsiChar(local_name));
end;

function ftp_download_text(ftp_index : Integer; ftp_name : AnsiString) : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _ftp_download_text(ftp_index, PAnsiChar(ftp_name));
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function ftp_upload(ftp_index : Integer; ftp_name : AnsiString; local_name : AnsiString) : Integer;
begin
  result := _ftp_upload(ftp_index, PAnsiChar(ftp_name), PAnsiChar(local_name));
end;

function ftp_upload_text(ftp_index : Integer; ftp_name : AnsiString; text : AnsiString) : Integer;
begin
  result := _ftp_upload_text(ftp_index, PAnsiChar(ftp_name), PAnsiChar(text));
end;

function ftp_rename(ftp_index : Integer; ftp_name_before : AnsiString; ftp_name_after : AnsiString) : Integer;
begin
  result := _ftp_rename(ftp_index, PAnsiChar(ftp_name_before), PAnsiChar(ftp_name_after));
end;

function ftp_create_directory(ftp_index : Integer; ftp_dir_name : AnsiString) : Integer;
begin
  result := _ftp_create_directory(ftp_index, PAnsiChar(ftp_dir_name));
end;

function ftp_delete_file(ftp_index : Integer; ftp_name : AnsiString) : Integer;
begin
  result := _ftp_delete_file(ftp_index, PAnsiChar(ftp_name));
end;

function ftp_delete_directory(ftp_index : Integer; ftp_name : AnsiString) : Integer;
begin
  result := _ftp_delete_directory(ftp_index, PAnsiChar(ftp_name));
end;

function email_init(smtp_server : AnsiString; smtp_user : AnsiString; smtp_password : AnsiString) : Integer;
begin
  ftp_dll_init;
  result := _email_init(PAnsiChar(smtp_server), PAnsiChar(smtp_user), PAnsiChar(smtp_password));
end;

function email_do_send() : Integer;
begin
  ftp_dll_init;
  result := _email_do_send();
end;

function email_set_from(input : AnsiString) : Integer;
begin
  ftp_dll_init;
  result := _email_set_from(PAnsiChar(input));
end;

function email_set_to(input : AnsiString) : Integer;
begin
  ftp_dll_init;
  result := _email_set_to(PAnsiChar(input));
end;

function email_set_subject(input : AnsiString) : Integer;
begin
  ftp_dll_init;
  result := _email_set_subject(PAnsiChar(input));
end;

function email_set_body(input : AnsiString) : Integer;
begin
  ftp_dll_init;
  result := _email_set_body(PAnsiChar(input));
end;

function email_add_attachment(path : AnsiString; name : AnsiString) : Integer;
begin
  ftp_dll_init;
  result := _email_add_attachment(PAnsiChar(path), PAnsiChar(name));
end;

function convert_iconv(from_charset : AnsiString; to_charset : AnsiString; input : AnsiString) : AnsiString;
var
  ptr : PAnsiChar;
begin
  ftp_dll_init;
  ptr := _convert_iconv(PAnsiChar(from_charset), PAnsiChar(to_charset), PAnsiChar(input));
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function convert_xml_entities(input : AnsiString) : AnsiString;
var
  ptr : PAnsiChar;
begin
  ftp_dll_init;
  ptr := _convert_xml_entities(PAnsiChar(input));
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function print_image_start(width : Integer; height : Integer) : Integer;
begin
  ftp_dll_init;
  result := _print_image_start(width, height);
end;

function print_image_add_line(bytes : PAnsiChar; bytes_length : Integer; bytes_pixel : Integer) : Integer;
begin
  ftp_dll_init;
  result := _print_image_add_line(bytes, bytes_length, bytes_pixel);
end;

function print_image_save_jpeg(filename : PAnsiChar; quality : Integer) : Integer;
begin
  ftp_dll_init;
  result := _print_image_save_jpeg(PAnsiChar(filename), quality);
end;

function print_image_save_bmp(filename : PAnsiChar) : Integer;
begin
  ftp_dll_init;
  result := _print_image_save_bmp(PAnsiChar(filename));
end;

function print_load_printers_get_count() : Integer;
begin
  ftp_dll_init;
  result := _print_load_printers_get_count();
end;

function print_get_printer_detail(index : Integer; flag : Integer) : AnsiString;
var
  ptr : PAnsiChar;
begin
  ftp_dll_init;
  ptr := _print_get_printer_detail(index, flag);
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function print_start(printer_dialog : Boolean; document_name : AnsiString; max_dpi : Integer) : Integer;
begin
  ftp_dll_init;
  result := _print_start(printer_dialog, PAnsiChar(document_name), max_dpi);
end;

function print_start_by_name(printer_name : AnsiString; document_name : AnsiString; max_dpi : Integer) : Integer;
begin
  ftp_dll_init;
  result := _print_start_by_name(PAnsiChar(printer_name), PAnsiChar(document_name), max_dpi);
end;

function print_start_pdf(printer_name : AnsiString; document_name : AnsiString; max_dpi : Integer; pdf_file : AnsiString) : Integer;
begin
  ftp_dll_init;
  result := _print_start_pdf(PAnsiChar(printer_name), PAnsiChar(document_name), max_dpi, PAnsiChar(pdf_file));
end;

function print_test_dpi(max_dpi : Integer) : Integer;
begin
  ftp_dll_init;
  result := _print_test_dpi(max_dpi);
end;

function print_get_dpi_count() : Integer;
begin
  ftp_dll_init;
  result := _print_get_dpi_count();
end;

function print_get_dpi_x(index : Integer) : Integer;
begin
  ftp_dll_init;
  result := _print_get_dpi_x(index);
end;

function print_get_dpi_y(index : Integer) : Integer;
begin
  ftp_dll_init;
  result := _print_get_dpi_y(index);
end;

function print_page_text(text : AnsiString) : Integer;
begin
  ftp_dll_init;
  result := _print_page_text(PAnsiChar(text));
end;

function print_page_bitmap(path : AnsiString; add_x : Integer; add_y : Integer; add_width : Integer; add_height : Integer) : Integer;
begin
  ftp_dll_init;
  result := _print_page_bitmap(PAnsiChar(path), add_x, add_y, add_width, add_height);
end;

function print_page_cached_image(add_x : Integer; add_y : Integer; add_width : Integer; add_height : Integer) : Integer;
begin
  ftp_dll_init;
  result := _print_page_cached_image(add_x, add_y, add_width, add_height);
end;

function print_finish() : Integer;
begin
  ftp_dll_init;
  result := _print_finish();
end;

function print_cancel() : Integer;
begin
  ftp_dll_init;
  result := _print_cancel();
end;

function term_init() : Integer;
begin
  ftp_dll_init;
  result := _term_init();
end;

function term_setup(terminal_type : AnsiString; terminal_host : AnsiString; terminal_port : AnsiString; terminal_pos : AnsiString; self_port : Integer) : Integer;
begin
  result := _term_setup(PAnsiChar(terminal_type), PAnsiChar(terminal_host), PAnsiChar(terminal_port), PAnsiChar(terminal_pos), self_port);
end;

function term_set_log_path(path : AnsiString) : Integer;
begin
  result := _term_set_log_path(PAnsiChar(path));
end;

function term_stop() : Integer;
begin
  result := _term_stop();
end;


function term_get_status() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_status();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function term_get_status_internal_error() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_status_internal_error();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function term_get_status_version() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_status_version();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function term_get_status_podpis() : Boolean;
begin
  result := _term_get_status_podpis();
end;

function term_get_status_listecek() : Boolean;
begin
  result := _term_get_status_listecek();
end;

function term_is_session_state_opened() : Boolean;
begin
  result := _term_is_session_state_opened();
end;

function term_is_session_state_waiting_confirm() : Boolean;
begin
  result := _term_is_session_state_waiting_confirm();
end;

function term_is_debug_verbose() : Boolean;
begin
  result := _term_is_debug_verbose();
end;

function term_get_terminal_pos() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_terminal_pos();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function term_get_resp_amount() : Double;
begin
  result := _term_get_resp_amount();
end;

function term_get_resp_symbol() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_resp_symbol();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function term_get_resp_currency() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_resp_currency();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function term_get_resp_server_message() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_resp_server_message();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function term_get_resp_card_brand() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_resp_card_brand();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function term_get_resp_pan() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_resp_pan();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function term_get_resp_approval_code() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_resp_approval_code();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function term_get_resp_sequence_id() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_resp_sequence_id();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function term_get_resp_err_code() : Integer;
begin
  result := _term_get_resp_err_code();
end;

function term_get_resp_err_approved() : Boolean;
begin
  result := _term_get_resp_err_approved();
end;

function term_get_resp_err_info() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_resp_err_info();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function term_get_resp_err_readable_info() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_resp_err_readable_info();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function term_get_resp_ticket_merchant() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_resp_ticket_merchant();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function term_get_resp_ticket_customer() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_resp_ticket_customer();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function term_get_status_readable() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _term_get_status_readable();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;


function term_app_info_request() : Integer;
begin
  result := _term_app_info_request();
end;

function term_payment_request(amount : Double; symbol : AnsiString; currency : AnsiString) : Integer;
begin
  result := _term_payment_request(amount, PAnsiChar(symbol), PAnsiChar(currency));
end;

function term_refund_request(amount : Double; symbol : AnsiString; currency : AnsiString; PAN_value : AnsiString) : Integer;
begin
  result := _term_refund_request(amount, PAnsiChar(symbol), PAnsiChar(currency), PAnsiChar(PAN_value));
end;

function term_last_result_request() : Integer;
begin
  result := _term_last_result_request();
end;

function term_reversal_request(approval_code : AnsiString) : Integer;
begin
  result := _term_reversal_request(PAnsiChar(approval_code));
end;

function term_passivate() : Integer;
begin
  result := _term_passivate();
end;

function term_passivate_no_reply() : Integer;
begin
  result := _term_passivate_no_reply();
end;

function term_handshake() : Integer;
begin
  result := _term_handshake();
end;

function term_tms_call() : Integer;
begin
  result := _term_tms_call();
end;

function term_close_totals() : Integer;
begin
  result := _term_close_totals();
end;

function term_send_confirmation() : Integer;
begin
  result := _term_send_confirmation();
end;

function ares_list_request(ico : AnsiString; obchodni_firma : AnsiString; nazev_obce : AnsiString; max_pocet : Integer) : Integer;
begin
  result := _ares_list_request(PAnsiChar(ico), PAnsiChar(obchodni_firma), PAnsiChar(nazev_obce), max_pocet);
end;

function ares_list_response_count() : Integer;
begin
  result := _ares_list_response_count();
end;

function ares_list_response(index : Integer) : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _ares_list_response(index);
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function ares_list_error() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _ares_list_error();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function ares_detail_request(ico : AnsiString) : Integer;
begin
  result := _ares_detail_request(PAnsiChar(ico));
end;

function ares_detail_response() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _ares_detail_response();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function ares_detail_error() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _ares_detail_error();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function http_request(url : AnsiString) : Integer;
begin
  result := _http_request(PAnsiChar(url));
end;

function http_response() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _http_response();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function http_header() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _http_header();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;

function http_error() : AnsiString;
var
  ptr : PAnsiChar;
begin
  ptr := _http_error();
  result := AnsiString(ptr);
  _ftp_freechar(ptr);
end;




end.
