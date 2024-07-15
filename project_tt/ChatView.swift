import SwiftUI
/*
struct ChatView: View {
    @EnvironmentObject var pubNubManager: PubNubManager
    @State private var messageText: String = ""

    var body: some View {
        VStack {
            ScrollView {
                ForEach(pubNubManager.messages, id: \.self) { message in
                    Text(message)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .trailing], 10)
                        .padding([.top, .bottom], 2)
                }
            }
            .padding(.top)

            HStack {
                TextField("Enter message...", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    pubNubManager.publishMessage(messageText, to: "chat_channel")
                    messageText = ""
                }) {
                    Text("Send")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.trailing)
            }
            .padding(.bottom)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(PubNubManager())
    }
}
*/
