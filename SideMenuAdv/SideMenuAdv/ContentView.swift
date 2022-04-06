//
//  ContentView.swift
//  SideMenuAdv
//
//  Created by Yiğit Efe Enhoş on 16.03.2022.
//

import SwiftUI



struct MenuItem: Identifiable {
    var id = UUID()
    let text: String
    let handler: ()-> Void {
        print("Tapped")
    }
    
}
    


struct MenuContent: View {
    let items: [MenuItem]=[
        MenuItem(text: "Home"),
        MenuItem(text: "Settings"),
        MenuItem(text: "Profile"),
        MenuItem(text: "Status"),
    ]
    
    
    var body: some View{
        ZStack{
            Color(UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1))
            
            VStack(alignment: .leading, spacing: 0){
                
                
                ForEach(items){item in
                    HStack {
                        Text(item.text)
                            .bold()
                            .font(.system(size: 22))
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .onTapGesture {
                        <#code#>
                    }
                    .padding()
                    Divider()
                    
                }
                
                
                Spacer()
            }
            
            .padding(.top, 45)
            
        }
    }
}



struct SideMenu: View {
    let width: CGFloat
    let menuOpened: Bool
    let toggleMenu: () -> Void
    
    
    var body: some View{
        ZStack{
            // Background View
            GeometryReader { _ in
                EmptyView()
            }
            
            .background(Color.gray.opacity(0.25))
            .opacity(self.menuOpened ? 1:0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.toggleMenu()
            }
            
            
            
            // MenuContent
            
            HStack{
                MenuContent()
                    .frame(width: width)
                    .offset(x: menuOpened ? 0 : -width)
                    .animation(.default)
                Spacer()
            
            }
            
            
        }
    }
}


struct ContentView: View {
    @State var menuOpened = false
    
    
    
    
    var body: some View {
        ZStack{
            if !menuOpened{
                Button(action:{
                    //OpenMenu
                    self.menuOpened.toggle()
                }, label: {
                    Text("Button")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50, alignment: .center)
                        .background(Color(.systemBlue))
                        
                })
            }
           
            
            
            SideMenu(width: UIScreen.main.bounds.width/2,
                     menuOpened: menuOpened,
                     toggleMenu: toggleMenu)
            
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func toggleMenu() {
        menuOpened.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
