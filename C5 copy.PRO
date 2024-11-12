DOMAINS
  symptom = symbol  
  cause = symbol

PREDICATES

  start
  menu
  anyKey
 % trieu_chung(string, string)
 % chan_doan(string, string)
  lua_chon(string, string)
  xu_ly_lua_chon(string, string)
  chan_doan(string)

CLAUSES
  
  start :-
    makewindow(1,2,2, "Chuan doan hong xe may",0,0,25,80),
    menu.

  menu :-
    write("-------------------------"), nl,
    write("Xe gap van de gi? (nhap so tuong ung)"), nl, nl,
    write("1. Khong the no may"), nl,
    write("2. Den khong sang"), nl,
    write("3. Di soc"), nl,
    write("4. Ra khoi den"), nl,
    write("5. Kho no may"), nl,
    write("6. Chet may giua chung"), nl,
    write("7. Di giat cuc"), nl,
    write("0. Thoat"), nl,
    nl, readln(Lua_chon), xu_ly_lua_chon(ds_trieu_chung, Lua_chon).
  
  xu_ly_lua_chon(ds_trieu_chung, "0") :- !.

  xu_ly_lua_chon(ds_trieu_chung, Lua_chon) :-
    clearwindow,
    lua_chon(ds_trieu_chung, Lua_chon),
    anyKey, clearwindow, menu;
    anyKey, clearwindow, menu.

  lua_chon(ds_trieu_chung, "1") :-
    chan_doan(con_xang);
    chan_doan(de_tay_keu);
    chan_doan(bugi_bi_mon_den);
    chan_doan(bugi_bi_tuot);
    chan_doan(bugi_bi_ban);
    chan_doan(bugi_bi_ho_dien_cuc);
  %  chan_doan(loc_gio_bi_ban);
    chan_doan(xupap_bi_gay);
    write("Chua the chan doan benh").

  lua_chon(ds_trieu_chung, "2") :-
    chan_doan(ac_quy_chet);
    write("Den xe bi hong"), nl.

  lua_chon(ds_trieu_chung, "3") :-
    chan_doan(kiem_tra_thung_lop);
    chan_doan(chong_soc_co_nhun);
    write("Benh co the nam o nhung bo phan khac"), nl.    

  lua_chon(ds_trieu_chung, "4") :-
    chan_doan(loc_gio_bi_ban);
    chan_doan(xang_lan_tap_chat);
    chan_doan(che_hoa_khi_ban);
    chan_doan(xupap_mon_chay);
    write("Co the benh nam o nhung bo phan khac"), nl.

  lua_chon(ds_trieu_chung, "5") :-
    chan_doan(loc_gio_bi_ban);
    chan_doan(thieu_nhot);
    chan_doan(xang_lan_tap_chat);
    chan_doan(bugi_bi_mon_den);
    chan_doan(bugi_bi_ban);
    chan_doan(che_hoa_khi_ban);
    chan_doan(xupap_mon_chay);
    write("Co the benh nam o nhung bo phan khac"), nl.

  lua_chon(ds_trieu_chung, "6") :-
    chan_doan(con_xang);
    chan_doan(bugi_bi_tuot);
    chan_doan(bugi_bi_mon_den);
    chan_doan(bugi_bi_ban);
    chan_doan(bugi_bi_ho_dien_cuc);
    chan_doan(xupap_bi_gay);
    write("Co the benh nam o nhung bo phan khac"), nl.

  lua_chon(ds_trieu_chung, "7") :-
    chan_doan(thieu_nhot);
    chan_doan(che_hoa_khi_ban);
    chan_doan(bugi_bi_ban);
    write("Co the benh nam o nhung bo phan khac"), nl.

  chan_doan(bugi_bi_tuot) :-
    write("Kiem tra bugi bi tuot hay khong? (y/n)"), nl,
    readln(Ans),
    Ans = "y",
    write("Hay lap lai bugi"), nl.
  
  chan_doan(bugi_bi_mon_den) :- 
    write("Kiem tra bugi bi mon hay bi den khong? (y/n)"), nl, 
    readln(Ans),
    Ans = "y",
    write("Can thay bugi moi"), nl.

  chan_doan(bugi_bi_ban) :-
    write("Lau bugi co sach khong? (y/n)"), nl,
    readln(Ans),
    Ans = "y",
    write("Can lau sach bugi"), nl.

  chan_doan(bugi_bi_ho_dien_cuc) :-
    write("Kiem tra bugi co ho dien cuc khong? (y/n)"), nl,
    readln(Ans),
    Ans = "y",
    write("Can cho dien cuc gan nhau"), nl.

  chan_doan(con_xang) :-
    write("Xe con xang khong?"), nl,
    readln(Ans), Ans="y",
    chan_doan(khoa_xang_mo_dong);
    chan_doan(ong_dan_xang_bi_nghet).

  chan_doan(khoa_xang_mo_dong) :-
    write("Khoa xang mo hay khong? (y/n)"), nl,
    readln(Ans), 
    Ans="n", write("Khoa xang bi dong, hay mo khoa xang ra"), nl;
    Ans="y", chan_doan(sac_xang).

  chan_doan(sac_xang) :-
    write("Co the xe bi sac xang, hay thu khoa xang lai, khoi dong, roi mo ra"), nl,
    write("Giai quyet duoc van de? (y/n)"), nl,
    readln(Ans),
    Ans="y".
%    Ans="n", fail.

  chan_doan(ong_dan_xang_bi_nghet) :-
    write("Kiem tra ong dan xang co bi nghet khong?"), nl,
    readln(Ans), 
    Ans="y", write("Khoi thong ong dan xang"), nl.

  chan_doan(loc_gio_bi_ban) :-
    write("Kiem tra loc gio co bi ban hay khong?"), nl,
    readln(Ans), Ans="y",
    write("Rua loc gio, hoac thay loc gio neu da cu"), nl.

  chan_doan(xupap_bi_gay) :-
    write("Kiem tra xupap co bi kenh hay gay khong?"), nl,
    readln(Ans), Ans="y",
    write("Can nan chinh lai xupap"), nl.
  
  chan_doan(de_tay_keu) :-
    write("De tay co keu hay khong?"), nl,
    readln(Ans),
    Ans="n", not(chan_doan(ac_quy_chet)), write("Co the nut de, cu de bi hong"), nl;
    Ans="y", fail.

%  chan_doan(nut_de_cu_de) :-
%    write("Kiem tra cu de co van de hay khong?"),
%    readln(Ans),
%    Ans 

  chan_doan(ac_quy_chet) :-
    write("Kiem tra ac quy co dien khong? (y/n)"), nl,
    readln(Ans),
    Ans="n", write("Chan doan: Ac quy het dien"), nl, chan_doan(ac_quy_cu);
    Ans="y", chan_doan(day_dien).

  chan_doan(day_dien) :-
    write("Kiem tra day dien co duoc noi khong? (y/n)"), nl,
    readln(Ans),
    Ans="n", write("Noi lai day dien"), nl.

  chan_doan(ac_quy_cu) :-
    write("Ac quy dung lau chua (tren 3 nam)? (y/n)"), nl,
    readln(Ans), 
    Ans="y", write("Giai phap: Can thay ac quy"), nl;
    Ans="n", write("Giai phap: Co the sac lai ac quy"), nl.

  chan_doan(xang_lan_tap_chat) :-
    write("Kiem tra xang co lan tap chat hay nuoc khong? (y/n)"), nl,
    readln(Ans),
    Ans="y", write("Giai phap: Can thay xang moi").

  chan_doan(xupap_mon_chay) :-
    write("Kiem tra xupap co bi ho khong? (y/n)"), nl,
    readln(Ans),
    Ans="y", write("Chan doan: Xupap mon, chay. Giai phap: Can thay xupap"), nl.

  chan_doan(thieu_nhot) :-
    write("Mo nap nhot, kiem tra con nhieu nhot khong? (y/n)"), nl,
    readln(Ans), 
    Ans="n", write("Giai phap: Can bo sung nhot"), nl.

  chan_doan(che_hoa_khi_ban) :-
    write("Kiem tra bo che hoa khi xe may co bi ban khong? (y/n)"), nl,
    readln(Ans),
    Ans="y", write("Chan doan: Bo che hoa khi bi tac. Giai phap: Can rua va hieu chinh bo che hoa khi"), nl;
    Ans="n", write("Giai phap: Hay thu dieu chinh bo che hoa khi"), nl, fail.

  %chan_doan(kiem_tra_thung_lop).

  chan_doan(kiem_tra_thung_lop) :-
    write("Bom cang va cho lop xuong nuoc. Co sui bot nuoc khong? (y/n)"), nl;
    readln(Ans),
    Ans="y", write("Chan doan: Lop bi thung").

  anyKey :-
    write("\n\nNhan nut bat ky de tiep tuc..."),
		readln(_).

GOAL
  start.