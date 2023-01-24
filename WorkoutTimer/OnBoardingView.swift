//
//  OnBoardingView.swift
//  WorkoutTimer
//
//  Created by Marc Bessa Hoffmann on 24.01.23.
//

import SwiftUI

struct WorkoutTimerView: View {
    @State var mode = "Workout"
    @State var workoutMinutes = 0
    @State var workoutSeconds = 0
    @State var breakMinutes = 0
    @State var breakSeconds = 0
    @State var roundCount = 0

    var body: some View {
        VStack {
            HStack {
                Button(action: { self.mode = "Workout" }) {
                    Text("Workout")
                }
                .padding()
                .background(mode == "Workout" ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: { self.mode = "Break" }) {
                    Text("Break")
                }
                .padding()
                .background(mode == "Break" ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Button(action: { self.mode = "Rounds"}){
                    Text("Rounds")
                }
                .padding()
                .background(mode == "Rounds" ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
            }.padding(.top)
            HStack {
                if mode == "Workout" {
                    Picker(selection: $workoutMinutes, label: Text("Minutes")) {
                        ForEach(0..<60) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100, height: 200)
                    .clipped()
                    Text("min")
                    
                    Picker(selection: $workoutSeconds, label: Text("Seconds")){
                        ForEach(0..<60) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100, height: 200)
                    .clipped()
                    Text("sec")
                    
                } else if mode == "Break"{
                    Picker(selection: $breakMinutes, label: Text("Minutes")) {
                        ForEach(0..<60) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100, height: 200)
                    .clipped()
                    Text("min")
                    
                    Picker(selection: $breakSeconds, label: Text("Seconds")) {
                        ForEach(0..<60) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100, height: 200)
                    .clipped()
                    Text("sec")
                    
                    
                } else if mode == "Rounds"{
                    Picker(selection: $roundCount, label: Text("Rounds")){
                        ForEach(0..<100){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100, height: 200)
                    .clipped()
                    Text("rounds")
                    
                }
            }
            if mode == "Workout" {
                Text("Workout: \(workoutMinutes == 0 ? "\(workoutSeconds) sec" : workoutMinutes == 1 ? "\(workoutMinutes) min & \(workoutSeconds) sec" : "\(workoutMinutes) min & \(workoutSeconds) sec")")
                
            }else if mode == "Break" {
                Text("Pause: \(breakMinutes == 0 ? "\(breakSeconds) sec" : breakMinutes == 1 ? "\(breakMinutes) min & \(breakSeconds) sec" : "\(breakMinutes) min & \(breakSeconds) sec")")
                
            }else if mode == "Rounds" {
                Text("Rounds: \(roundCount)")
            }
            
        }
    }
}




struct WorkoutTimerView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutTimerView()
    }
}
