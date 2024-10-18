% Khai báo các kiểu dữ liệu và luật
domains
    symptom = symbol  % Triệu chứng là các chuỗi ký tự
    cause = symbol    % Nguyên nhân là các chuỗi ký tự

predicates
    trieu_chung(symptom)  % Khai báo predicate cho triệu chứng
    nguyen_nhan(cause)    % Khai báo predicate cho nguyên nhân
    chan_doan(cause)      % Khai báo predicate để chẩn đoán
    nhap_trieu_chung(integer) % Nhập triệu chứng từ người dùng
    check_trieu_chung(symptom) % Kiểm tra triệu chứng
    convert_to_symptom(integer, symbol).

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
    nguyen_nhan(het_nhien_lieu) :- check_trieu_chung(xe_khong_khoi_dong), check_trieu_chung(den_khong_sang).
    nguyen_nhan(ac_quy_yeu) :- check_trieu_chung(xe_khong_khoi_dong), check_trieu_chung(den_khong_sang).
    nguyen_nhan(bugi_hong) :- check_trieu_chung(dong_co_khong_no), check_trieu_chung(tieng_keu_la).
    nguyen_nhan(xang_khong_xuong) :- check_trieu_chung(xe_khong_khoi_dong), check_trieu_chung(tieng_keu_la).
    nguyen_nhan(binh_xang_con_hong) :- check_trieu_chung(xe_khong_tang_toc), check_trieu_chung(hao_xang).
    nguyen_nhan(bo_loc_gio_ban) :- check_trieu_chung(xe_rung_manh), check_trieu_chung(khoi_den).
    nguyen_nhan(dong_co_qua_nhiet) :- check_trieu_chung(khoi_trang), check_trieu_chung(xe_rung_manh).
    nguyen_nhan(phanh_van_de) :- check_trieu_chung(banh_xe_cung), check_trieu_chung(xe_rung_manh).
    nguyen_nhan(lop_xe_van_de) :- check_trieu_chung(banh_xe_cung), check_trieu_chung(xe_khong_tang_toc).

    % Luật chẩn đoán dựa trên nguyên nhân
    chan_doan(X) :- nguyen_nhan(X).

    % Predicate để kiểm tra triệu chứng
    check_trieu_chung(X) :- trieu_chung(X), nhap_trieu_chung(Y), convert_to_symptom(Y, X).

    % Đọc triệu chứng từ người dùng
    nhap_trieu_chung(1) :- write("TT: Xe khong khoi dong"), nl.
    nhap_trieu_chung(2) :- write("TT: Den ko sang"), nl.
    nhap_trieu_chung(3) :- write("TT: Dong co ko no"), nl.
    nhap_trieu_chung(4) :- write("TT: Co tieng keu la"), nl.
    nhap_trieu_chung(5) :- write("TT: Khoi den tu ong xa"), nl.
    nhap_trieu_chung(6) :- write("Triệu chứng: Khói trắng từ ống xả"), nl.
    nhap_trieu_chung(7) :- write("Triệu chứng: Xe hao xăng"), nl.
    nhap_trieu_chung(8) :- write("Triệu chứng: Xe rung mạnh khi chạy"), nl.
    nhap_trieu_chung(9) :- write("Triệu chứng: Xe không tăng tốc được"), nl.
    nhap_trieu_chung(10) :- write("Triệu chứng: Bánh xe cứng"), nl.

    % Chuyển đổi từ số sang triệu chứng
    convert_to_symptom(1, xe_khong_khoi_dong).
    convert_to_symptom(2, den_khong_sang).
    convert_to_symptom(3, dong_co_khong_no).
    convert_to_symptom(4, tieng_keu_la).
    convert_to_symptom(5, khoi_den).
    convert_to_symptom(6, khoi_trang).
    convert_to_symptom(7, hao_xang).
    convert_to_symptom(8, xe_rung_manh).
    convert_to_symptom(9, xe_khong_tang_toc).
    convert_to_symptom(10, banh_xe_cung).

goal
    write("Nhap cac trieu chung (chon so tuong ung): "), nl,
    nhap_trieu_chung(_),
    chan_doan(X),
    write("Nguyen nhan co the la: "), write(X), nl.