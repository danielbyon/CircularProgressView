//
//  CircularProgressView.swift
//  
//
//  Created by Daniel Byon on 9/19/22.
//

import SwiftUI

/// Draws a progress view as a circular line. Progress starts at the 12 o'clock position
/// and increases counter-clockwise.
public struct CircularProgressView: View {

    /// The progress to draw the partial circle.
    public let progress: Double
    /// The color used to draw the circles.
    public let color: Color
    /// The width of the circular lines.
    public let lineWidth: CGFloat

    public var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color.opacity(0.5),
                    lineWidth: lineWidth
                )
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    color,
                    style: StrokeStyle(
                        lineWidth: lineWidth,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut, value: progress)
        }
    }

    public init(
        progress: Double,
        color: Color = .gray,
        lineWidth: CGFloat = 30.0
    ) {
        self.progress = progress
        self.color = color
        self.lineWidth = lineWidth
    }

}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.5)
    }
}
