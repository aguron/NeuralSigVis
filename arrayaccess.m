function [entry, idx] = arrayaccess(array,index)
%ARRAYACCESS

    if isvector(array)
      array = colvec(array);
    end % if isvector(array)
    
    arraySize = size(array);
    
    idx = 1;
    for i=1:length(index)
      idx = idx + (index(i)-1)*prod(arraySize(i+1:end));
    end % for i=1:length(index)
    if iscell(array)
      entry = array{idx};
    else
      entry = array(idx);
    end
end