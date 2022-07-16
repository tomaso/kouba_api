#[macro_use] extern crate rocket;

#[get("/")]
fn index() -> &'static str {
    "TODO: List of available methods..."
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![index])
}

