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
                            Image(systemName: "video.fill")
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
                    
                    
                    
                    // MARK: Posts section
                    ForEach(samplePosts){ post in
                        Rectangle()
                            .foregroundColor(Color(.systemGray5))
                            .frame(height: 5)
                        Post(post: post)
                    }
                    
                    // MARK: Image post placeholder
                    Rectangle()
                        .foregroundColor(Color(.systemGray5))
                        .frame(height: 5)
                    VStack{
                        HStack{
                            // Name and pfp
                            HStack(spacing: 10){
                                Image(sampleUsers[0].picture)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                Text(sampleUsers[0].fullName)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            // time ago of post
                            Text("5 hour")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding([.horizontal, .top])
                        Image("story5")
                            .resizable()
//                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: 200)
                    }
                    
                    
                }
                .frame(width: .infinity, height: .infinity)
                
            }
        }
    }
    
    // MARK: Build post UI for home view from data of a post.
    @ViewBuilder
    func Post(post: Post) -> some View{
        let poster = post.user
        let fontColor: Color = Color(red: 60/255, green: 60/255, blue: 60/255)
        VStack( alignment: .leading){
            // MARK: Name and pfp and time ago
            HStack{
                // Name and pfp
                HStack(spacing: 10){
                    Image(poster.picture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                    Text(poster.fullName)
                        .font(.footnote)
                        .foregroundColor(fontColor)
                }
                Spacer()
                // time ago of post
                Text(post.timeAgo)
                    .font(.caption)
                    .foregroundColor(fontColor)
            }
            // MARK: Post content
            Text(post.text)
//                .background(.red)
                .font(.subheadline)
                .padding(.vertical, 5)
            
            // MARK: Reactions, comments and shares count
            HStack{
                // Reactions
                HStack(spacing: 3){
                    // Like
                    Circle()
                        .frame(width: 22, height: 22)
                        .foregroundColor(.blue)
                        .overlay{
                            Image(systemName: "hand.thumbsup.fill")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.white)
                        }
                    // Love
                    Circle()
                        .frame(width: 22, height: 22)
                        .foregroundColor(.red)
                        .overlay{
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.white)
                        }
                        .padding(.leading, 4.5)
                        .padding(.trailing, 3)
                        .overlay{
                            Circle()
                                .foregroundColor(.red)
                                .frame(width: 5, height: 5)
                                .offset(x: 1,y: 19)
                        }
                    // Laugh
                    Text("😂")
                        .font(.title2)
                    // Surprised
                    Text("😲")
                        .font(.title2)
                    // Sad
                    Text("😪")
                        .font(.title2)
                    // Angry
                    Text("😡")
                        .font(.title2)
                }
                Spacer()
                // Comments and shares count
                HStack{
                    Text("\(post.commentCount.roundedWithAbbreviations) Comments")
                    Text("\(post.shareCount.roundedWithAbbreviations) Shares")
                }
                .font(.caption)
                .foregroundColor(fontColor)
            }
        }
        .padding()
//        .background(.green)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
