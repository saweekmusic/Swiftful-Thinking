/*
    MaskBootcamp.swift
*/


// BEGGINNER LEVEL
import SwiftUI
struct MaskBootcamp: View {

    @State var rating: Int = 3

    var body: some View {
        ZStack {
            HStack {
                ForEach (1..<6) { index in
                    Image(systemName: "star.fill")
                        .font(.largeTitle)
                        .foregroundColor(rating >= index ? Color.yellow : Color.gray)
                        .onTapGesture {
                            rating = index
                        }
                }
            }
        }
    }
}

struct MaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootcamp()
    }
}









// INTERMIDIATE LEVEL
import SwiftUI
struct MaskBootcamp: View {

    @State var rating: Int = 3

    var body: some View {
        starsView
            .overlay( overlayView().mask(starsView) )
    }

    private var starsView: some View {
        ZStack {
            HStack {
                ForEach (1..<6) { index in
                    Image(systemName: "star.fill")
                        .font(.largeTitle)
                        .foregroundColor(Color.gray)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                rating = index
                                
                            }
                        }
                }
            }
        }
    }

    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowHitTestinf(false) // makes overlay be unclickable, so basicly transperent for your touch
    }
}

struct MaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootcamp()
    }
}