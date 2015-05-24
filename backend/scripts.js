function daysInMonth(payday) {
    //Set 1 day in milliseconds
    var one_day=1000*60*60*24
    //set today date
    var today = new Date()
    //sets saved date
    var reset=new Date(today.getFullYear(),today.getMonth(), payday) //Month is 0-11 in JavaScript
    if (today.getDay() < payday ){ //if day has already passed
        reset.setMonth(today.getMonth()+1) //calculate next month
        return(  Math.abs(Math.ceil((today.getTime()-reset.getTime())/(one_day)))  )
    } else{
    //Calculate difference btw the two dates, and convert to days
        return(  Math.abs(Math.ceil((reset.getTime()-today.getTime())/(one_day)))  )
    }
}

function day(){
    var day = new Date().getDate();
    //console.log("Js day = " + day);
    return day;
}




function setupMonth(){
    var d = new Date();
    var y = d.getYear();
    var day = d.getDay();
    var n = d.getMonth()+1;
    return new Date(y, n, 0).getDate();
}
function setupDay(budget){
    var days = setupMonth();
    return (budget / days);
}

function setupWeeks(budget)
{
    var d = new Date();
    var year = d.getYear();
    var month = d.getMonth()+1;
    var dayThreshold = [ 5, 1, 5, 6, 5, 6, 5, 5, 6, 5, 6, 5 ];
    var firstDay = new Date(year, month, 1).getDay();
    var baseWeeks = (month == 1 ? 4 : 5); // only February can fit in 4 weeks
    // TODO: account for leap years
    var done = baseWeeks + (firstDay >= dayThreshold[month] ? 1 : 0); // add an extra week if the month starts beyond the threshold day.
    return (budget/done);
}

//color of circle
function color(unit){
    if(unit === 0){
    //week yellow
    return "#ffcc33"
    } else if(unit === 1){
    //today blue
    return "#10a5ba"
    } else {
    //month red
    return "#f55443"
    }
}

//text under circle
function circleLorem(unit){
    if(unit === 0){
    //week
    return "this week"
    } else if(unit === 1){
    //today
    return "today"
    } else {
    //month
    return "this month"
    }
}

function circleText(unit, week, today, month){
    //return dollar amount from database
    if(unit === 0){
    //week
    return week
    } else if(unit === 1){
    //today
    return today
    } else {
    //month
    return month
    }
}

//circle lvl handler
function lvl(week,today,month,wneed,tneed,mneed,height, index){
    if(week/wneed === 1){ //if at 100 percent set to max height
        return height + 4;
    } else { //handles the different circle
    if(index === 0){
        //week
        return (week/wneed * height)
    } else if(index === 1){
        //today
        console.log( today/tneed * 100 )
        return (today/tneed * height)
    }else {
        //month
        return (month/mneed * height)
    }

    }

}

//--- add expense page ----///
function typeLorem(index){
    if(index === 0){
        return "#ffcc33";
    } else {
        return "#ffcc33";
    }
}

function expenseMath(index, amount){
    if(index === 0){
        return - amount
    } else {
        return + amount
    }
}
