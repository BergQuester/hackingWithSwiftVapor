import Vapor
import Leaf

func routes(_ app: Application) throws {
    app.get { req -> EventLoopFuture<View> in
        let context = [String: String]()
        return req.view.render("home", context)
    }

    app.get("staff", ":name") { req -> EventLoopFuture<View> in
        let name = req.parameters.get("name") ?? ""

        // create some dummy data to work with
        let bios = [
            "kirk" : "My name is James Kirk and I love snakes.",
            "picard" : "My name is Jean-Luc Picard and I'm made for fish.",
            "sisko" : "My name is Benjamin Sisko and I'm all about the budgies.",
            "janeway" : "My name is Kathryn Janeway and I want to hug every hamster",
            "archer" : "My name is Jonathan Archer and beagles are my thing."
        ]

        // define the struct we'll pass to the template
        struct StaffView: Codable {
            var name: String?
            var bio: String?
        }

        let context: StaffView

        // attempt to find a staff member by this name and fill in our struct
        if let bio = bios[name] {
            context = StaffView(name: name, bio: bio)
        } else {
            context = StaffView()
        }

        //render the template with whatever we have
        return req.view.render("staff", context) 
    }

    app.get("contact") { req -> EventLoopFuture<View> in
        let context = [String: String]()
        return req.view.render("contact", context)
    }
}

