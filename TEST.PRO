DOMAINS
    xe = symbol  % Định nghĩa miền cho xe (có thể là ký hiệu tên xe)

PREDICATES
    no_fuel(xe)  % Định nghĩa predicate không có xăng
    cannot_start(xe)  % Định nghĩa predicate xe không thể nổ máy

CLAUSES
    no_fuel(X) :- write(X), write(" không có xăng."), nl.  % Quy tắc xe không có xăng
    cannot_start(X) :- no_fuel(X), write(X), write(" không thể nổ máy."), nl.  % Quy tắc xe không thể nổ máy nếu không có xăng

GOAL
    cannot_start('xe_may').  % Gọi luật cho xe có tên 'xe_may'