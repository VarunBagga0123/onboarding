//
//  ContentView.swift
//  Onboarding
//
//  Created by Varun Bagga on 27/05/24.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State var name:String = ""
    @State var selection = "Male"
    @State var newSelection = ""
    @State var birthDate:Date = Calendar.current.date(byAdding: DateComponents(year: -80), to: Date()) ?? Date()
    @State var showPhotoPicker = false
    @State var selectedPhoto: UIImage? = nil
    
    
    var body: some View {
        VStack {
          
        }
        .padding()
    }
    
    
    private var dateView: some View{
        VStack{
            HStack {
                Text("Date of birth")
                Spacer()
            }
            DatePicker(selection:$birthDate,displayedComponents: .date){}
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
            
            Button {
                print(birthDate)
            } label: {
               Text("Press")
            }
        }
    }
    
    private var genderSelection: some View{
        VStack {
            HStack {
                Text("Gender")
                Spacer()
            }
            RadioButton("Male", selectedID: "Male")
            RadioButton("Female", selectedID: "Male")
            RadioButton("Other", selectedID: "Male")
        }
    }
    
    private var nameView: some View {
        VStack{
            HStack{
                Text("Name")
                Spacer()
            }
            TextField("please enter your email here",text: $name)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(style: StrokeStyle(lineWidth: 0.5))
                        .fill(.black.opacity(0.5))
                )
        }
    }
}

struct gridview: View {
    
    @State var arr:[String] = ["android","iPhone","Oppo","vivo",]
    
    let columns: [GridItem] = [GridItem(.flexible(), spacing: 10),
                               GridItem(.flexible(), spacing: 10)]
    var body : some View{
        ScrollView{
        HStack{
//            ForEach(0..<2) { _ in
            LazyVGrid(columns: columns){
                ForEach(arr,id: \.self) { ele in
                        SelectedCellView(name: ele)
                    }
                }
            }
        }
    }
}

struct RadioButton: View {
    
    let id: String
  
    let selectedID : String
    let size: CGFloat
    let color: Color

    init(
        _ id: String,
        selectedID: String,
        size: CGFloat = 20,
        color: Color = Color.primary
        ) {
        self.id = id
        self.size = size
        self.color = color
        self.selectedID = selectedID
    }

    var body: some View {
        Button(action:{
            
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.selectedID == self.id ? "largecircle.fill.circle" : "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                    
                Text(id)
                    .font(Font.system(size: 20))
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(self.color)
        .id(id)
    }
}
struct SelectedCellView: View {
    
    let name: String
    @State var isSelected = false
    
    var body: some View{
        HStack {
            Text(name)
                .opacity(isSelected ? 1 : 0.5)
            Spacer()
            Image(systemName:isSelected ?"checkmark" : "plus")
                .resizable()
                .scaledToFit()
                .frame(width: 15,height: 15)
                .foregroundColor(.black.opacity(isSelected ? 1 : 0.5))
        }
        .padding(.vertical,10)
        .padding(.leading,40)
        .padding(.trailing,20)
        .frame(maxWidth: UIScreen.main.bounds.width/2)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .stroke(style: StrokeStyle(lineWidth: 0.5))
                .fill(.black.opacity(isSelected ? 1 : 0.5))
        )
        .contentShape(Rectangle())
        .onTapGesture {
            isSelected.toggle()
        }
    }
}



#Preview {
    ContentView()
}
