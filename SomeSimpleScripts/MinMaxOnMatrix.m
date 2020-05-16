%%% MinMax normalize matrix

mindata = min(data);
maxdata = max(data);
minmaxdata = bsxfun(@rdivide, bsxfun(@minus, data, mindata), maxdata - mindata);