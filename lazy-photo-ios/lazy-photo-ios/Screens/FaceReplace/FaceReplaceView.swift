//
//  ContentView.swift
//  lazy-photo-ios
//
//  Created by Yannian Liu on 22/12/2024.
//

import SwiftUI
import SwiftData
import UIToolbox

struct FaceReplaceView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject private var viewModel = FaceReplaceViewModel()
    @State private var originalImage: UIImage?
    @State private var replacementImage: UIImage?

    var body: some View {
        VStack {
            if let image = originalImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .plateDisplay(.card)
                    .onTapGesture {
                        viewModel.isOriginalImagePickerPresented = true
                    }
            } else {
                StatableButtonView(configuration: viewModel.addOriginalButtonConfiguration)

            }
            
            if let image = replacementImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .plateDisplay(.card)
                    .onTapGesture {
                        viewModel.isReplacementImagePickerPresented = true
                    }
            } else {
                StatableButtonView(configuration: viewModel.addReplacementButtonConfiguration)
            }
        }
        .sheet(isPresented: $viewModel.isOriginalImagePickerPresented) {
            ImagePicker(image: $originalImage)
        }
        .sheet(isPresented: $viewModel.isReplacementImagePickerPresented) {
            ImagePicker(image: $replacementImage)
        }

    }
}

#Preview {
    FaceReplaceView()
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
