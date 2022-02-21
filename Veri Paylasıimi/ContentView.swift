
import SwiftUI


// Our Super Class. For Data Sharing
class Data: ObservableObject{
    @Published var counter:Int = 0
}

struct ContentView: View {
    
    @ObservedObject var dataReceived = Data() // to reach the variable to be used for common sharing.
    
    var body: some View {
        
        NavigationView{
            VStack(spacing:10){
                
                Text("Counter : \(self.dataReceived.counter)")
                Button(action:{
                    
                    self.dataReceived.counter += 1
                    
                }){
                    
                    Text("Add")
                }
                //code for page switching
                NavigationLink(destination:SecondPage(broughtCounter: self.$dataReceived.counter)){
                    Text("Switch")
                }
                
            }.navigationTitle("Homapage")
        }
        
    }
}

struct SecondPage: View {
    //A variable is created in the @binding property to receive the incoming data
    @Binding var broughtCounter:Int
    
    var body: some View {
        VStack{
            
            Text("Counter: \(broughtCounter)")
            Button(action:{
                
                self.broughtCounter += 1
                
            }){
                Text("Add")
            }
            
        }.navigationTitle("SecondPage")
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
