--> companies that were published in a specific year (e.g., 2022). 
SELECT * FROM best_employees
WHERE publish_year = 2022;  

--> Average number of employees across all companies. 
SELECT AVG(employees) AS AverageEmployees 
FROM best_employees;   

--> Companies along with their rank and country/territory sorted by rank in ascending order and then by country/territory in descending order. 
SELECT company, rank, country_territory 
FROM best_employees
ORDER BY rank ASC, country_territory DESC;

--> Top 10 companies based on their rank.   
SELECT * FROM best_employees 
ORDER BY rank 
LIMIT 10;   

--> Total number of companies listed in the database.  
SELECT COUNT(*) AS TotalCompanies 
FROM best_employees;   

--> Companies with the most employees in descending order.  
SELECT company, employees 
FROM best_employees
ORDER BY employees DESC;   Display the count of companies grouped by industries. 
SELECT industries, COUNT(*) AS NumCompanies 
FROM best_employees
GROUP BY industries;  

--> Companies that were published in a specific year (e.g., 2022).  
SELECT * FROM best_employees
WHERE publish_year = 2022;  

--> Companies and their ranks from the top 20% of companies with the highest number of employees:
SELECT rank, company, employees
 FROM best_employees
WHERE rank IN ( SELECT rank 
FROM best_employees
ORDER BY employees DESC 
LIMIT ROUND(0.2 * (SELECT COUNT(*) FROM best_employees)) );

--> Retrieve companies that have more employees than the average number of employees across all companies:
SELECT rank, company, employees
 FROM best_employees
WHERE employees > (SELECT AVG(employees) FROM best_employees);
