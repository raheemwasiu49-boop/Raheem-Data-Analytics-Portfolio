select * from hospital_db.healthcare_dataset;

select count(Patient_ID) as Total_Patient from hospital_db.healthcare_dataset;

select sum(Treatment_Cost) as Total_Treatment_Cost from hospital_db.healthcare_dataset;

select round(Avg(Treatment_Cost),2) as Average_Treatment_Cost from hospital_db.healthcare_dataset;

select sum(Treatment_Cost) as Total_Hospital_Revenue from hospital_db.healthcare_dataset;

select round(avg(Treatment_Cost),2) as Average_Hospital_Revenue from hospital_db.healthcare_dataset;

-- Total Male Patients

select Gender, count(*) As Total_Male from hospital_db.healthcare_dataset
where Gender ="Male" 
group by Gender;

-- Total Female Patients

select Gender, count(*) As Total_Female from hospital_db.healthcare_dataset
where Gender ="Female" 
group by Gender;

-- Total Recovered
select Outcome,count(*) AS Total_Recovered from hospital_db.healthcare_dataset
where Outcome = "Recovered"
group by Outcome;

-- Total Death
select Outcome, count(*) AS Total_Death from hospital_db.healthcare_dataset
where Outcome = "Death"
group by Outcome;

select sum(Length_of_Stay) as Total_Length_of_Stay from hospital_db.healthcare_dataset;

select round(avg(Length_of_Stay),2) as Average_Length_of_Stay from hospital_db.healthcare_dataset;

-- OR

SELECT ROUND(
AVG(DATEDIFF(Discharge_Date, Admission_Date)),2
) AS avg_stay_days
FROM hospital_db.healthcare_dataset;

SELECT ROUND(SUM(CASE WHEN Outcome='Recovered' THEN 1 ELSE 0 END)
*100.0/COUNT(*),2) AS recovery_rate 
FROM hospital_db.healthcare_dataset;
-- 
SELECT ROUND(SUM(CASE WHEN outcome='Death' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS mortality_rate
FROM hospital_db.healthcare_dataset;

-- 1. #Age Distribution.

Select Age, Gender, 
Case
When Age < 23 then "18 - 22"
When Age between  23 And 27 then "23 - 27"
When Age between 28 and 35 then "28 - 35"
When Age between 36 and 40 then "36 - 40"
When Age between 41 and 45 then "41 - 45"
When Age between 46 and 50 then "46 - 50"
When Age between 51 and 55 then "51 - 55"
When Age between 56 and 60 then "56 - 60"
When Age between 61 and 65 then "61 - 65"
When Age between 66 and 70 then "66 - 70"
When Age between 71 and 75 then "71 - 75"
Else "76 - 80"
End  As Age_group
From hospital_db.healthcare_dataset
Group by Age,Gender
order by Age ASC, Gender DESC;

Select 
CASE When Age < 23 then "18 - 22"
When Age between  23 And 27 then "23 - 27"
When Age between 28 and 35 then "28 - 35"
When Age between 36 and 40 then "36 - 40"
When Age between 41 and 45 then "41 - 45"
When Age between 46 and 50 then "46 - 50"
When Age between 51 and 55 then "51 - 55"
When Age between 56 and 60 then "56 - 60"
When Age between 61 and 65 then "61 - 65"
When Age between 66 and 70 then "66 - 70"
When Age between 71 and 75 then "71 - 75"
Else "76 - 80"
End As Age_group,
count(*) As total_Patients
From hospital_db.healthcare_dataset
Group by
Case When Age < 23 then "18 - 22"
When Age between  23 And 27 then "23 - 27"
When Age between 28 and 35 then "28 - 35"
When Age between 36 and 40 then "36 - 40"
When Age between 41 and 45 then "41 - 45"
When Age between 46 and 50 then "46 - 50"
When Age between 51 and 55 then "51 - 55"
When Age between 56 and 60 then "56 - 60"
When Age between 61 and 65 then "61 - 65"
When Age between 66 and 70 then "66 - 70"
When Age between 71 and 75 then "71 - 75"
Else "76 - 80"
End 
order by Age_group ASC;

-- 2. Gender Distribution.

select Gender,count(*) as Total_patients from hospital_db.healthcare_dataset
group by Gender;

-- 3. Most Common Diseases

select Diagnosis,count(*) AS Common_Disease from hospital_db.healthcare_dataset
group by Diagnosis
order by Common_Disease DESC;

-- 4. Average Treatment Cost per Disease

select Diagnosis,avg(Treatment_Cost) As Average_Treatment_Cost_per_Disease from hospital_db.healthcare_dataset
group by Diagnosis
order by Average_Treatment_Cost_per_Disease;

-- 5. Relationship between Cost and Age

Select round(avg(Treatment_Cost),2),
Case
When Age < 23 then "18 - 22"
When Age between  23 And 27 then "23 - 27"
When Age between 28 and 35 then "28 - 35"
When Age between 36 and 40 then "36 - 40"
When Age between 41 and 45 then "41 - 45"
When Age between 46 and 50 then "46 - 50"
When Age between 51 and 55 then "51 - 55"
When Age between 56 and 60 then "56 - 60"
When Age between 61 and 65 then "61 - 65"
When Age between 66 and 70 then "66 - 70"
When Age between 71 and 75 then "71 - 75"
Else "76 - 80"
End  As Age_group
From hospital_db.healthcare_dataset
Group by Age, Treatment_Cost
order by Age_group ASC, Treatment_Cost DESC;

-- OR

SELECT
    Age,round(avg(Treatment_Cost),2) As Avg_Cost
FROM hospital_db.healthcare_dataset
GROUP BY Age, Treatment_Cost
ORDER BY Age;

-- 6. Length of Stay Distribution

select Length_of_Stay,count(*) As Patient_number_of_stay from hospital_db.healthcare_dataset
group by Length_of_Stay
order by Length_of_Stay;
--
-- OR
select datediff(Discharge_Date,Admission_Date) As stay_days,count(*) As stay_count from hospital_db.healthcare_dataset
group by stay_days
order by stay_days;

-- 7. Outcome Distribution

select outcome, count(*) As Total_Case from hospital_db.healthcare_dataset
group by Outcome;

-- 8 Compare Hospital Performance

select Hospital, Outcome,count(Outcome) As Case_result from hospital_db.healthcare_dataset
group by Hospital,Outcome
Order by case_result DESC;

-- OR
select Hospital,count(*) As Number_of_patients,round(Avg(Treatment_Cost),2) As Average_Treatment_Cost from hospital_db.healthcare_dataset
group by Hospital
order by Number_of_patients DESC;

select Hospital,count(*) As Total_patients,sum(Treatment_Cost) As Revenue from hospital_db.healthcare_dataset
group by Hospital
order by Total_patients DESC;

-- 9. City With Highest Patients

select City,count(Patient_ID) As Total_patient_Admitted from hospital_db.healthcare_dataset
group by City
limit 2;
-- OR

select City, count(*) As City_Highest_patient_Admitted from hospital_db.healthcare_dataset
where City < (select max(City) from hospital_db.healthcare_dataset)
group by City; 

-- 10. Monthly Admission Trend

select year(Admission_Date) As Year,monthname(Admission_Date) As Month, count(*) As Monthly_Admission_Trend from hospital_db.healthcare_dataset
group by year(Admission_Date),monthname(Admission_Date)
order by Year, Month;
