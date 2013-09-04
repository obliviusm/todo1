== README

#Site adress:
with authorization http://scooby-todo.herokuapp.com/
and without http://protected-brook-1646.herokuapp.com/

#Queries:

##### 1. get all statuses, not repeating, alphabetically ordered:

    SELECT DISTINCT status 
    FROM tasks
    ORDER BY status ASC 

##### 2 get the count of all tasks in each project, order by tasks count descending:

	SELECT projects.name, COUNT(*) as count
	FROM tasks JOIN projects 
	ON tasks.project_id = projects.id
	GROUP BY project_id
	ORDER BY count DESC ;

##### 3. get the count of all tasks in each project, order by projects names:

	SELECT projects.name, COUNT(*) AS COUNT
	FROM tasks JOIN projects
	ON tasks.project_id = projects.id
	GROUP BY project_id
	ORDER BY projects.name ;

##### 4. get the tasks for all projects having the name beginning with “N” letter

	SELECT name
	FROM tasks
	WHERE name LIKE 'N%';

##### 5. get the list of all projects containing the ‘a’ letter in the middle of the name, and show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id=NULL:

	SELECT projects.name, COUNT(tasks.project_id) AS 'task\'s number'
	FROM projects LEFT JOIN tasks
	ON projects.id = tasks.project_id
	GROUP BY tasks.project_id
	HAVING projects.name LIKE '_%a%_';
	
##### 6. get the list of tasks with duplicate names. Order alphabetically:

	SELECT name
	FROM tasks
	GROUP BY name
	HAVING COUNT(name) >= 2
	ORDER BY name ASC ;

##### 7. get the list of tasks having several exact matches of both name and status, from the project ‘Garage’. Order by matches count:

	SELECT tasks.name, tasks.status, COUNT(*) as count
	FROM tasks JOIN projects
	ON tasks.project_id = projects.id
	WHERE projects.name = 'Garage'
	GROUP BY tasks.name, tasks.status
	HAVING count > 1
	ORDER BY count ASC ;

##### 8. get the list of project names having more than 10 tasks in status ‘completed’. Order by project_id:

	SELECT projects.name, COUNT(tasks.project_id) as count
	FROM tasks JOIN projects
	ON tasks.project_id = projects.id
	WHERE tasks.status = 'completed'
	GROUP BY tasks.project_id
	HAVING count > 10
	ORDER BY projects.id ; 
