
//  SwiftUIView.swift
//  
//
//  Created by Rifqi Fadhlillah on 28/12/20.
//

import SwiftUI

public struct MyTdsButtonStyle: ButtonStyle {
  let width: CGFloat?
  let height: CGFloat?
  var buttonState: ButtonState
  var buttonStyle: ButtonStyle
  
  init(width: CGFloat = 44,
       height: CGFloat = 93,
       buttonState: ButtonState = .active,
       buttonStyle: ButtonStyle = .primary) {
    self.width = width
    self.height = height
    self.buttonState = buttonState
    self.buttonStyle = buttonStyle
  }
  
  enum ButtonState {
    case active, inactive
  }
  
  enum ButtonStyle {
    case primary, secondary
  }
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(.vertical, 12)
      .padding(.horizontal)
      .frame(width: 100, height: 40, alignment: .center)
      .foregroundColor(foregroundColor(configuration))
      .background(backgroundColor(configuration))
      .clipShape(Capsule())
  }
  
  func foregroundColor(_ configuration: ButtonStyleConfiguration) -> Color{
    switch buttonState {
    case .active:
      return Color.white
    case .inactive:
      return Color.textInactiveColor
    }
  }
  
  func backgroundColor(_ configuration: ButtonStyleConfiguration) -> Color {
    switch buttonState {
    case .active:
      return configuration.isPressed ? Color.primaryColor.opacity(0.7) : Color.primaryColor
    case .inactive:
      return Color.backgroundInactiveColor
    }
  }
}

struct SwiftUIView: View {
    var body: some View {
      Button("Button", action: {})
        .buttonStyle(MyTdsButtonStyle(buttonState: .active))
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
