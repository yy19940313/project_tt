
import SwiftUI


struct UsernameSettingView: View {
    @State private var username: String = ""
    
    var body: some View {

        ZStack{
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                

                Spacer()
                    .frame(height: 150)
                
                Text("Set Up Username")
                    .font(Font.custom("Rubik", size: 24).weight(.bold))
                    .padding(.bottom, 20)
                
                // Email input field
                VStack(alignment: .leading, spacing: 4) {
                    Text("Username")
                        .font(Font.custom("Rubik", size: 14).weight(.light))
                        .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29).opacity(0.60))
                    TextField("Enter your username", text: $username)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(red: 0.90, green: 0.91, blue: 0.93), lineWidth: 0.50)
                        )
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
                
                // Reset Password button
                Button(action: {
                    // Add your reset password logic here
                    print("Confirm: \(username)")
                }) {
                    Text("Confirm")
                        .font(Font.custom("Rubik", size: 18).weight(.bold))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 320, height: 48)
                        .background(Color(red: 0.93, green: 0.04, blue: 0.26))
                        .cornerRadius(32)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 100)
        }
    }
}




struct UsernameSettingView_Previews: PreviewProvider {
    static var previews: some View {
        UsernameSettingView().environmentObject(UserAuthModel())
    }
}


