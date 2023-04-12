import Vapor

func routes(_ app: Application) throws {
    app.get { req async in
        "Welcome to Millions Hairs"
    }

    app.get("staff") { req async -> String in
        "Meet our great team"
    }

    app.get("contact") { req async in
        "Get in touch with us"
    }
}
