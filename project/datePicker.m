
sheet = 'Excel';
for i = 1 : 7
range = sprintf('A%i', i);



xlswrite('Attendance.xlsx', 1, sheet, range);
end