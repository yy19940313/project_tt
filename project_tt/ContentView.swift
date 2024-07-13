//
//  ContentView.swift
//  project_tt
//
//  Created by Yi Y on 7/11/24.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


/*
import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack() {
      Rectangle()
        .foregroundColor(.clear)
        .frame(width: 431, height: 932)
        .background(
          AsyncImage(url: URL(string: "https://via.placeholder.com/431x932"))
        )
        .offset(x: -0.50, y: 0)
        .shadow(
          color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
        )
      Text("First time here?")
        .font(Font.custom("Rubik", size: 16).weight(.medium))
        .lineSpacing(24)
        .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
        .offset(x: 0, y: -175)
      Text("Already have an account? \nLog in here")
        .font(Font.custom("Rubik", size: 14).weight(.light))
        .lineSpacing(21)
        .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
        .offset(x: 0, y: 154)
      ZStack() {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 133, height: 0)
          .overlay(
            Rectangle()
              .stroke(
                Color(red: 0, green: 0.15, blue: 0.29).opacity(0.20), lineWidth: 0.50
              )
          )
          .offset(x: -93.50, y: 0.50)
        Text("OR")
          .font(Font.custom("Rubik", size: 14).weight(.medium))
          .lineSpacing(21)
          .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
          .offset(x: 0, y: 0)
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 133, height: 0)
          .overlay(
            Rectangle()
              .stroke(
                Color(red: 0, green: 0.15, blue: 0.29).opacity(0.20), lineWidth: 0.50
              )
          )
          .offset(x: 93.50, y: 0.50)
      }
      .frame(width: 320)
      .offset(x: 0, y: 232.50)
      HStack(alignment: .top, spacing: 122.54) {
        HStack(spacing: 0) {
          Text("9:41")
            .font(Font.custom("SF Pro", size: 17).weight())
            .lineSpacing(22)
            .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
        }
        .padding(
          EdgeInsets(top: 18.34, leading: 0, bottom: 13.66, trailing: 0)
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        HStack(alignment: .top, spacing: 7.50) {
          ZStack() {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 25, height: 13)
              .cornerRadius(4.30)
              .overlay(
                RoundedRectangle(cornerRadius: 4.30)
                  .inset(by: 0.50)
                  .stroke(Color(red: 0, green: 0.15, blue: 0.29), lineWidth: 0.50)
              )
              .offset(x: -1.16, y: 0)
              .opacity(0.35)
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 21, height: 9)
              .background(Color(red: 0, green: 0.15, blue: 0.29))
              .cornerRadius(2.50)
              .offset(x: -1.16, y: 0)
          }
          .frame(width: 27.33, height: 13)
        }
        .padding(
          EdgeInsets(top: 23, leading: 37, bottom: 18, trailing: 38.40)
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
      .frame(width: 430, height: 54)
      .offset(x: 0, y: -439)
      VStack(alignment: .leading, spacing: 32) {
        VStack(alignment: .leading, spacing: 12) {
          VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .top, spacing: 10) {
              Text("Email Address")
                .font(Font.custom("Rubik", size: 14).weight(.light))
                .lineSpacing(21)
                .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29).opacity(0.60))
            }
            .frame(width: 320)
            HStack(spacing: 0) {
              Text("vivian_shi_1990@gmail.com")
                .font(Font.custom("Rubik", size: 16).weight(.light))
                .lineSpacing(20)
                .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29).opacity(0.80))
            }
            .padding(EdgeInsets(top: 12, leading: 12, bottom: 16, trailing: 44))
            .background(.white)
            .cornerRadius(8)
            .overlay(
              RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.50)
                .stroke(Color(red: 0.90, green: 0.91, blue: 0.93), lineWidth: 0.50)
            )
          }
          VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .top, spacing: 10) {
              Text("Password")
                .font(Font.custom("Rubik", size: 14).weight(.light))
                .lineSpacing(21)
                .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29).opacity(0.60))
            }
            .frame(maxWidth: .infinity)
            HStack(alignment: .bottom, spacing: 8) {
              Text("************")
                .font(Font.custom("Rubik", size: 16).weight(.light))
                .lineSpacing(20)
                .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29).opacity(0.80))
              HStack(spacing: 0) {

              }
              .padding(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
              .frame(width: 24, height: 24)
            }
            .padding(12)
            .frame(width: 320)
            .background(.white)
            .cornerRadius(8)
            .overlay(
              RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.50)
                .stroke(Color(red: 0.90, green: 0.91, blue: 0.93), lineWidth: 0.50)
            )
          }
          .frame(height: 73)
        }
        HStack(spacing: 8) {
          Text("Sign Me Up!")
            .font(Font.custom("Rubik", size: 18).weight(.bold))
            .lineSpacing(27)
            .foregroundColor(.white)
        }
        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
        .frame(width: 320, height: 48)
        .background(Color(red: 0.93, green: 0.04, blue: 0.26))
        .cornerRadius(32)
      }
      .offset(x: 0, y: -21)
      VStack(alignment: .leading, spacing: 16) {
        HStack(spacing: 8) {
          Text("Continue with Gmail")
            .font(Font.custom("Rubik", size: 18).weight(.bold))
            .lineSpacing(27)
            .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
        }
        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
        .frame(width: 320, height: 48)
        .cornerRadius(32)
        .overlay(
          RoundedRectangle(cornerRadius: 32)
            .inset(by: 1)
            .stroke(Color(red: 0, green: 0.15, blue: 0.29), lineWidth: 1)
        )
        HStack(spacing: 8) {
          Text("Continue with Facebook")
            .font(Font.custom("Rubik", size: 18).weight(.bold))
            .lineSpacing(27)
            .foregroundColor(Color(red: 0, green: 0.15, blue: 0.29))
        }
        .padding(EdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24))
        .frame(width: 320, height: 48)
        .cornerRadius(32)
        .overlay(
          RoundedRectangle(cornerRadius: 32)
            .inset(by: 1)
            .stroke(Color(red: 0, green: 0.15, blue: 0.29), lineWidth: 1)
        )
      }
      .offset(x: 0, y: 337)
      HStack(spacing: 0) {

      }
      .padding(
        EdgeInsets(top: 42.50, leading: 27.25, bottom: 42.50, trailing: 39.25)
      )
      .frame(width: 128, height: 128)
      .background(.white)
      .cornerRadius(90)
      .offset(x: 0, y: -298)
    }
    .frame(width: 430, height: 932)
    .background(.white);
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
*/
