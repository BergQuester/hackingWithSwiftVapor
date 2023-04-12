import Vapor
import Leaf

func routes(_ app: Application) throws {
    app.get { req -> EventLoopFuture<View> in
        let context = [String: String]()
        return req.view.render("home", context)
    }

    app.get("staff") { req async -> String in
        "Meet our great team"
    }

    app.get("contact") { req async in
        "Get in touch with us"
    }
}

