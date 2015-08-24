SELECT Security,BankName,City FROM (SELECT DISTINCT BankName,City FROM Plans EXCEPT SELECT DISTINCT BankName,City FROM Robberies) AS PlannedRob NATURAL JOIN (SELECT Bank.BankName,Bank.City,COUNT(RobberId) AS NoAccounts,Security FROM Banks AS Bank NATURAL JOIN HasAccounts AS HC GROUP BY Bank.BankName,Bank.City) AS D ORDER BY D.NoAccounts DESC;