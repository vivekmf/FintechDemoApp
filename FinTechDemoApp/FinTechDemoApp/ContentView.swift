//
//  ContentView.swift
//  FinTechDemoApp
//
//  Created by Vieeveek Singh on 24/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedIndex = 1
    @State private var scrollOffset: CGFloat = 0

    var body: some View {
        VStack {
            Spacer()

            // Body content based on selectedIndex
            if selectedIndex == 0 {
                // Content for Scan & Pay
                Text("Scan & Pay Content")
            } else if selectedIndex == 1 {
                // Content for Profile
                Text("Profile Content")
            } else {
                // Content for Pay Contacts
                Text("Pay Contacts Content")
            }

            // Bottom navigation with curved separator
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    Spacer() // Add leading spacer

                    // Scan and Pay button
                    Button(action: {
                        withAnimation {
                            selectedIndex = 0
                        }
                    }) {
                        VStack {
                            Image(systemName: "qrcode.viewfinder")
                                .foregroundColor((selectedIndex == 0) ? .white : .gray)
                            Text("SCAN & PAY")
                                .font(.caption)
                                .foregroundColor((selectedIndex == 0) ? .white : .gray)
                        }
                        .padding()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }

                    // Profile Image with name
                    Button(action: {
                        withAnimation {
                            selectedIndex = 1
                        }
                    }) {
                        VStack {
                            Image(systemName: "person.fill")
                                .foregroundColor((selectedIndex == 1) ? .white : .gray)
                            Text("VIVEK SINGH")
                                .font(.caption)
                                .foregroundColor((selectedIndex == 1) ? .white : .gray)
                        }
                        .padding()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }

                    // Pay Contacts button
                    Button(action: {
                        withAnimation {
                            selectedIndex = 2
                        }
                    }) {
                        VStack {
                            Image(systemName: "person.2.fill")
                                .foregroundColor((selectedIndex == 2) ? .white : .gray)
                            Text("PAY CONTACTS")
                                .font(.caption)
                                .foregroundColor((selectedIndex == 2) ? .white : .gray)
                        }
                        .padding()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }

                    Spacer()
                }
                .padding(.horizontal)
                .onChange(of: scrollOffset) { newValue, _ in
                    // Update selectedIndex based on scroll direction
                    let scrollThreshold: CGFloat = 20
                    if newValue > scrollThreshold {
                        selectedIndex = min(selectedIndex + 1, 2)
                    } else if newValue < -scrollThreshold {
                        selectedIndex = max(selectedIndex - 1, 0)
                    }
                }
            }
            .background(GeometryReader { proxy in
                // Curved separator
                CurvedShape()
                    .fill(Color.white.opacity(0.2))
                    .frame(height: 20)
                    .offset(y: 10)
                    .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: -5)
            })
            .background(Color.black)
        }
        .background(Color.black)
        .foregroundColor(.white)
    }
}

struct CurvedShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.height), control: CGPoint(x: rect.midX, y: rect.height - 40))
        path.closeSubpath()
        return path
    }
}

#Preview {
    ContentView()
}
