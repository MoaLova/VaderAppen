//
//  Quiz.swift
//  VaderAppen
//
//  Created by Lisa Carlsson on 2024-03-05.
//

import Foundation

struct WeatherQuizQuestion {
    let question: String
    let options: [String]
    let correctAnswer: String
}

let question1 = WeatherQuizQuestion(
    question: "Vad är termen för mätningen av lufttryck?",
    options: ["A) Celsius", "B) Hektometer", "C) Millibar", "D) Fahrenheit"],
    correctAnswer: "C) Millibar"
)

let question2 = WeatherQuizQuestion(
    question: "Vilken enhet mäts vinden vanligtvis i?",
    options: ["A) Kilometer per timme (km/h)", "B) Meter per sekund (m/s)", "C) Kilometer per sekund (km/s)", "D) Kilometer per minut (km/min)"],
    correctAnswer: "A) Kilometer per timme (km/h)"
)

let question3 = WeatherQuizQuestion(
    question: "Vad är den primära källan till energi som driver jordens väder?",
    options: ["A) Solen", "B) Månen", "C) Vulkaner", "D) Jordens kärna"],
    correctAnswer: "A) Solen"
)

let question4 = WeatherQuizQuestion(
    question: "Vilken enhet används för att mäta fuktighet i luften?",
    options: ["A) Hertz (Hz)", "B) Celsius (°C)", "C) Procent (%)", "D) Millimeter kvicksilver (mmHg)"],
    correctAnswer: "C) Procent (%)"
)

let question5 = WeatherQuizQuestion(
    question: "Vilken typ av moln är känd för att producera regn?",
    options: ["A) Cirrus", "B) Cumulus", "C) Stratus", "D) Nimbostratus"],
    correctAnswer: "D) Nimbostratus"
)

let question6 = WeatherQuizQuestion(
    question: "Vad kallas processen där vatten återgår från flytande form till gasform?",
    options: ["A) Kondensation", "B) Smältning", "C) Förångning", "D) Sublimering"],
    correctAnswer: "C) Förångning"
)

let question7 = WeatherQuizQuestion(
    question: "Vilken term används för luftens temperatur vid vilken vattenånga kondenserar till vattendroppar?",
    options: ["A) Fryspunkt", "B) Ångpunkt", "C) Återkallningspunkt", "D) Smältningstemperatur"],
    correctAnswer: "B) Ångpunkt"
)

let question8 = WeatherQuizQuestion(
    question: "Vad är en 'monsun'?",
    options: ["A) En snöstorm", "B) En storm med åska", "C) En stark vind", "D) En årstidsrelaterad vind som för med sig regn"],
    correctAnswer: "D) En årstidsrelaterad vind som för med sig regn"
)

let question9 = WeatherQuizQuestion(
    question: "Vad är den termiska uppvärmningen av jordens atmosfär som orsakas av ökande nivåer av växthusgaser känd som?",
    options: ["A) Global svalning", "B) Ozonförlust", "C) Jordens rotation", "D) Global uppvärmning"],
    correctAnswer: "D) Global uppvärmning"
)

let question10 = WeatherQuizQuestion(
    question: "Vilken meteorologisk händelse orsakar blåst, regn och snö samt åskväder och tornadoer?",
    options: ["A) Höjtryck", "B) Lågtryck", "C) Front", "D) Väderbana"],
    correctAnswer: "C) Front"
)

let question11 = WeatherQuizQuestion(
    question: "Vilken enhet används för att mäta nederbördsmängd?",
    options: ["A) Millimeter (mm)", "B) Celsius (°C)", "C) Kilometer per timme (km/h)", "D) Hektometer (hm)"],
    correctAnswer: "A) Millimeter (mm)"
)

let question12 = WeatherQuizQuestion(
    question: "Vilken typ av moln är tunna och fjäderlika och kan indikera finväder eller att regn är på väg?",
    options: ["A) Cumulus", "B) Cirrus", "C) Stratus", "D) Nimbostratus"],
    correctAnswer: "B) Cirrus"
)

let question13 = WeatherQuizQuestion(
    question: "Vad kallas den process där vattendroppar kolliderar med varandra för att bilda större droppar som sedan faller som nederbörd?",
    options: ["A) Avdunstning", "B) Kondensation", "C) Aggregation", "D) Sublimering"],
    correctAnswer: "C) Aggregation"
)

let question14 = WeatherQuizQuestion(
    question: "Vilken term används för en plötslig och kortvarig nedgång av temperaturen under natten, vanligtvis i ett torrt klimat?",
    options: ["A) Värmebölja", "B) Kylning", "C) Torka", "D) Frost"],
    correctAnswer: "D) Frost"
)

let question15 = WeatherQuizQuestion(
    question: "Vilket av följande är en term som beskriver ett område med extremt lågt lufttryck och starka vindar?",
    options: ["A) Cyklon", "B) Anticyklon", "C) Orkan", "D) Tornado"],
    correctAnswer: "A) Cyklon"
)

let question16 = WeatherQuizQuestion(
    question: "Vilken term används för en meteorologisk händelse där varmt och fuktigt luftmassa kolliderar med en kall luftmassa, vilket kan leda till kraftiga regnskurar och åskväder?",
    options: ["A) Dvala", "B) Front", "C) Isostasi", "D) Monsoon"],
    correctAnswer: "B) Front"
)

let question17 = WeatherQuizQuestion(
    question: "Vilken typ av moln är känd för att täcka himlen i ett grått skikt och ofta orsaka långvarig regn och disigt väder?",
    options: ["A) Cumulus", "B) Cirrus", "C) Stratus", "D) Nimbostratus"],
    correctAnswer: "C) Stratus"
)

let question18 = WeatherQuizQuestion(
    question: "Vad kallas en vattengympa som skapas när varm, fuktig luft stiger och kyls, vilket resulterar i kondensation av vattenånga?",
    options: ["A) Konvektion", "B) Advektion", "C) Konvergens", "D) Divergens"],
    correctAnswer: "A) Konvektion"
)

let question19 = WeatherQuizQuestion(
    question: "Vilken term används för den genomsnittliga atmosfäriska förhållandet för temperatur, lufttryck, fuktighet och vind över en lång period?",
    options: ["A) Klimat", "B) Väder", "C) Lufttryck", "D) Vindförhållanden"],
    correctAnswer: "A) Klimat"
)

let question20 = WeatherQuizQuestion(
    question: "Vad kallas den del av jordens atmosfär där vädret äger rum?",
    options: ["A) Stratosfären", "B) Troposfären", "C) Mesosfären", "D) Termosfären"],
    correctAnswer: "B) Troposfären"
)

let question21 = WeatherQuizQuestion(
    question: "Vilken term används för den mätbara delen av nederbörd som faller på marken, såsom regn, snö och hagel?",
    options: ["A) Åska", "B) Drizzle", "C) Nedfall", "D) Nederbörd"],
    correctAnswer: "D) Nederbörd"
)

let question22 = WeatherQuizQuestion(
    question: "Vilken meteorologisk händelse innebär en plötslig och kortvarig ökning av lufttrycket och resulterar vanligtvis i klart och soligt väder?",
    options: ["A) Front", "B) Åskväder", "C) Högtryck", "D) Lågtryck"],
    correctAnswer: "C) Högtryck"
)

let question23 = WeatherQuizQuestion(
    question: "Vad är den term för luftfuktighet som anges som en procent av den maximala mängden fukt luften kan hålla vid en given temperatur?",
    options: ["A) Absolut fuktighet", "B) Relativ fuktighet", "C) Specifik fuktighet", "D) Kondenserad fuktighet"],
    correctAnswer: "B) Relativ fuktighet"
)

let question24 = WeatherQuizQuestion(
    question: "Vilken typ av moln är känd för att vara låga och täcka himlen i ett grått skikt och ofta orsaka dis och lätt nederbörd?",
    options: ["A) Cumulus", "B) Cirrus", "C) Stratus", "D) Altostratus"],
    correctAnswer: "C) Stratus"
)

let question25 = WeatherQuizQuestion(
    question: "Vilken term används för en plötslig och kraftig ökning av lufttrycket och resulterar vanligtvis i blåsigt och regnigt väder?",
    options: ["A) Front", "B) Åskväder", "C) Lågtryck", "D) Högtryck"],
    correctAnswer: "A) Front"
)

let question26 = WeatherQuizQuestion(
    question: "Vad är termen för det atmosfäriska fenomenet där ljusstrålar böjs eller reflekteras av vattendroppar och skapar en färgglad båge?",
    options: ["A) Aurora borealis", "B) Regnbåge", "C) Halo", "D) Snöbåge"],
    correctAnswer: "B) Regnbåge"
)

let question27 = WeatherQuizQuestion(
    question: "Vad är den term för den process där vattenånga kondenserar direkt till is utan att passera genom vätskefasen?",
    options: ["A) Sublimering", "B) Aggregation", "C) Kondensation", "D) Förångning"],
    correctAnswer: "A) Sublimering"
)

let question28 = WeatherQuizQuestion(
    question: "Vilken term används för en väderförutsägelse som täcker en period på flera dagar till en vecka?",
    options: ["A) Korttidsprognos", "B) Långtidsprognos", "C) Medelprognos", "D) Ögonblicklig prognos"],
    correctAnswer: "B) Långtidsprognos"
)

let question29 = WeatherQuizQuestion(
    question: "Vilken term används för en liten, snabbt rörlig virvelvind av luft som är synlig på marken och består av damm eller löv?",
    options: ["A) Tornado", "B) Vindstrimma", "C) Stoftdörr", "D) Wirbel"],
    correctAnswer: "C) Stoftdörr"
)

let question30 = WeatherQuizQuestion(
    question: "Vad är termen för en period av extremt varmt väder som varar flera dagar eller längre?",
    options: ["A) Hettan", "B) Värmevåg", "C) Solfeber", "D) Hettautbrott"],
    correctAnswer: "B) Värmevåg"
)

let question31 = WeatherQuizQuestion(
    question: "Vilken typ av väder gillar snögubbar mest?",
    options: ["A) Hett och soligt", "B) Regnigt och blåsigt", "C) Kallt och snöigt", "D) Stormigt och åskigt"],
    correctAnswer: "C) Kallt och snöigt"
)

let question32 = WeatherQuizQuestion(
    question: "Varför blev inte termometern överraskad när den gick ut?",
    options: ["A) För att den hade redan haft en känning", "B) För att den hade redan nått toppen", "C) För att den var fastfrusen", "D) För att den var för kall för att bry sig"],
    correctAnswer: "D) För att den var för kall för att bry sig"
)

let question33 = WeatherQuizQuestion(
    question: "Vad är en molns favoritdryck?",
    options: ["A) Vattenånga", "B) Molntäckt mjölk", "C) Regnvatten", "D) Kondenserad mjölk"],
    correctAnswer: "A) Vattenånga"
)

let question34 = WeatherQuizQuestion(
    question: "Varför var molnet ensamt?",
    options: ["A) För att det hade regnat på deras parad", "B) För att det hade tappat alla sina vänner", "C) För att det hade blåst bort", "D) För att det hade gått upp i rök"],
    correctAnswer: "B) För att det hade tappat alla sina vänner"
)

let question35 = WeatherQuizQuestion(
    question: "Vad sa den lilla regndroppen till den stora regnskuren?",
    options: ["A) 'Du är för intensiv för mig'", "B) 'Sluta att duschning mig med komplimanger'", "C) 'Kan vi ta det lite lugnt?'", "D) 'Jag är bara en liten fisk i din stor damm'"],
    correctAnswer: "C) 'Kan vi ta det lite lugnt?'"
)

let question36 = WeatherQuizQuestion(
    question: "Varför blev vinden tvungen att sluta blåsa?",
    options: ["A) För att den blåste bort alla sina pengar", "B) För att den blev trött på att gå runt", "C) För att den hade förlorat sitt sinne för riktning", "D) För att den blev utblåst av sin chef"],
    correctAnswer: "A) För att den blåste bort alla sina pengar"
)

let question37 = WeatherQuizQuestion(
    question: "Vad sa molnen till solen när de började täcka den?",
    options: ["A) 'Ingen solariumtid för dig!'", "B) 'Vi är på väg att bli det största solskyddet någonsin!'", "C) 'Du är för ljus för ditt eget bästa'", "D) 'Du är så överexponerad'"],
    correctAnswer: "B) 'Vi är på väg att bli det största solskyddet någonsin!'"
)

let question38 = WeatherQuizQuestion(
    question: "Varför ville inte åskan gå på festen?",
    options: ["A) För att den inte kunde jorda sig själv", "B) För att den inte ville att bli jordad av värdens utbrott", "C) För att den hade redan haft en uppladdning", "D) För att den var för laddad"],
    correctAnswer: "C) För att den hade redan haft en uppladdning"
)

let question39 = WeatherQuizQuestion(
    question: "Varför var molnet så deppig?",
    options: ["A) För att det var nere på jorden", "B) För att det hade ingen silverkant", "C) För att det hade förlorat sin silverfodring", "D) För att det hade blivit regnat på"],
    correctAnswer: "B) För att det hade ingen silverkant"
)

let question40 = WeatherQuizQuestion(
    question: "Varför blev vädermannen avskedad?",
    options: ["A) För att han alltid var 'molnig' i sina prognoser", "B) För att han blåste bort från sitt jobb", "C) För att han inte kunde regna in på sin prognos", "D) För att han alltid var 'väder-vanlig' på sitt jobb"],
    correctAnswer: "A) För att han alltid var 'molnig' i sina prognoser"
)

let question41 = WeatherQuizQuestion(
    question: "Vad är termen för när luft stiger och svalnar, vilket resulterar i molnbildning och eventuellt nederbörd?",
    options: ["A) Konvektion", "B) Advektion", "C) Inversion", "D) Konduktion"],
    correctAnswer: "A) Konvektion"
)

let question42 = WeatherQuizQuestion(
    question: "Vilken typ av moln är känd för att vara lågt hängande och orsaka dimma och lätt regn?",
    options: ["A) Cirrus", "B) Cumulus", "C) Stratus", "D) Altostratus"],
    correctAnswer: "C) Stratus"
)

let question43 = WeatherQuizQuestion(
    question: "Vilken term används för en typ av nederbörd som består av små, svaga ispartiklar som smälter delvis när de når marken?",
    options: ["A) Snö", "B) Hagel", "C) Duggregn", "D) Rimfrost"],
    correctAnswer: "C) Duggregn"
)

let question44 = WeatherQuizQuestion(
    question: "Vilken term används för den återvändande av ljusenergi till jordytan som absorberats och återsänds av atmosfären?",
    options: ["A) Reflektion", "B) Absorption", "C) Spridning", "D) Återstrålning"],
    correctAnswer: "D) Återstrålning"
)

let question45 = WeatherQuizQuestion(
    question: "Vilken term används för en skarp gräns mellan två luftmassor med olika temperaturer och fuktighetsnivåer?",
    options: ["A) Gradient", "B) Front", "C) Skiktning", "D) Strömning"],
    correctAnswer: "B) Front"
)

let question46 = WeatherQuizQuestion(
    question: "Vad kallas det område där det finns minimala eller inga vindar och ofta orsakar extremt varma förhållanden?",
    options: ["A) Ögat", "B) Vindfritt område", "C) Kalmen", "D) Stilla"],
    correctAnswer: "A) Ögat"
)

let question47 = WeatherQuizQuestion(
    question: "Vilken term används för en snabb, vertikal rörelse av luft som orsakas av uppvärmning vid marken?",
    options: ["A) Cyklon", "B) Orkan", "C) Vindstrimma", "D) Termisk"],
    correctAnswer: "D) Termisk"
)

let question48 = WeatherQuizQuestion(
    question: "Vilken typ av väder gillar väderkvarnar mest?",
    options: ["A) Lugnt och stilla", "B) Blåsigt och stormigt", "C) Vått och dimmigt", "D) Kallt och snöigt"],
    correctAnswer: "B) Blåsigt och stormigt"
)

let question49 = WeatherQuizQuestion(
    question: "Varför blev vindrutetorkarna på bilen glada?",
    options: ["A) För att de äntligen fick en paus", "B) För att de var tvungna att springa runt hela dagen", "C) För att de var trötta på att vara 'på tork'", "D) För att de kunde se bättre"],
    correctAnswer: "A) För att de äntligen fick en paus"
)

let question50 = WeatherQuizQuestion(
    question: "Vilken term används för en enhet för att mäta solstrålningens intensitet på en given yta?",
    options: ["A) Irradians", "B) Lumen", "C) Watt per kvadratmeter", "D) Lux"],
    correctAnswer: "C) Watt per kvadratmeter"
)

