//
//  MomentRow.swift
//  WeChat
//
//  Created by 彭智鑫 on 2021/5/24.
//

import SwiftUI
import VideoPlayer

struct MomentRow: View {
    let moment: Moment
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Avatar(icon: moment.author.icon)
            
            VStack(alignment: .leading, spacing: 10) {
                Name(name: moment.author.name)
                
                if let text = moment.text {
                    TextContent(text: text)
                }
                
                if let images = moment.images {
                    if images.count == 1 {
                        SingleImage(image: images[0])
                    } else {
                        ImageGrid(images: images)
                    }
                }
                
                if let video = moment.video {
                    SingleVideo(video: video)
                }
                
                HStack {
                    Time(time: moment.time)
                    Spacer()
                    Image("moment_comment")
                }
                
                if moment.likes != nil || moment.comments != nil {
                    VStack(alignment: .leading, spacing: 0) {
                        if let likes = moment.likes {
                            Likes(likes: likes)
                        }
                        
                        if moment.likes != nil && moment.comments != nil {
                            Separator(color: Color("moment_comment_separator"))
                        }
                        
                        if let comments = moment.comments {
                            Comments(comments: comments)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color("moment_comment_background"))
                    .cornerRadius(3)
                }
            }
        }
        .padding(.init(top: 12, leading: 12, bottom: 14, trailing: 12))
    }
    
    struct Name: View {
        let name: String
        
        var body: some View {
            Text(name)
                .foregroundColor(Color("link"))
                .font(.system(size: 16, weight: .medium))
                .padding(.bottom, -6)
        }
    }
    
    struct TextContent: View {
        let text: String
        
        var body: some View {
            Text(text)
                .font(.system(size: 15))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    struct SingleImage: View {
        let image: Media
        
        var body: some View {
            Image(image.url)
                .resizable()
                .aspectRatio(CGSize(width: image.width!, height: image.height!), contentMode: .fit)
                .frame(maxWidth: 180, maxHeight: 180, alignment: .leading)
        }
    }
    
    struct ImageGrid: View {
        let images: [Media]
        
        var rows: Int { images.count / cols }
        var cols: Int { images.count == 4 ? 2 : min(images.count, 3) }
        var lastRowCols: Int { images.count % cols }
        
        var body: some View {
            VStack {
                ForEach(0..<rows, id: \.self) { row in
                    self.rowBody(row: row, isLast: false)
                }
                if lastRowCols > 0 {
                    self.rowBody(row: rows, isLast: true)
                }
            }
        }
        
        func rowBody(row: Int, isLast: Bool) -> some View {
            HStack(spacing: 6) {
                ForEach(0..<(isLast ? self.lastRowCols : self.cols), id: \.self) { col in
                    Image(self.images[row * self.cols + col].url)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 60, maxWidth: 80, minHeight: 60, maxHeight: 80)
                        .aspectRatio(1, contentMode: .fill)
                        .clipped()
                }
            }
        }
    }
    
    struct SingleVideo: View {
        let video: Media
        
        @State private var play: Bool = false
        @State private var isPlaying: Bool = false
        
        var body: some View {
            ZStack {
                VideoPlayer(url: URL(string: video.url)!, play: $play)
                    .onStateChanged { state in
                        switch state {
                        case .playing: self.isPlaying = true
                        default: self.isPlaying = false
                        }
                    }
                    .onAppear { self.play = true }
                    .onDisappear { self.play = false }
                
                if !isPlaying {
                    Image(video.cover!)
                        .resizable()
                }
            }
            .aspectRatio(CGSize(width: video.width!, height: video.height!), contentMode: .fit)
            .frame(maxWidth: 225, maxHeight: 225, alignment: .leading)
        }
    }
    
    struct Time: View {
        let time: String
        
        var body: some View {
            Text(time)
                .foregroundColor(.secondary)
                .font(.system(size: 14))
        }
    }
    
    struct Likes: View {
        let likes: [String]
        
        var body: some View {
            ZStack(alignment: .topLeading) {
                makeLikesText()
                    .fixedSize(horizontal: false, vertical: true)
                
                Image("moment_like")
                    .resizable()
                    .frame(width: 12, height: 12)
                    .offset(y: 5)
            }
            .padding(.init(top: 4, leading: 14, bottom: 4, trailing: 14))
        }
        
        func makeLikesText() -> Text {
            var text = Text("    ")
            for (i, like) in likes.enumerated() {
                if i > 0 {
                    text = text + Text(",")
                }
                text = text + Text(like)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color("link"))
            }
            return text
        }
    }
    
    struct Comments: View {
        let comments: [Comment]
        
        var body: some View {
            VStack(alignment: .leading, spacing: 4) {
                ForEach(comments) { comment in
                    makeCommentText(comment: comment)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .padding(.init(top: 6, leading: 12, bottom: 6, trailing: 12))
        }
        
        func makeCommentText(comment: Comment) -> Text {
            Text(comment.name)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Color("link"))
            +
                Text("：\(comment.content)")
                .font(.system(size: 14))
        }
    }
}

struct MomentRow_Previews: PreviewProvider {
    static var previews: some View {
        MomentRow(moment: Moment.page1[0])
            .previewLayout(.sizeThatFits)
    }
}
