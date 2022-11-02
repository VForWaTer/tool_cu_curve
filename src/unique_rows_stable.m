% Implement the missing ic parameter return value
% Found here: https://stackoverflow.com/questions/28648439/find-unique-values-of-a-vector-with-same-order-as-in-the-vector-in-matlab
function [C, ia, ic] = unique_rows_stable(A)
    % call unique with first -> not in order
    [un_mat, row_ind, labels] = unique(A, 'rows', 'first');
    
    % sort row indices
    [ia, ordered_ind] = sort(row_ind);

    % now we can order C
    C = un_mat(ordered_ind,:);

    % finally get ic
    [~, ic] = ismember(labels, ordered_ind);
endfunction