//
//  BlobShape.swift
//  OpenWeather
//
//  Created by Palatip Jantawong on 9/3/2567 BE.
//

import SwiftUI

struct BlobShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.4526*width, y: 0.04825*height))
        path.addCurve(to: CGPoint(x: 0.71806*width, y: 0.11568*height), control1: CGPoint(x: 0.54576*width, y: 0.06036*height), control2: CGPoint(x: 0.63706*width, y: 0.05215*height))
        path.addCurve(to: CGPoint(x: 0.99724*width, y: 0.47538*height), control1: CGPoint(x: 0.8336*width, y: 0.20629*height), control2: CGPoint(x: 0.97997*width, y: 0.29601*height))
        path.addCurve(to: CGPoint(x: 0.79768*width, y: 0.94296*height), control1: CGPoint(x: 1.0151*width, y: 0.66097*height), control2: CGPoint(x: 0.91157*width, y: 0.83705*height))
        path.addCurve(to: CGPoint(x: 0.4526*width, y: 0.98188*height), control1: CGPoint(x: 0.69875*width, y: 1.03497*height), control2: CGPoint(x: 0.57258*width, y: 0.98432*height))
        path.addCurve(to: CGPoint(x: 0.11773*width, y: 0.92912*height), control1: CGPoint(x: 0.33579*width, y: 0.9795*height), control2: CGPoint(x: 0.20779*width, y: 1.02994*height))
        path.addCurve(to: CGPoint(x: 0.00016*width, y: 0.47538*height), control1: CGPoint(x: 0.02292*width, y: 0.82298*height), control2: CGPoint(x: -0.00228*width, y: 0.64199*height))
        path.addCurve(to: CGPoint(x: 0.13076*width, y: 0.03929*height), control1: CGPoint(x: 0.00255*width, y: 0.31233*height), control2: CGPoint(x: 0.03201*width, y: 0.13252*height))
        path.addCurve(to: CGPoint(x: 0.4526*width, y: 0.04825*height), control1: CGPoint(x: 0.22229*width, y: -0.04711*height), control2: CGPoint(x: 0.34156*width, y: 0.03381*height))
        path.closeSubpath()
        return path
    }
}
#Preview {
    BlobShape()
}
