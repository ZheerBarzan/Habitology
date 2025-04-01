//
//  IntroPageView.swift
//  Habitology
//
//  Created by zheer barzan on 1/4/25.
//

import SwiftUI

struct IntroPageView: View {
    @State private var selectedItem: IntroPageItems = staticIntroItems.first!
    @State private var introItems: [IntroPageItems] = staticIntroItems
    @State private var ActiveIndex: Int = 0
    @State private var askUserName: Bool = false
    @AppStorage("userName") var userName: String = ""
    var body: some View {
        VStack(spacing: 0) {
            Button{
                UpdateItem(isForward: false)
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
                    .contentShape(.rect)
            }
            .padding(15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .opacity(selectedItem.id != introItems.first!.id ? 1 : 0)
            
            ZStack{
                ForEach(introItems) { item in
                    AnimatedIconView(item)
                }
            }
            .frame(maxHeight: 250)
            .frame(maxHeight: .infinity)
            
            VStack(spacing: 6) {
                HStack(spacing:4){
                    ForEach(introItems) { index in
                        Capsule()
                            .fill(selectedItem.id == index.id ? Color.white : Color.black.opacity(0.5))
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
            .font(.system(size: 60, design: .monospaced))
            .foregroundStyle(.white.shadow(.drop(radius: 10)))
            .blendMode(.overlay)
            .frame(width: 120, height: 120)
            .background{
                RoundedRectangle(cornerRadius: 15)
                    .fill(.background)
                    .shadow(color: .primary.opacity(0.2), radius: 1, x: 1, y: 1)
                    .shadow(color: .primary.opacity(0.2), radius: 1, x: -1, y: -1)
                    .padding(-3)
                    .opacity(selectedItem.id == item.id ? 1 : 0)
                
            }
            .rotationEffect(.init(degrees: -item.rotation))
            .scaleEffect(isSelected ? 1 : item.scale, anchor: item.anchor)
            .offset(y: isSelected ? item.offset : item.extraOffset)
            .rotationEffect(.init(degrees: item.rotation))
            .zIndex(isSelected ? 2 : item.zIndex)
    }
    
    func UpdateItem(isForward: Bool) {
        guard isForward ? ActiveIndex != introItems.count - 1 : ActiveIndex != 0 else { return }
        
        var fromIndex: Int
        var extraOffset: CGFloat
        
        if isForward {
            ActiveIndex += 1
        } else {
            ActiveIndex -= 1
        }
        
        if isForward {
            fromIndex = ActiveIndex - 1
            extraOffset = introItems[ActiveIndex].extraOffset
        } else {
            fromIndex = ActiveIndex + 1
            extraOffset = introItems[ActiveIndex].extraOffset
        }
        
        for index in introItems.indices {
            introItems[index].zIndex = 0
        }
            
    }
        
}




#Preview {
    IntroPageView()
}
