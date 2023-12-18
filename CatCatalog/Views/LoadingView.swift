import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        VStack(spacing: 20)  {
            // MARK: - Emoji
            Text("😼")
                .font(.system(size: 80))
            
            // MARK: - Progress Indicator
            ProgressView()
            
            // MARK: - Loading Text
            Text("Catting the cats ...")
                .foregroundColor(.gray)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    // MARK: - Preview
    static var previews: some View {
        LoadingView()
    }
}
