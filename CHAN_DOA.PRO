% Khai báo file Turbo Prolog
domains
    symptom = symbol  % Triệu chứng là các chuỗi ký tự
    cause = symbol    % Nguyên nhân là các chuỗi ký tự

predicates
    trieu_chung(symptom) % Khai báo predicate cho triệu chứng
    nguyen_nhan(cause)   % Khai báo predicate cho nguyên nhân
    chan_doan(cause)     % Khai báo predicate để chẩn đoán
    parse_trieu_chung(string)

clauses
    % Triệu chứng
    trieu_chung(xe_khong_khoi_dong).
    trieu_chung(den_khong_sang).
    trieu_chung(dong_co_khong_no).
    trieu_chung(tieng_keu_la).
    trieu_chung(khoi_den).
    trieu_chung(khoi_trang).
    trieu_chung(hao_xang).
    trieu_chung(xe_rung_manh).
    trieu_chung(xe_khong_tang_toc).
    trieu_chung(banh_xe_cung).

    % Nguyên nhân dựa trên triệu chứng
    nguyen_nhan(het_nhien_lieu) :- trieu_chung(xe_khong_khoi_dong), trieu_chung(den_khong_sang).
    nguyen_nhan(ac_quy_yeu) :- trieu_chung(xe_khong_khoi_dong), trieu_chung(den_khong_sang).
    nguyen_nhan(bugi_hong) :- trieu_chung(dong_co_khong_no), trieu_chung(tieng_keu_la).
    nguyen_nhan(xang_khong_xuong) :- trieu_chung(xe_khong_khoi_dong), trieu_chung(tieng_keu_la).
    nguyen_nhan(binh_xang_con_hong) :- trieu_chung(xe_khong_tang_toc), trieu_chung(hao_xang).
    nguyen_nhan(bo_loc_gio_ban) :- trieu_chung(xe_rung_manh), trieu_chung(khoi_den).
    nguyen_nhan(dong_co_qua_nhiet) :- trieu_chung(khoi_trang), trieu_chung(xe_rung_manh).
    nguyen_nhan(phanh_van_de) :- trieu_chung(banh_xe_cung), trieu_chung(xe_rung_manh).
    nguyen_nhan(lop_xe_van_de) :- trieu_chung(banh_xe_cung), trieu_chung(xe_khong_tang_toc).

    % Chẩn đoán dựa trên nguyên nhân
    chan_doan(X) :- nguyen_nhan(X).

    parse_trieu_chung("1") :- assert(trieu_chung(xe_khong_khoi_dong)).
    parse_trieu_chung("2") :- assert(trieu_chung(den_khong_sang)).
    parse_trieu_chung("3") :- assert(trieu_chung(dong_co_khong_no)).
    parse_trieu_chung("4") :- assert(trieu_chung(tieng_keu_la)).
    parse_trieu_chung("5") :- assert(trieu_chung(khoi_den)).
    parse_trieu_chung("6") :- assert(trieu_chung(khoi_trang)).
    parse_trieu_chung("7") :- assert(trieu_chung(hao_xang)).
    parse_trieu_chung("8") :- assert(trieu_chung(xe_rung_manh)).
    parse_trieu_chung("9") :- assert(trieu_chung(xe_khong_tang_toc)).
    parse_trieu_chung("10") :- assert(trieu_chung(banh_xe_cung)).

goal
    write("Nhap cac trieu chung: "), nl,
    write("1. Xe khong khoi dong"), nl,
    write("2. Den khong sang"), nl,
    write("3. Dong co khong no"), nl,
    write("4. Tieng keu la"), nl,
    write("5. Khoi den"), nl,
    write("6. Khoi trang"), nl,
    write("7. Hao xang"), nl,
    write("8. Xe rung manh"), nl,
    write("9. Xe khong tang toc"), nl,
    write("10. Banh xe cung"), nl,
    write("Nhap cac so tuong ung voi trieu chung, cach nhau boi dau phay: "),
    readln(Input),
    parse_trieu_chung(Input),
    chan_doan(X),
    write("Nguyen nhan co the la: "), write(X), nl.
