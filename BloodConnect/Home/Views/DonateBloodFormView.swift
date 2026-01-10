//
//  DonateBloodView.swift
//  BloodConnect
//
//  Created by Sajan Lawrence on 10/01/26.
//

import SwiftUI

struct DonateBloodFormView: View {
    
    @State private var step: DonateStep = .personal
    
    // MARK: Personal
    @State private var name = ""
    @State private var age = ""
    @State private var phone = ""
    @State private var city = ""
    @State private var bloodGroup = ""
    
    // MARK: Health
    @State private var lastDonationDate = ""
    @State private var weight = ""
    @State private var recentIllness = false
    @State private var chronicDisease = false
    
    // MARK: Availability
    @State private var availableNow = true
    @State private var emergencyDonation = false
    @State private var consentAccepted = false
    @State private var showSuccessMsg = false
    
    var body: some View {
        ZStack {
            if !showSuccessMsg{
                VStack(spacing: 24) {
                    stepHeader
                    switch step {
                    case .personal:
                        personalStep
                    case .health:
                        healthStep
                    case .availability:
                        availabilityStep
                    }
                    
                    Spacer()
                    
                    actionButtons
                    
                }
                .padding()
            }else{
                SuccessView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

extension DonateBloodFormView {
    func customTextField(text: Binding<String>, placeholder: String, width: Double, height: Double) -> some View{
        HStack{
            TextField( "", text: text, prompt: Text(placeholder) .font(.custom("Ubuntu-Bold", size: 16)) .foregroundColor(.gray) )
                .padding(.leading)
                .font(.custom("Ubuntu-Bold", size: 16))
                .frame(height: height, alignment: .leading)
                .frame(maxWidth: width)
                .background( RoundedRectangle(cornerRadius: 10) .fill(Color(red: 243/255.0, green: 243/255.0, blue: 243/255.0)) )
        }
    }
    
    func submitForm() {
        showSuccessMsg = true
    }
    
    var stepHeader: some View {
        Text(step == .personal ? "Personal Details" :
                step == .health ? "Health Details" :
                "Availability & Consent")
        .font(.custom("Ubuntu-Bold", size: 22))
        .foregroundStyle(.appPrimary)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var personalStep: some View {
        VStack(spacing: 16) {
            customTextField(text: $name, placeholder: "Full Name", width: .infinity, height: 52)
            customTextField(text: $age, placeholder: "Age", width: .infinity, height: 52)
            customTextField(text: $bloodGroup, placeholder: "Blood Group (e.g. B+)", width: .infinity, height: 52)
            customTextField(text: $phone, placeholder: "Phone Number", width: .infinity, height: 52)
            customTextField(text: $city, placeholder: "City", width: .infinity, height: 52)
        }
    }
    
    var healthStep: some View {
        VStack(spacing: 16) {
            customTextField(
                text: $lastDonationDate,
                placeholder: "Last Donation Date (DD/MM/YYYY)",
                width: .infinity,
                height: 52
            )
            
            customTextField(
                text: $weight,
                placeholder: "Weight (kg)",
                width: .infinity,
                height: 52
            )
            
            Toggle("Recent illness (last 14 days)?", isOn: $recentIllness)
            Toggle("Any chronic disease?", isOn: $chronicDisease)
        }
        .font(.custom("Ubuntu-Regular", size: 14))
    }
    
    var availabilityStep: some View {
        VStack(spacing: 16) {
            
            Toggle("Available for donation now?", isOn: $availableNow)
            Toggle("Willing for emergency donation?", isOn: $emergencyDonation)
            
            Toggle(isOn: $consentAccepted) {
                Text("I confirm the details are correct and consent to be contacted")
                    .font(.custom("Ubuntu-Regular", size: 14))
            }
        }
    }
}

extension DonateBloodFormView {
    var actionButtons: some View {
        HStack {
            
            if step != .personal {
                Button("Back") {
                    step = step == .health ? .personal : .health
                }
                .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Button(step == .availability ? "Submit" : "Next") {
                if step == .personal {
                    step = .health
                } else if step == .health {
                    step = .availability
                } else {
                    submitForm()
                }
            }
            //.disabled(step == .availability && !consentAccepted)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(.appPrimary)
            .foregroundStyle(.white)
            .clipShape(Capsule())
        }
    }
}



#Preview {
    DonateBloodFormView()
}
