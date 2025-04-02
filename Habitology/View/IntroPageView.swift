//
//  IntroPageView.swift
//  Habitology
//
//  Created by zheer barzan on 1/4/25.
//

import SwiftUI

struct IntroPageView: View {
    // MARK: - Properties
    @State private var selectedItem: IntroPageItems = staticIntroItems.first!
    @State private var introItems: [IntroPageItems] = staticIntroItems
    @State private var ActiveIndex: Int = 0
    @State private var askUserName: Bool = false
    @AppStorage("userName") var userName: String = ""
    var body: some View {
        VStack(spacing: 0) {
            // back button
            Button{
                UpdateItem(isForward: false)
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.green)
                    .contentShape(.rect)
            }
            .padding(15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .opacity(selectedItem.id != introItems.first?.id ? 1 : 0)
            
            ZStack{
                ForEach(introItems) { item in
                    AnimatedIconView(item)
                }
            }
            .frame(maxHeight: 250)
            .frame(maxHeight: .infinity)
            
            VStack(spacing: 6) {
                HStack(spacing:4){
                    // animated indicator
                    ForEach(introItems) { index in
                        Capsule()
                            .fill(selectedItem.id == index.id ? Color.primary : .gray)
                            .frame(width: selectedItem.id == index.id ? 20 : 8, height: 8)
                    }
                }.padding(.bottom,15)
                
                Text(selectedItem.title)
                    .font(.system(.title, design: .monospaced))
                    .contentTransition(.numericText())
                
                Text(selectedItem.description)
                    .multilineTextAlignment(.center)
                    .font(.system(.body, design: .monospaced))
                    .contentTransition(.numericText())
                    
                
                Button{
                    if selectedItem.id == introItems.last?.id {
                        askUserName.toggle()
                    }
                    UpdateItem(isForward: true)
                } label: {
                    Text(selectedItem.id == introItems.last!.id ? "Get Started" : "Next")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .contentTransition(.numericText())
                        .frame(maxWidth: 250)
                        .padding(.vertical,12)
                        .background(.green.gradient, in: RoundedRectangle(cornerRadius: 8))
                        
                }
                .padding(.top,25)
            }
            .multilineTextAlignment(.center)
            .frame(width: 300)
            .frame(maxHeight: .infinity)
        }
    }
    @ViewBuilder
    func AnimatedIconView(_ item: IntroPageItems) -> some View {
        let isSelected = selectedItem.id == item.id
        
        Image(systemName: item.image)
            .font(.system(size: 80, design: .monospaced))
            .foregroundStyle(.white.shadow(.drop(radius: 15)))
            .blendMode(.overlay)
            .frame(width: 120, height: 120)
            .background(.green.gradient, in: .rect(cornerRadius:30))
            .background{
                RoundedRectangle(cornerRadius: 30)
                    .fill(.background)
                    .shadow(color: .primary.opacity(0.2), radius: 1, x: 1, y: 1)
                    .shadow(color: .primary.opacity(0.2), radius: 1, x: -1, y: -1)
                    .padding(-3)
                    .opacity(selectedItem.id == item.id ? 1 : 0)
                
            }
            .rotationEffect(.init(degrees: -item.rotation))
            .scaleEffect(isSelected ? 1.1 : item.scale, anchor: item.anchor)
            .offset(x: item.offset)
            .rotationEffect(.init(degrees: item.rotation))
            .zIndex(isSelected ? 2 : item.zIndex)
    }
    
    func UpdateItem(isForward: Bool) {
        guard isForward ? ActiveIndex != introItems.count - 1 : ActiveIndex != 0 else { return }
        
        var fromIndex: Int
        var extraOffset: CGFloat
        
        
        
        isForward ? (ActiveIndex += 1) : (ActiveIndex -= 1)
        
        if isForward{
             fromIndex = ActiveIndex - 1
            extraOffset = introItems[ActiveIndex].extraOffset

        }else{
            extraOffset = introItems[ActiveIndex].extraOffset
            fromIndex = ActiveIndex + 1
        
        }

        // resting z-index
        
        for index in introItems.indices {
            introItems[index].zIndex = 0
        }
        
        Task {[fromIndex, extraOffset] in
            
            
            withAnimation(.bouncy(duration:1.5)){
                introItems[fromIndex].scale = introItems[ActiveIndex].scale
                introItems[fromIndex].offset = introItems[ActiveIndex].offset
                introItems[fromIndex].rotation = introItems[ActiveIndex].rotation
                introItems[fromIndex].anchor = introItems[ActiveIndex].anchor
                
                // to location is always at the center
                
                introItems[ActiveIndex].offset = extraOffset
                
                introItems[fromIndex].zIndex = 1
            }
            
            try? await Task.sleep(for: .seconds(0.1))
            withAnimation(.bouncy(duration: 1)){
                introItems[ActiveIndex].scale = 1
                introItems[ActiveIndex].offset = .zero
                introItems[ActiveIndex].rotation = .zero
                introItems[ActiveIndex].anchor = .center
                
                
                
                
                selectedItem = introItems[ActiveIndex]
                
            }
        }
        
            
    }
        
}




#Preview {
    IntroPageView()
}
