import SwiftUI

struct HomeProgressToolbarView: View {
    var completedTasks: Int
    var amountOfTasks: Int

    private var rankName: String {
        if completedTasks >= 25 {
            return "Trader"
        } else if completedTasks >= 20 {
            return "Clerk"
        } else if completedTasks >= 10 {
            return "Investera"
        } else if completedTasks >= 3 {
            return "Sparare"
        } else {
            return "Nybörjare"
        }
    }

    private var progressAmountText: String {
        return "\(completedTasks) / \(amountOfTasks)"
    }

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text(rankName)
                    .foregroundColor(.primary)

                Spacer()

                Text(progressAmountText)
                    .foregroundColor(.secondary)
            }
            .textCase(.uppercase)
            .font(.caption.weight(.semibold))

            ProgressView(value: CGFloat(completedTasks), total: CGFloat(amountOfTasks))
                .animation(.linear, value: completedTasks)
                .progressViewStyle(.linear)
                .tint(.blue)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 4)
        .padding(.horizontal, 24)
    }
}

struct HomeProgressToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeProgressToolbarView(completedTasks: 4, amountOfTasks: 25)
    }
}
