create or replace function is_a_date 
    ( p_date in date )
    return varchar2
is
    d date;
begin
    d := to_date(to_char(p_date,  'SYYYYMMDDHH24MISS'),  'SYYYYMMDDHH24MISS') ;
    if d != p_date then
        return 'not a proper date';
    else
        return 'good date';
    end if;
exception
    when others  then
        return 'not a date';
end;
/ 

/***********************************************************
 select h.id, dump(h.bid_close_date)
 from mytable h 
 where h.bid_close_date is not null
 and is_a_date(h.bid_close_date) != 'good date';
************************************************************/
