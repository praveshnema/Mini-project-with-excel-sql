
-- database used
use angloeasternproject;

-- checking table data
select top 50 * from shipsdata;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Query1:Select top 10 companies , who are managing ships and biggest competitor of Anglo eastern ship management, mention Ship manager and there managing ships counts, which are registered in NRC plan.
select top 10 [Owner Operator],count([official number]) as Ships_managing from shipsdata group by [Owner Operator] order by count([official number]) desc;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query2: How many different type of Vessels (ships) Anglo eastern holds under this plan, also mention there quantity with their type of ships, order by their ship numbers from higher to lower order.
select [owner operator],[Vessel Type],count([Official Number]) as no_of_ships from  shipsdata group by [owner operator],[Vessel Type] having [owner operator]='Anglo-Eastern Ship Management Ltd' order by count([Official Number]) desc;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query3: How many total ships are registered on NRC website
select count([Official Number]) as ships_counts from shipsdata;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Query4: How many Spill Management Team (SMT) are present as per NRC plan, how many ships they are holding, order by highest to lowest of their ship holding capacity.
select [Qualified Individual / SMT],count([Official Number]) as no_of_ships from shipsdata group by [Qualified Individual / SMT] order by count([Official Number]) desc ;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query5: Find out all the top 20 Ship types, and their quantity over the world in highest to lowest ship count.
select top 20 [Vessel Type],count([Official Number]) as ship_counts from shipsdata group by [Vessel Type] order by count([Official Number]) desc;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Query6: Write a query to find out top 10 companies having highest number of tanker ships, what position ANGLO EASTERN holds & who is leading. Also, give ranking on the basis of number of tanker ships

select * from (select [owner operator],[Vessel Type],count([Official Number]) as no_of_tanker_ships, dense_rank() over(order by count([Official Number]) desc) as rankings from shipsdata group by [owner operator],[Vessel Type] having [Vessel Type]='Tank Vessel' ) as innertable where innertable.rankings<=10; 


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query7: Write a query to find out top 10 companies having highest number of Container ships, what position ANGLO EASTERN holds & who is leading.

select top 10 [owner operator],[Vessel Type],count([Official Number]) as no_of_Container_ships from  shipsdata group by [owner operator],[Vessel Type] having [Vessel Type]='Container Ship'order by count([Official Number]) desc;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query8: Write a query to find out top 10 companies having highest number of Dry/bulk ships, what position ANGLO EASTERN hold & who is leading.

select top 10 [owner operator],[Vessel Type],count([Official Number]) as no_of_Bulk_Dry_Cargo from  shipsdata group by [owner operator],[Vessel Type] having [Vessel Type]='Bulk/Dry Cargo'order by count([Official Number]) desc;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query9: Write a query to find out which ship managers holding yacht and is Anglo Eastern listed in the same.

select [owner operator] from  shipsdata where [Official Number] in (select [Official Number] from  shipsdata where [Vessel Type]='Yacht');


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query10: How many Spill Management Team (SMT) Anglo eastern is holding.
select [owner operator],[Qualified Individual / SMT],count([Official Number]) as no_of_ships from shipsdata group by [owner operator],[Qualified Individual / SMT] having [owner operator]='Anglo-Eastern Ship Management Ltd' order by count([Official Number]) desc ;


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Query11: Write a query to find out How many Spill Management Team (SMT) Anglo eastern is holding per vessel types.
select [owner operator],[Vessel Type],[Qualified Individual / SMT],count([Official Number]) as no_of_ships from shipsdata group by [owner operator],[Qualified Individual / SMT],[Vessel Type] having [owner operator]='Anglo-Eastern Ship Management Ltd' order by count([Official Number]) desc ;


