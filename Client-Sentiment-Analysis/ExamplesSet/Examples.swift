//
//  Examples.swift
//  Client-Sentiment-Analysis
//
//  Created by Jacek on 21/05/2020.
//  Copyright © 2020 Jacek. All rights reserved.
//

import SwiftUI

struct Message {
    let id = UUID()
    let text: String
    let rating: String
    let user: User
}

struct User {
    let id = UUID()
    let avatar: String
    let nickname: String
    let fullName: String
}


var users = [User(avatar: "🦄", nickname: "@Uni420", fullName: "Uni Clay"),
             User(avatar: "🦊", nickname: "@wFoxSay", fullName: "Foxy Dug"),
             User(avatar: "🐸", nickname: "@FrogDriver", fullName: "Fraggy Meh"),
             User(avatar: "🐹", nickname: "@WirelessMouse", fullName: "Mini Fiz"),
             User(avatar: "🦧", nickname: "@BigValve", fullName: "Bombo Juzz")
]

var reviews = [
    "Very very tiny!",
    "When I got mine it was broken so my husband had to glue it back together.",
    "Don't ever buy this its not worth your money pieces where missing and it didn't work worthless",
    "This figure is extremely tiny, not worth the $10 I paid for it. More like a Happy Meal toy.",
    "A piece of junk, not worth five dollars! Looked good in pictures but not in person. Don't buy it, you will be disappointed.",
    "Defective product. Arrived with two holes on it. Absolutely useless. Kids were very disapointed!",
    "Really cute and the water fountain tail is awesome but I got a leak the first day using it.",
    "Doesn't stick to wall well.",
    "Too expensive for what it is",
    "You will not receive item as advertised. You will receive the standard version, not the metallic version. Don't waste your time.",
    "After a very short time only one ball will light up.  I have changed the batteries and still no luck.",
    "Zero stars: one pen was not working, other lasted less then 10 safe, but hardly noticeable zapping. Was a good lesson to my son about buying cheap products.",
    "I paid 11.45 for this and it is sooooo small hardly will wrap 4 small gifts! I would never buy this had I known it was such a small amount",
    "They were horrible!!! They were not sealed good and did not hold water. Waste of my money!!!",
    "Sizing was all wrong. It was way bigger than description which made it impossible to wear.",
    "All counter clockwise. No clockwise. Cant fly like that",
    "I applied as directed only to have it splotch or come up completely if touched by another surface",
    "Terribly made. Can't read the writing on it !!",
    "Broke within 1 hour of first use!",
    "Missing pieces, unable to build",
    "It popped the first day I got it!",
    "Broke after third use",
    "I was so happy because I collect these BUT  a sticker was on the box from kohls and it wouldn't come off without destroying the box",
    "Chintzy and feels extremely cheaply made. Just buy the original from your local thrift store.",
    "Much more smaller than I though.The stickers makes it looks cheap.And there has a lot of stuff you need to carve by yourself.Overpriced!",
    "My son broke the first one and the second one's chest plate does not sit properly.  Not durable but my son likes it.",
    "Elastic broke within seconds of me opening it. I hadn't even put it on yet!",
    "not a nice specimen",
    "While the technology is good, there is only so much you can do with this. The grands grew tired of it quickly. Not enough challenge.",
    "Octopus ball was stated to be 20 inches, but was only 9.",
    "I'm not happy with the item, because it did not said that required extra parts. its going to be more expensive to buy the other things.",
    "I thought there would be more included for the price.",
    "Really slow you have to continue clicking so that the bubbles comes out",
    "Gloves are very small",
    "NOT GOOD, AS ADVERTIZED",
    "I bought this set twice, mainly for the basket ball. Both basket balls were not durable, they have holes already and we barely used them. I would not recommend.",
    "was missing screws to hold bucket on, ordered just before my sons birthday, all though I should have returned it, I didn't I kept it for his present.",
    "The lid doesn't close securely, so the ink pad dried out while in transit to me. It arrived almost completely dry.",
    "Each character consists of several small pieces, which come apart easily. Not as kid-friendly as I'd hoped.",
    "Very thin and doesn't provide much protection other than keeping it from slipping from child's hands.",
    "Amazon said it was new buy it's missing the letter q. Other than that it's nice.",
    "Cards were too thin",
    "Baby has a weird color. Daughter does love the baby doll.",
    "Pain to get it in the bag but fun for the kids",
    "A better paint job and nice new head sculpt, but it is the same figure from ML Iron Man 3 series.",
    "I thought it was a lil bigger but it will make a do.",
    "Pops a lot",
    "The commercials made me believe this thing could swim. While my kid likes, it the tail falls off all the time. Kinda sucks.",
    "Worked as a great accesory for my flapper dress",
    "Same problem as other reviewers!! Wheel broken off of front.  Returned the item and will try to replace.  Packing box seemed too big for the item.",
    "Out of the box when I started flying it tilted right . Had to counter weight it.",
    "Thin, low quality paper",
    "Easy for my 10 yr old nephew to assemble. Down fall is one mirror broke off right away.",
    "Smaller and not as cute as i thought it would be. It is also pricey for what it is.",
    "I thought they glowed... and they are too slippery to be practical...",
    "I knew it wasn't big-but it looks even smaller than I thought it would",
    "The water didnt come out like the pictures. I even try to use different hose but I think this one is defective.",
    "Shipped the pink and purple when green and blue was ordered.  Aside from that we love this bike for our one year old.",
    "Some very small cheap pieces.",
    "Big. Expensive and bored in 1 hour. Takes up a lot of space so be ready to commit. I can see a lot of these in the thrift shops next year.",
    "I have purchased all of the mini Corelle dolls. This one's hair is very wiry. Messy hair, not smooth like the others.",
    "This toy entertains my kids for long durations! Be sure to stock up on batteries, they don't last all that long.",
    "Bought these as bases for some secondhand terminators. About half as thick as GW products. Good quality, just feel small because they're not as high.",
    "We purchased 3 and the stitching broke on 2 of them after about 3 hours of use. However, they were really fun to use!!",
    "I got it on time and was able to use it for my daughters grad. it fits perfectly and I had no issues with it. Satisfied with the product",
    "Kids love this toy! WAS A GREAT HIT! But...very delicate and breaks easily, like after one week. It did generate a lot of happiness while it worked :)",
    "Pretty good conditions, I little bit expensive, but it worth the money",
    "Purchased these for my kids rockstar party and they looked great. The inner stars were a little tricky to separate out, but turned out nicely!",
    "Works as advertised, but can be a little unpredictable.  It has given my know-it-all 4yr old and new interested in phonics and reading, so it can stay!",
    "Lots of fun",
    "Was good ! They have detailed instructions on what to do if you have problems with peeling, extremely helpful!",
    "Very cute, but made for a smaller head.  But my sister will love it.",
    "Awesome just came with no bottle :(",
    "Great activity for toddlers on up.  Too expensive, though.",
    "so cute.  I wish the ties at the end were a little longer, though.",
    "Nice little dress display holder for Barbie",
    "Not bad for the price but had to cut the eyes out more so I could see. I used a cuticle cutter and it worked great and did not make it look weird or anything.",
    "The mug is fantastic,  but after 1 month,  the adhesive started to fall off even I am not scratching when I clean it.",
    "This was a fun puzzle to do. I usually prefer Americana puzzles, but this one got me hooked on Vermont company.",
    "Good quality and looks good in my bookcase. Setting up the masts and lines was a little tricky, though.",
    "Some of the pieces were really small, but overall good quality and look they looked nice when combine with baloons and other items.",
    "great, I liked it",
    "Great product, would buy again.",
    "My daughter loved it! The molds work great and she makes the cutest sand cupcakes :-)",
    "My 2 yr old daughter LOVES this thing",
    "great purchase",
    "Parts made well. Truck went together ok. Do agree with another reviewer this kit should be considered a skill level 3 not a 2.",
    "Great puzzle,  I need the large format and I enjoyed putting the puzzle together.",
    "It was a gift for nephew and he loved it!",
    "my son loves this",
    "This coin fit in perfectly with my picture of the Thunder Birds and the number of commemorative pins I've collected over the years .",
    "Arrived promptly and exact same as the original pen.",
    "this pool is great, my kids love it. It is a decent size, hold my 5, 4, and 3 year old with room for them to splash around.",
    "Buddy Christ makes us smile every day.",
    "So cute!!! daughter loved it, great present!",
    "Grand daughter LOVED these!! Great product for the price :):)",
    "Big hit at my sons birthday party",
    "Blast to play with kids, Great outdoor fun",
    "Works great and easy to apply.",
    "Loved building this puzzle. I will buy more from this company.",
    "It's a great product",
]
