import SwiftUI
struct ContentView: View {
    // Game state
    @State private var currentStep = "start"
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            switch currentStep {
            case "start":
                Text("🏞️ Oh no someone breaks into your house.")
                    .multilineTextAlignment(.center)
                HStack {
                    gameButton("hide") {
                        currentStep = "hide"
                    }
                    gameButton("run away") {
                        currentStep = "run"
                    }
                }
            case "hide":
                Text("🌉 hide in the closet, or hide under th bed.")
                    .multilineTextAlignment(.center)
                VStack {
                    gameButton("hide in the closet") {
                        currentStep = "hide2"
                    }
                    gameButton("hide under the bed") {
                        currentStep = "hide3"
                    }
                }
                
            case "hide2":
                Text("what should you do")
                gameButton("call the police"){
                    currentStep = "hide"
                }
                gameButton("stay where your at"){
                    currentStep = "hide"
                }
            case "hide3":
                Text("the burglar finds you because you were to loud")
                gameButton("Gameover"){
                    currentStep = "start"
                }
                
                
            case "run":
                Text("⛺ go to your neighbors house, or go to a near by tree")
                Circle()
                    .fill(Color.brown)
                    .frame(width: 100, height: 100)
                gameButton("go to your neighbors house.") {
                    currentStep = "neighbors"
                }
                gameButton("go to a near by tree.") {
                    currentStep = "run"
                }
            case "run2":
                Text("🕳️ call the police, or stay put!")
                Ellipse()
                    .fill(Color.gray)
                    .frame(width: 120, height: 60)
                gameButton("call police") {
                    currentStep = "run"
                }
                gameButton ("stay put") {
                    currentStep = "run"
                }
                
            case "neighbors":
                Text("🌈 The police are able to stop the burglar and all your things are safe!")
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 100, height: 100)
                gameButton("Restart Game") {
                    currentStep = "start"
                }
            case "tree":
                Text("🚣 call the police, or stay put")
                Image(systemName: "ferry.fill")
                    .resizable()
                    .frame(width: 80, height: 60)
                    .foregroundColor(.blue)
                gameButton("call the police") {
                    currentStep = "polices"
                }
                gameButton("stay put"){
                    currentStep = "stay here"
                }
                
            case "polices":
                Text("the burglar sees you and attacks you")
                
            case "stay here":
                Text("the burglar sees you and attacks you")
                
            default:
                Text("Game Over.")
            }
            Spacer()
        }
        .padding()
        .font(.title3)
    }
    // Reusable styled button
    func gameButton(_ label: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(label)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
#Preview {
    ContentView()
}


