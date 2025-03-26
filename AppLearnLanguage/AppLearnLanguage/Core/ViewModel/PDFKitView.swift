//
//  PDFKitView.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 26.03.2025.
//

import Foundation
import PDFKit
import SwiftUI

struct PDFKitView: UIViewRepresentable {
    func updateUIView(_ uiView: PDFView, context: Context) {
        //
    }
    
    
    func makeUIView(context: Context) -> PDFView {
        let pdf = PDFView()
        
        if let url = Bundle.main.url(forResource: "document", withExtension: "pdf") {
            if let document = PDFDocument(url: url) {
                pdf.document = document
            }
        }
        
        return pdf
        
    }
    
}
