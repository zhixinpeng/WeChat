//
//  MomentHome.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/24.
//

import SwiftUI

struct MomentHome: View {
    @Environment(\.statusBarStyle) var statusBarStyle
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Color.black.frame(height: 300)
                    Spacer()
                }
                MomentList()
            }
            .overlayPreferenceValue(NavigationKey.self, { value in
                VStack {
                    self.navigation(geometry: geometry, value: value)
                    Spacer()
                }
            })
            .ignoresSafeArea()
        }
        .navigationBarHidden(true)
        .navigationBarTitle("朋友圈", displayMode: .inline)
        .onDisappear {
            statusBarStyle.current = .default
        }
    }
    
    struct NavigationKey: PreferenceKey {
        typealias Value = [Anchor<CGPoint>]
        
        static var defaultValue: Value = []
        static func reduce(value: inout Value, nextValue: () -> Value) {
            value.append(contentsOf: nextValue())
        }
    }
    
    func navigation(geometry: GeometryProxy, value: [Anchor<CGPoint>]) -> some View {
        let height = geometry.safeAreaInsets.top + 44
        let progress: CGFloat
        
        if let anchor = value.first {
            progress = max(0, min(1, (-geometry[anchor].y + height + 20) / 44))
        } else {
            progress = 1
        }
        
        statusBarStyle.current = progress > 0.3 ? .default : .lightContent
        
        return Navigation(progress: Double(progress))
            .frame(height: height)
    }
    
    struct Navigation: View {
        @Environment(\.colorScheme) var colorScheme
        @Environment(\.presentationMode) var presentationMode
        
        let progress: Double
        
        var body: some View {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("light_gray").opacity(progress))
                
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("back").renderingMode(.template)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: progress > 0.4 ? "camera" : "camera.fill")
                    }
                }
                .accentColor(Color(white: colorScheme == .light ? 1 - progress : 1))
                .frame(height: 44)
                
                Text("朋友圈")
                    .font(.system(size: 16, weight: .semibold))
                    .opacity(progress)
                    .frame(height: 44, alignment: .center)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct MomentHome_Previews: PreviewProvider {
    static var previews: some View {
        MomentHome()
    }
}
