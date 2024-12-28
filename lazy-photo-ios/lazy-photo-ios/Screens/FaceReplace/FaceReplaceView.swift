//
//  ContentView.swift
//  lazy-photo-ios
//
//  Created by Yannian Liu on 22/12/2024.
//

import SwiftUI
import SwiftData

struct FaceReplaceView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var isOriginalImagePickerPresented = false
    @State private var originalImage: UIImage?
    @State private var faceImage: UIImage?


    var body: some View {
        VStack {
            if let image = originalImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .plateDisplay(.primary)
            } else {
                Button(action: {
                    isOriginalImagePickerPresented = true
                }) {
                    Label("Upload Photo", systemImage: "photo.fill")
                }
                .padding()

            }
            
        }
        .sheet(isPresented: $isOriginalImagePickerPresented) {
            ImagePicker(image: $originalImage)
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
