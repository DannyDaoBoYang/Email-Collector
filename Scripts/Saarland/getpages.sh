for i in {1..4};do wget -O page$i.txt 'https://www.saarland.de/mbk/DE/portale/bildungsserver/themen/schulen-und-bildungswege/schuldatenbank/_functions/Schulsuche_Formular.html?gtp=%2526c5706df2-b646-40cc-8c62-b7a95b0cb40e_list%253D'$i'&schulformKurzbez_str=gy';sleep 3;done

