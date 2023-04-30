import SwiftUI
import AVKit

struct ContentView: View {
    @State var instrumentType: ARRInstrument = .gayageum
    @State var noteType: ARRNote = .a
    @State var player = ARRAudioPlayer(instrunment: .gayageum, note: .a)
    @State var isPlaying: Bool = false
    @State var isPressed: Bool = false
    
    let types: [ARRInstrument] = [.gayageum, .haegeum, .taepyeongso, .tungso]
    let notes: [ARRNote] = [.a, .b, .c, .d, .e, .f]

//    var timer: 
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 30) {
            // 악기 선택
            VStack{
                ForEach(types, id: \.self) {type in 
                    Button{
                        instrumentType = type
                    } label: {
                        ZStack{
                            ZStack{
                                Image("\(type.rawValue)Image")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                RoundedRectangle(cornerRadius: 10).foregroundColor(type.rawValue == instrumentType.rawValue ? .clear : .black.opacity(0.8))
                            }
                            .frame(width: 200, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
            }
            
            
            VStack(alignment: .center, spacing: 30){
                Spacer()
                // 악기 설명
                HStack(alignment: .top, spacing: 30){
                    VStack{
                        Image("\(instrumentType.rawValue)Image")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: 500, height: 330, alignment: .top)
                        Spacer()
                    }
                    VStack(alignment: .leading){
                        Text(instrumentType.rawValue)
                            .frame(alignment: .topLeading)
                            .font(.largeTitle)
                            .foregroundColor(.white).bold(true)
                        Text("\n" + getDesctription(instrument: instrumentType))
                            .font(.body).foregroundColor(.white)
//                            Button {
//                                isPlaying.toggle()
//                            } label: {
//                                ZStack{
//                                    Image(isPlaying ? "StopButton" : "StartButton")
//                                }
//                            }
                    }
                    Spacer()
                }          
                
                Spacer()
                
                // 음계 선택
                HStack{
                    ForEach(notes, id: \.self){ note in
                        Button{
                            player.ARRstop()
                            noteType = note
                            player = ARRAudioPlayer(instrunment: instrumentType, note: noteType)
                            player.ARRplay()
                            isPressed = true
                        } label: {
                            ZStack{
                                Image("Button"+note.rawValue)
                                Image("Press"+note.rawValue)
                            }  
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 50)
        .padding([.bottom, .top], 100)
        .background(Image("paper")
            .resizable()
            .ignoresSafeArea(edges: .all))
    }
}
