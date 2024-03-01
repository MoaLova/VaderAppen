//
//  ContentView.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-02-28.
//att göra: //Använd @FetchRequest för att hämta data från din Core Data-stack och @Environment(\.managedObjectContext) för att få tillgång till managedObjectContext som krävs för att skapa eller modifiera entiteter.
//Skapa en tjänstklass i ditt projekt som hanterar nätverksanrop till OpenWeatherMap API. Använd URLSession för att utföra dessa anrop och decodera svaret med hjälp av JSONDecoder.


struct ContentView: View{
    
    @State var text : String = ""
    
    var body: some View{
        VStack{
           NavigationView {
            WeatherView()
                .navigationTitle("Weather Me")
            Button("Get weather"){
                
            }
            HStack{
                Text("07.00")
                    .position(x:50, y: 10 )
                
                
                Button(action: {
                    print("nein")
                    
                }){Image(systemName: "heart.fill")
                        .resizable()
                        .foregroundColor(.pink)
                        .frame(width: 50, height: 50)
                        .position(x: 130, y: 10)
                    }
                
            }
          
                
                
                Text("Location")
                .position(x: 190, y: -120)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                
                Rectangle()
                
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 340, height: 550)
                    .foregroundColor(.white)
                    .position(x: 200, y: -10)
            
            HStack{
                
                ZStack{
                 Rectangle()
                    .stroke(Color.black, lineWidth: 3)
                    .frame(width: 100, height: 100)
                    .position(x:80, y:140)
                    
                    
                    Button(action:{
                    print("Button tapped")
                      }) {
                    Image(systemName: "questionmark")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 80, height: 80)
                        .position(x:80, y:140)
                 }

            }
                
                ZStack{
                    
                    Rectangle()
                        .frame(width: 225, height: 55)
                        .position(x:60 , y:116)
                    
                    TextField("Search location", text: $text)
                        .frame(width: 220, height: 50)
                        .background(Color.white)
                        .position(x:60, y:116)
                    
                }
            }

            }
        
        }
    }
    
    struct ContentView_Previews: PreviewProvider{
        static var previews: some View{
            ContentView()
        }
    }
