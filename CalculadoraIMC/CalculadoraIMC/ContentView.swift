//
//  ContentView.swift
//  CalculadoraIMC
//
//  Created by Student25 on 01/09/23.
//

import SwiftUI

struct ContentView: View {
    @State private var peso: String = ""
    @State private var altura: String = ""
    @State private var resultadoIMC: String = ""
    @State private var corDeFundo: Color = Color.white
    @State private var imc : Double? = nil
    
    var body: some View {
        VStack {
            Text("Calculadora de IMC")
                .font(.largeTitle)
           
            Spacer()
           
            TextField("Digite seu peso", text: $peso)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
           
            Spacer()
           
            TextField("Digite sua altura", text:$altura)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
            
            Button(action: {
                self.calcularIMC()
                corDeFundo = CorDoIMC()
            }) {
                Text("Calcular IMC")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer().frame(width: 80)
            
            Text("Resultado do IMC: \(resultadoIMC)")
                .font(.title)
            
            Spacer().frame(width: 80)
            
            Image("tabela-IMC")
                .resizable()
                .scaledToFit()
        }.background(corDeFundo)
    }

    func calcularIMC() {
        if let pesoDouble = Double(peso), let alturaDouble = Double(altura), pesoDouble > 0, alturaDouble > 0 {
            let imc = pesoDouble / (alturaDouble * alturaDouble)
            resultadoIMC = String(format:"%.2f",imc)
            self.imc = imc
            corDeFundo = CorDoIMC()
        } else {
            resultadoIMC = "Por favor, insira valores válidos para peso e altura."
        }
    }
    
    func CorDoIMC() -> Color {
        
        if(imc != nil){
            
            if imc! <= 18.5 {
                return Color("BaixoPeso")
            } else if imc! <= 24.9 {
                return Color("normal")
            } else if imc! <= 29.9 {
                return Color("Sobrepeso")
            } else {
                return Color("obesidade")
            }
        }
        return Color.red
    
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
