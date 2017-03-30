-- What are all projects that use JavaScript?
select project.name 
from project 
where project.id = 3;

-- What are all technologies used by the Personal Website?
select tech.name 
from tech, project, project_uses_tech 
where project_uses_tech.project_id = project.id 
AND project_uses_tech.tech_id = tech.id 
AND project.id = 4;

-- Perform a left outer join from the tech table to the project_uses_tech table - which techs has no associated project?
select * from
	(
		select name, count(project_id)
		from tech 
		left outer join project_uses_tech 
		on project_uses_tech.tech_id = tech.id
		group by tech.name
	) my_query
where count = 0;

-- Based on the previous query, get the count of the number of techs used by each project.
select project.name, count(tech_id)
from project 
left outer join project_uses_tech 
on project_uses_tech.project_id = project.id
group by project.name;

-- Perform a left outer join from the project table to the project_users_tech table - which projects has no associated tech?
select * from
	(
		select project.name, count(tech_id)
		from project
		left outer join project_uses_tech
		on project_uses_tech.project_id = project.id
		group by project.name
	) my_query
where count = 0;

-- Based on the previous query, get the count of the number of projects that use each tech.
select tech.name, count(project_id)
from tech
left outer join project_uses_tech
on project_uses_tech.tech_id = tech.id
group by tech.name;


-- List all projects along with each technology used by it. You will need to do a three-way join.
select * 
from project
full outer join project_uses_tech 
	on project_uses_tech.project_id = project.id
full outer join tech 
	on project_uses_tech.tech_id = tech.id;



-- List all the distinct techs that are used by at least one project.
select * from
	(
		select project.name, count(tech_id)
		from project
		left outer join project_uses_tech
		on project_uses_tech.project_id = project.id
		group by project.name
	) my_query
where count >= 1;
--Alt method
select distinct on (tech.id) tech.id, tech.name
from project
inner join project_uses_tech 
	on project_uses_tech.project_id = project.id
inner join tech 
	on project_uses_tech.tech_id = tech.id;

-- List all the distinct techs that are not used by any projects.
select distinct(tech.name)
from project
right outer join project_uses_tech on project_uses_tech.project_id = project.id
right outer join tech on project_uses_tech.tech_id = tech.id
where project_id is NULL;

-- List all the distinct projects that use at least one tech.


-- List all the distinct projects that use no tech.
-- Order the projects by how many tech it uses.
select * from
	(
		select project.id, project.name, count(project_uses_tech.tech_id)
		from project
		left outer join project_uses_tech on project_uses_tech.project_id = project.id
		left outer join tech on project_uses_tech.tech_id = tech.id
		group by project.id
	) sub
order by count desc;

-- Alt method without subselect
select project.id, project.name, count(project_uses_tech.tech_id) as my_count
from project
left outer join project_uses_tech on project_uses_tech.project_id = project.id
left outer join tech on project_uses_tech.tech_id = tech.id
group by project.id
order by my_count desc;

-- Order the tech by how many projects use it.
select tech.id, tech.name, count(project_uses_tech.project_id) as my_count
from tech
left outer join project_uses_tech on project_uses_tech.tech_id = tech.id
left outer join tech on project_uses_tech.project_id = project.id
group by tech.id
order by my_count desc;???????/

-- What is the average number of techs used by a project?
select avg(tech_count)
from
	(
		select project.id, project.name, count(project_uses_tech.tech_id) as tech_count
		from project
		left outer join project_uses_tech on project_uses_tech.project_id = project.id
		group by project.id
	) tech_counts
