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