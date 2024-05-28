import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req async throws in
        try await req.view.render("index", ["title": "Hello Vapor!"])
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get("home") { req async throws in
        try await req.view.render("index-2", ["title": "Hello Vapor!"])
    }
    
   
    try app.register(collection: TodoController())
    
    let usersController = UsersController()
    try app.register(collection: usersController)
    
    let serviceController = ServiceController()
    try app.register(collection: serviceController)
}
