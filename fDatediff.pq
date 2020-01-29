let
    Source = (vAnneeDeb, vMoisDeb, vJourDeb, vAnneeFin, vMoisFin, vJourFin) =>
let
    listeDeb = {vAnneeDeb, vMoisDeb, vJourDeb},
	listeFin = {vAnneeFin, vMoisFin, vJourFin},
    monthDayList = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31},
 
 // Day calculation
    increment0 = 0,
    mois1 = vMoisDeb - 1,
    increment1 = if vJourDeb > vJourFin then monthDayList{mois1} else increment0,

    resJour = if increment1 <> 0 then 
            (vJourFin + increment1) - vJourDeb
        else
            vJourFin - vJourDeb,

    increment2 = if increment1 <> 0 then 1 else increment1,

// Month calculation
    resMois = if vMoisDeb + increment2 > vMoisFin then
        (vMoisFin + 12) - (vMoisDeb + increment2)
        //increment = 1;
       else
        vMoisFin - (vMoisDeb + increment2)
        //increment = 0;
    ,
    increment3 = if vMoisDeb + increment2 > vMoisFin then 1 else 0,
    
// Year calculation
    resAnnee = vAnneeFin - (vAnneeDeb + increment3),

	return = "Diffence : " & Text.From(resAnnee) & " year(s) " & Text.From(resMois) & " month(s) " & Text.From(resJour) & " day(s)"
in
    return
in
    Source
