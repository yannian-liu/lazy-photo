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

    var body: some View {
        ScrollView {
            
            VStack {
                Text("face_replacement".localized)
                    .font(.headline)
                
                Spacer().frame(height: 30)
                
                Text("original_photo".localized).font(.callout)

                if let image = viewModel.originalImage {
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
                
                Spacer().frame(height: 30)
                
                Text("replacement_photo".localized).font(.callout)

                if let image = viewModel.replacementImage {
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
                
                Spacer().frame(height: 60)
                
                StatableButtonView(configuration: viewModel.generateButtonConfiguration)
            }
            .sheet(isPresented: $viewModel.isOriginalImagePickerPresented) {
                ImagePicker(image: $viewModel.originalImage)
            }
            .sheet(isPresented: $viewModel.isReplacementImagePickerPresented) {
                ImagePicker(image: $viewModel.replacementImage)
            }
            
        }
        .contentMargins(.all, 16)

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
