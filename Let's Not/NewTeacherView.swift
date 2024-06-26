//
//  NewTeacherView.swift
//  Let's Not
//
//  Created by jiachen on 1/11/21.
//

import SwiftUI

struct NewTeacherView: View {
    
    @ObservedObject var teacherManager: TeacherManager
    @State var teacher = Teacher(name: "", subject: "")
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Mr Soon", text: $teacher.name)
                } header: {
                    Text("Name")
                }
                
                Section {
                    TextField("Swift Accelerator Programme", text: $teacher.subject)
                } header: {
                    Text("Subject")
                }
                
                Section {
                    Button {
                        teacherManager.teachers.append(teacher)
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Label("Done", systemImage: "checkmark")
                    }
                    
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                    }
                }
            }
            .navigationTitle("New Teacher")
        }
    }
}

struct NewTeacherView_Previews: PreviewProvider {
    static var previews: some View {
        NewTeacherView(teacherManager: TeacherManager())
    }
}
