library(shiny)
library(shinyWidgets)
library(tableHTML)
shinyUI(fluidPage(theme="file.css",
                  
                  div(class="myTitle",
                      titlePanel(" TwisentR  - Tweet & Sentiment Analysis")),
                  setBackgroundColor(
                    color = c("#00FFFF","#4D3D39"),
                    gradient = "linear",
                    direction = "top"
                  ),  
 
  
  # Getting User Inputs
  
  sidebarPanel(  h4(textOutput("currentTime")),
    
      
  
    textInput ("searchTerm","Enter hashtag to be searched with",  "#"),
    tags$style(make_css(list('.irs-bar', 
                             c('border-top', 'border-bottom', 'background'), 
                             rep('black', 3)),
                        list('.irs-bar-edge',
                             c('background', 'border'),
                             c('auqa', '0px !important')),
                        list('.irs-single',
                             'background',
                             'red'))),
    sliderInput("maxTweets","Number of recent tweets to be used for analysis",min=10,max=1000,value=100), # The max can, of course, be increased
    submitButton(text="Analyze")    
  ),
  
  mainPanel(
    tabsetPanel(
      
	tabPanel("Trending Stuff Today",	
selectInput("trendingTable","Choose location to extract trending tweets", c("Worldwide" ,  "Abu Dhabi" ,"Acapulco" , "Accra" , "Adana" , "Adela", "Aguascalientes" , 
"Ahmedabad" ,  "Ahsa" , "Albuquerque" , "Alexandria" , "Algeria" , "Algiers" , "Amman" , "Amritsar" , "Amsterdam",  "Ankara" , "Ansan" , "Antalya" , "Antipolo" , 
"Argentina" ,  "Athens" ,  "Atlanta" ,             "Auckland" ,            "Austin" ,              "Australia" ,    "Austria"  , "Bahrain"     , "Baltimore"  ,         
  "Bandung"   ,           "Bangalore" ,           "Bangkok",              "Barcelona" ,           "Barcelona",            "Barquisimeto",         "Barranquilla"  ,      
  "Baton Rouge" ,         "Bekasi"    ,           "Belarus",            "Belfast"  ,            "Belgium"     ,         "Belo Horizonte",      
  "Benin City"  ,         "Bergen"    ,           "Berlin" ,              "Bhopal"    ,           "Bilbao"   ,            "Birmingham"  ,         "Birmingham"    ,      
  "Blackpool"   ,         "Bogota"    ,           "Bologna",              "Bordeaux"  ,           "Boston"   ,            "Bournemouth" ,         "Brasilia"      ,      
  "Brazil"      ,         "Bremen"    ,           "Brest"  ,              "Brighton"  ,           "Brisbane" ,            "Bristol"     ,         "Bucheon"       ,      
  "Buenos Aires",         "Bursa"     ,           "Busan"  ,              "Cagayan de Oro" ,      "Cairo"    ,            "Calgary"     ,         "Cali"      ,          
  "Calocan"     ,         "Campinas"  ,           "Can Tho",              "Canada"    ,           "Canberra"  ,           "Cape Town"   ,         "Caracas"   ,          
  "Cardiff"     ,         "Cebu City" ,           "Changwon" ,            "Charlotte" ,           "Chelyabinsk" ,         "Chennai"     ,         "Chiba"     ,          
  "Chicago"     ,         "Chihuahua" ,           "Chile"    ,            "Cincinnati",           "Ciudad Guayana" ,      "Ciudad Juarez",        "Cleveland" ,          
  "Cologne"     ,         "Colombia"  ,           "Colorado Springs",     "Columbus"  ,           "Concepcion" ,          "Cordoba"      ,        "Cork"      ,          
  "Coventry"    ,         "Culiacan"  ,           "Curitiba"    ,         "Da Nang"   ,           "Daegu"      ,          "Daejeon"      ,        "Dallas-Ft. Worth" ,   
 "Dammam"  , "Darwin" ,"Davao City", "Delhi", "Den Haag" , "Denmark" ,"Denver" ,  "Depok" , "Derby" , "Detroit" , "Diyarbakir" , "Dnipropetrovsk" ,"Dominican Republic",
"Donetsk", "Dortmund"  ,           "Dresden" ,             "Dubai"         ,       "Dublin"      ,         "Durban" , "Dusseldorf"    ,       "Ecatepec de Morelos", 
 "Ecuador"       ,       "Edinburgh" ,           "Edmonton"      ,       "Egypt"       ,         "El Paso"      ,        "Eskisehir"     ,       "Essen"    ,           
 "Faisalabad"    ,       "Fortaleza"  ,          "France"        ,       "Frankfurt"   ,         "Fresno"       ,        "Fukuoka"       ,       "Galway"   ,           
 "Gaziantep"    ,        "Gdansk"      ,         "Geneva"       ,        "Genoa"       ,         "Germany"      ,        "Ghana"         ,       "Giza"     ,           
 "Glasgow"      ,        "Goiania"     ,         "Gomel"        ,        "Gothenburg"  ,         "Goyang"       ,        "Greece"        ,       "Greensboro" ,         
 "Grodno"       ,        "Guadalajara" ,         "Guarulhos"    ,        "Guatemala"   ,         "Guatemala City"  ,     "Guayaquil"     ,       "Gwangju"  ,           
 "Hai Phong"    ,        "Haifa"       ,         "Hamamatsu"    ,        "Hamburg"     ,         "Hanoi"      ,          "Harrisburg"    ,       "Hermosillo"     ,     
 "Hiroshima"    ,        "Ho Chi Minh City" ,    "Honolulu"     ,        "Houston"     ,         "Hull"       ,          "Hulu Langat"   ,       "Hyderabad"      ,     
 "Ibadan"       ,        "Incheon"      ,        "India"        ,        "Indianapolis",         "Indonesia" ,           "Indore"        ,       "Ipoh"           ,     
 "Ireland"      ,        "Irkutsk"       ,       "Israel"       ,        "Istanbul"    ,         "Italy"     ,           "Izmir"         ,       "Jackson"        ,     
 "Jacksonville" ,        "Jaipur"        ,       "Jakarta"      ,        "Japan"       ,         "Jeddah"    ,           "Jerusalem"     ,       "Johannesburg"   ,     
 "Johor Bahru"  ,        "Jordan"        ,       "Kaduna"       ,        "Kajang"      ,         "Kano"      ,           "Kanpur"        ,       "Kansas City"    ,     
 "Karachi"      ,        "Kawasaki"      ,       "Kayseri"      ,        "Kazan"       ,         "Kenya"     ,           "Khabarovsk"    ,       "Kharkiv"        ,     
 "Kitakyushu"   ,        "Klang"         ,       "Kobe"         ,        "Kolkata"      ,        "Konya"     ,           "Korea"         ,       "Krakow"         ,     
 "Krasnodar"    ,        "Krasnoyarsk"   ,       "Kuala Lumpur" ,        "Kumamoto"    ,         "Kumasi"    ,           "Kuwait"        ,       "Kyiv"           ,     
"Kyoto" ,               "Lagos"    ,            "Lahore"       ,        "Las Palmas",           "Las Vegas"   ,         "Latvia" ,              "Lausanne"       ,     
"Lebanon" ,              "Leeds"   ,             "Leicester"   ,      "Leipzig" ,             "Leon"        ,         "Lille"  ,              "Lima" ,               
"Liverpool" ,           "Lodz"     ,            "London"      ,         "Long Beach" ,          "Los Angeles"  ,        "Louisville"       ,    "Lucknow"  ,           
"Lviv"       ,          "Lyon"          ,       "Madrid"       ,        "Makassar"    ,         "Makati"      ,         "Malaga"          ,     "Malaysia"  ,          
 "Manaus"     ,          "Manchester"  ,         "Manila"       ,        "Maracaibo"   ,         "Maracay"   ,           "Marseille"     ,       "Maturin"   ,   
 "Mecca"       ,         "Medan"      ,          "Medellin"      ,       "Medina"       ,        "Melbourne"  ,          "Memphis"      ,        "Mendoza"    ,         
 "Merida"       ,        "Mersin"    ,           "Mesa"           ,      "Mexicali"      ,       "Mexico"    ,           "Mexico City" ,         "Miami"       ,        
 "Middlesbrough" ,       "Milan"    ,            "Milwaukee"       ,     "Minneapolis"    ,      "Minsk"      ,          "Mombasa"    ,          "Monterrey"    ,       
"Montpellier"     ,     "Montreal" ,            "Morelia"           ,   "Moscow"           ,    "Multan"    ,           "Mumbai"     ,          "Munich" ,     
 "Murcia"  ,             "Muscat" ,              "Nagoya"       ,    "Nagpur"            ,   "Nairobi"  ,            "Nantes"    ,    "Naples" , "Nashville" ,
 "Netherlands",  "New Haven" , "New Orleans" , "New York","New Zealand" , "Newcastle", "Nigeria" , "Niigata" ,"Nizhny Novgorod" , "Norfolk", "Norway", 
"Nottingham"   ,        "Novosibirsk"      ,    "Odesa"         ,       "Okayama"      ,        "Okinawa"         ,     "Oklahoma City"     ,   "Omaha"    ,           
"Oman"          ,       "Omsk"            ,     "Orlando"        ,      "Osaka"        ,        "Oslo"              ,   "Ottawa"           ,    "Pakistan"  ,          
"Palembang"      ,      "Palermo"        ,      "Palma"            ,    "Panama"        ,       "Paris"            ,    "Pasig"           ,     "Patna"      ,         
"Pekanbaru"       ,     "Perm"          ,       "Perth"           ,     "Peru"           ,      "Petaling"        ,     "Philadelphia"   ,      "Philippines" ,        
"Phoenix"    ,          "Pittsburgh"   ,        "Plymouth"  ,           "Poland"          ,     "Port Elizabeth" ,      "Port Harcourt" ,       "Portland"     ,       
"Porto Alegre" ,        "Portsmouth"  ,         "Portugal"   ,          "Poznan"           ,    "Preston"       ,       "Pretoria"     ,        "Providence"    ,      
"Puebla"        ,       "Puerto Rico"    ,      "Pune"        ,         "Qatar"             ,   "Quebec"       ,        "Queretaro"           , "Quezon City"    ,     
 "Quito"    ,            "Rajkot"       ,        "Raleigh"     ,         "Ranchi"            ,   "Rawalpindi" ,          "Recife"            ,   "Rennes"         ,     
"Richmond"   ,          "Riga"         ,        "Rio de Janeiro",       "Riyadh"      ,         "Rome"       ,          "Rosario"           ,   "Rostov-on-Don"    ,   
 "Rotterdam"  ,          "Russia"     ,          "Sacramento"    ,       "Sagamihara"  ,         "Saint Petersburg",     "Saitama"         ,     "Salt Lake City"  ,    
"Saltillo"     ,        "Salvador"   ,          "Samara"          ,     "San Antonio"   ,       "San Diego"       ,     "San Francisco"   ,     "San Jose"  ,  
"San Luis Potosi",      "Santiago"  ,           "Santo Domingo"    ,  "Sao Paulo"      ,      "Sapporo"        ,      "Saudi Arabia"       , 
"Seattle"   ,           "Semarang"      ,       "Sendai"            ,   "Seongnam"        ,     "Seoul"         ,       "Seville"       ,       "Sharjah"   ,          
 "Sheffield" ,           "Singapore"   ,         "Singapore"         ,   "South Africa"    ,     "Soweto"      ,         "Spain"       ,         "Srinagar"  ,          
 "St. Louis"  ,          "Stockholm"  ,          "Stoke-on-Trent"     ,  "Strasbourg"       ,    "Stuttgart"  ,          "Surabaya"   ,          "Surat"      ,         
"Suwon"        ,        "Swansea"    ,          "Sweden"     ,          "Switzerland"        ,  "Sydney"     ,          "Taguig"     ,          "Takamatsu"    ,       
 "Tallahassee"  ,        "Tampa"    ,            "Tangerang"  ,          "Tel Aviv"           ,  "Thailand" ,            "Thane"    ,            "Thessaloniki" ,       
"Tijuana"        ,      "Tokyo"    ,            "Toluca"       ,        "Toronto"   ,           "Toulouse"          ,   "Tucson"   ,            "Turin"          ,     
"Turkey"    ,           "Turmero"     ,         "Ufa"           ,       "Ukraine"    ,          "Ulsan"            ,    "United Arab Emirates", "United Kingdom"   ,   
 "United States" ,       "Utrecht"   ,           "Valencia"      ,       "Valencia"   ,          "Valparaiso"     ,      "Vancouver"   ,         "Venezuela"      ,     
"Vienna"      ,         "Vietnam"   ,           "Virginia Beach"  ,     "Vladivostok"  ,        "Volgograd"      ,      "Voronezh"    ,         "Warsaw"  ,            
 "Washington"  ,         "Winnipeg",  "Wroclaw"      ,        "Yekaterinburg",        "Yokohama"  ,  "Yongin",              
"Zamboanga City" ,      "Zapopan",              "Zaporozhye"       ,    "Zaragoza"       ,      "Zurich"  ), selected = "Worldwide", selectize = FALSE), 
        submitButton(text="Search"),    HTML("<div><h3> Top trending 
	hashtags on Twitter for the location you have chosen.</h3></div>"),
   tableOutput("trendtable"),
			HTML
               ("<div> </div>")),

tabPanel("Tweets Analysis",HTML( "<div><h3> Recent tweets with their sentiments </h3></div>"), tableOutput("tabledata"),
                                          HTML ("<div><h4> This table renders the sentiment (positive, negative or neutral) of the tweets 
                                                associated with the search hashtag by showing the score for each type of sentiment. </h4></div>")),


tabPanel("Top Users",HTML("<div><h3> Top 20 users of hashtag </h3></div>"),plotOutput("tweetersplot"), tableOutput("tweeterstable")),



               
      
      
      tabPanel("Histogram", plotOutput("histScore"), plotOutput("histPos"), plotOutput("histNeg")
               ),
      
      
      tabPanel("Pie Chart",HTML("<div><h3>Rendering sentiment on a scale of 5</h3></div>"), plotOutput("piechart")
                
              ),      
tabPanel("WordCloud",HTML("<div><h3>Most used words associated with the hashtag</h3></div>"),plotOutput("word")),

      
      
      
      tabPanel("User Analysis", textInput("user", "Enter user name", "@"),submitButton(text="Search"), plotOutput("tophashtagsplot"), HTML("<div><h3> Frequency of HashTags in the tweets of the user
			</h3></div>")  ) ,tags$tab(
			  tags$style(type = "text/css", "a{color: #ffffff;}")
			)    
    )
  )
  
))