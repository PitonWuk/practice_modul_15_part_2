--Завдання 1
--Створіть наступні запити для бази даних з оцінками студентів із попереднього практичного завдання:
--■ Показати ПІБ усіх студентів з мінімальною оцінкою у вказаному діапазоні.
--■ Показати інформацію про студентів, яким виповнилося 20 років.
--■ Показати інформацію про студентів з віком, у вказаному діапазоні.
--■ Показати інформацію про студентів із конкретним ім’ям. Наприклад, показати студентів з ім’ям Борис.
--■ Показати інформацію про студентів, в номері яких є три сімки.
--■ Показати електронні адреси студентів, що починаються з конкретної літери.

select student_name from student_grades
where min_grade in(select min(min_grade) from student_grades)

select * from student_grades
where date_of_birth <= current_date - interval '25 years'

select * from student_grades
where extract(YEAR from age(date_of_birth, current_date)) between 19 and 25;

select * from student_grades
where student_name like 'John%'

select * from student_grades
where contact_phone like '%777%'

select * from student_grades
where email like 'r%'


--Завдання 2
--Створіть наступні запити для бази даних з оцінками cтудентів із попереднього практичного завдання:
--■ Показати мінімальну середню оцінку по всіх студентах.
--Показати максимальну середню оцінку по всіх студентах.
--■ Показати статистику міст. Має відображатися назва міста та кількість студентів з цього міста.
--■ Показати статистику студентів. Має відображатися назва країни та кількість студентів з цієї країни.
--■ Показати кількість студентів з мінімальною середньою оцінкою з математики.
--■ Показати кількість студентів з максимальною середньою оцінкою з математики.
--■ Показати кількість студентів у кожній групі.
--■ Показати середню оцінку групи.

select min(average_grade_per_year) from student_grades

select max(average_grade_per_year) from student_grades

select city, count(*) as student_count from student_grades
group by city;

select country, count(*) as student_count from student_grades
group by country;

select count(*) from student_grades
where average_grade_per_year = (select min(average_grade_per_year) from student_grades) 
and min_subject_name = 'mathematics'

select count(*) from student_grades
where average_grade_per_year = (select max(average_grade_per_year) from student_grades) 
and min_subject_name = 'mathematics'


select group_name, count(*) as student_count from student_grades
group by group_name;

select group_name, avg(average_grade_per_year) as group_average from student_grades
group by group_name;
