//
//  Home.swift
//  SimpleFacebookUI
//
//  Created by Daniel Spalek on 31/07/2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack{
            // OPTION TO ADD DIFFERENT BACKGROUND COLOR
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    // MARK: Top menu
                    HStack{
                        Text("facebook")
                            .font(.title.bold())
                            .foregroundColor(.blue)
                        
                        Spacer()
                        
                        //MARK: Buttons
                        HStack{
                            Circle()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.gray)
                                .overlay{
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.white)
                                }
                            Circle()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.red)
                                .overlay{
                                    Image(systemName: "bell.fill")
                                        .foregroundColor(.white)
                                }
                            Circle()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.cyan)
                                .overlay{
                                    Image(systemName: "person.2.fill")
                                        .foregroundColor(.white)
                                }
                            Circle()
                                .frame(width: 35, height: 35)
                                .foregroundColor(.blue)
                                .overlay{
                                    Image(systemName: "message.fill")
                                        .foregroundColor(.white)
                                }
                            
                        }
                    }
                    .padding([.top, .horizontal])
                    
                    // MARK: Write something section
                    HStack(spacing: 20){
                        Image("danixuz")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                            .frame(width: 45, height: 45)
                        Text("What's on your mind, Daniel?")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 15)
                    
                    // MARK: Sections buttons
                    HStack(spacing: 15){
                        HStack(spacing: 10){
                            Image(systemName: "photo.fill.on.rectangle.fill")
                            Text("Gallery")
                                .font(.caption)
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .background(Color(.init(red: 70/255, green: 210/255, blue: 100/255, alpha: 1)))
                        .cornerRadius(10)
                        
                        HStack(spacing: 10){
                            Image(systemName: "person.2.fill")
                            Text("Tag Friends")
                                .font(.caption)
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .background(Color(.init(red: 70/255, green: 150/255, blue: 240/255, alpha: 1)))
                        .cornerRadius(10)
                        
                        HStack(spacing: 10){
                            Image(systemName: "bell.fill")
                            Text("Live")
                                .font(.caption)
                        }
                        .padding(.horizontal, 15)
                        .padding(.vertical, 10)
                        .background(Color(.init(red: 240/255, green: 100/255, blue: 120/255, alpha: 1)))
                        .cornerRadius(10)
                    }
                    .foregroundColor(.white)
                    
                    // MARK: Stories section
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20){
                            ForEach(sampleStories){ story in
                                Image(story.picture)
                                    .resizable()
                                    .frame(width: 95, height: 120)
                                    .cornerRadius(20)
                                    .overlay{
                                        Circle()
                                            .foregroundColor(.white)
                                            .frame(width: 50, height: 50)
                                            .overlay{
                                                Image(story.user.picture)
                                                    .resizable()
                                                    .clipShape(Circle())
                                                    .frame(width: 45, height: 45)
                                            }
                                            .offset(y: 57)
                                    }
                            }
                        }
                        .padding(.bottom) // to add more space to the bottom frame so the profile picture won't cut out of the frame
                        .padding()
                    }
                    
                    Rectangle()
                        .foregroundColor(Color(.systemGray5))
                    
                    // MARK: Posts section
                    
                }
                .frame(width: .infinity, height: .infinity)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
