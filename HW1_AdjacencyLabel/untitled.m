m_f1 = [2 2 1 1; 4 3 2 1; 1 2 3 4];
m_f2 = [1 -1; 1 -1];

Cfull = conv2(m_f1,m_f2, 'same');
x = xcorr2(m_f1, m_f2);
% print(Cfull);