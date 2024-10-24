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
  hoi(string)

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
    nl, readln(Lua_chon), xu_ly_lua_chon(menuC, Lua_chon).
  
  xu_ly_lua_chon(menuC, "0") :- !.

  xu_ly_lua_chon(menuC, Lua_chon) :-
    clearwindow,
    lua_chon(menuC, Lua_chon),
    anyKey, clearwindow, menu;
    anyKey, clearwindow, menu.

  lua_chon(menuC, "1") :-
    hoi(con_xang);
    hoi(de_tay_keu);
    hoi(bugi_bi_mon_den);
    hoi(bugi_bi_tuot);
    hoi(bugi_bi_ban);
    hoi(bugi_bi_ho_dien_cuc);
  %  hoi(loc_gio_bi_ban);
    hoi(xupap_bi_gay);
    write("Chua the chan doan benh").

  lua_chon(menuC, "2") :-
    hoi(ac_quy_chet);
    write("Den xe bi hong"), nl.

  lua_chon(menuC, "3") :-
    hoi(kiem_tra_thung_lop);
    hoi(chong_soc_co_nhun);
    write("Benh co the nam o nhung bo phan khac"), nl.    

  lua_chon(menuC, "4") :-
    hoi(loc_gio_bi_ban);
    hoi(xang_lan_tap_chat);
    hoi(che_hoa_khi_ban);
    hoi(xupap_mon_chay);
    write("Co the benh nam o nhung bo phan khac"), nl.

  lua_chon(menuC, "5") :-
    hoi(loc_gio_bi_ban);
    hoi(thieu_nhot);
    hoi(xang_lan_tap_chat);
    hoi(bugi_bi_mon_den);
    hoi(bugi_bi_ban);
    hoi(che_hoa_khi_ban);
    hoi(xupap_mon_chay);
    write("Co the benh nam o nhung bo phan khac"), nl.

  lua_chon(menuC, "6") :-
    hoi(con_xang);
    hoi(bugi_bi_tuot);
    hoi(bugi_bi_mon_den);
    hoi(bugi_bi_ban);
    hoi(bugi_bi_ho_dien_cuc);
    hoi(xupap_bi_gay);
    write("Co the benh nam o nhung bo phan khac"), nl.

  lua_chon(menuC, "7") :-
    hoi(thieu_nhot);
    hoi(che_hoa_khi_ban);
    hoi(bugi_bi_ban);
    write("Co the benh nam o nhung bo phan khac"), nl.

  hoi(bugi_bi_tuot) :-
    write("Kiem tra bugi bi tuot hay khong? (y/n)"), nl,
    readln(Ans),
    Ans = "y",
    write("Hay lap lai bugi"), nl.
  
  hoi(bugi_bi_mon_den) :- 
    write("Kiem tra bugi bi mon hay bi den khong? (y/n)"), nl, 
    readln(Ans),
    Ans = "y",
    write("Can thay bugi moi"), nl.

  hoi(bugi_bi_ban) :-
    write("Lau bugi co sach khong? (y/n)"), nl,
    readln(Ans),
    Ans = "y",
    write("Can lau sach bugi"), nl.

  hoi(bugi_bi_ho_dien_cuc) :-
    write("Kiem tra bugi co ho dien cuc khong? (y/n)"), nl,
    readln(Ans),
    Ans = "y",
    write("Can cho dien cuc gan nhau"), nl.

  hoi(con_xang) :-
    write("Xe con xang khong?"), nl,
    readln(Ans), Ans="y",
    hoi(khoa_xang_mo_dong);
    hoi(ong_dan_xang_bi_nghet).

  hoi(khoa_xang_mo_dong) :-
    write("Khoa xang mo hay khong? (y/n)"), nl,
    readln(Ans), 
    Ans="n", write("Khoa xang bi dong, hay mo khoa xang ra"), nl;
    Ans="y", hoi(sac_xang).

  hoi(sac_xang) :-
    write("Co the xe bi sac xang, hay thu khoa xang lai, khoi dong, roi mo ra"), nl,
    write("Giai quyet duoc van de? (y/n)"), nl,
    readln(Ans),
    Ans="y".
%    Ans="n", fail.

  hoi(ong_dan_xang_bi_nghet) :-
    write("Kiem tra ong dan xang co bi nghet khong?"), nl,
    readln(Ans), 
    Ans="y", write("Khoi thong ong dan xang"), nl.

  hoi(loc_gio_bi_ban) :-
    write("Kiem tra loc gio co bi ban hay khong?"), nl,
    readln(Ans), Ans="y",
    write("Rua loc gio, hoac thay loc gio neu da cu"), nl.

  hoi(xupap_bi_gay) :-
    write("Kiem tra xupap co bi kenh hay gay khong?"), nl,
    readln(Ans), Ans="y",
    write("Can nan chinh lai xupap"), nl.
  
  hoi(de_tay_keu) :-
    write("De tay co keu hay khong?"), nl,
    readln(Ans),
    Ans="n", not(hoi(ac_quy_chet)), write("Co the nut de, cu de bi hong"), nl;
    Ans="y", fail.

%  hoi(nut_de_cu_de) :-
%    write("Kiem tra cu de co van de hay khong?"),
%    readln(Ans),
%    Ans 

  hoi(ac_quy_chet) :-
    write("Kiem tra ac quy co dien khong? (y/n)"), nl,
    readln(Ans),
    Ans="n", write("Chan doan: Ac quy het dien"), nl, hoi(ac_quy_cu);
    Ans="y", hoi(day_dien).

  hoi(day_dien) :-
    write("Kiem tra day dien co duoc noi khong? (y/n)"), nl,
    readln(Ans),
    Ans="n", write("Noi lai day dien"), nl.

  hoi(ac_quy_cu) :-
    write("Ac quy dung lau chua (tren 3 nam)? (y/n)"), nl,
    readln(Ans), 
    Ans="y", write("Giai phap: Can thay ac quy"), nl;
    Ans="n", write("Giai phap: Co the sac lai ac quy"), nl.

  hoi(xang_lan_tap_chat) :-
    write("Kiem tra xang co lan tap chat hay nuoc khong? (y/n)"), nl,
    readln(Ans),
    Ans="y", write("Giai phap: Can thay xang moi").

  hoi(xupap_mon_chay) :-
    write("Kiem tra xupap co bi ho khong? (y/n)"), nl,
    readln(Ans),
    Ans="y", write("Chan doan: Xupap mon, chay. Giai phap: Can thay xupap"), nl.

  hoi(thieu_nhot) :-
    write("Mo nap nhot, kiem tra con nhieu nhot khong? (y/n)"), nl,
    readln(Ans), 
    Ans="n", write("Giai phap: Can bo sung nhot"), nl.

  hoi(che_hoa_khi_ban) :-
    write("Kiem tra bo che hoa khi xe may co bi ban khong? (y/n)"), nl,
    readln(Ans),
    Ans="y", write("Chan doan: Bo che hoa khi bi tac. Giai phap: Can rua va hieu chinh bo che hoa khi"), nl;
    Ans="n", write("Giai phap: Hay thu dieu chinh bo che hoa khi"), nl, fail.

  %hoi(kiem_tra_thung_lop).

  hoi(kiem_tra_thung_lop) :-
    write("Bom cang va cho lop xuong nuoc. Co sui bot nuoc khong? (y/n)"), nl;
    readln(Ans),
    Ans="y", write("Chan doan: Lop bi thung").

  anyKey :-
    write("\n\nNhan nut bat ky de tiep tuc..."),
		readln(_).

GOAL
  start.