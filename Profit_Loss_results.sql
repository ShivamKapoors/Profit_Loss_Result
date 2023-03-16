/* How to use the database */
use zerodha

/* How to show all the values of a table*/
select * from profitloss

/*How to show all the comapnies in a table*/
select count(*) as companies_name from profitloss 

/* What is the highest profit I earned*/
select max("Realized_P&L") as Highest_Profit
from profitloss 

/* Which company has given me the hightest profit*/
select *
from profitloss
where "Realized_P&L"= '17488.55'


/*Minimum Profit I earned */
select min("Realized_P&L") as Minimum_Profit 
from profitloss
where "Realized_P&L" >0

/*Which company has given me the minimum profit*/
select *
from profitloss
where "Realized_P&L"=1.7


/* What is the Maximum loss I earned*/
select min("Realized_P&L") as Maximum_loss
from profitloss 
where "Realized_P&L" < 0

/* What is the Minimum loss I earned*/
select max("Realized_P&L") as Minimum_loss
from profitloss 
where "Realized_P&L" < 0


/* Which company has given me the highest loss*/
select *
from profitloss
where "Realized_P&L" like '-6261%'


/* What is the total profit I earned*/
select sum("Realized_P&L") as Total_Profit
from profitloss 
where ("Realized_P&L") >0

/* What is the total loss I earned*/
select sum("Realized_P&L") as Total_loss
from profitloss 
where ("Realized_P&L") <0

/* How much profit I earned in last tow years*/
select(select sum("Realized_P&L")
from profitloss 
where ("Realized_P&L") >0
)-(-(select sum("Realized_P&L")
from profitloss 
where ("Realized_P&L") <0
)) as Total_Amount_Earned


/*Profit made less than 1oo rs */
select count(*) as company_count_100rs
from profitloss
where "Realized_P&L" >= 0 and "Realized_P&L" <=100 

/*Profit made more than 1oo rs */
select * 
from profitloss
where "Realized_P&L" >= 100  

/*Count of companies I made profit*/
select count(*) 
from profitloss
where "Realized_P&L" >0


/*Count of companies I made loss*/
select count(*) 
from profitloss
where "Realized_P&L" <0

/* Count of companies I made more than 1000rs*/
select * 
from profitloss
where "Realized_P&L" >1000 

/*How to select the maximum profit along with company name*/
select symbol, max("Realized_P&L") as Max_Profit
from profitloss
group by "Realized_P&L"


/*Name of companies I made profit*/
select symbol,"Realized_P&L",Round((Buy_value/Quantity),2) as purchase_price,round((sell_value/Quantity),2) as Sell_Price,round((Round((Sell_value/Quantity),2))-(round((Buy_value/Quantity),2)),2) as Profit_per_share
from profitloss
where "Realized_P&L" >0
order by "Realized_P&L" desc

/*Name of companies I made losses*/

select symbol,Quantity,"Realized_P&L","Realized_P&L Pct#",Round((Buy_value/Quantity),2) as purchase_price,round((sell_value/Quantity),2) as Sell_Price,round((Round((Buy_value/Quantity),2))-(round((sell_value/Quantity),2)),2) as Loss_per_share
from profitloss
where "Realized_P&L" <0 and "Realized_P&L Pct#" <-0  
order by "Realized_P&L" asc


/*Average proit per share*/
select avg("Realized_P&L") as Avg_profit_per_Share
from profitloss
where "Realized_P&L" >0

/*Average loss per share*/
select avg("Realized_P&L") as Avg_Loss_per_Share
from profitloss
where "Realized_P&L" <0

/*Average for both profit and loss per share*/
select round(avg("Realized_P&L"),2) as Avg_per_Share
from profitloss

/* Percentage proft share  I earned */

select round(avg("Realized_P&L Pct#"),2) as Percentage_per_profit
from profitloss
Where "Realized_P&L" >0

/* Percentage loss share  I earned */
select round(avg("Realized_P&L Pct#"),2) as Percentage_per_Loss
from profitloss
Where "Realized_P&L" < 0

/* Percentage  share  I earned */
select round(avg("Realized_P&L Pct#"),2) as Percentage_per_Loss
from profitloss




